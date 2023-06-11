#include "string.h"
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "fcntl.h"

int main(int argc,char* argv[])
{
    int fd2[1];fd2[0] = argv[1][0];
    char filename2[100]; strcpy(filename2,argv[0]);

    int f2;
    //код второй дочки
    write(1,"It's child two\n", strlen("It's child two\n"));
    char str[100];
    int i = 0;
    for(;;)
    {  
        f2 = open(filename2,O_CREAT | O_WRONLY | O_APPEND, 00660);
    //    fflush(stdout);
        read(fd2[0],&str[i],1);
    //    printf("[%d] read, got %d\n",getpid(),str[i]);
        char stop[1];stop[0] = 1;
        if(str[i]==stop[0])
        {
            close(fd2[0]);
            close(fd2[1]);
            write(1,"two: stop\n",strlen("two: stop\n"));
            exit(0);
        }

        if(str[i]==0)
        {
            //работа со строкой
            write(1,"two: string is got\n",strlen("two: string is got\n"));

            char res[strlen(str)+1];
            int k = 0;
            for(int j = strlen(str)-1;j>=0;--j,++k)
            {
                res[k] = str[j];
            }

            res[k] = 0;

            write(1,"two: result written\n",strlen("two: result written\n"));
            write(f2,res,strlen(res));
            write(f2,"\n",strlen("\n"));
                            
            i = 0;
        }
        else 
        {
            ++i;
        }
        close(f2);
    }                
    
    close(fd2[0]);
    close(fd2[1]);
}