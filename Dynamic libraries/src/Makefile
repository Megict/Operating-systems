all: geometryLib1.c geometryLib2.c main.c static.c
	gcc -Wall --std=c99 -shared -fPIC -lm -o libOne.so geometryLib1.c -lm
	gcc -Wall --std=c99 -shared -fPIC -lm -o libTwo.so geometryLib2.c -lm
	gcc -Wall --std=c99 -o ProgOne.out static.c geometryLib1.c -lm
	gcc -Wall --std=c99 -o ProgTwo.out main.c -ldl -lm

static: geometryLib1.c static.c 
	gcc -Wall --std=c99 -lm -o ProgOne.out static.c geometryLib1.c -lm

dynamic: 
	gcc -Wall --std=c99 -shared -fPIC -lm -o libOne.so geometryLib1.c -lm
	gcc -Wall --std=c99 -shared -fPIC -lm -o libTwo.so geometryLib2.c -lm
	gcc -Wall --std=c99 -o ProgTwo.out main.c -ldl -lm
