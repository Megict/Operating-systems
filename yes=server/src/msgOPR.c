#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include <time.h>
#include <strings.h>
#include "transformres.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdio.h>


typedef struct msg {
    int priority;
    int size; 
    char* content;
} msg;

msg* createMsg(int _priority, char* _content) {

    if(_priority < 0) {
        return NULL;
    }

    msg* mess = (msg*)malloc(sizeof(msg)); 
    mess->priority = _priority;
    mess->size = strlen(_content) + 1;
    mess->content = (char*)malloc(mess->size);
    mess->content = strcpy(mess->content, _content);
    return mess;
}

void destroyMSG(msg* dbl) {
    free(dbl->content);
    free(dbl);
}

typedef struct msgQ msgQ;
typedef struct msgQ {
    msg** Elem;
    int ListSize;
    int ListCapacity;
    int queueID;

    char logFlag;
    int logLen;
    msgQ* log;
} msgQ;

void Qinit (msgQ* queue,int ID) {
    queue->Elem = NULL;
    queue->ListSize = 0;
    queue->ListCapacity = 0;
    queue->queueID = ID;
    queue->logFlag = 0;
}

void QinitLogged (msgQ* queue,int ID, int logLen) { //очередь логируется. В очереди - журнале хранятся все сообения, что когда-либо были в нее помещены
    queue->Elem = NULL;
    queue->ListSize = 0;
    queue->ListCapacity = 0;
    queue->queueID = ID;

    queue->logFlag = 1;
    queue->logLen = logLen+1;
    queue->log = (msgQ*)malloc(sizeof(msgQ));
    Qinit (queue->log,0);
}

int Qadd (msgQ* Li, msg* adb) {

    if(Li->ListSize == 0) {
        Li->Elem = (msg**)realloc(Li->Elem,sizeof(msg*));
        Li->ListCapacity = 1;
    }

    if(Li->ListSize == Li->ListCapacity) {
        Li->ListCapacity*=2; 
        Li->Elem = (msg**)realloc(Li->Elem,sizeof(msg*)*Li->ListCapacity);
    }
    
    int pos = Li->ListSize;
    for(int i = Li->ListSize - 1;i >= 0;--i) {
        if(Li->Elem[i]->priority < adb->priority) {
            Li->Elem[i+1] = Li->Elem[i];
            pos--;
        }
    }
    Li->Elem[pos] = adb; 
    Li->ListSize++;



    if(Li->logFlag == 1) {
        Qadd(Li->log, adb);
    }

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

    if(Li->logFlag == 1 && Li->log->ListSize >= Li->logLen) { //убираем первыйй элемент из очереди-лога, если ее длина превышает лимит. (доавляются элементы в конец)
        Qremove(Li->log,0);
    }

    return gtb;
}

void Qdestroy(msgQ* Li) {
    if(Li->logFlag == 0) {
        for(int i = 0; i < Li->ListSize; ++i) {
            destroyMSG(Li->Elem[i]);
        }
    }
    else {
        Qdestroy(Li->log);
        free(Li->log);
    }
    free(Li->Elem);
}

typedef struct Qmas {//массив очередей сообщений
    msgQ** queues;
    int size;
} Qmas;

void queueMASinit(Qmas* mas) {
    mas->queues = NULL;
    mas->size = 0;
}

int findQ(Qmas* mas,int adressate) { // возвращает порядковый номер очереди с указанным адресатом в массиве
    for(int i=0;i<mas->size;++i) {
        if(mas->queues[i]->queueID == adressate) {
            return i;
        }
    }
    return -1;
}

msgQ* queueMASlocate(Qmas* mas,int ID) { //возвращает указатель на очередь с ID в массиве mas
    for(int i=0;i<mas->size;++i) {
        if(mas->queues[i]->queueID == ID) {
            return mas->queues[i];
        }
    }

    return NULL;
}

int queueMASadd(Qmas* mas,int ID) {//добавляет в массив очередь с индексом
    mas->size++;
    mas->queues = (msgQ**)realloc(mas->queues,sizeof(msgQ*)*mas->size);
    mas->queues[mas->size-1] = (msgQ*)malloc(sizeof(msgQ));
    Qinit(mas->queues[mas->size-1],ID);
    return mas->size-1;
}

int queueMASaddLogged(Qmas* mas,int ID, int LogMAX) {//добавляет в массив логируемую очередь
    mas->size++;
    mas->queues = (msgQ**)realloc(mas->queues,sizeof(msgQ*)*mas->size);
    mas->queues[mas->size-1] = (msgQ*)malloc(sizeof(msgQ));
    QinitLogged(mas->queues[mas->size-1],ID,LogMAX);
    return mas->size-1;
}

void destroyMAS(Qmas* mas) {
    for(int i=0; i<mas->size;++i) {
        Qdestroy(mas->queues[i]);
        free(mas->queues[i]);
    }
    free(mas->queues);
}

