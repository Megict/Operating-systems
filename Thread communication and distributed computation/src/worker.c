#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/mman.h>
#include "transformres.h"
#include "oprUI.h"
#include "mutex.h"
#include <time.h>
#define DEBUG 0
#define MAP_FILE_SIZE 100

char readTag = 0;
char answTag = 0; //тег для переклички

void taghdl(int sig)
{
    if(sig == SIGUSR2) 
    {
        answTag = 1;
    }
    else 
    if(sig == SIGUSR1) 
    {
        if(DEBUG == 1)printf("WS(%d)\n",readTag);
        readTag++;
    }
    else 
    if(sig == SIGTERM) 
    {
        exit(0);
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

int main(int argc,char** argv) {
    //аргументы - пайпы
    //ставим обработчик
    struct sigaction act_sync;
    memset(&act_sync, 0, sizeof(act_sync));
    act_sync.sa_handler = taghdl;
    sigset_t   set_sync; 
    sigemptyset(&set_sync);
    sigaddset(&set_sync, SIGUSR1); 
    sigaddset(&set_sync, SIGTERM); 
    sigaddset(&set_sync, SIGUSR2);
    act_sync.sa_mask = set_sync;
    sigaction(SIGUSR1, &act_sync, NULL);
    sigaction(SIGTERM, &act_sync, NULL);
    sigaction(SIGUSR2, &act_sync, NULL);
    //парисм аргументы
    int fd_to_operator = back_transform(argv[1]);
    int fd_from_operator = back_transform(argv[2]);
    int parId = back_transform(argv[4]);



    int wf = 0;
    unsigned long long time = 0;

    mutex mtx;
    if(linkToMutex(&mtx)!=0) {
        printf("ERROR: mutex error\n");
        exit(-1);
    }
    for(;;) {
        if (wf == 1) {
            freze_for_1_ms();
            ++time;
        }

        if(readTag > 0) {
            if(DEBUG == 1)printf("reading\n");           
            

            while((lock(&mtx,10) != 0)) {}
            if(DEBUG == 1)printf("chil--|%c|l\n",mtx.memloc[0]);
            unsigned long long act = 0;
            int from;
            if(getMSG(fd_to_operator,fd_from_operator,&act,&from) == -1) {
                unlock(&mtx);
                if(DEBUG == 1)printf("ERROR: msg lost\n");
                readTag = 0;
                continue;
            }
            else {
                if(from!=parId) {
                    unlock(&mtx);
                    if(DEBUG == 1)printf("ERROR: msg incorrect\n");
                    readTag = 0;
                    continue;
                }
                if(DEBUG == 1)printf("%llu\n",act);
            }
            unlock(&mtx);
            if(DEBUG == 1)printf("chil--|%c|u\n",mtx.memloc[0]);


            if(DEBUG == 1)printf("got post\n");
            if(act == 1) {
                wf = 1;
            }
            else 
            if(act == 2) {
                wf = 0;
            }
            else
            if(act == 3) {
                sendMSG(fd_to_operator,time,parId);
            }
            else {
                printf("ERROR: child got unknown command\n");
            }

            readTag--;
        }

        if(answTag == 1) {
            kill (parId,SIGUSR2); //если процесс спрашивают, жив лион, он отвечает родителю, что жив
            answTag = 0;
        }
    }

    // munmap(adr,MAP_FILE_SIZE);
    //close(ftmp);

    detachFromMutex(&mtx);
    return 0;
}