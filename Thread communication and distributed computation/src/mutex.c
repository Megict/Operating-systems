#include <string.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/types.h>

/*
    простой мьютекс, основанный на mmf 
    может существовать в единственном экземпляре
*/

typedef struct mutex {
    int descr; 
    char* memloc;
} mutex;

int initMMF(char* filename) {
    int a = open(filename,O_CREAT | O_WRONLY | O_TRUNC, 00660); //создание и инициализация отображаемого файла
    for(int i=0;i<2;++i) {
        write(a,"0",1);
    }
    close(a);
    return 0;
}

int createMutex() {
    if(initMMF("MTF")==0) {
        return 0;
    }
    else {
        return 1;
    }
}

int linkToMutex(mutex* mtx) {
    mtx->descr = open("MTF", O_RDWR, 00660);
    mtx->memloc = mmap(NULL,2,PROT_READ | PROT_WRITE, MAP_SHARED,mtx->descr,0);
    if(mtx->memloc == MAP_FAILED)
    {
        return -1;
    }
    return 0;
}

void detachFromMutex(mutex* mtx) {
    munmap(mtx->memloc,2);
    close(mtx->descr);
} 

int lock(mutex* mtx, int timeout) { //пропробовать захватить мьютекс и выдать ошибку, если он недоступен в течении timeout секуд
    int i=0;
    while(mtx->memloc[0]!='0') {
        sleep(0.1);
        ++i;
        if(i>(timeout/10)) {
            return -1;
        }
    };
    mtx->memloc[0] = '1';
    return 0;
}

void unlock(mutex* mtx) {
    mtx->memloc[0] = '0';
}