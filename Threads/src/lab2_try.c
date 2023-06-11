//Гаврилов М.С. М8О-206Б-19 | Лр#2, вар. 21

// Родительский процесс создает два дочерних процесса. Первой строкой пользователь 
// в консоль родительского процесса вводит имя файла, которое будет использовано для
//  открытия File с таким именем на запись для child1. Аналогично для второй строки 
//  и процесса child2. Родительский и дочерний процесс должны быть представлены разными
//   программами. 
// Родительский процесс принимает от пользователя строки произвольной длины и пересылает
//  их в pipe1 или в pipe2 в зависимости от правила фильтрации. Процесс child1 и 
//  child2 производят работу над строками. Процессы пишут результаты своей работы в 
//  стандартный вывод. 

// Правило фильтрации: нечетные строки отправляются в pipe1, четные в pipe2. Дочерние 
// процессы инвертируют строки.

#include <string.h>
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "fcntl.h"


int main()
{
    write(1,"Input two filenames\nthen input strings to be inverted\n",strlen("Input two filenames\nthen input strings to be inverted\n"));
    char filename1[100];
    char filename2[100];
//

    char buf = 0; int i = 0;
    while(buf != '\n')
    {
        read(0,&buf,1);
        filename1[i] = buf;
        ++i;
    }
    filename1[i-1] = 0;


    for(;;)
    {
        char buf = 0; i = 0;
        while(buf != '\n')
        {
            read(0,&buf,1);
            filename2[i] = buf;
            ++i;
        }
        filename2[i-1] = 0;
        
        if(strcmp(filename1,filename2)==0)
        {
            write(1,"please input string differ to name one\n",strlen("please input string differ to name one\n"));
        }
        else 
        {
            break;
        }   
    }

    int l = strlen(filename1);
    for(int j=0;j<l;++j)
    {
        if(filename1[j]=='\n')
        {
            filename1[j] = 0;
        }
    }

    l = strlen(filename2);
    for(int j=0;j<l;++j)
    {
        if(filename2[j]=='\n')
        {
            filename2[j] = 0;
        }
    }

    int a = open(filename1,O_CREAT | O_WRONLY | O_TRUNC, 00660);
    write(a,"This is file one\n(even)\n\n",strlen("This is file one\n(even)\n\n"));
    close(a);

    a = open(filename2,O_CREAT | O_WRONLY | O_TRUNC, 00660);
    write(a,"This is file two\n(odd)\n\n",strlen("This is file two\n(odd)\n\n"));
    close(a);

    int fd1[2];
    pipe(fd1); //pipe привязывает к своим концам элементы fd ([0] - выход, [1] - вход)

    write(1,"initiating process separation\n",strlen("initiating process separation\n"));
    int id = fork(); //разделение процесса, в основном процессе id будет соответствовать pid порожденного, в порожденном id = 0


    if(id == -1) //ошибка
    {
        write(1,"error\n",strlen("error\n"));
        return -1;
    }
    else 
    if(id == 0)
    {
        char arg1[1]; arg1[0] = fd1[0];
        execl("chid_proc_one.out",filename1,arg1,NULL);
    }
    else 
    {
        //код основного процесса
        int fd2[2];
        pipe(fd2);
        int id2 = fork();

        if(id2 == -1)
        {
            write(1,"error in genetating str 2\n",strlen("error in genetating str 2\n"));
            return -1;
        }
        else
        if(id2 == 0)
        {
            char arg2[1]; arg2[0] = fd2[0];
            execl("chid_proc_one.out",filename2,arg2,NULL);
        }
        else 
        {
            //основной процесс
		    write(1,"parent: It's parent\n", strlen("parent: It's parent\n"));

            char inp[100];

            int x,y;
            int stp = 0;
            while(stp==0)
            {
                char buf = 0; i = 0;
                while(buf != '\n')
                {
                    if(read(0,&buf,1)==0)
                    {
                        stp = 1;
                        break;
                    }
                    inp[i] = buf;
                    ++i;
                }
                inp[i-1] = 0;

                int l = strlen(inp);
                for(int j=0;j<l;++j)
                {
                    if(inp[j]=='\n')
                    {
                        inp[j] = 0;
                    }
                }
                l = strlen(inp);

                if(l % 2 == 0)
                {
                    write(fd1[1],inp,sizeof(char)*(l+1));
                }
                else
                {
                    write(fd2[1],inp,sizeof(char)*(l+1));
                }

                strcpy(inp,"");
            }

            char stop[1];
            stop[0] = 1;
            write(fd1[1],stop,sizeof(char));
            write(fd2[1],stop,sizeof(char));

            close(fd1[0]);
            close(fd1[1]);
            close(fd2[0]);
            close(fd2[1]);

            write(1,"parent: stop\n",strlen("parent: stop\n"));
            return 0; 
        }

    }
    //общий код 
    return 0; 
}
