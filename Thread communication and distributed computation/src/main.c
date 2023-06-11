//Гаврилов М.С. М8О-206Б-19 | Лр#6,7,8, вар. 21
//топология 1, команды 3,проверка 1.

// Все вычислительные узлы находятся в списке. Есть только один управляющий узел. Чтобы
// добавить новый вычислительный узел к управляющему, то необходимо выполнить команду:
// create id -1.

// Набора команд 3 (локальный таймер)
// Формат команды сохранения значения: exec id subcommand
// subcommand – одна из трех команд: start, stop, time.
// start – запустить таймерstop – остановить таймер
// time – показать время локального таймера в милисекундах

// Тип проверки доступности узлов
// Команда проверки 2
// Формат команды: ping

#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/mman.h>
#include "list.h"
#include "transformres.h"
#include "mutex.h"
#include <time.h>

#include <stdio.h>
#include "oprUI.h"

#define Pi 3.1415926
#define MAP_FILE_SIZE 100
#define DEBUG 0

int readTag = 0;
int answTag = 0;
int killTag = 0;

void taghdl(int sig)
{
    if(sig == SIGUSR1) 
    {
        if(DEBUG == 1)printf("MAINSIG(%d)\n",readTag);
        readTag++;
    }
    else
    if(sig == SIGUSR2) 
    {
        answTag = 1;
    }
    if(sig == SIGINT) 
    {
        killTag =1;
    }
}

char* bitescan (char* str) //принимает неинициализированный указатель, маллочит для него память и считывает строку
{
    int counter = 0,size = 2;
    str = (char*)realloc(str,size);
    char buf;
    int mark=0;

    while(read(0,&buf,1)!=0) {
        if(buf == ' '||buf == '\n'||buf =='\t') {
            if(mark == 0) {
                continue;
            }
            else {
                break;
            }
        }
        mark=1;
        if(counter+1 == size) {
            size*=2;
            str = (char*)realloc(str,size);
        }
        str[counter] = buf;
        ++counter;
    }

    if(counter == 0) { //если ничего не считали
        free(str);
        str = NULL; 
        return str;
    }

    //str = (char*)realloc(str,counter); //если раскомментить, то почему-то ругается валгринд
    str[counter] = 0; 
    return str;
}


proc* CreateWorker(int id,int fd_to_opr, int fd_from_opr) {
    int curID = getpid();
    proc* crb;
    crb = (proc*)malloc(sizeof(proc));
    crb->lid = id;

    crb->pid = fork();
    
    if(crb->pid == -1) {
        printf("unable to separate\n");
        return NULL;
    }
    else 
    if(crb->pid == 0) {
        //printf("initing\n");
        execl("worker.exe","worker.exe",transform(fd_to_opr),transform(fd_from_opr),transform(id),transform(curID),NULL);
        return NULL;
    }
    else {
        return crb;
    }
    
}

int CreatePostman(int* fd_to_opr,int* fd_from_opr) {
    int fd1[2];
    int fd2[2];
    pipe(fd1);
    pipe(fd2);
    *fd_to_opr = fd1[1];
    *fd_from_opr = fd2[0];
    int postmanID = fork();
    if(postmanID == -1) {
        return -1;
    }
    else
    if(postmanID == 0) {
        execl("operator.exe",transform(fd1[0]),transform(fd2[1]),NULL);
        return 0;
    }
    else {
        return postmanID; exit(0);
    }
}

void destroy(proc* dbl) {
    kill(dbl->pid,SIGTERM);
    free(dbl);
}

int pingWorker(proc* pbl) {
    kill(pbl->pid,SIGUSR2);
    sleep(2); 
    if(answTag == 1) {
        answTag = 0; 
        return 0;
    }
    else {
        return -1;
    }
}

void freze_for_1_ms() {
    struct timespec time1,time2;
    clock_gettime(CLOCK_REALTIME,&time1);
    clock_gettime(CLOCK_REALTIME,&time2);
    while(/*(time1.tv_nsec/1000000 + 1)%1000 > time2.tv_nsec/1000000 || */(time2.tv_nsec/1000000 == time1.tv_nsec/1000000)) {
        clock_gettime(CLOCK_REALTIME,&time2);
    }
}

void freze(int t) {
    for(int i=0;i<t;++i) {
        freze_for_1_ms();
    }
}

