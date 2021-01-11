all: prog/queueCHEK.c prog/msgOPR.c prog/operator.c prog/transformres.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o ch.exe prog/queueCHEK.c prog/msgOPR.c prog/transformres.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o operator.exe prog/operator.c prog/msgOPR.c prog/transformres.c	

operator: prog/msgOPR.c prog/operator.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o operator.exe prog/msgOPR.c prog/operator.c prog/transformres.c
