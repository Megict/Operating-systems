//Гаврилов М.С. М8О-206Б-19 | Лр#5, вар. 21

#include <string.h>
#include <unistd.h>
#include <stdlib.h>


//#include "interface.h"
#include <stdio.h>
#include "geometryLib1.h"
//#include "thread.h"
//#include "synch.h"



int main() {    
    int cmdInd = 0;

    while(scanf("%d",&cmdInd)!=EOF) {

        if(cmdInd == 1) {
            float args[3];
            float Res;
           // float (*func)(float,float,float);
            scanf("%f %f %f",&args[0],&args[1],&args[2]);

            Res = SinIntegral(args[0],args[1],args[2]);
            printf("%lf\n",Res);
        }
        else
        if(cmdInd == 2) {
            long args[1];
            char* Res;
           // char (*func)(long);
            scanf("%li",&args[0]);
            Res = translation(args[0]);
            printf("%s\n",Res);
        }

    }
}