int main() {
    //задаем стурктуру для sigaction
    struct sigaction act;
    memset(&act, 0, sizeof(act));
    act.sa_handler = taghdl;
    sigset_t   set; 
    sigemptyset(&set);                                                             
    sigaddset(&set, SIGUSR1); 
    sigaddset(&set, SIGUSR2);
    sigaddset(&set, SIGINT);
    act.sa_mask = set;
    sigaction(SIGUSR1, &act, 0);
    sigaction(SIGUSR2, &act, 0);
    sigaction(SIGINT, &act, 0);
    //обработчики сигналов готовы

    if(createMutex()!=0) {
        printf("ERROR: create mutex error\n");
        return -1;
    }

    mutex mtx;
    if(linkToMutex(&mtx)!=0) {
        printf("ERROR: mutex error\n");
        return -1;
    }

    List IndList;
    LIinit (&IndList);
    
    char* inpstr = (char*)malloc(20);
    char* subcommand = (char*)malloc(10);

    int fd_to_opr, fd_from_opr;
    int work = CreatePostman(&fd_to_opr,&fd_from_opr); //запускаем оператор сообщений

    while(0==0) {
        strcpy(inpstr,""); 
        printf("> ");
        if(scanf("%s",inpstr)==EOF) {
            break;
        }//возвращает EOF при получении сигнала

        if(strcmp(inpstr,"create") == 0) {
            int id;
            scanf("%d",&id);
            
            if(find(&IndList,id) != -1) {
                printf("ERROR: already exists\n");
                continue;
            }
            proc* ADB = CreateWorker(id,fd_to_opr,fd_from_opr);

            add(&IndList,ADB);

            printf("OK %d\n",id);
        }
        else
        if(strcmp(inpstr,"remove") == 0) {
            int id;
            scanf("%d",&id);

            int ind = find(&IndList,id);
            if(ind == -1) {
                printf("ERROR: no such node\n");
                continue;
            }

            proc* dbl = getPointer(&IndList,id);
            destroy(dbl);
            Lremove(&IndList,ind);
            
            printf("OK %d\n",id);
        }
        else 
        if(strcmp(inpstr,"exec") == 0) {
            int id;
            scanf("%d %s",&id,subcommand);

            proc* curWc = getPointer(&IndList,id);

            if(curWc == NULL) {
                printf("ERROR: node with index %d does not exist\n",id); 
            }
            else
            if(pingWorker(curWc)!=0) {
                printf("ERROR: node with index %d is unavailable\n",id);
            }
            else {

                if(strcmp(subcommand,"start") == 0) {

                    sendMSG(fd_to_opr,1,curWc->pid);
                    if(DEBUG == 1)printf("ask sent\n");
                    kill(curWc->pid,SIGUSR1);

                    printf("OK\n");
                }
                else 
                if(strcmp(subcommand,"stop") == 0) {
                    
                    sendMSG(fd_to_opr,2,curWc->pid);
                    if(DEBUG == 1)printf("ask sent\n");
                    kill(curWc->pid,SIGUSR1);

                    printf("OK\n");
                }
                else 
                if(strcmp(subcommand,"time") == 0) {
                    
                    sendMSG(fd_to_opr,3,curWc->pid);
                    if(DEBUG == 1)printf("ask sent\n");
                    kill(curWc->pid,SIGUSR1);

                } 
                else {
                    printf("ERROR: wrong subcommand \"%s\"\n",subcommand);
                }
            }

        }
        else
        if(strcmp(inpstr,"print")==0) {
            printf("<|");
            for(int j=0;j<IndList.ListSize;++j) {
                printf("%d|",IndList.Elem[j]->lid);
            }
            printf("\n");
        }
        else
        if(strcmp(inpstr,"ping")==0) {
            int id;
            scanf("%d",&id);

            proc* wc = getPointer(&IndList,id);
            if(wc == NULL) {
                printf("ERROR: node with index %d does not exist\n",id);
                continue;
            }
            
            if(pingWorker(wc)==0) {
                printf("%d - available\n",id);
            }
            else {
                printf("%d - unavailable\n",id);
            }
        }
        else
        if(strcmp(inpstr,"pingall")==0) {
            printf("nodes:\n");
            for(int j=0;j<IndList.ListSize;++j) {
                kill(IndList.Elem[j]->pid,SIGUSR2);
                sleep(2); 
                if(answTag == 1) {
                    answTag = 0; 
                    printf("%d - available\n",IndList.Elem[j]->lid);
                }
                else {
                    printf("%d - unavailable\n",IndList.Elem[j]->lid);
                }
            }
        }
        else
        if(strcmp(inpstr,"q") == 0 || killTag == 1) {
            for(int j=0;j<IndList.ListSize;++j) {
                kill(IndList.Elem[j]->pid,SIGTERM);
            }
            kill(work,SIGTERM);
            return 0;
        }
        else
        if(strcmp(inpstr,"freze") == 0) {
            int t;
            scanf("%d",&t);
            printf("frost (%d ms)\n",t);
            freze(t);
        }
        else
        if(strcmp(inpstr,"")!=0) {//да, это костыль | ps. хотя даже не совсем и костыль...
            printf("ERROR: no such command \"%s\"\n",inpstr);
        }

        freze(20);
        //if(readTag > 0) {
            if(DEBUG == 1)printf("main hasMSG\n");
            
            while((lock(&mtx,10)!=0)) {};
            if(DEBUG==1)printf("par--|%c|l\n",mtx.memloc[0]);
            
            unsigned long long time = 0;
            int chPid = 0;
            if(getMSG(fd_to_opr,fd_from_opr,&time,&chPid) == -1) {
                if(DEBUG==1)printf("[main] got no msgs\n");
            }
            else {
                int lid = findLID(&IndList,chPid);
                printf("time of %d is: %llu\n",lid,time);
            }
            unlock(&mtx);
            if(DEBUG==1)printf("par--|%c|u\n",mtx.memloc[0]);    
        
            //readTag--;
        //}

    }

    for(int j=0;j<IndList.ListSize;++j) {
        kill(IndList.Elem[j]->pid,SIGTERM);
    }
    kill(work,SIGTERM);
    detachFromMutex(&mtx);
    free(inpstr);
    free(subcommand);
}