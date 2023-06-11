#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <stdio.h>


typedef struct msg {
    int from;
    int to; 
    unsigned long long content;
} msg;

typedef struct msgQ { //список указателей на процесы-работники 
    msg** Elem;
    int ListSize;
    int ListCapacity;
    int recipient;
} msgQ;

typedef struct msgOperator{
    msgQ messenges;
} msgOperator;

msg* createMsg(int _from,int _to,char* what);

void send (msgOperator* postman,msg* messenge);

int get (msgOperator* postman,msg* getMSG,int forW);

void OPRinit(msgOperator* opr);


typedef struct Qmas {//массив очередей сообщений
    msgQ** queues;
    int size;
} Qmas;

int findQ(Qmas* mas,int adressate);

int createQ(Qmas* mas,int adressate);

int sendTO(Qmas* mas,int adressate,msg* ms);

msg* reciveBY(Qmas* mas,int adressate,msg* ms);

typedef struct ask {//структура запроса к оператору сообщений
    int action; //1 - послать, 0 - принять
    msg mess;
} ask;