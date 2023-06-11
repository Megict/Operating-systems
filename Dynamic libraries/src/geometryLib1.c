#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#define prc 0.001

float SinIntegral(float A,float B,float d) {
    float sum = 0;
    for(float i = A;i <= B; i += d) {
        sum+= sin(i)*d;
    }
    return sum;
}

char* translation(long A) {
    int i=0;
    int s = 10;
    char* res = (char*)malloc(s);
    while(A>0) {
        if(i >= s) {
            s*=2;
            res = (char*)realloc(res,s);
        }
        if(A%2 == 1) {
            res[i] = '1';
        }
        else {
            res[i] = '0';
        }
        A/=2;

        ++i;
    }
    res[i] = 0;
    i--;
    char* str = (char*)malloc(s);
    int j = 0;
    for(j = 0;j<=i;++j) {
        str[j] = res[i-j];
    }
    str[j] = 0;
    free(res);
    return str;
}