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

msg* createMsg(int _from,int _to,unsigned long long what) {
    msg* mess = (msg*)malloc(sizeof(msg)); 
    mess->from = _from;
    mess->to = _to;
    mess->content = what;
    return mess;
}

typedef struct msgQ { //список указателей на процесы-работники 
    msg** Elem;
    int ListSize;
    int ListCapacity;
    int recipient;
} msgQ;

void Qinit (msgQ* queue,int rec) {
    queue->Elem = NULL;
    queue->ListSize = 0;
    queue->ListCapacity = 0;
    queue->recipient = rec;
}

int Qadd (msgQ* Li,msg* adb) {
    if(Li->ListSize == 0) {
        Li->Elem = (msg**)realloc(Li->Elem,sizeof(msg*));
        Li->ListCapacity = 1;
    }

    if(Li->ListSize == Li->ListCapacity) {
        Li->ListCapacity*=2; 
        Li->Elem = (msg**)realloc(Li->Elem,sizeof(msg*)*Li->ListCapacity);
    }
    Li->Elem[Li->ListSize] = adb; 
    Li->ListSize++;
    return 1;
}

int Qremove (msgQ* Li,int rmInd) {
    if(Li->ListSize == 0) {
        return 0; 
    }
    for(int i=rmInd;i<Li->ListSize-1;++i) {
        Li->Elem[i] = Li->Elem[i+1];
    }
    Li->ListSize--; 

    if(Li->ListSize *2 > Li->ListCapacity) {//при таком удалении теряется указатель на узел !исправить!
        Li->ListCapacity/=2;
        Li->Elem = (msg**)realloc(Li->Elem,sizeof(msg*)*Li->ListCapacity);
    }
    return 0;
}

// int Qfind(msgQ* Li,int getterID) {
//     printf("%d\n",Li->ListSize);
//     for(int i=0;i<Li->ListSize;++i) {
//         printf("working - %d\n",i);
//         if(Li->Elem[i]->to==getterID) {
//             return i;
//         }
//     }
//     return -1;
// }

msg* QgetPointer(msgQ* Li,int ind) {
    if(Li->ListSize <= ind){
        return NULL;
    }
    else {
        return Li->Elem[ind];
    }
}

msg* Qget (msgQ* Li) {//вытаскивает из очереди первый элемент, возвращает его
    msg* gtb = QgetPointer(Li,0);
    Qremove(Li,0);
    return gtb;
}

typedef struct Qmas {//массив очередей сообщений
    msgQ** queues;
    int size;
} Qmas;

int findQ(Qmas* mas,int adressate) { // возвращает порядковый номер очереди с указанным адресатом в массиве
    for(int i=0;i<mas->size;++i) {
        if(mas->queues[i]->recipient == adressate) {
            return i;
        }
    }
    return -1;
}

int createQ(Qmas* mas,int adressate) {//добавляет в массив очередь с адресатом
    mas->size++;
    mas->queues = (msgQ**)realloc(mas->queues,sizeof(msgQ*)*mas->size);
    mas->queues[mas->size-1] = (msgQ*)malloc(sizeof(msgQ));
    Qinit(mas->queues[mas->size-1],adressate);
    return mas->size-1;
}

int sendTO(Qmas* mas,int adressate,msg* ms) { //это для внутреннего пользования оператором
    int qind = findQ(mas,adressate);
    if(qind == -1) {
        qind = createQ(mas,adressate);
    }

    Qadd(mas->queues[qind],ms); 
    return 1;
}

msg* reciveBY(Qmas* mas,int adressate) {
    int qind = findQ(mas,adressate);
    if(qind == -1) {
        return NULL;
    }

    msg* ms = Qget(mas->queues[qind]);
    
    return ms;

}

typedef struct ask {//структура запроса к оператору сообщений
    int action; //1 - послать, 0 - принять
    msg mess;
} ask;

//а это - для внешнего

int sendMSG(int fd_to_opr,unsigned long long item,int adressate) {
    ask toPM;
    toPM.action = 1;
    toPM.mess.from = getpid();
    toPM.mess.to = adressate;
    toPM.mess.content = item;
    write(fd_to_opr,&toPM,sizeof(toPM));
    return 0;
}

int getMSG(int fd_to_opr,int fd_from_opr,unsigned long long* item, int* transmitter) {
    ask toPM;
    toPM.action = 0; 
    toPM.mess.from = -1;
    toPM.mess.to = getpid();
    toPM.mess.content = 1;
    write(fd_to_opr,&toPM,sizeof(toPM));
    read(fd_from_opr,&toPM,sizeof(toPM));
    if(toPM.action == 2) {
        return -1; //это сообщение от оператора, что сообщений для нас нет
    }
    *item = toPM.mess.content;
    *transmitter = toPM.mess.from;
    return 0;
}
