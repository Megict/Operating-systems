#include <string.h>
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "fcntl.h"
#include <sys/types.h>
#include "tramsformres.h"
#include <sys/mman.h>
#include <signal.h>
//#include "thread.h"
//#include "synch.h"

#define MAP_FILE_SIZE 1000
#define TIMEOUT_TIMER 1000000000


char syncTag = 0;
int upCount = 0;

void taghdl(int sig)
{
    if(sig == SIGUSR1) 
    {
        syncTag = 1;
    }
    else 
    if(sig == SIGUSR2)
    {
        upCount++;
    }
}

int main(int argc,char* argv[])
{
    struct sigaction act_sync;
    memset(&act_sync, 0, sizeof(act_sync));
    act_sync.sa_handler = taghdl;
    sigset_t   set_sync; 
    sigemptyset(&set_sync);
    sigaddset(&set_sync, SIGUSR1); 
    sigaddset(&set_sync, SIGUSR2);
    act_sync.sa_mask = set_sync;
    sigaction(SIGUSR1, &act_sync, NULL);
    sigaction(SIGUSR2, &act_sync, NULL);
    
    //int fd1[1];fd1[0] = argv[1][0];
    int l = strlen(argv[0]);
    char filename1[l]; strcpy(filename1,argv[0]);
    printf("%d\n | ",l);
    int id = back_transform(argv[1]);
    printf("child [%d] parent id is %d\n",getpid(),id);

    int f1,ftmp;
    char* adr;

    //код дочернего процесса 
    printf("[%d] It's child\n",getpid());

    char str[100];

    f1 = open(filename1,O_CREAT | O_WRONLY | O_APPEND, 00660);//открываем все нужные файлы, проводим отображение
    if(f1 == -1) {
        printf("child: ERROR: unable to open output file\n");
        return 0;
    }
    ftmp = open("twpfile", O_RDWR, 00660);
    if(f1 == -1) {
        printf("child: ERROR: unable to open exchange file\n");
        return 0;
    }
    //отображение файла
    adr = mmap(NULL,MAP_FILE_SIZE,PROT_READ | PROT_WRITE, MAP_SHARED,ftmp,0);
    if(adr == MAP_FAILED)
    {
        printf("failed to map\n");
        return 0;
    }
    kill (id,SIGUSR1); //отсылаем родителю сигнал о готовности читать сообщения
    printf("child: ready to read\n");
    for(;;)
    {
        int i=0;
        while(syncTag == 0){//ждем, пока нам разрешат прочесть
            ++i;

            if(i==TIMEOUT_TIMER) {
                if(upCount == 0)
                {
                    printf("chid: ERROR: syncroniser timed out\n");
                    return 0;
                }
                else
                {
                    upCount--;
                    i=0;
                }
            }
        }
        syncTag = 0;
        strcpy(str,adr);
        printf("[%d] read: %s\n",getpid(),str);
        write(f1,str,strlen(str)); 
        write(f1,"\n",1);

        kill(id,SIGUSR1);//сигнализируем о прочтении
    }
    munmap(adr,MAP_FILE_SIZE);
    close(ftmp);
    close(f1);
    return 0;
}