typedef struct subscriber {
    int localID; 
    int localPortIn; //откуда очеердь будет читать сообщения
    int localPortOut; //куда очередь будет писать сообщенияы
} subscriber;

subscriber* createSUB (int lid,int in, int out) {
    subscriber* crt = (subscriber*)malloc(sizeof(subscriber));
    crt->localID = lid;
    crt->localPortIn = in;
    crt->localPortOut = out;
    return crt;
}

typedef struct SUBlist { //список подписсчиков
    subscriber** Elem; 
    int ListSize;
    int ListCapacity; 
} SUBlist;

void subLISTinit (SUBlist* list) {
    list->Elem = NULL; 
    list->ListSize = 0;
    list->ListCapacity = 0;
}

int subLISTadd (SUBlist* Li, subscriber* adb) {
    if(Li->ListSize == 0) {
        Li->Elem = (subscriber**)malloc(sizeof(subscriber*));
        Li->ListCapacity = 1;
    }

    if(Li->ListSize == Li->ListCapacity) {
        Li->ListCapacity*=2; 
        Li->Elem = (subscriber**)realloc(Li->Elem,sizeof(subscriber*)*Li->ListCapacity);
    }
    Li->Elem[Li->ListSize] = adb; 
    Li->ListSize++;
    return 1;
}

subscriber* subLISTlocate (SUBlist* Li, int fdbID) {
    for(int i=0;i<Li->ListSize;++i) {
        if(Li->Elem[i]->localID==fdbID) {
            return Li->Elem[i];
        }
    }
    return NULL;
}

void destroySUBlist (SUBlist* Li) {
    for(int i=0;i<Li->ListSize;++i) {
        close(Li->Elem[i]->localPortIn);
        close(Li->Elem[i]->localPortOut);
        free(Li->Elem[i]);
    }
    free(Li->Elem);
}

typedef struct request {
    int action; 
    //0 - подписаться 
    //1 - отправить сообщение с localIN подписчику с reciverID
    //2 - посмотреть, есть ли для localID сообщения и если есть, переслать их на LocalOUT
    //3 - узнать localID процесса по его PID и переслать его на loclOUT
    int localID; //кто обращается.
    int Qid; //нужно для отправки сообщений
    char localIN[9]; //заранее созданные pipe-ы. Нужны для подписки
    char localOUT[9]; //заранее созданные pipe-ы. Нужны для подписки
} request; //запросы такого вида принимает оператор очереди через publicPort. Дальнейщее взаимодействие идет через локальные порты.

typedef struct msQ {
    int publicPort; //куда уведомлять оператор
    int localPortIn; //куда посылать сообщения оператору очереди
    int localPortOut; //откуда принимать сообщения
} msQ; //структура, которую получает процесс после подписки на очередь. 

char* nameGenerator(int seed) {
    srand(time(NULL)*seed);
    char* ret = (char*)malloc(4);
    for(int i = 0; i < 4; ++i) {
        ret[i] = rand()%20 + 'a';
    }

    char nst[9] = "tmp/";
    strncat(nst,ret,4);
    int k = open(nst,O_WRONLY);
    while(k != -1) {
        close(k);
        for(int i = 0; i < 4; ++i) {
            ret[i] = rand()%20 + 'a';
        }

        char nst[9] = "tmp/";
        strncat(nst,nameGenerator(1),4);
        k = open(nst,O_WRONLY);
    }
    return ret;
}

int CreateQueue(msQ* queue, int maxlen) { //принимается указатель на массив из 2-х элементов. Процесс, создавший оператор получает его публичные порты. Возвращается PID оператора
    //fd[0] - общий дескриптор для отправки сообщений оператору.
    // int fd1[2];
    // pipe(fd1);
    // fd[0] = fd1[1];

    char* globalFIF;

    char nst[9] = "tmp/";
    system("mkdir tmp");
    char* gen = nameGenerator(3*getpid());
    strncat(nst,gen,4);
    free(gen);
    mkfifo(nst, 0777);

    globalFIF = (char*)malloc(sizeof(nst));
    strcpy(globalFIF,nst);

    int queueOprID = fork(); //запуск процесса оператора очереди
    if(queueOprID == -1) {
        return -1;
    }
    else
    if(queueOprID == 0) {
        execl("operator.exe","operator.exe",globalFIF,transform(maxlen),NULL);
        free(globalFIF);
        return 0;
    }
    else {
        queue->publicPort = open(globalFIF,O_WRONLY);
        free(globalFIF);
        return queueOprID;
    }
}

