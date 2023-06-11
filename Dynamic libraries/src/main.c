//Гаврилов М.С. М8О-206Б-19 | Лр#5, вар. 7

#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>

//#include "interface.h"
#include <stdio.h>
#include <dlfcn.h>
//#include "thread.h"
//#include "synch.h"
#define Pi 3.1415926

int exeFL_t1 (char* libname, char* funcname, float* funcArgs,float* res) {
    void* lib;
    char* error;
    lib = dlopen(libname, RTLD_LAZY);
    error = dlerror();
    if(error != NULL) {
        printf("%s\n",error);
        return -1;
    }
    float (*func)(float,float,float);
    func = dlsym(lib,funcname);
    error = dlerror();
    if(error != NULL) {
        printf("%s\n",error);
        return -2;
    }


    *res = (*func)(funcArgs[0],funcArgs[1],funcArgs[2]);
    
    dlclose(lib);
    return 0;
}

int exeFL_t2 (char* libname, char* funcname, long* funcArgs, char** res) {
    void* lib;
    char* error;
    lib = dlopen(libname, RTLD_LAZY);
    error = dlerror();
    if(error != NULL) {
        printf("%s\n",error);
        return -1;
    }
    char* (*func)(long);
    func = dlsym(lib,funcname);
    error = dlerror();
    if(error != NULL) {
        printf("%s\n",error);
        return -2;
    }

    *res = (*func)(funcArgs[0]);
    
    dlclose(lib);
    return 0;
}

int main() {
    char* libPath[2];//заполнение адресов библиотек
    libPath[0] = (char*)malloc(200);
    libPath[0] = strcpy(libPath[0],"/home/max/Рабочий стол/OS/lab5/prog/libOne.so");
    libPath[1] = (char*)malloc(200);
    libPath[1] = strcpy(libPath[1],"/home/max/Рабочий стол/OS/lab5/prog/libTwo.so");

    char* funcNames[2]; 
    funcNames[0] = (char*)malloc(200);
    funcNames[0] = strcpy(funcNames[0],"SinIntegral");
    funcNames[1] = (char*)malloc(200);
    funcNames[1] = strcpy(funcNames[1],"translation");

    int switcher = 0,cmdInd = 0;

    while(scanf("%d",&cmdInd)!=EOF) {
        
        if(cmdInd == 0) {
            if(switcher == 0 ) {
                switcher = 1;
                printf("using lib two\n");
            } //переключение библиотек
            else {
                printf("using lib one\n");
                switcher = 0;
            }
        } 
        else 
        if(cmdInd == 1) {
            float args[3];
            float Res;
            scanf("%f %f %f",&args[0],&args[1],&args[2]);
            if (exeFL_t1(libPath[switcher],funcNames[cmdInd-1],args,&Res) != 0) {
                printf("ERROR\n"); 
            }
            else {
                printf("%lf\n",Res);
            }
        }
        else
        if(cmdInd == 2) {
            long args[1];
            char* Res;
            scanf("%li",&args[0]);
            if (exeFL_t2(libPath[switcher],funcNames[cmdInd-1],args,&Res)!=0) {
                printf("ERROR\n"); 
            }
            else {
                printf("%s\n",Res);
            }
        }

    }
}