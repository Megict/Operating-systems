all: src/queueCHEK.c src/msgOPR.c src/operator.c src/transformres.c src/MSQserver.c src/retranslator.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o ch.exe src/queueCHEK.c src/msgOPR.c src/transformres.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o operator.exe src/operator.c src/msgOPR.c src/transformres.c	
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o MSQserver.exe src/MSQserver.c src/msgOPR.c src/transformres.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o retranslator.exe src/retranslator.c src/msgOPR.c src/transformres.c

operator: src/msgOPR.c src/operator.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o operator.exe src/msgOPR.c src/operator.c src/transformres.c

server: src/MSQserver.c src/retranslator.c src/msgOPR.c src/transformres.c 
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o MSQserver.exe src/MSQserver.c src/msgOPR.c src/transformres.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o retranslator.exe src/retranslator.c src/msgOPR.c src/transformres.c

client: src/queueCHEK.c src/msgOPR.c src/transformres.c
	gcc -Wall -std=c99 -D_POSIX_C_SOURCE=199309L -o ch.exe src/queueCHEK.c src/msgOPR.c src/transformres.c
