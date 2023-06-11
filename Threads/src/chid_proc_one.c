#include "string.h"
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "fcntl.h"

int main(int argc,char* argv[])
{
    int fd1[1];fd1[0] = argv[1][0];
    char filename1[100]; strcpy(filename1,argv[0]);

    int f1;
    //код дочернего процесса 
    write(1,"It's child\n",strlen("It's child\n"));  
    char str[100];
    int i=0;
    for(;;)
    {    
        f1 = open(filename1,O_CREAT | O_WRONLY | O_APPEND, 00660);
 //       fflush(stdout);
        read(fd1[0],&str[i],sizeof(char));
        //printf("[%d] read, got %d\n",getpid(),str[i]);
        char stop[1];stop[0] = 1;
        if(str[i]==stop[0])
        {
            close(fd1[0]);
            close(fd1[1]);
            write(1,"one: stop\n",strlen("one: stop\n"));
            exit(0);
        }
        if(str[i]==0)
        {
            //работа со строкой
            write(1,"one: string got\n",strlen("one: string got\n\n"));

            char res[strlen(str)+1];
            int k = 0;
            for(int j = strlen(str)-1;j>=0;--j,++k)
            {
                res[k] = str[j];
            }

            res[k] = 0;

            write(1,"one: result written\n",strlen("one: result written\n"));
            write(f1,res,strlen(res));
            write(f1,"\n",strlen("\n"));
            
            i = 0;
        }
        else 
        {
            ++i;
        }
        close(f1);
    }

    close(fd1[0]);
    close(fd1[1]);
}