#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include "transformres.h"

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <netinet/in.h>

#include <stdio.h>
#include "msgOPR.h"

#define MAP_FILE_SIZE 100
#define DEBUG 1

int MAXLOGLEN = 0;

void configurate() {
    FILE* conf = NULL;
    conf = fopen("config","r+");
    if(conf == NULL) {
        conf = fopen("config","w+");
        fprintf(conf,"%d",10);
        MAXLOGLEN = 10;
    }
    else {
        fscanf(conf,"%d",&MAXLOGLEN);
    }
}

Qmas allQUEUES;
SUBlist subscribers;

char* nameIN = NULL;
char* nameOUT = NULL;


int printLogs(Qmas* queues, char* filename) {
    FILE* fdFILE = fopen(filename,"w+");
    if(fdFILE == NULL) {
        return -1;
    }

    fprintf(fdFILE,"-----------\n");
    for(int i = 0;i<queues->size;++i) {
        if(queues->queues[i]->logFlag == 1) {
            fprintf(fdFILE,"[%d]: ",queues->queues[i]->queueID);
            for(int j=0;j<queues->queues[i]->log->ListSize;++j) {
                fprintf(fdFILE,"%s ",queues->queues[i]->log->Elem[j]->content);
            }
            fprintf(fdFILE,"\n");
        }
    }
    fprintf(fdFILE,"-----------\n");

    fclose(fdFILE);
    return 0;
}

void taghdl(int sig)
{
    if(sig == SIGTERM || sig == SIGINT) 
    {
        printLogs(&allQUEUES,"logfile.txt");  
        destroyMAS(&allQUEUES);
        destroySUBlist(&subscribers);
        if(nameIN != NULL) {
            free(nameIN);
        }
        if(nameOUT != NULL) {
            free(nameOUT);
        }
        system("rm tmp/*");
        exit(0);
    }
}

