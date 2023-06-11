#ifndef OPRUI
#define OPRUI

#include <stdlib.h>


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

typedef struct ask {//структура запроса к оператору сообщений
    int action; //1 - послать, 0 - принять
    msg mess;
} ask;

int sendMSG(int fd_to_opr,unsigned long long item,int adressate);
int getMSG(int fd_to_opr,int fd_from_opr,unsigned long long* item,int* from);

#endif