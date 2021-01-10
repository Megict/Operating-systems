#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include "transformres.h"

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <stdio.h>
#include "msQ.h"

#define MAP_FILE_SIZE 100
#define DEBUG 0


int main(int argc,char** argv) {
    printf("creating\n");
    int mn = 1;
    int pid = fork();
    if(pid == 0) {
        mn = 5;
    }
    printf("\t\t <<<%d\n",mn);

    msQ mainQ;
    mainQ.publicPort = open("tmp/mainfif",O_WRONLY);
    if(mainQ.publicPort == -1) {
        return 0;
    }
    
    

    printf("subscribing\n");
    int myID = subscribe(&mainQ);
    
    printf("making\n");
    if(0 != makeQ(&mainQ,1*mn,0)) {
        printf("error making\n");
    }
    else {
        printf("made\n");
    }

    msg* ms;
    ms = createMsg(0,"1924");
    printf("sending\n");
    sendMSG(&mainQ,ms,myID,1*mn);

    msg* msGOT;
    msGOT = createMsg(0,"");
    printf("reciving\n");
    getMSG(&mainQ,msGOT,myID,1*mn);
    printf("res: %s\n",msGOT->content);
    
    sleep(2);


    strcpy(ms->content,"300");
    printf("sending\n");
    sendMSG(&mainQ,ms,myID,1*mn);

    printf("reciving\n");
    getMSG(&mainQ,msGOT,myID,1*mn);
    printf("res: %s\n",msGOT->content);

    
    makeQ(&mainQ,2*mn,1);

    ms->priority = 1;
    strcpy(ms->content,"400");
    printf("sending\n");
    sendMSG(&mainQ,ms,myID,2*mn);

    ms->priority = 8;
    strcpy(ms->content,"310");
    printf("sending\n");
    sendMSG(&mainQ,ms,myID,2*mn);

    printf("reciving\n");
    if(0 == getMSG(&mainQ,msGOT,myID,2*mn))
    printf("res: %s\n",msGOT->content);

    printf("reciving\n");
    if(0 == getMSG(&mainQ,msGOT,myID,2*mn))
    printf("res: %s\n",msGOT->content);

    printf("reciving\n");
    if(0 == getMSG(&mainQ,msGOT,myID,2*mn))
    printf("res: %s\n",msGOT->content);

    //sleep(1);
    //kill(oprPid,SIGTERM);
    return 0;
}