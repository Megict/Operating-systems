//Гаврилов М.С. М8О-206Б-19 | Лр#4, вар. 21

// Родительский процесс создает два дочерних процесса. Первой строкой пользователь 
// в консоль родительского процесса вводит имя файла, которое будет использовано для
//  открытия File с таким именем на запись для child1. Аналогично для второй строки 
//  и процесса child2. Родительский и дочерний процесс должны быть представлены разными
//   программами. 

#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include "sys/types.h"
#include <sys/mman.h>
#include <signal.h>
#include "sys/wait.h"
#include "tramsformres.h"
//#include "thread.h"
//#include "synch.h"


#define MAP_FILE_SIZE 1000
#define TIMEOUT_TIMER 1000000000

int id1 = -1,id2 = -1;
int a; //дескриптор файла 
char* adr = NULL; //адрес отображаемого куска

char syncTag = 0;
char resSync = 0;


void hdl(int sig)
{
    if(sig == SIGUSR1)
    {
        syncTag++;
    }
    else 
    if(sig == SIGCHLD)
    {
        kill(id1,SIGKILL);
        kill(id2,SIGKILL);

        kill(getpid(),SIGKILL);
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

void terminate() {
    munmap(adr,MAP_FILE_SIZE);
    close(a);
    kill(id1,SIGKILL);
    kill(id2,SIGKILL);
}

int main()
{

    printf("Input two filenames\nthen input strings to be inverted\n");
    char* filename1 = NULL;
    char* filename2 = NULL;

    filename1 = bitescan(filename1);   
    if(filename1 == NULL) {
        return 0;
    }

    for(;;) {
        filename2 = bitescan(filename2);
        if(filename2 == NULL) {
            return 0;
        }
        if(strcmp(filename1,filename2) != 0) {
            break;
        }
        else {
            printf("please input string differ to name one\n");
        }
    }


    a = open(filename1,O_CREAT | O_WRONLY | O_TRUNC, 00660); //создание первого файла с результатами
    write(a,"This is file one\n(even)\n\n",strlen("This is file one\n(even)\n\n"));
    close(a); 

    a = open(filename2,O_CREAT | O_WRONLY | O_TRUNC, 00660); //создаие второго файла с результатами
    write(a,"This is file two\n(odd)\n\n",strlen("This is file two\n(odd)\n\n"));
    close(a);
 
    a = open("twpfile",O_CREAT | O_WRONLY | O_TRUNC, 00660); //создание и инициализация отображаемого файла
    for(int i=0;i<MAP_FILE_SIZE;++i) {
        write(a,"0",1); //я хотел проинициализировать его нулями, но он не хочет в текстовый файл писать настоящие нули (
    }
    close(a);

    a = open("twpfile", O_RDWR, 00660);
    printf("initiated\n");
    //отображение файла
    
    adr = mmap(NULL,MAP_FILE_SIZE,PROT_READ | PROT_WRITE, MAP_SHARED,a,0);
    if(adr == MAP_FAILED)
    {
        printf("failed to map\n");
        return 0;
    }

    munmap(adr,MAP_FILE_SIZE);
    close(a);//конец фрагмента с отображением

    int pid = getpid();
    printf("initiating process separation\n");


    id1 = fork(); //разделение процесса, в основном процессе id будет соответствовать pid порожденного, в порожденном id = 0


    if(id1 == -1) //ошибка
    {
        write(1,"error\n",strlen("error\n"));
        return -1;
    }
    else 
    if(id1 == 0)
    {
        //char arg1[1]; arg1[0] = fd1[0];
        execl("chid_proc_one.out",filename1,transform(pid),NULL);
    }
    else
    {
        //код основного процесса
        id2 = fork();

        if(id2 == -1)
        {
            write(1,"error in genetating str 2\n",strlen("error in genetating str 2\n"));
            return -1;
        }
        else
        if(id2 == 0)
        {
            execl("chid_proc_one.out",filename2,transform(pid),NULL);
        }
        else 
        {
            struct sigaction act;
            memset(&act, 0, sizeof(act));
            act.sa_handler = hdl;
            sigset_t   set; 
            sigemptyset(&set);                                                             
            sigaddset(&set, SIGUSR1); 
            sigaddset(&set, SIGUSR2);
            act.sa_mask = set;
            sigaction(SIGUSR1, &act, 0);
            sigaction(SIGUSR2, &act, 0);

            //основной процесс
		    printf("[%d] It's parent, child id: [%d] [%d]\n",getpid(),id1,id2);
            /*void (*fptr)(int) = NULL; //установка обработчика сигнала
            fptr = hdl;
            signal(SIGUSR1,fptr);*/
            //отображение файла
            a = open("twpfile", O_RDWR, 00660);
            adr = mmap(NULL,MAP_FILE_SIZE,PROT_READ | PROT_WRITE, MAP_SHARED,a,0);
            unsigned long long i=0;
            while(syncTag < 2) {
                ++i;

                if(i==TIMEOUT_TIMER) {
                    printf("ERROR: syncroniser timed out. Child didn't start correctly\n");
                    munmap(adr,MAP_FILE_SIZE);
                    close(a);
                    kill(id1,SIGKILL);
                    kill(id2,SIGKILL);
                    return 0;
                }
            }
            syncTag = 0;//поймали сигнал от первого ребентак
            printf("got_signal_one\n");
            printf("got_signal_two\n");//поймали сигнал от второго ребенка
            //дети готовы принимать сообщения

            char* inp = NULL;
            int l=0;

            if(adr == MAP_FAILED)
            {
                printf("failed to map\n");
                return 0;
            }
            while(0==0)
            {
                inp = bitescan(inp);
                if(inp == NULL) {
                    break;
                }
                printf("[%d] writing: %s\n",getpid(),inp);

                l = strlen(inp);

                strcpy(adr,inp);



                if(l % 2 == 0)
                {
                    syncTag = 0;
                    kill(id1,SIGUSR1);//посылаем ребенку сигнал разрешающий считать сообщение
                    kill(id2,SIGUSR2);

                    while(syncTag == 0) {//ждем ответа от ребенка (что он считал)
                        ++i;

                        if(i==TIMEOUT_TIMER) {
                            printf("ERROR: syncroniser timed out\n");
                            terminate();
                            return 0;
                        }
                   }
                }
                else
                {
                    syncTag = 0;
                    kill(id2,SIGUSR1);
                    kill(id1,SIGUSR2);

                    while(syncTag == 0) {
                        ++i;

                        if(i==TIMEOUT_TIMER) {
                            printf("ERROR: syncroniser timed out\n");
                            terminate();
                            return 0;
                        }
                   }
                }
            }

            terminate();
            printf("[%d] parent: stop\n",getpid());
            return 0; 
        }

    }
    //общий код 
    return 0; 
}
