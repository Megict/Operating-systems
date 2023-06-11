7178  15:16:42.863038 execve("./exethr.out", ["./exethr.out", "-4"], 0x7ffedb37f2f8 /* 47 vars */) = 0
7178  15:16:42.865311 brk(NULL)         = 0x564004578000
7178  15:16:42.865622 arch_prctl(0x3001 /* ARCH_??? */, 0x7ffd481b3bc0) = -1 EINVAL (Недопустимый аргумент)
7178  15:16:42.866323 access("/etc/ld.so.preload", R_OK) = -1 ENOENT (Нет такого файла или каталога)
7178  15:16:42.866640 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
7178  15:16:42.866789 fstat(3, {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
7178  15:16:42.866900 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f994e583000
7178  15:16:42.867004 close(3)          = 0
7178  15:16:42.867120 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
7178  15:16:42.867242 read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
7178  15:16:42.867372 pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7178  15:16:42.867473 pread64(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7178  15:16:42.867566 pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7178  15:16:42.867662 fstat(3, {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
7178  15:16:42.867760 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f994e581000
7178  15:16:42.867878 pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7178  15:16:42.867976 pread64(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7178  15:16:42.868105 pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7178  15:16:42.868245 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f994e38f000
7178  15:16:42.868389 mprotect(0x7f994e3b4000, 1847296, PROT_NONE) = 0
7178  15:16:42.868554 mmap(0x7f994e3b4000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7f994e3b4000
7178  15:16:42.869107 mmap(0x7f994e52c000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19d000) = 0x7f994e52c000
7178  15:16:42.869273 mmap(0x7f994e577000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7f994e577000
7178  15:16:42.869409 mmap(0x7f994e57d000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f994e57d000
7178  15:16:42.869557 close(3)          = 0
7178  15:16:42.869881 arch_prctl(ARCH_SET_FS, 0x7f994e582540) = 0
7178  15:16:42.870135 mprotect(0x7f994e577000, 12288, PROT_READ) = 0
7178  15:16:42.870290 mprotect(0x564003577000, 4096, PROT_READ) = 0
7178  15:16:42.870399 mprotect(0x7f994e5c4000, 4096, PROT_READ) = 0
7178  15:16:42.870500 munmap(0x7f994e583000, 77941) = 0
7178  15:16:42.870799 fstat(1, {st_mode=S_IFREG|0664, st_size=0, ...}) = 0
7178  15:16:42.871047 brk(NULL)         = 0x564004578000
7178  15:16:42.871143 brk(0x564004599000) = 0x564004599000
7178  15:16:42.871320 pipe([3, 4])      = 0
7178  15:16:42.871524 pipe([5, 6])      = 0
7178  15:16:42.871716 pipe([7, 8])      = 0
7178  15:16:42.871867 pipe([9, 10])     = 0
7178  15:16:42.872001 pipe([11, 12])    = 0
7178  15:16:42.872103 pipe([13, 14])    = 0
7178  15:16:42.872200 pipe([15, 16])    = 0
7178  15:16:42.872303 pipe([17, 18])    = 0
7178  15:16:42.872420 clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f994e582810) = 7180
7178  15:16:42.872738 clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f994e582810) = 7181
7181  15:16:42.873069 getpid()          = 7181
7181  15:16:42.873326 write(10, "1", 1) = 1
7181  15:16:42.873559 execve("child_any.out", ["01", "7"], 0x7ffd481b3cb0 /* 47 vars */ <unfinished ...>
7180  15:16:42.873960 getpid()          = 7180
7181  15:16:42.874523 <... execve resumed> ) = 0
7180  15:16:42.874685 write(6, "1", 1 <unfinished ...>
7181  15:16:42.874781 brk(NULL <unfinished ...>
7180  15:16:42.874834 <... write resumed> ) = 1
7178  15:16:42.875026 clone( <unfinished ...>
7181  15:16:42.875092 <... brk resumed> ) = 0x563a3ee1c000
7180  15:16:42.875145 execve("child_any.out", ["6", "3"], 0x7ffd481b3cb0 /* 47 vars */ <unfinished ...>
7181  15:16:42.875472 arch_prctl(0x3001 /* ARCH_??? */, 0x7ffd28d30b20 <unfinished ...>
7178  15:16:42.875548 <... clone resumed> child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f994e582810) = 7182
7181  15:16:42.875611 <... arch_prctl resumed> ) = -1 EINVAL (Недопустимый аргумент)
7178  15:16:42.875667 clone( <unfinished ...>
7181  15:16:42.875781 access("/etc/ld.so.preload", R_OK <unfinished ...>
7182  15:16:42.875958 getpid( <unfinished ...>
7181  15:16:42.876043 <... access resumed> ) = -1 ENOENT (Нет такого файла или каталога)
7178  15:16:42.876099 <... clone resumed> child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f994e582810) = 7183
7181  15:16:42.876153 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC <unfinished ...>
7178  15:16:42.876220 read(5,  <unfinished ...>
7181  15:16:42.876272 <... openat resumed> ) = 19
7178  15:16:42.876321 <... read resumed> "1", 1) = 1
7181  15:16:42.876381 fstat(19,  <unfinished ...>
7178  15:16:42.876432 read(9,  <unfinished ...>
7181  15:16:42.876482 <... fstat resumed> {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
7178  15:16:42.876551 <... read resumed> "1", 1) = 1
7181  15:16:42.876611 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 19, 0 <unfinished ...>
7178  15:16:42.876667 read(13,  <unfinished ...>
7181  15:16:42.876722 <... mmap resumed> ) = 0x7f016b449000
7181  15:16:42.876785 close(19 <unfinished ...>
7180  15:16:42.876837 <... execve resumed> ) = 0
7181  15:16:42.876890 <... close resumed> ) = 0
7182  15:16:42.876995 <... getpid resumed> ) = 7182
7181  15:16:42.877044 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 19
7181  15:16:42.877194 read(19, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
7181  15:16:42.877356 pread64(19, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7181  15:16:42.877492 pread64(19, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7181  15:16:42.877636 pread64(19, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7182  15:16:42.877815 write(14, "1", 1 <unfinished ...>
7181  15:16:42.878514 fstat(19,  <unfinished ...>
7182  15:16:42.878675 <... write resumed> ) = 1
7178  15:16:42.878737 <... read resumed> "1", 1) = 1
7181  15:16:42.878802 <... fstat resumed> {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
7178  15:16:42.878866 read(17,  <unfinished ...>
7181  15:16:42.878915 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f016b447000
7182  15:16:42.879105 execve("child_any.out", ["41", "11"], 0x7ffd481b3cb0 /* 47 vars */ <unfinished ...>
7181  15:16:42.879414 pread64(19, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7181  15:16:42.879626 pread64(19, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7180  15:16:42.879776 brk(NULL <unfinished ...>
7181  15:16:42.879839 pread64(19,  <unfinished ...>
7180  15:16:42.879888 <... brk resumed> ) = 0x55acaa28b000
7181  15:16:42.879930 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7180  15:16:42.879986 arch_prctl(0x3001 /* ARCH_??? */, 0x7ffdacba8420 <unfinished ...>
7181  15:16:42.880036 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 19, 0 <unfinished ...>
7180  15:16:42.880089 <... arch_prctl resumed> ) = -1 EINVAL (Недопустимый аргумент)
7181  15:16:42.880157 <... mmap resumed> ) = 0x7f016b255000
7182  15:16:42.880206 <... execve resumed> ) = 0
7181  15:16:42.880250 mprotect(0x7f016b27a000, 1847296, PROT_NONE <unfinished ...>
7180  15:16:42.880297 access("/etc/ld.so.preload", R_OK <unfinished ...>
7182  15:16:42.880384 brk(NULL <unfinished ...>
7181  15:16:42.880429 <... mprotect resumed> ) = 0
7182  15:16:42.880473 <... brk resumed> ) = 0x55f9ac059000
7181  15:16:42.880518 mmap(0x7f016b27a000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x25000 <unfinished ...>
7182  15:16:42.880568 arch_prctl(0x3001 /* ARCH_??? */, 0x7ffd89172e40 <unfinished ...>
7181  15:16:42.880612 <... mmap resumed> ) = 0x7f016b27a000
7182  15:16:42.880656 <... arch_prctl resumed> ) = -1 EINVAL (Недопустимый аргумент)
7181  15:16:42.880700 mmap(0x7f016b3f2000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x19d000 <unfinished ...>
7180  15:16:42.880752 <... access resumed> ) = -1 ENOENT (Нет такого файла или каталога)
7182  15:16:42.880800 access("/etc/ld.so.preload", R_OK <unfinished ...>
7181  15:16:42.880855 <... mmap resumed> ) = 0x7f016b3f2000
7182  15:16:42.880901 <... access resumed> ) = -1 ENOENT (Нет такого файла или каталога)
7181  15:16:42.880999 mmap(0x7f016b43d000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x1e7000 <unfinished ...>
7182  15:16:42.881069 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC <unfinished ...>
7181  15:16:42.881136 <... mmap resumed> ) = 0x7f016b43d000
7182  15:16:42.881183 <... openat resumed> ) = 19
7181  15:16:42.881230 mmap(0x7f016b443000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0 <unfinished ...>
7182  15:16:42.881281 fstat(19,  <unfinished ...>
7181  15:16:42.881328 <... mmap resumed> ) = 0x7f016b443000
7182  15:16:42.881394 <... fstat resumed> {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
7181  15:16:42.881498 close(19 <unfinished ...>
7182  15:16:42.881566 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 19, 0 <unfinished ...>
7181  15:16:42.881628 <... close resumed> ) = 0
7182  15:16:42.881682 <... mmap resumed> ) = 0x7fb77ac05000
7180  15:16:42.881746 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC <unfinished ...>
7182  15:16:42.881821 close(19 <unfinished ...>
7181  15:16:42.881887 arch_prctl(ARCH_SET_FS, 0x7f016b448540 <unfinished ...>
7182  15:16:42.881943 <... close resumed> ) = 0
7181  15:16:42.881993 <... arch_prctl resumed> ) = 0
7182  15:16:42.882042 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC <unfinished ...>
7180  15:16:42.882120 <... openat resumed> ) = 19
7182  15:16:42.882186 <... openat resumed> ) = 19
7181  15:16:42.882240 mprotect(0x7f016b43d000, 12288, PROT_READ <unfinished ...>
7182  15:16:42.882300 read(19,  <unfinished ...>
7181  15:16:42.882357 <... mprotect resumed> ) = 0
7182  15:16:42.882407 <... read resumed> "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
7181  15:16:42.882493 mprotect(0x563a3e8f9000, 4096, PROT_READ <unfinished ...>
7182  15:16:42.882566 pread64(19,  <unfinished ...>
7180  15:16:42.882632 fstat(19,  <unfinished ...>
7183  15:16:42.882870 getpid()          = 7183
7181  15:16:42.882983 <... mprotect resumed> ) = 0
7181  15:16:42.883098 mprotect(0x7f016b48a000, 4096, PROT_READ <unfinished ...>
7183  15:16:42.883154 write(18, "1", 1 <unfinished ...>
7181  15:16:42.883205 <... mprotect resumed> ) = 0
7178  15:16:42.883254 <... read resumed> "1", 1) = 1
7183  15:16:42.883294 <... write resumed> ) = 1
7178  15:16:42.883324 getpid( <unfinished ...>
7183  15:16:42.883368 execve("child_any.out", ["81", "51"], 0x7ffd481b3cb0 /* 47 vars */ <unfinished ...>
7178  15:16:42.883581 <... getpid resumed> ) = 7178
7181  15:16:42.883627 munmap(0x7f016b449000, 77941 <unfinished ...>
7178  15:16:42.883678 getpid( <unfinished ...>
7182  15:16:42.883725 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7178  15:16:42.883784 <... getpid resumed> ) = 7178
7182  15:16:42.883828 pread64(19,  <unfinished ...>
7178  15:16:42.883871 getpid( <unfinished ...>
7182  15:16:42.883915 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7178  15:16:42.884000 <... getpid resumed> ) = 7178
7182  15:16:42.884049 pread64(19,  <unfinished ...>
7178  15:16:42.884094 getpid()          = 7178
7183  15:16:42.884160 <... execve resumed> ) = 0
7178  15:16:42.884193 getpid( <unfinished ...>
7182  15:16:42.884238 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7178  15:16:42.884294 <... getpid resumed> ) = 7178
7183  15:16:42.884327 brk(NULL <unfinished ...>
7178  15:16:42.884356 write(4, "2", 1 <unfinished ...>
7183  15:16:42.884397 <... brk resumed> ) = 0x5642b6ba0000
7178  15:16:42.884428 <... write resumed> ) = 1
7183  15:16:42.884463 arch_prctl(0x3001 /* ARCH_??? */, 0x7ffcb6618690 <unfinished ...>
7178  15:16:42.884497 write(8, "2", 1 <unfinished ...>
7183  15:16:42.884536 <... arch_prctl resumed> ) = -1 EINVAL (Недопустимый аргумент)
7178  15:16:42.884571 <... write resumed> ) = 1
7182  15:16:42.884614 fstat(19,  <unfinished ...>
7178  15:16:42.884658 write(12, "2", 1 <unfinished ...>
7183  15:16:42.884696 access("/etc/ld.so.preload", R_OK <unfinished ...>
7178  15:16:42.884735 <... write resumed> ) = 1
7183  15:16:42.884772 <... access resumed> ) = -1 ENOENT (Нет такого файла или каталога)
7178  15:16:42.884806 write(16, "2", 1 <unfinished ...>
7183  15:16:42.884852 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC <unfinished ...>
7178  15:16:42.884890 <... write resumed> ) = 1
7183  15:16:42.884929 <... openat resumed> ) = 19
7178  15:16:42.885040 read(5,  <unfinished ...>
7183  15:16:42.885081 fstat(19,  <unfinished ...>
7182  15:16:42.885108 <... fstat resumed> {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
7183  15:16:42.885141 <... fstat resumed> {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
7182  15:16:42.885173 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
7183  15:16:42.885207 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 19, 0 <unfinished ...>
7182  15:16:42.885244 <... mmap resumed> ) = 0x7fb77ac03000
7183  15:16:42.885277 <... mmap resumed> ) = 0x7ff8ceb79000
7181  15:16:42.885300 <... munmap resumed> ) = 0
7183  15:16:42.885333 close(19 <unfinished ...>
7180  15:16:42.885360 <... fstat resumed> {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
7183  15:16:42.885396 <... close resumed> ) = 0
7180  15:16:42.885422 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 19, 0 <unfinished ...>
7183  15:16:42.885454 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC <unfinished ...>
7182  15:16:42.885490 pread64(19,  <unfinished ...>
7183  15:16:42.885518 <... openat resumed> ) = 19
7182  15:16:42.885540 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7183  15:16:42.885569 read(19,  <unfinished ...>
7182  15:16:42.885591 pread64(19,  <unfinished ...>
7183  15:16:42.885616 <... read resumed> "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
7182  15:16:42.885641 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7183  15:16:42.885670 pread64(19,  <unfinished ...>
7182  15:16:42.885691 pread64(19,  <unfinished ...>
7183  15:16:42.885721 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7181  15:16:42.885783 read(7,  <unfinished ...>
7183  15:16:42.885875 pread64(19,  <unfinished ...>
7180  15:16:42.885930 <... mmap resumed> ) = 0x7f6f9fd89000
7183  15:16:42.885960 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7181  15:16:42.885996 <... read resumed> "2", 1) = 1
7183  15:16:42.886035 pread64(19,  <unfinished ...>
7181  15:16:42.886066 getpid( <unfinished ...>
7183  15:16:42.886096 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7181  15:16:42.886140 <... getpid resumed> ) = 7181
7182  15:16:42.886180 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7181  15:16:42.886256 fstat(1,  <unfinished ...>
7182  15:16:42.886295 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 19, 0 <unfinished ...>
7181  15:16:42.886332 <... fstat resumed> {st_mode=S_IFREG|0664, st_size=0, ...}) = 0
7182  15:16:42.886385 <... mmap resumed> ) = 0x7fb77aa11000
7180  15:16:42.886427 close(19 <unfinished ...>
7182  15:16:42.886502 mprotect(0x7fb77aa36000, 1847296, PROT_NONE <unfinished ...>
7181  15:16:42.886548 brk(NULL <unfinished ...>
7183  15:16:42.886590 fstat(19,  <unfinished ...>
7182  15:16:42.886616 <... mprotect resumed> ) = 0
7183  15:16:42.886641 <... fstat resumed> {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
7182  15:16:42.886675 mmap(0x7fb77aa36000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x25000 <unfinished ...>
7183  15:16:42.886705 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
7182  15:16:42.886731 <... mmap resumed> ) = 0x7fb77aa36000
7183  15:16:42.886758 <... mmap resumed> ) = 0x7ff8ceb77000
7182  15:16:42.886782 mmap(0x7fb77abae000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x19d000 <unfinished ...>
7183  15:16:42.886813 pread64(19,  <unfinished ...>
7182  15:16:42.886838 <... mmap resumed> ) = 0x7fb77abae000
7183  15:16:42.886864 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7182  15:16:42.886896 mmap(0x7fb77abf9000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x1e7000 <unfinished ...>
7183  15:16:42.886926 pread64(19,  <unfinished ...>
7182  15:16:42.886951 <... mmap resumed> ) = 0x7fb77abf9000
7183  15:16:42.886977 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7182  15:16:42.887007 mmap(0x7fb77abff000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0 <unfinished ...>
7183  15:16:42.887037 pread64(19,  <unfinished ...>
7182  15:16:42.887060 <... mmap resumed> ) = 0x7fb77abff000
7183  15:16:42.887085 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7182  15:16:42.887117 close(19 <unfinished ...>
7183  15:16:42.887147 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 19, 0 <unfinished ...>
7182  15:16:42.887173 <... close resumed> ) = 0
7183  15:16:42.887203 <... mmap resumed> ) = 0x7ff8ce985000
7181  15:16:42.887228 <... brk resumed> ) = 0x563a3ee1c000
7183  15:16:42.887258 mprotect(0x7ff8ce9aa000, 1847296, PROT_NONE <unfinished ...>
7182  15:16:42.887284 arch_prctl(ARCH_SET_FS, 0x7fb77ac04540 <unfinished ...>
7183  15:16:42.887323 <... mprotect resumed> ) = 0
7182  15:16:42.887351 <... arch_prctl resumed> ) = 0
7183  15:16:42.887378 mmap(0x7ff8ce9aa000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x25000 <unfinished ...>
7181  15:16:42.887410 brk(0x563a3ee3d000 <unfinished ...>
7183  15:16:42.887461 <... mmap resumed> ) = 0x7ff8ce9aa000
7181  15:16:42.887491 <... brk resumed> ) = 0x563a3ee3d000
7183  15:16:42.887517 mmap(0x7ff8ceb22000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x19d000 <unfinished ...>
7182  15:16:42.887546 mprotect(0x7fb77abf9000, 12288, PROT_READ <unfinished ...>
7183  15:16:42.887580 <... mmap resumed> ) = 0x7ff8ceb22000
7182  15:16:42.887605 <... mprotect resumed> ) = 0
7183  15:16:42.887633 mmap(0x7ff8ceb6d000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x1e7000 <unfinished ...>
7181  15:16:42.887694 write(10, "1", 1 <unfinished ...>
7183  15:16:42.887752 <... mmap resumed> ) = 0x7ff8ceb6d000
7182  15:16:42.887778 mprotect(0x55f9aabe3000, 4096, PROT_READ <unfinished ...>
7183  15:16:42.887811 mmap(0x7ff8ceb73000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0 <unfinished ...>
7182  15:16:42.887837 <... mprotect resumed> ) = 0
7183  15:16:42.887868 <... mmap resumed> ) = 0x7ff8ceb73000
7182  15:16:42.887894 mprotect(0x7fb77ac46000, 4096, PROT_READ <unfinished ...>
7183  15:16:42.887928 close(19 <unfinished ...>
7182  15:16:42.887970 <... mprotect resumed> ) = 0
7183  15:16:42.887998 <... close resumed> ) = 0
7182  15:16:42.888021 munmap(0x7fb77ac05000, 77941 <unfinished ...>
7181  15:16:42.888056 <... write resumed> ) = 1
7183  15:16:42.888092 arch_prctl(ARCH_SET_FS, 0x7ff8ceb78540 <unfinished ...>
7182  15:16:42.888119 <... munmap resumed> ) = 0
7183  15:16:42.888144 <... arch_prctl resumed> ) = 0
7181  15:16:42.888170 read(7,  <unfinished ...>
7180  15:16:42.888219 <... close resumed> ) = 0
7182  15:16:42.888264 read(11,  <unfinished ...>
7183  15:16:42.888319 mprotect(0x7ff8ceb6d000, 12288, PROT_READ <unfinished ...>
7182  15:16:42.888354 <... read resumed> "2", 1) = 1
7183  15:16:42.888396 <... mprotect resumed> ) = 0
7182  15:16:42.888426 getpid( <unfinished ...>
7180  15:16:42.888456 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC <unfinished ...>
7183  15:16:42.888492 mprotect(0x5642b4d12000, 4096, PROT_READ <unfinished ...>
7182  15:16:42.888523 <... getpid resumed> ) = 7182
7183  15:16:42.888549 <... mprotect resumed> ) = 0
7180  15:16:42.888569 <... openat resumed> ) = 19
7183  15:16:42.888596 mprotect(0x7ff8cebba000, 4096, PROT_READ <unfinished ...>
7182  15:16:42.888621 fstat(1,  <unfinished ...>
7183  15:16:42.888646 <... mprotect resumed> ) = 0
7182  15:16:42.888666 <... fstat resumed> {st_mode=S_IFREG|0664, st_size=0, ...}) = 0
7183  15:16:42.888698 munmap(0x7ff8ceb79000, 77941 <unfinished ...>
7180  15:16:42.888719 read(19,  <unfinished ...>
7183  15:16:42.888763 <... munmap resumed> ) = 0
7182  15:16:42.888792 brk(NULL <unfinished ...>
7180  15:16:42.888821 <... read resumed> "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
7182  15:16:42.888863 <... brk resumed> ) = 0x55f9ac059000
7183  15:16:42.888893 read(15,  <unfinished ...>
7182  15:16:42.888914 brk(0x55f9ac07a000 <unfinished ...>
7183  15:16:42.888938 <... read resumed> "2", 1) = 1
7182  15:16:42.888990 <... brk resumed> ) = 0x55f9ac07a000
7183  15:16:42.889019 getpid( <unfinished ...>
7180  15:16:42.889040 pread64(19,  <unfinished ...>
7183  15:16:42.889062 <... getpid resumed> ) = 7183
7182  15:16:42.889082 write(14, "1", 1 <unfinished ...>
7180  15:16:42.889117 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7183  15:16:42.889146 fstat(1,  <unfinished ...>
7182  15:16:42.889166 <... write resumed> ) = 1
7183  15:16:42.889188 <... fstat resumed> {st_mode=S_IFREG|0664, st_size=0, ...}) = 0
7182  15:16:42.889214 read(11,  <unfinished ...>
7180  15:16:42.889244 pread64(19, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7183  15:16:42.889310 brk(NULL <unfinished ...>
7180  15:16:42.889334 pread64(19,  <unfinished ...>
7183  15:16:42.889356 <... brk resumed> ) = 0x5642b6ba0000
7180  15:16:42.889376 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7183  15:16:42.889404 brk(0x5642b6bc1000 <unfinished ...>
7180  15:16:42.889424 fstat(19,  <unfinished ...>
7183  15:16:42.889447 <... brk resumed> ) = 0x5642b6bc1000
7180  15:16:42.889467 <... fstat resumed> {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
7183  15:16:42.889518 write(18, "1", 1 <unfinished ...>
7180  15:16:42.889548 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
7183  15:16:42.889576 <... write resumed> ) = 1
7180  15:16:42.889597 <... mmap resumed> ) = 0x7f6f9fd87000
7183  15:16:42.889620 read(15,  <unfinished ...>
7180  15:16:42.889639 pread64(19, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
7180  15:16:42.889704 pread64(19, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
7180  15:16:42.889759 pread64(19, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
7180  15:16:42.889812 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 19, 0) = 0x7f6f9fb95000
7180  15:16:42.889870 mprotect(0x7f6f9fbba000, 1847296, PROT_NONE) = 0
7180  15:16:42.890015 mmap(0x7f6f9fbba000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x25000) = 0x7f6f9fbba000
7180  15:16:42.890100 mmap(0x7f6f9fd32000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x19d000) = 0x7f6f9fd32000
7180  15:16:42.890181 mmap(0x7f6f9fd7d000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 19, 0x1e7000) = 0x7f6f9fd7d000
7180  15:16:42.890257 mmap(0x7f6f9fd83000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f6f9fd83000
7180  15:16:42.890331 close(19)         = 0
7180  15:16:42.890413 arch_prctl(ARCH_SET_FS, 0x7f6f9fd88540) = 0
7180  15:16:42.890562 mprotect(0x7f6f9fd7d000, 12288, PROT_READ) = 0
7180  15:16:42.890636 mprotect(0x55aca84c1000, 4096, PROT_READ) = 0
7180  15:16:42.890683 mprotect(0x7f6f9fdca000, 4096, PROT_READ) = 0
7180  15:16:42.890727 munmap(0x7f6f9fd89000, 77941) = 0
7180  15:16:42.890833 read(3, "2", 1)   = 1
7180  15:16:42.890885 getpid()          = 7180
7180  15:16:42.890941 fstat(1, {st_mode=S_IFREG|0664, st_size=0, ...}) = 0
7180  15:16:42.891037 brk(NULL)         = 0x55acaa28b000
7180  15:16:42.891076 brk(0x55acaa2ac000) = 0x55acaa2ac000
7180  15:16:42.891135 write(6, "1", 1)  = 1
7178  15:16:42.891182 <... read resumed> "1", 1) = 1
7180  15:16:42.891201 read(3,  <unfinished ...>
7178  15:16:42.891216 read(9, "1", 1)   = 1
7178  15:16:42.891257 read(13, "1", 1)  = 1
7178  15:16:42.891298 read(17, "1", 1)  = 1
7178  15:16:42.891528 fstat(0, {st_mode=S_IFREG|0664, st_size=25, ...}) = 0
7178  15:16:42.891578 read(0, "100\n50  \n200 250\n1000000\n", 4096) = 25
7178  15:16:42.891632 write(4, "000052\0", 7) = 7
7180  15:16:42.891674 <... read resumed> "0", 1) = 1
7178  15:16:42.891692 write(4, "05\0", 3 <unfinished ...>
7180  15:16:42.891709 read(3,  <unfinished ...>
7178  15:16:42.891723 <... write resumed> ) = 3
7180  15:16:42.891737 <... read resumed> "0", 1) = 1
7178  15:16:42.891754 write(4, "002\0", 4 <unfinished ...>
7180  15:16:42.891771 read(3,  <unfinished ...>
7178  15:16:42.891785 <... write resumed> ) = 4
7180  15:16:42.891799 <... read resumed> "0", 1) = 1
7178  15:16:42.891815 write(4, "052\0", 4 <unfinished ...>
7180  15:16:42.891832 read(3,  <unfinished ...>
7178  15:16:42.891846 <... write resumed> ) = 4
7180  15:16:42.891859 <... read resumed> "0", 1) = 1
7178  15:16:42.891876 write(8, "000052\0", 7 <unfinished ...>
7180  15:16:42.891893 read(3,  <unfinished ...>
7178  15:16:42.891908 <... write resumed> ) = 7
7181  15:16:42.891922 <... read resumed> "0", 1) = 1
7178  15:16:42.891939 write(8, "05\0", 3 <unfinished ...>
7181  15:16:42.891956 read(7,  <unfinished ...>
7178  15:16:42.891970 <... write resumed> ) = 3
7181  15:16:42.891984 <... read resumed> "0", 1) = 1
7178  15:16:42.892000 write(8, "002\0", 4 <unfinished ...>
7180  15:16:42.892023 <... read resumed> "5", 1) = 1
7181  15:16:42.892049 read(7,  <unfinished ...>
7178  15:16:42.892083 <... write resumed> ) = 4
7181  15:16:42.892111 <... read resumed> "0", 1) = 1
7178  15:16:42.892142 write(8, "052\0", 4 <unfinished ...>
7181  15:16:42.892166 read(7,  <unfinished ...>
7178  15:16:42.892182 <... write resumed> ) = 4
7181  15:16:42.892196 <... read resumed> "0", 1) = 1
7178  15:16:42.892213 write(12, "000052\0", 7 <unfinished ...>
7181  15:16:42.892231 read(7,  <unfinished ...>
7178  15:16:42.892249 <... write resumed> ) = 7
7182  15:16:42.892271 <... read resumed> "0", 1) = 1
7178  15:16:42.892301 write(12, "05\0", 3 <unfinished ...>
7182  15:16:42.892327 read(11,  <unfinished ...>
7178  15:16:42.892347 <... write resumed> ) = 3
7182  15:16:42.892363 <... read resumed> "0", 1) = 1
7178  15:16:42.892384 write(12, "002\0", 4 <unfinished ...>
7182  15:16:42.892402 read(11,  <unfinished ...>
7178  15:16:42.892420 <... write resumed> ) = 4
7182  15:16:42.892434 <... read resumed> "0", 1) = 1
7178  15:16:42.892455 write(12, "052\0", 4 <unfinished ...>
7182  15:16:42.892473 read(11,  <unfinished ...>
7178  15:16:42.892490 <... write resumed> ) = 4
7182  15:16:42.892504 <... read resumed> "0", 1) = 1
7178  15:16:42.892538 write(16, "000052\0", 7 <unfinished ...>
7182  15:16:42.892557 read(11,  <unfinished ...>
7178  15:16:42.892577 <... write resumed> ) = 7
7183  15:16:42.892593 <... read resumed> "0", 1) = 1
7178  15:16:42.892615 write(16, "05\0", 3 <unfinished ...>
7183  15:16:42.892633 read(15,  <unfinished ...>
7178  15:16:42.892651 <... write resumed> ) = 3
7183  15:16:42.892665 <... read resumed> "0", 1) = 1
7178  15:16:42.892686 write(16, "002\0", 4 <unfinished ...>
7183  15:16:42.892703 read(15,  <unfinished ...>
7178  15:16:42.892721 <... write resumed> ) = 4
7183  15:16:42.892736 <... read resumed> "0", 1) = 1
7178  15:16:42.892756 write(16, "052\0", 4 <unfinished ...>
7183  15:16:42.892782 read(15,  <unfinished ...>
7178  15:16:42.892799 <... write resumed> ) = 4
7183  15:16:42.892814 <... read resumed> "0", 1) = 1
7178  15:16:42.892834 read(5,  <unfinished ...>
7183  15:16:42.892849 read(15,  <unfinished ...>
7182  15:16:42.892866 <... read resumed> "5", 1) = 1
7183  15:16:42.892884 <... read resumed> "5", 1) = 1
7182  15:16:42.892901 read(11,  <unfinished ...>
7183  15:16:42.892915 read(15,  <unfinished ...>
7182  15:16:42.892929 <... read resumed> "2", 1) = 1
7183  15:16:42.892961 <... read resumed> "2", 1) = 1
7182  15:16:42.892984 read(11,  <unfinished ...>
7183  15:16:42.892999 read(15,  <unfinished ...>
7182  15:16:42.893013 <... read resumed> "\0", 1) = 1
7183  15:16:42.893030 <... read resumed> "\0", 1) = 1
7182  15:16:42.893047 read(11,  <unfinished ...>
7183  15:16:42.893061 read(15,  <unfinished ...>
7182  15:16:42.893075 <... read resumed> "0", 1) = 1
7183  15:16:42.893091 <... read resumed> "0", 1) = 1
7182  15:16:42.893108 read(11,  <unfinished ...>
7183  15:16:42.893122 read(15,  <unfinished ...>
7182  15:16:42.893136 <... read resumed> "5", 1) = 1
7183  15:16:42.893153 <... read resumed> "5", 1) = 1
7182  15:16:42.893169 read(11,  <unfinished ...>
7183  15:16:42.893184 read(15,  <unfinished ...>
7182  15:16:42.893198 <... read resumed> "\0", 1) = 1
7183  15:16:42.893214 <... read resumed> "\0", 1) = 1
7182  15:16:42.893231 read(11,  <unfinished ...>
7183  15:16:42.893246 read(15,  <unfinished ...>
7182  15:16:42.893259 <... read resumed> "0", 1) = 1
7183  15:16:42.893276 <... read resumed> "0", 1) = 1
7182  15:16:42.893292 read(11,  <unfinished ...>
7183  15:16:42.893307 read(15,  <unfinished ...>
7182  15:16:42.893320 <... read resumed> "0", 1) = 1
7183  15:16:42.893337 <... read resumed> "0", 1) = 1
7182  15:16:42.893353 read(11,  <unfinished ...>
7183  15:16:42.893368 read(15,  <unfinished ...>
7182  15:16:42.893381 <... read resumed> "2", 1) = 1
7183  15:16:42.893398 <... read resumed> "2", 1) = 1
7182  15:16:42.893414 read(11,  <unfinished ...>
7183  15:16:42.893429 read(15,  <unfinished ...>
7182  15:16:42.893442 <... read resumed> "\0", 1) = 1
7183  15:16:42.893459 <... read resumed> "\0", 1) = 1
7182  15:16:42.893476 read(11,  <unfinished ...>
7183  15:16:42.893490 read(15,  <unfinished ...>
7182  15:16:42.893504 <... read resumed> "0", 1) = 1
7183  15:16:42.893520 <... read resumed> "0", 1) = 1
7182  15:16:42.893537 read(11,  <unfinished ...>
7183  15:16:42.893551 read(15,  <unfinished ...>
7182  15:16:42.893565 <... read resumed> "5", 1) = 1
7183  15:16:42.893581 <... read resumed> "5", 1) = 1
7182  15:16:42.893598 read(11,  <unfinished ...>
7183  15:16:42.893612 read(15,  <unfinished ...>
7182  15:16:42.893626 <... read resumed> "2", 1) = 1
7183  15:16:42.893642 <... read resumed> "2", 1) = 1
7182  15:16:42.893659 read(11,  <unfinished ...>
7183  15:16:42.893674 read(15,  <unfinished ...>
7182  15:16:42.893688 <... read resumed> "\0", 1) = 1
7183  15:16:42.893704 <... read resumed> "\0", 1) = 1
7182  15:16:42.893721 getpid( <unfinished ...>
7183  15:16:42.893736 getpid( <unfinished ...>
7182  15:16:42.893749 <... getpid resumed> ) = 7182
7183  15:16:42.893763 <... getpid resumed> ) = 7183
7182  15:16:42.893777 write(14, "1", 1 <unfinished ...>
7183  15:16:42.893794 write(18, "1", 1 <unfinished ...>
7182  15:16:42.893812 <... write resumed> ) = 1
7183  15:16:42.893826 <... write resumed> ) = 1
7182  15:16:42.893850 getpid( <unfinished ...>
7183  15:16:42.893869 getpid( <unfinished ...>
7182  15:16:42.893884 <... getpid resumed> ) = 7182
7183  15:16:42.893901 <... getpid resumed> ) = 7183
7181  15:16:42.893915 <... read resumed> "5", 1) = 1
7180  15:16:42.893940 read(3,  <unfinished ...>
7181  15:16:42.893960 read(7,  <unfinished ...>
7180  15:16:42.893979 <... read resumed> "2", 1) = 1
7181  15:16:42.894001 <... read resumed> "2", 1) = 1
7180  15:16:42.894023 read(3,  <unfinished ...>
7181  15:16:42.894042 read(7,  <unfinished ...>
7180  15:16:42.894061 <... read resumed> "\0", 1) = 1
7181  15:16:42.894083 <... read resumed> "\0", 1) = 1
7180  15:16:42.894105 read(3,  <unfinished ...>
7181  15:16:42.894124 read(7,  <unfinished ...>
7180  15:16:42.894142 <... read resumed> "0", 1) = 1
7181  15:16:42.894164 <... read resumed> "0", 1) = 1
7180  15:16:42.894186 read(3,  <unfinished ...>
7181  15:16:42.894205 read(7,  <unfinished ...>
7180  15:16:42.894224 <... read resumed> "5", 1) = 1
7181  15:16:42.894246 <... read resumed> "5", 1) = 1
7180  15:16:42.894268 read(3,  <unfinished ...>
7181  15:16:42.894287 read(7,  <unfinished ...>
7180  15:16:42.894306 <... read resumed> "\0", 1) = 1
7181  15:16:42.894327 <... read resumed> "\0", 1) = 1
7180  15:16:42.894350 read(3,  <unfinished ...>
7181  15:16:42.894369 read(7,  <unfinished ...>
7180  15:16:42.894387 <... read resumed> "0", 1) = 1
7181  15:16:42.894409 <... read resumed> "0", 1) = 1
7180  15:16:42.894434 read(3,  <unfinished ...>
7181  15:16:42.894566 read(7,  <unfinished ...>
7180  15:16:42.894593 <... read resumed> "0", 1) = 1
7181  15:16:42.894761 <... read resumed> "0", 1) = 1
7180  15:16:42.894798 read(3,  <unfinished ...>
7181  15:16:42.894818 read(7,  <unfinished ...>
7180  15:16:42.894837 <... read resumed> "2", 1) = 1
7181  15:16:42.894860 <... read resumed> "2", 1) = 1
7180  15:16:42.894882 read(3,  <unfinished ...>
7181  15:16:42.894901 read(7,  <unfinished ...>
7180  15:16:42.894933 <... read resumed> "\0", 1) = 1
7181  15:16:42.894951 <... read resumed> "\0", 1) = 1
7180  15:16:42.894968 read(3,  <unfinished ...>
7181  15:16:42.894984 read(7,  <unfinished ...>
7180  15:16:42.894999 <... read resumed> "0", 1) = 1
7181  15:16:42.895017 <... read resumed> "0", 1) = 1
7180  15:16:42.895034 read(3,  <unfinished ...>
7181  15:16:42.895050 read(7,  <unfinished ...>
7180  15:16:42.895065 <... read resumed> "5", 1) = 1
7181  15:16:42.895083 <... read resumed> "5", 1) = 1
7180  15:16:42.895101 read(3,  <unfinished ...>
7181  15:16:42.895116 read(7,  <unfinished ...>
7180  15:16:42.895131 <... read resumed> "2", 1) = 1
7181  15:16:42.895149 <... read resumed> "2", 1) = 1
7180  15:16:42.895167 read(3,  <unfinished ...>
7181  15:16:42.895182 read(7,  <unfinished ...>
7180  15:16:42.895197 <... read resumed> "\0", 1) = 1
7181  15:16:42.895215 <... read resumed> "\0", 1) = 1
7180  15:16:42.895233 getpid( <unfinished ...>
7181  15:16:42.895248 getpid( <unfinished ...>
7180  15:16:42.895263 <... getpid resumed> ) = 7180
7181  15:16:42.895278 <... getpid resumed> ) = 7181
7180  15:16:42.895293 write(6, "1", 1 <unfinished ...>
7181  15:16:42.895311 write(10, "1", 1 <unfinished ...>
7178  15:16:42.895330 <... read resumed> "1", 1) = 1
7181  15:16:42.895348 <... write resumed> ) = 1
7178  15:16:42.895363 read(9,  <unfinished ...>
7181  15:16:42.895378 getpid( <unfinished ...>
7178  15:16:42.895396 <... read resumed> "1", 1) = 1
7181  15:16:42.895414 <... getpid resumed> ) = 7181
7178  15:16:42.895429 read(13,  <unfinished ...>
7180  15:16:42.895444 <... write resumed> ) = 1
7178  15:16:42.896979 <... read resumed> "1", 1) = 1
7178  15:16:42.897014 read(17, "1", 1)  = 1
7178  15:16:42.897061 read(5,  <unfinished ...>
7180  15:16:42.900970 getpid()          = 7180
7182  15:16:43.959130 write(14, "5354\0", 5) = 5
7182  15:16:43.959310 close(11)         = 0
7182  15:16:43.959360 close(14)         = 0
7182  15:16:43.959406 write(1, "[7182] process detached | 14 <- "..., 115) = 115
7182  15:16:43.959490 exit_group(0)     = ?
7182  15:16:43.959636 +++ exited with 0 +++
7178  15:16:43.959659 <... read resumed> 0x7ffd481b3ab3, 1) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
7178  15:16:43.959683 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=7182, si_uid=1000, si_status=0, si_utime=106, si_stime=0} ---
7178  15:16:43.959711 read(5,  <unfinished ...>
7181  15:16:43.976422 write(10, "0944\0", 5) = 5
7181  15:16:43.976499 close(7)          = 0
7181  15:16:43.976536 close(10)         = 0
7181  15:16:43.976574 write(1, "[7181] process detached | 10 <- "..., 114) = 114
7181  15:16:43.976635 exit_group(0)     = ?
7181  15:16:43.976755 +++ exited with 0 +++
7178  15:16:43.976772 <... read resumed> 0x7ffd481b3ab3, 1) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
7178  15:16:43.976792 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=7181, si_uid=1000, si_status=0, si_utime=106, si_stime=0} ---
7178  15:16:43.976816 read(5,  <unfinished ...>
7183  15:16:43.981759 write(18, "3464\0", 5) = 5
7183  15:16:43.981829 close(15)         = 0
7183  15:16:43.981885 close(18)         = 0
7183  15:16:43.981993 write(1, "[7183] process detached | 18 <- "..., 115) = 115
7183  15:16:43.982073 exit_group(0)     = ?
7183  15:16:43.982212 +++ exited with 0 +++
7178  15:16:43.982225 <... read resumed> 0x7ffd481b3ab3, 1) = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
7178  15:16:43.982245 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=7183, si_uid=1000, si_status=0, si_utime=104, si_stime=0} ---
7178  15:16:43.982270 read(5,  <unfinished ...>
7180  15:16:43.985981 write(6, "4364\0", 5 <unfinished ...>
7178  15:16:43.986013 <... read resumed> "4", 1) = 1
7180  15:16:43.986030 <... write resumed> ) = 5
7178  15:16:43.986041 read(5,  <unfinished ...>
7180  15:16:43.986051 close(3 <unfinished ...>
7178  15:16:43.986061 <... read resumed> "3", 1) = 1
7180  15:16:43.986074 <... close resumed> ) = 0
7178  15:16:43.986084 read(5,  <unfinished ...>
7180  15:16:43.986094 close(6 <unfinished ...>
7178  15:16:43.986104 <... read resumed> "6", 1) = 1
7180  15:16:43.986117 <... close resumed> ) = 0
7178  15:16:43.986127 read(5,  <unfinished ...>
7180  15:16:43.986137 write(1, "[7180] process detached | 6 <- S"..., 113 <unfinished ...>
7178  15:16:43.986151 <... read resumed> "4", 1) = 1
7180  15:16:43.986166 <... write resumed> ) = 113
7178  15:16:43.986178 read(5,  <unfinished ...>
7180  15:16:43.986189 exit_group(0 <unfinished ...>
7178  15:16:43.986199 <... read resumed> "\0", 1) = 1
7180  15:16:43.986211 <... exit_group resumed>) = ?
7178  15:16:43.986221 read(9, "0", 1)   = 1
7178  15:16:43.986256 read(9, "9", 1)   = 1
7178  15:16:43.986290 read(9,  <unfinished ...>
7180  15:16:43.986303 +++ exited with 0 +++
7178  15:16:43.986311 <... read resumed> "4", 1) = 1
7178  15:16:43.986329 --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=7180, si_uid=1000, si_status=0, si_utime=107, si_stime=0} ---
7178  15:16:43.986346 read(9, "4", 1)   = 1
7178  15:16:43.986376 read(9, "\0", 1)  = 1
7178  15:16:43.986406 read(13, "5", 1)  = 1
7178  15:16:43.986435 read(13, "3", 1)  = 1
7178  15:16:43.986464 read(13, "5", 1)  = 1
7178  15:16:43.986493 read(13, "4", 1)  = 1
7178  15:16:43.986521 read(13, "\0", 1) = 1
7178  15:16:43.986550 read(17, "3", 1)  = 1
7178  15:16:43.986580 read(17, "4", 1)  = 1
7178  15:16:43.986609 read(17, "6", 1)  = 1
7178  15:16:43.986638 read(17, "4", 1)  = 1
7178  15:16:43.986667 read(17, "\0", 1) = 1
7178  15:16:43.986700 close(3)          = 0
7178  15:16:43.986729 close(6)          = 0
7178  15:16:43.986755 close(7)          = 0
7178  15:16:43.986782 close(10)         = 0
7178  15:16:43.986809 close(11)         = 0
7178  15:16:43.986836 close(14)         = 0
7178  15:16:43.986863 close(15)         = 0
7178  15:16:43.986890 close(18)         = 0
7178  15:16:43.986934 write(1, "procon-> 4\n<-| initiating proces"..., 658) = 658
7178  15:16:43.986978 lseek(0, -1, SEEK_CUR) = 24
7178  15:16:43.987009 exit_group(0)     = ?
7178  15:16:43.987165 +++ exited with 0 +++
