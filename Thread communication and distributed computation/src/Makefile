all: main.c list.c msgOPR.c operator.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o prog.exe main.c list.c msgOPR.c mutex.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o worker.exe worker.c msgOPR.c mutex.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o operator.exe operator.c msgOPR.c 	
