#valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt

strace -f -o traces/serv-tr.t ./MSQserver.exe 8311 #запуск сервера

#strace -f -o traces/oprt-tr.t ./operator.exe tmp/mainfif 10 #запуск оператора (отдельно)

strace -f -o traces/clit-tr.t ./ch.exe 127.0.0.1 8311 #запуск тест-клиента
