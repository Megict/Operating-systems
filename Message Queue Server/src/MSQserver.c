#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include "transformres.h"
#include <strings.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <stdio.h>
//#include "msgOPR.h"
#include "msQ.h"

#define MAP_FILE_SIZE 100
#define DEBUG 0

int MAXLOGLEN = 10;
int doStartOpr = 0;
char portname[20];


void configurate() {
    FILE* conf = NULL;
    conf = fopen("config","r+");
    char tmp[10];
    if(conf == NULL) {
        conf = fopen("config","w+");
        fprintf(conf,"DOCONF %d\n",doStartOpr);
    }
    else {
        //поиск 
        fseek(conf,0,SEEK_SET);
        if(fscanf(conf,"%s",tmp) == EOF) {
            printf("bad config\n");
            exit(-123);
        }
        while(strcmp(tmp,"DOCONF")!=0) {
            if(fscanf(conf,"%s",tmp) == EOF) {
                printf("bad config\n");
                exit(-123);
            }
        }
        //нашли
        fscanf(conf,"%d",&doStartOpr);

        if(doStartOpr == 1)
        {
            //поиск 
            fseek(conf,0,SEEK_SET);
            if(fscanf(conf,"%s",tmp) == EOF) {
                printf("bad config\n");
                exit(-123);
            }
            while(strcmp(tmp,"MAXLEN")!=0) {
                if(fscanf(conf,"%s",tmp) == EOF) {
                    printf("bad config\n");
                    exit(-123);
                }
            }
            //нашли
            fscanf(conf,"%d",&MAXLOGLEN);
            printf("will create OPR | maxLOGlen: %d\n",MAXLOGLEN);
        }
        else {
            //поиск 
            fseek(conf,0,SEEK_SET);
            if(fscanf(conf,"%s",tmp) == EOF) {
                printf("bad config\n");
                exit(-123);
            }
            while(strcmp(tmp,"PORTNM")!=0) {
                if(fscanf(conf,"%s",tmp) == EOF) {
                    printf("bad config\n");
                    exit(-123);
                }
            }
            //нашли
            fscanf(conf,"%s",portname);
            printf("will connect OPR | ipn: %s\n",portname); //input pipe name
        }
    }
}

int main(int argc,char** argv) {
    int sockfd1 = socket(AF_INET, SOCK_STREAM, 0);

    if(argc < 2) {
        return -2;
    }

    configurate();

    int fdTOopr;
    if(doStartOpr == 0) {
        fdTOopr = open(portname,O_WRONLY);
    }
    else {
        msQ queueMain;
        CreateQueue(&queueMain,MAXLOGLEN);
        fdTOopr = queueMain.publicPort;
    }
    
    if(sockfd1 == -1) {
        printf("error: sock\n");
        return 0;
    }
    if(fdTOopr == -1) {
        printf("error: opr\n");
        return 0;
    }

    int port = atoi(argv[1]);

    printf("port: %d\n",port);

    struct sockaddr_in adr;
    bzero((char *) &adr, sizeof(adr)); 
    adr.sin_port = htons(port);
    adr.sin_family = AF_INET;

    adr.sin_addr.s_addr = htonl(INADDR_ANY);
    if(bind(sockfd1, (struct sockaddr *)&adr, sizeof(adr)) < 0) {
        printf("ERROR binding: bad port\n");
        return 0;
    }

    listen(sockfd1, 1);
    printf("server started\n");

    for(;;) {
        int sockfdCON = accept(sockfd1,NULL,NULL);
        int pid = fork();
        if(pid != 0) {
            continue;
        } 
        else {
            execl("retranslator.exe","retranslator.exe",transform(sockfdCON),transform(fdTOopr),NULL);//запуск ретранслятора
        }
    }
}