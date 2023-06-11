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

#include <stdio.h>
#include "msgOPR.h"

#define MAP_FILE_SIZE 100
#define DEBUG 0


void taghdl(int sig)
{
    if(sig == SIGTERM) 
    {
        exit(0);
    }
}

int main(int argc,char** argv) {
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

    int fd_com_from = back_transform(argv[0]);//откуда читать
    int fd_com_to = back_transform(argv[1]);//куда писать
    
    if(DEBUG == 1)printf("operator activatrd\n");
    
    Qmas allmsges;
    allmsges.size = 0;
    allmsges.queues = NULL; 

    
    for(;;) {
        ask cur_ask;
        cur_ask.action = -1;
        cur_ask.mess.content = 0;
        
        read(fd_com_from,&cur_ask,sizeof(cur_ask));
        if(DEBUG == 1)printf("operator| got ask\n");

        if(DEBUG == 1) {
            for(int i=0;i<allmsges.size;++i) {
                printf("|%d|-|",allmsges.queues[i]->recipient);
                for(int j=0;j<allmsges.queues[i]->ListSize;++j) {
                    printf("%llu|",allmsges.queues[i]->Elem[j]->content);
                }
                printf("(%d)\n",allmsges.queues[i]->ListSize);
            }
        }

        if(DEBUG == 1)printf("operator| %d | %d - %d |%llu\n",cur_ask.action, cur_ask.mess.from, cur_ask.mess.to,cur_ask.mess.content);

        if(cur_ask.action == 1) {
            if(DEBUG == 1)printf("operator| sending...\n");
            msg* mesSD = (msg*)malloc(sizeof(msg));
            mesSD->to = cur_ask.mess.to;
            mesSD->from = cur_ask.mess.from;
            mesSD->content = cur_ask.mess.content;

            if(DEBUG == 1)printf("operator| msg is: %llu\n",mesSD->content);
            sendTO(&allmsges,mesSD->to,mesSD);
            //kill(cur_ask.mess.to,SIGUSR1);
        }
        else 
        if(cur_ask.action == 0) {
            if(DEBUG == 1)printf("operator| cheking...\n");
            msg* mesSD = reciveBY(&allmsges,cur_ask.mess.to,mesSD);
            if(mesSD!=NULL) {
                cur_ask.mess.from = mesSD->from;
                cur_ask.mess.content = mesSD->content;

                free(mesSD);

                if(DEBUG == 1)printf("operator| msg is: %llu\n",cur_ask.mess.content);
                write(fd_com_to,&cur_ask,sizeof(cur_ask));
            }
            else {
                if(DEBUG == 1)printf("operator| no messenges\n");
                cur_ask.action = 2; //это значит, что не удалось прочитать
                write(fd_com_to,&cur_ask,sizeof(cur_ask));
            }
        }
          
    }

}