int connectToQ(msQ* queue,char* ip,int port) {
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if(sockfd == -1) {
        return -1;
    }
    
    struct sockaddr_in adr;
    bzero((char *) &adr, sizeof(adr)); 

    //if(inet_pton(AF_INET,ip,&adr.sin_addr.s_addr) < 0)
    adr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);

    adr.sin_port = htons(port);
    adr.sin_family = AF_INET;

    if(connect(sockfd, (struct sockaddr *)&adr, sizeof(adr)) < 0) {
        return -2;
    }
    else {
        queue->publicPort = sockfd;
        return 0;
    }
}


int subscribe(msQ* queue) { //во входной структуре должен быть прописан публичный порт. Локальные порты будут записаны после получения
    //возвращаемое значение - код успеха
    //после отправки запроса по дескриптору 0 необходимо уведомить оператор сообщением на глобальный дескриптор.
    char* fif1;
    char* fif2;

    char nst[9] = "tmp/";
    char* gen = nameGenerator(1*getpid());
    strncat(nst,gen,4);
    free(gen);
    mkfifo(nst, 0777);

    fif1 = (char*)malloc(sizeof(nst));
    strcpy(fif1,nst);

    strcpy(nst,"tmp/");
    gen = nameGenerator(2*getpid());
    strncat(nst,gen,4);
    free(gen);
    mkfifo(nst, 0777);

    fif2 = (char*)malloc(sizeof(nst));
    strcpy(fif2,nst);

    printf("<%s|%s>\n",fif1,fif2);

    request qCall; //эта структура будет отправлена оператору
    qCall.action = 1;
    qCall.localID = getpid();
    qCall.Qid=0;
    printf("<%s|%s>\n",fif1,fif2);
    strcpy(qCall.localIN, fif1); //это на чтение
    strcpy(qCall.localOUT, fif2); //это открыть на запись

    //write(fd2[1],"1",sizeof("1"));

    //printf("sub: sent (%d)\n",qCall.localOUT);
    write(queue->publicPort,&qCall,sizeof(qCall));

    queue->localPortIn = open(fif1,O_WRONLY);
    queue->localPortOut = open(fif2,O_RDONLY);
    free(fif1);
    free(fif2);

    int lid;
    
    read(queue->localPortOut,&lid,sizeof(int)); 

    return lid;

    //сформировать запрос на подписку
    //считать с выходного дескриптора сигнал об успешной подписке
    //вернуть localID?
}

int makeQ(msQ* queue,int QID, int logged) {
    request qCall; //эта структура будет отправлена оператору
    qCall.action = 4;
    qCall.localID = getpid();
    qCall.Qid = QID;

    if(logged == 0) {
        strcpy(qCall.localIN,"00000000"); //далеко не только чтобы valgrind не ругался
    }
    else {
        strcpy(qCall.localIN,"00000000"); //далеко не только чтобы valgrind не ругался
        qCall.localIN[0] = 1;
    }
    strcpy(qCall.localOUT,"00000000"); //но он все равно ругается (

    write(queue->publicPort,&qCall,sizeof(qCall));

    int resp = -1;
    read(queue->localPortOut,&resp,sizeof(int));
    return resp;
        //-1 - чето прям ваще не так
        //0 - очередь создана
        //1 - такой идентефикатор уже есть
}

int sendMSG(msQ* queue, msg* item, int QID) {
    request qCall; //эта структура будет отправлена оператору

    qCall.action = 2;
    qCall.localID = getpid();
    qCall.Qid = QID;
    strcpy(qCall.localIN,"00000000"); //исключительно чтобы valgrind не ругался
    strcpy(qCall.localOUT,"00000000");

    //write(queue->localPortIn,item,sizeof(msg)); //отправляем сообщение на localIN очереди

    write(queue->localPortIn,&item->priority,sizeof(int));
    write(queue->localPortIn,&item->size,sizeof(int));
    write(queue->localPortIn,item->content,item->size);

    write(queue->publicPort,&qCall,sizeof(qCall)); //отправляем уведомление очереди о том, что надо переслать сообщение
    return 0;
}

int getMSG(msQ* queue, msg* item, int QID) {
    request qCall; //эта структура будет отправлена оператору
    qCall.action = 3;
    qCall.localID = getpid();
    qCall.Qid = QID;
    strcpy(qCall.localIN,"00000000"); //исключительно чтобы valgrind не ругался
    strcpy(qCall.localOUT,"00000000");

    write(queue->publicPort,&qCall,sizeof(qCall)); //отправляем уведомление очереди о том, что надо проверить наличие сообщений
    //read(queue->localPortOut,item,sizeof(msg)); //считываем сообщение с localOUT очереди
    read(queue->localPortOut,&item->priority,sizeof(int));

    if(item->priority == -1) { //значит, собщения нету
        return -1;
    }

    read(queue->localPortOut,&item->size,sizeof(int));
    item->content = (char*)realloc(item->content,item->size);
    read(queue->localPortOut,item->content,item->size);

    return 0;
}
