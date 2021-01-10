#ifndef MSG_OPR
#define MSGOPR
#include <stdlib.h>

//функциии, необходиые для работы оператора очереди (сервера сообещний)

typedef struct msg {
    int priority;
    int size;
    char* content;
} msg;

msg* createMsg(int _from,char* _content); //создание сообщения из элементов (переработать)

typedef struct msgQ msgQ;
typedef struct msgQ { //очередь сообщений
    msg** Elem;
    int ListSize;
    int ListCapacity;
    int queueID; //идентефикатор очереди

    char logFlag;
    int logLen;
    msgQ* log;
} msgQ;

void Qinit (msgQ* queue,int ID); //инициализация очереди

void QinitLogged (msgQ* queue,int ID, int logLen); //инициализация очереди

int Qadd (msgQ* Li,msg* adb); //добавляет элемент в конец очереди

msg* Qget (msgQ* Li); //удаляет из очереди первый элемент, возвращает его указатель

typedef struct Qmas {//массив очередей сообщений. В нем оператор очереди хранит все сообщения
    msgQ** queues;
    int size;
} Qmas;

void queueMASinit(Qmas* mas); //инициализация очереди

int findQ(Qmas* mas,int adressate); // возвращает порядковый номер очереди с указанным адресатом в массиве (вроде не юзается)

msgQ* queueMASlocate(Qmas* mas,int ID); //возвращает указатель на очередь с ID в массиве mas

int queueMASadd(Qmas* mas,int ID); //создает очередь и добавляет ее в массив очередей

int queueMASaddLogged(Qmas* mas,int ID, int maxLogSize);

typedef struct subscriber { //запись о подписчике. Содержит данные о каналах коммуникации с процессом
    int localID; 
    int localPortIn; //откуда очеердь будет читать сообщения
    int localPortOut; //куда очередь будет писать сообщенияы
} subscriber;

subscriber* createSUB (int lid,int in, int out); //создать запись подписчика

typedef struct SUBlist { //список подписсчиков
    subscriber** mas; 
    int size;
    int capacity; 
} SUBlist;

void subLISTinit (SUBlist* list); //инициализировать список подписчиков

int subLISTadd (SUBlist* Li, subscriber* adb); //добавить подписчика в список

subscriber* subLISTlocate (SUBlist* Li, int fdbID); //вытащить элемент из списка подписчиков

void Qdestroy(msgQ* Li);

void destroyMAS(Qmas* mas);

void destroySUBlist (SUBlist* Li);

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
    //int PID; //нужно для запроса lid
} request; //запросы такого вида принимает оператор очереди через publicPort. Дальнейщее взаимодействие идет через локальные порты.

typedef struct msQ {
    int publicPort; //куда уведомлять оператор
    int localPortIn; //куда посылать сообщения оператору очереди
    int localPortOut; //откуда принимать сообщения
} msQ; //структура, которую получает процесс после подписки на очередь. 

#endif