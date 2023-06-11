#ifndef MUTEX
#define MUTEX

/*
    простой мьютекс, основанный на mmf 
    может существовать в единственном экземпляре
*/

typedef struct mutex {
    int descr; 
    char* memloc;
} mutex;


int createMutex();
int linkToMutex(mutex* mtx);
void detachFromMutex(mutex* mtx);
int lock(mutex* mtx, int timeout);
int unlock(mutex* mtx);

#endif