int main(int argc,char** argv) {
    struct sigaction act_sync;
    memset(&act_sync, 0, sizeof(act_sync));
    act_sync.sa_handler = taghdl;
    sigset_t   set_sync; 
    sigemptyset(&set_sync);
    sigaddset(&set_sync, SIGTERM); 
    sigaddset(&set_sync, SIGINT); 
    act_sync.sa_mask = set_sync;
    sigaction(SIGTERM, &act_sync, NULL);
    sigaction(SIGINT, &act_sync, NULL);
    
    configurate();

    if(DEBUG == 1)printf("operator activatrd |%d|\n",MAXLOGLEN);

    if(argc < 2) {
        return -3;
    }

    int public_port_in = open(argv[1],O_RDONLY);

    if(public_port_in == -1) {
        //printf("made\n");
        if(mkfifo(argv[1], 0777) == -1) {
            return -1;
        }
        else {
            public_port_in = open(argv[1],O_RDONLY);

            if(public_port_in == -1) {
                if(mkdir("tmp/",0777) == -1) {
                    return -2;
                }
                else {
                    public_port_in = open(argv[1],O_RDONLY);

                    if(public_port_in == -1) {
                        return -2;
                    }
                }
            }
        }
    }
    //на публичные порты отправляется запрос о подписке.
    //также на публичный порт отправляются сигнализации о запросе передачи

    queueMASinit(&allQUEUES);
    subLISTinit(&subscribers);


    nameIN = (char*)malloc(9);
    nameOUT = (char*)malloc(9);

    for(;;) {
        request cur_ask;
        char a[2];
        
        //read(public_port_in,&cur_ask,sizeof(cur_ask));
        while(read(public_port_in,&cur_ask.action,sizeof(int)) == 0) {}
        read(public_port_in,&cur_ask.localID,sizeof(int));
        read(public_port_in,&cur_ask.Qid,sizeof(int));
        read(public_port_in,nameIN,9);
        read(public_port_in,nameOUT,9);

        read(public_port_in,&a,2);
        


        if(DEBUG)printf("operator| got ask | from: %d\n",cur_ask.localID);

        if(DEBUG) {
            for(int i=0;i<allQUEUES.size;++i) {
                printf("|%d|-|",allQUEUES.queues[i]->queueID);
                for(int j=0;j<allQUEUES.queues[i]->ListSize;++j) {
                    printf("%s|",allQUEUES.queues[i]->Elem[j]->content);
                }
                printf("(%d)\n",allQUEUES.queues[i]->ListSize);
            }
        }

        if(DEBUG == 1)printf("operator ask: %d | %d\n",cur_ask.action,cur_ask.Qid);
        
        if(cur_ask.action == 1) { //подписка
            //printf("%d\n",cur_ask.localIN);
            int fdR = open(nameIN,O_RDONLY);
            int fdW = open(nameOUT,O_WRONLY);
            subLISTadd(&subscribers,createSUB(cur_ask.localID,fdR,fdW));
            if(DEBUG)printf("\tsub added\n");
            write(fdW,&cur_ask.localID,sizeof(int));
            if(DEBUG)printf("\trespond written (%d)\n",fdW);
        }
        else
        if(cur_ask.action == 2) { //отправка сообещния в очередь
            subscriber* curSUB = subLISTlocate(&subscribers,cur_ask.localID);
            if(curSUB == NULL) {
                if(DEBUG)printf("ask handled (ask error)\n");
                continue;
            }

            msgQ* curQ = queueMASlocate(&allQUEUES,cur_ask.Qid);
            msg* curMSG = (msg*)malloc(sizeof(msg));

            if(curQ == NULL || curMSG == NULL) {
                if(DEBUG)printf("ask handled (ask error)\n");
                continue;
            }
            
            read(curSUB->localPortIn,&curMSG->priority,sizeof(int));
            read(curSUB->localPortIn,&curMSG->size,sizeof(int));
            curMSG->content = (char*)malloc(curMSG->size);
            read(curSUB->localPortIn,curMSG->content,curMSG->size);

            Qadd(curQ,curMSG);
        }
        else
        if(cur_ask.action == 3) { //чтение сообщения из очереди
            subscriber* curSUB = subLISTlocate(&subscribers,cur_ask.localID);

            if(curSUB == NULL) {
                if(DEBUG)printf("ask handled (ask error)\n");
                continue;
            }

            msgQ* curQ = queueMASlocate(&allQUEUES,cur_ask.Qid);
            msg* curMSG = NULL;
            if(curQ == NULL) {
                curMSG = NULL;
            }
            else {
                curMSG = Qget(curQ);
            }

            if(curMSG == NULL) {
                //написать чето чтоб было понятно что сообщение пусктое
                int resp = -1;
                write(curSUB->localPortOut,&resp,sizeof(int));
            }
            else {
                write(curSUB->localPortOut,&curMSG->priority,sizeof(int));
                write(curSUB->localPortOut,&curMSG->size,sizeof(int));
                write(curSUB->localPortOut,curMSG->content,curMSG->size);
                //write(curSUB->localPortOut,curMSG,sizeof(*curMSG));

                if(curQ->logFlag != 1) {
                    free(curMSG->content);
                    free(curMSG);
                }
            }
        }
        else
        if(cur_ask.action == 4) { //создание очереди
            //printf(">|%d|%d|\n",nameIN[0],nameIN[1]);
            subscriber* curSUB = subLISTlocate(&subscribers,cur_ask.localID);
            int resp = 0;

            if(curSUB == NULL) {
                if(DEBUG)printf("ask handled (ask error)\n");
                continue;
            }

            if(queueMASlocate(&allQUEUES,cur_ask.Qid) != NULL) {
                resp = 1;
                write(curSUB->localPortOut,&resp,sizeof(int));
                if(DEBUG)printf("ask handled (ask error)\n");
                continue;
            }

            if(nameIN[0] != '0') {
                //printf("making log\n");
                queueMASaddLogged(&allQUEUES,cur_ask.Qid,MAXLOGLEN);
            } 
            else {
                queueMASadd(&allQUEUES,cur_ask.Qid);
            }

            write(curSUB->localPortOut,&resp,sizeof(int));
        } 
        if(DEBUG)printf("ask handled\n");
    }

    free(nameIN);
    free(nameOUT);
}