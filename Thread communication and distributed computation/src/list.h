#ifndef LIST
#define LIST 
#include <stdlib.h>
#define Pi 3.1415926

typedef struct proc{
    int lid; 
    int pid; 
    int writePIPE;
    int readPIPE;
} proc;

typedef struct List {
    proc** Elem;
    int ListSize;
    int ListCapacity;
} List;

void LIinit(List* li);

int add (List* Li,proc* adb);

int Lremove (List* Li,int rmInd);

int find(List* Li,int fdb);

int findLID(List* Li,int fdbPID);

proc* getPointer(List* Li,int fdbID);

#endif