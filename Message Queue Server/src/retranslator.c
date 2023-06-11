#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>
#include <signal.h>
#include "transformres.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <stdio.h>
#include "msgOPR.h"

#define MAP_FILE_SIZE 100
#define DEBUG 0


int main(int argc,char** argv) {
    if(argc < 3) {
        return -1;
    }

    int sockfd = back_transform(argv[1]);
    int fdTOopr = back_transform(argv[2]);
    
    if(sockfd == -1) {
        printf("error: sock\n");
        return -1;
    }
    else {
        printf("retranslator activated\n");
    }

    request rqt;

    for(;;) {
        if(read(sockfd,&rqt,sizeof(request)) == sizeof(request))
        write(fdTOopr,&rqt,sizeof(request));
    }

}