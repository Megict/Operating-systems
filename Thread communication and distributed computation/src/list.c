#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#define Pi 3.1415926

typedef struct proc{
    int lid; 
    int pid;
} proc;

typedef struct List { //список указателей на процесы-работники 
    proc** Elem;
    int ListSize;
    int ListCapacity;
} List;

void LIinit(List* li) {
    li->Elem = NULL; 
    li->ListSize = 0;
    li->ListCapacity = 0;
}

int add (List* Li,proc* adb) {
    if(Li->ListSize == 0) {
        Li->Elem = (proc**)malloc(sizeof(proc*));
        Li->ListCapacity = 1;
    }

    if(Li->ListSize == Li->ListCapacity) {
        Li->ListCapacity*=2; 
        Li->Elem = (proc**)realloc(Li->Elem,sizeof(proc*)*Li->ListCapacity);
    }
    Li->Elem[Li->ListSize] = adb; 
    Li->ListSize++;
    return 1;
}

int Lremove (List* Li,int rmInd) {
    for(int i=rmInd;i<Li->ListSize-1;++i) {
        Li->Elem[i] = Li->Elem[i+1];
    }
    Li->ListSize--; 

    if(Li->ListSize *2 > Li->ListCapacity) {//при таком удалении теряется указатель на узел !исправить!
        Li->ListCapacity/=2;
        Li->Elem = (proc**)realloc(Li->Elem,sizeof(proc*)*Li->ListCapacity);
    }
    return 0;
}

int find(List* Li,int fdbID) {
    for(int i=0;i<Li->ListSize;++i) {
        if(Li->Elem[i]->lid==fdbID) {
            return i;
        }
    }
    return -1;
}

int findLID(List* Li,int fdbPID) { //находи lid процесса по его pid
    for(int i=0;i<Li->ListSize;++i) {
        if(Li->Elem[i]->pid==fdbPID) {
            return Li->Elem[i]->lid;
        }
    }
    return -1;
}

proc* getPointer(List* Li,int fdbID) {
    for(int i=0;i<Li->ListSize;++i) {
        if(Li->Elem[i]->lid==fdbID) {
            return Li->Elem[i];
        }
    }
    return NULL;
}
