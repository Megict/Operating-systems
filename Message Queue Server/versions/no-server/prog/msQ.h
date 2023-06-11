#ifndef OPRUI
#define OPRUI

#include <stdlib.h>

//функции, с помощью коих производится взаимодействие между оператором сообщений и иными процессами

typedef struct msg {
    int priority;
    int size; 
    char* content;
} msg;

msg* createMsg(int _from, char* _content);

typedef struct request { //структура запроса к оператору
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

typedef struct msQ { //структура, хранящая информацию об операторе, которая может понадобиться процессу для взаимодействия с ним
    int publicPort; //куда уведомлять оператор
    int localPortIn; //куда посылать сообщения оператору очереди
    int localPortOut; //откуда принимать сообщения
} msQ; //структура, которую получает процесс после подписки на очередь. 

int CreateQueue(msQ* queue); //принимается указатель на массив из 2-х элементов. Процесс, создавший оператор получает его публичные порты. Возвращается PID оператора

int subscribe(msQ* queue); //во входной структуре должен быть прописан публичный порт. Локальные порты будут записаны после получения

int makeQ(msQ* queue,int QID, int doLog);

int sendMSG(msQ* queue, msg* item, int senderLid, int adressateLid);

int getMSG(msQ* queue, msg* item, int senderLid, int adressateLid);

#endif