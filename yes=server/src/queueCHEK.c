#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include "transformres.h"
#include <strings.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
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

    int res = connectToQ(&mainQ,argv[1],atoi(argv[2]));

    if(res < 0) {
        printf("error connecting\n");
        return 0;
    }
    
    printf("[%d] subscribing\n",getpid());
    int myID = subscribe(&mainQ);
    
    printf("[%d] makingQ (ind %d)\n",getpid(),mn);
    if(0 != makeQ(&mainQ,1*mn,0)) {
        printf("[%d] error making\n",getpid());
    }
    else {
        printf("[%d] made\n",getpid());
    }

    msg* ms;
    ms = createMsg(0,"1924");
    printf("[%d] sending to %d (%s)\n",getpid(),mn,ms->content);
    sendMSG(&mainQ,ms,myID,1*mn);

    msg* msGOT;
    msGOT = createMsg(0,"");
    printf("[%d] reciving from %d\n",getpid(),mn);
    getMSG(&mainQ,msGOT,myID,1*mn);
    printf("[%d] recived: %s\n",getpid(),msGOT->content);
    
    sleep(2);


    strcpy(ms->content,"300");
    printf("[%d] sending to %d (%s)\n",getpid(),mn,ms->content);
    sendMSG(&mainQ,ms,myID,1*mn);

    printf("[%d] reciving from %d\n",getpid(),mn);
    getMSG(&mainQ,msGOT,myID,1*mn);
    printf("[%d] recived: %s\n",getpid(),msGOT->content);

    
    printf("[%d] makingQ (ind %d)\n",getpid(),mn*2);

    if(0 != makeQ(&mainQ,2*mn,1)) {
        printf("[%d] error making\n",getpid());
    }
    else {
        printf("[%d] made\n",getpid());
    }

    ms->priority = 1;
    strcpy(ms->content,"400");
    printf("[%d] sending to %d (%s)\n",getpid(),mn*2,ms->content);
    sendMSG(&mainQ,ms,myID,2*mn);

    ms->priority = 8;
    strcpy(ms->content,"310");
    printf("[%d] sending to %d (%s)\n",getpid(),mn*2,ms->content);
    sendMSG(&mainQ,ms,myID,2*mn);

    printf("[%d] reciving from %d\n",getpid(),2*mn);
    if(0 == getMSG(&mainQ,msGOT,myID,2*mn))
    printf("[%d] recived: %s\n",getpid(),msGOT->content);

    printf("[%d] reciving from %d\n",getpid(),2*mn);
    if(0 == getMSG(&mainQ,msGOT,myID,2*mn))
    printf("[%d] recived: %s\n",getpid(),msGOT->content);

    printf("[%d] reciving from %d\n",getpid(),2*mn);
    if(0 == getMSG(&mainQ,msGOT,myID,2*mn))
    printf("[%d] recived: %s\n",getpid(),msGOT->content);

    sleep(1);
    printf("LAST TEST\n");

    if(mn == 5) {
        free(ms);
        ms = createMsg(0,"sentTOother");
        printf("[%d] sending to %d (%s)\n",getpid(),mn*2,ms->content);
        sendMSG(&mainQ,ms,myID,2*mn);
    } 
    else {
        sleep(1);
    }

    if(mn == 1) {
        printf("[%d] reciving from %d\n",getpid(),4*mn);
        if(0 == getMSG(&mainQ,msGOT,myID,5*2*mn))
        printf("[%d] recived: %s\n",getpid(),msGOT->content);
    }

    //sleep(1);
    //kill(oprPid,SIGTERM);
    return 0;
}