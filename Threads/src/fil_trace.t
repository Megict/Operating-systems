47094 14:49:08.510185 execve("./exetry.out", ["./exetry.out"], 0x7ffc705fad20 /* 47 vars */) = 0
47094 14:49:08.511830 brk(NULL)         = 0x55cbb87de000
47094 14:49:08.511994 arch_prctl(0x3001 /* ARCH_??? */, 0x7ffcf4b065e0) = -1 EINVAL (Недопустимый аргумент)
47094 14:49:08.512484 access("/etc/ld.so.preload", R_OK) = -1 ENOENT (Нет такого файла или каталога)
47094 14:49:08.512681 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
47094 14:49:08.512875 fstat(3, {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
47094 14:49:08.512990 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7efd6954d000
47094 14:49:08.513104 close(3)          = 0
47094 14:49:08.513236 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
47094 14:49:08.513372 read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
47094 14:49:08.513492 pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
47094 14:49:08.513607 pread64(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
47094 14:49:08.513724 pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
47094 14:49:08.518518 fstat(3, {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
47094 14:49:08.518733 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7efd6954b000
47094 14:49:08.518889 pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
47094 14:49:08.519010 pread64(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
47094 14:49:08.519116 pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
47094 14:49:08.519227 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7efd69359000
47094 14:49:08.521982 mprotect(0x7efd6937e000, 1847296, PROT_NONE) = 0
47094 14:49:08.522241 mmap(0x7efd6937e000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7efd6937e000
47094 14:49:08.522515 mmap(0x7efd694f6000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19d000) = 0x7efd694f6000
47094 14:49:08.522789 mmap(0x7efd69541000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7efd69541000
47094 14:49:08.522971 mmap(0x7efd69547000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7efd69547000
47094 14:49:08.524698 close(3)          = 0
47094 14:49:08.524932 arch_prctl(ARCH_SET_FS, 0x7efd6954c540) = 0
47094 14:49:08.525200 mprotect(0x7efd69541000, 12288, PROT_READ) = 0
47094 14:49:08.525329 mprotect(0x55cbb748c000, 4096, PROT_READ) = 0
47094 14:49:08.525435 mprotect(0x7efd6958e000, 4096, PROT_READ) = 0
47094 14:49:08.525532 munmap(0x7efd6954d000, 77941) = 0
47094 14:49:08.525820 write(1, "Input two filenames\nthen input s"..., 54) = 54
47094 14:49:08.525968 read(0, "f", 1)   = 1
47094 14:49:08.526262 read(0, "i", 1)   = 1
47094 14:49:08.526362 read(0, "l", 1)   = 1
47094 14:49:08.526449 read(0, "e", 1)   = 1
47094 14:49:08.526553 read(0, "_", 1)   = 1
47094 14:49:08.526667 read(0, "a", 1)   = 1
47094 14:49:08.526788 read(0, "\n", 1)  = 1
47094 14:49:08.526972 read(0, "f", 1)   = 1
47094 14:49:08.527122 read(0, "i", 1)   = 1
47094 14:49:08.527272 read(0, "l", 1)   = 1
47094 14:49:08.527364 read(0, "e", 1)   = 1
47094 14:49:08.527455 read(0, "_", 1)   = 1
47094 14:49:08.527539 read(0, "b", 1)   = 1
47094 14:49:08.527621 read(0, " ", 1)   = 1
47094 14:49:08.527704 read(0, "\n", 1)  = 1
47094 14:49:08.527810 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_TRUNC, 0660) = 3
47094 14:49:08.528078 write(3, "This is file one\n(even)\n\n", 25) = 25
47094 14:49:08.528247 close(3)          = 0
47094 14:49:08.528622 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_TRUNC, 0660) = 3
47094 14:49:08.528929 write(3, "This is file two\n(odd)\n\n", 24) = 24
47094 14:49:08.529101 close(3)          = 0
47094 14:49:08.529285 pipe([3, 4])      = 0
47094 14:49:08.529410 write(1, "initiating process separation\n", 30) = 30
47094 14:49:08.529582 clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7efd6954c810) = 47095
47094 14:49:08.529881 pipe( <unfinished ...>
47095 14:49:08.529940 execve("chid_proc_one.out", ["file_a", "\3"], 0x7ffcf4b066c8 /* 47 vars */ <unfinished ...>
47094 14:49:08.530167 <... pipe resumed> [5, 6]) = 0
47094 14:49:08.530226 clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7efd6954c810) = 47096
47094 14:49:08.530481 write(1, "parent: It's parent\n", 20 <unfinished ...>
47096 14:49:08.530538 execve("chid_proc_two.out", ["file_b ", "\5"], 0x7ffcf4b066c8 /* 47 vars */ <unfinished ...>
47094 14:49:08.530808 <... write resumed> ) = 20
47094 14:49:08.530864 read(0,  <unfinished ...>
47095 14:49:08.530901 <... execve resumed> ) = 0
47094 14:49:08.530937 <... read resumed> "a", 1) = 1
47094 14:49:08.530993 read(0,  <unfinished ...>
47095 14:49:08.531030 brk(NULL <unfinished ...>
47094 14:49:08.531066 <... read resumed> "s", 1) = 1
47095 14:49:08.531103 <... brk resumed> ) = 0x556205e87000
47094 14:49:08.531139 read(0,  <unfinished ...>
47095 14:49:08.531168 arch_prctl(0x3001 /* ARCH_??? */, 0x7ffda87863b0 <unfinished ...>
47094 14:49:08.531207 <... read resumed> "d", 1) = 1
47095 14:49:08.531245 <... arch_prctl resumed> ) = -1 EINVAL (Недопустимый аргумент)
47094 14:49:08.531287 read(0, "\n", 1)  = 1
47095 14:49:08.531366 access("/etc/ld.so.preload", R_OK <unfinished ...>
47094 14:49:08.531416 write(6, "asd\0", 4) = 4
47094 14:49:08.531689 read(0,  <unfinished ...>
47095 14:49:08.531737 <... access resumed> ) = -1 ENOENT (Нет такого файла или каталога)
47094 14:49:08.531780 <... read resumed> "a", 1) = 1
47094 14:49:08.531982 read(0,  <unfinished ...>
47096 14:49:08.532065 <... execve resumed> ) = 0
47094 14:49:08.532115 <... read resumed> "s", 1) = 1
47094 14:49:08.532184 read(0,  <unfinished ...>
47096 14:49:08.532223 brk(NULL <unfinished ...>
47094 14:49:08.532261 <... read resumed> "d", 1) = 1
47096 14:49:08.532298 <... brk resumed> ) = 0x558e30455000
47094 14:49:08.532334 read(0,  <unfinished ...>
47096 14:49:08.532365 arch_prctl(0x3001 /* ARCH_??? */, 0x7fff896db680 <unfinished ...>
47094 14:49:08.532404 <... read resumed> "f", 1) = 1
47096 14:49:08.532441 <... arch_prctl resumed> ) = -1 EINVAL (Недопустимый аргумент)
47094 14:49:08.532481 read(0,  <unfinished ...>
47095 14:49:08.532511 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC <unfinished ...>
47094 14:49:08.532562 <... read resumed> "d", 1) = 1
47096 14:49:08.532600 access("/etc/ld.so.preload", R_OK <unfinished ...>
47094 14:49:08.532678 read(0, "\n", 1)  = 1
47096 14:49:08.532756 <... access resumed> ) = -1 ENOENT (Нет такого файла или каталога)
47094 14:49:08.532796 write(6, "asdfd\0", 6 <unfinished ...>
47096 14:49:08.532833 openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC <unfinished ...>
47094 14:49:08.532879 <... write resumed> ) = 6
47096 14:49:08.532911 <... openat resumed> ) = 7
47094 14:49:08.532946 read(0,  <unfinished ...>
47096 14:49:08.532975 fstat(7,  <unfinished ...>
47094 14:49:08.533011 <... read resumed> "f", 1) = 1
47096 14:49:08.533046 <... fstat resumed> {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
47094 14:49:08.533094 read(0,  <unfinished ...>
47096 14:49:08.533124 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 7, 0 <unfinished ...>
47094 14:49:08.533163 <... read resumed> "s", 1) = 1
47096 14:49:08.533200 <... mmap resumed> ) = 0x7f4560dfd000
47094 14:49:08.533235 read(0,  <unfinished ...>
47096 14:49:08.533264 close(7 <unfinished ...>
47094 14:49:08.533299 <... read resumed> "a", 1) = 1
47096 14:49:08.533335 <... close resumed> ) = 0
47094 14:49:08.533369 read(0,  <unfinished ...>
47095 14:49:08.533398 <... openat resumed> ) = 5
47094 14:49:08.533432 <... read resumed> "f", 1) = 1
47096 14:49:08.533468 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC <unfinished ...>
47094 14:49:08.533512 read(0,  <unfinished ...>
47096 14:49:08.533564 <... openat resumed> ) = 7
47094 14:49:08.533602 <... read resumed> "a", 1) = 1
47096 14:49:08.533639 read(7,  <unfinished ...>
47094 14:49:08.533674 read(0,  <unfinished ...>
47096 14:49:08.533703 <... read resumed> "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
47094 14:49:08.533745 <... read resumed> "a", 1) = 1
47096 14:49:08.533781 pread64(7,  <unfinished ...>
47094 14:49:08.533821 read(0,  <unfinished ...>
47096 14:49:08.533860 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
47094 14:49:08.533912 <... read resumed> "a", 1) = 1
47095 14:49:08.533970 fstat(5,  <unfinished ...>
47094 14:49:08.534058 read(0,  <unfinished ...>
47096 14:49:08.534105 pread64(7,  <unfinished ...>
47094 14:49:08.534197 <... read resumed> "a", 1) = 1
47096 14:49:08.534244 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
47094 14:49:08.534291 read(0,  <unfinished ...>
47096 14:49:08.534330 pread64(7,  <unfinished ...>
47094 14:49:08.534365 <... read resumed> "a", 1) = 1
47096 14:49:08.534408 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
47094 14:49:08.534455 read(0,  <unfinished ...>
47096 14:49:08.534495 fstat(7,  <unfinished ...>
47094 14:49:08.534531 <... read resumed> "a", 1) = 1
47096 14:49:08.534574 <... fstat resumed> {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
47094 14:49:08.534624 read(0,  <unfinished ...>
47096 14:49:08.534665 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
47094 14:49:08.534707 <... read resumed> "\n", 1) = 1
47096 14:49:08.534753 <... mmap resumed> ) = 0x7f4560dfb000
47094 14:49:08.534791 write(4, "fsafaaaaaa\0", 11 <unfinished ...>
47096 14:49:08.534841 pread64(7,  <unfinished ...>
47094 14:49:08.534959 <... write resumed> ) = 11
47096 14:49:08.535003 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
47094 14:49:08.535050 read(0, "a", 1)   = 1
47096 14:49:08.535193 pread64(7,  <unfinished ...>
47094 14:49:08.535247 read(0,  <unfinished ...>
47096 14:49:08.535307 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
47094 14:49:08.535355 <... read resumed> "s", 1) = 1
47096 14:49:08.535392 pread64(7,  <unfinished ...>
47094 14:49:08.535427 read(0,  <unfinished ...>
47096 14:49:08.535456 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
47094 14:49:08.535499 <... read resumed> "a", 1) = 1
47096 14:49:08.535534 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 7, 0 <unfinished ...>
47094 14:49:08.535573 read(0,  <unfinished ...>
47096 14:49:08.535602 <... mmap resumed> ) = 0x7f4560c09000
47094 14:49:08.535638 <... read resumed> "a", 1) = 1
47096 14:49:08.535675 mprotect(0x7f4560c2e000, 1847296, PROT_NONE <unfinished ...>
47094 14:49:08.535713 read(0,  <unfinished ...>
47096 14:49:08.535743 <... mprotect resumed> ) = 0
47094 14:49:08.535779 <... read resumed> "a", 1) = 1
47096 14:49:08.535816 mmap(0x7f4560c2e000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 7, 0x25000 <unfinished ...>
47094 14:49:08.535855 read(0,  <unfinished ...>
47096 14:49:08.535885 <... mmap resumed> ) = 0x7f4560c2e000
47094 14:49:08.535919 <... read resumed> "a", 1) = 1
47096 14:49:08.535955 mmap(0x7f4560da6000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 7, 0x19d000 <unfinished ...>
47094 14:49:08.535993 read(0,  <unfinished ...>
47096 14:49:08.536022 <... mmap resumed> ) = 0x7f4560da6000
47094 14:49:08.536056 <... read resumed> "a", 1) = 1
47096 14:49:08.536092 mmap(0x7f4560df1000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 7, 0x1e7000 <unfinished ...>
47094 14:49:08.536129 read(0,  <unfinished ...>
47096 14:49:08.536158 <... mmap resumed> ) = 0x7f4560df1000
47094 14:49:08.536192 <... read resumed> "a", 1) = 1
47096 14:49:08.536249 mmap(0x7f4560df7000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0 <unfinished ...>
47094 14:49:08.536291 read(0,  <unfinished ...>
47096 14:49:08.536320 <... mmap resumed> ) = 0x7f4560df7000
47094 14:49:08.536354 <... read resumed> "a", 1) = 1
47094 14:49:08.536405 read(0,  <unfinished ...>
47096 14:49:08.536439 close(7 <unfinished ...>
47094 14:49:08.536479 <... read resumed> "a", 1) = 1
47096 14:49:08.536526 <... close resumed> ) = 0
47094 14:49:08.536565 read(0,  <unfinished ...>
47095 14:49:08.536611 <... fstat resumed> {st_mode=S_IFREG|0644, st_size=77941, ...}) = 0
47094 14:49:08.536697 <... read resumed> "a", 1) = 1
47096 14:49:08.536745 arch_prctl(ARCH_SET_FS, 0x7f4560dfc540 <unfinished ...>
47094 14:49:08.536821 read(0,  <unfinished ...>
47096 14:49:08.536861 <... arch_prctl resumed> ) = 0
47094 14:49:08.536897 <... read resumed> "\n", 1) = 1
47095 14:49:08.536935 mmap(NULL, 77941, PROT_READ, MAP_PRIVATE, 5, 0 <unfinished ...>
47094 14:49:08.536972 write(6, "asaaaaaaaaa\0", 12 <unfinished ...>
47095 14:49:08.537010 <... mmap resumed> ) = 0x7f07a342b000
47094 14:49:08.537047 <... write resumed> ) = 12
47096 14:49:08.537078 mprotect(0x7f4560df1000, 12288, PROT_READ <unfinished ...>
47094 14:49:08.537113 read(0,  <unfinished ...>
47096 14:49:08.537142 <... mprotect resumed> ) = 0
47094 14:49:08.537177 <... read resumed> "a", 1) = 1
47096 14:49:08.537213 mprotect(0x558e2f020000, 4096, PROT_READ <unfinished ...>
47094 14:49:08.537248 read(0,  <unfinished ...>
47096 14:49:08.537277 <... mprotect resumed> ) = 0
47094 14:49:08.537312 <... read resumed> "d", 1) = 1
47096 14:49:08.537347 mprotect(0x7f4560e3e000, 4096, PROT_READ <unfinished ...>
47094 14:49:08.537383 read(0,  <unfinished ...>
47096 14:49:08.537412 <... mprotect resumed> ) = 0
47094 14:49:08.537446 <... read resumed> "s", 1) = 1
47096 14:49:08.537481 munmap(0x7f4560dfd000, 77941 <unfinished ...>
47094 14:49:08.537517 read(0,  <unfinished ...>
47095 14:49:08.537546 close(5 <unfinished ...>
47094 14:49:08.537579 <... read resumed> "\n", 1) = 1
47096 14:49:08.537615 <... munmap resumed> ) = 0
47094 14:49:08.537649 write(6, "ads\0", 4 <unfinished ...>
47095 14:49:08.537686 <... close resumed> ) = 0
47094 14:49:08.537721 <... write resumed> ) = 4
47094 14:49:08.537769 read(0,  <unfinished ...>
47096 14:49:08.537806 write(1, "It's child two\n", 15 <unfinished ...>
47094 14:49:08.537854 <... read resumed> "", 1) = 0
47096 14:49:08.537890 <... write resumed> ) = 15
47095 14:49:08.537951 openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC <unfinished ...>
47096 14:49:08.538022 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47094 14:49:08.538078 write(4, "\0", 1 <unfinished ...>
47096 14:49:08.538117 <... openat resumed> ) = 7
47094 14:49:08.538154 <... write resumed> ) = 1
47096 14:49:08.538184 read(5,  <unfinished ...>
47094 14:49:08.538218 write(4, "\1", 1 <unfinished ...>
47096 14:49:08.538253 <... read resumed> "a", 1) = 1
47094 14:49:08.538302 <... write resumed> ) = 1
47095 14:49:08.538333 <... openat resumed> ) = 5
47094 14:49:08.538370 write(6, "\1", 1) = 1
47096 14:49:08.538652 close(7 <unfinished ...>
47094 14:49:08.538710 close(3 <unfinished ...>
47096 14:49:08.538776 <... close resumed> ) = 0
47094 14:49:08.538816 <... close resumed> ) = 0
47096 14:49:08.538853 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47094 14:49:08.538904 close(4 <unfinished ...>
47096 14:49:08.538944 <... openat resumed> ) = 7
47094 14:49:08.538976 <... close resumed> ) = 0
47096 14:49:08.539011 read(5,  <unfinished ...>
47094 14:49:08.539040 close(5 <unfinished ...>
47096 14:49:08.539075 <... read resumed> "s", 1) = 1
47094 14:49:08.539114 <... close resumed> ) = 0
47096 14:49:08.539149 close(7 <unfinished ...>
47094 14:49:08.539179 close(6 <unfinished ...>
47096 14:49:08.539228 <... close resumed> ) = 0
47094 14:49:08.539261 <... close resumed> ) = 0
47096 14:49:08.539296 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47094 14:49:08.539337 write(1, "parent: stop\n", 13 <unfinished ...>
47096 14:49:08.539408 <... openat resumed> ) = 7
47094 14:49:08.539457 <... write resumed> ) = 13
47095 14:49:08.539495 read(5,  <unfinished ...>
47096 14:49:08.539599 read(5,  <unfinished ...>
47095 14:49:08.539663 <... read resumed> "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360q\2\0\0\0\0\0"..., 832) = 832
47094 14:49:08.539719 exit_group(0 <unfinished ...>
47096 14:49:08.539757 <... read resumed> "d", 1) = 1
47094 14:49:08.539790 <... exit_group resumed>) = ?
47096 14:49:08.539826 close(7 <unfinished ...>
47095 14:49:08.539858 pread64(5,  <unfinished ...>
47096 14:49:08.539912 <... close resumed> ) = 0
47095 14:49:08.539970 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
47096 14:49:08.540089 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47094 14:49:08.540181 +++ exited with 0 +++
47096 14:49:08.540219 <... openat resumed> ) = 7
47095 14:49:08.540251 pread64(5,  <unfinished ...>
47096 14:49:08.540287 read(5,  <unfinished ...>
47095 14:49:08.540324 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
47096 14:49:08.540372 <... read resumed> "\0", 1) = 1
47095 14:49:08.540416 pread64(5,  <unfinished ...>
47096 14:49:08.540453 write(1, "two: string is got\n", 19 <unfinished ...>
47095 14:49:08.540497 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
47096 14:49:08.540550 <... write resumed> ) = 19
47095 14:49:08.540588 fstat(5,  <unfinished ...>
47096 14:49:08.540652 write(1, "two: result written\n", 20 <unfinished ...>
47095 14:49:08.540703 <... fstat resumed> {st_mode=S_IFREG|0755, st_size=2029224, ...}) = 0
47096 14:49:08.540758 <... write resumed> ) = 20
47095 14:49:08.540796 mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
47096 14:49:08.540839 write(7, "dsa", 3 <unfinished ...>
47095 14:49:08.540886 <... mmap resumed> ) = 0x7f07a3429000
47096 14:49:08.540947 <... write resumed> ) = 3
47095 14:49:08.540993 pread64(5,  <unfinished ...>
47096 14:49:08.541030 write(7, "\n", 1 <unfinished ...>
47095 14:49:08.541075 <... pread64 resumed> "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
47096 14:49:08.541129 <... write resumed> ) = 1
47095 14:49:08.541172 pread64(5,  <unfinished ...>
47096 14:49:08.541209 close(7 <unfinished ...>
47095 14:49:08.541243 <... pread64 resumed> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32, 848) = 32
47096 14:49:08.541301 <... close resumed> ) = 0
47095 14:49:08.541339 pread64(5,  <unfinished ...>
47096 14:49:08.541374 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.541420 <... pread64 resumed> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0cBR\340\305\370\2609W\242\345)q\235A\1"..., 68, 880) = 68
47096 14:49:08.541470 <... openat resumed> ) = 7
47095 14:49:08.541507 mmap(NULL, 2036952, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 5, 0 <unfinished ...>
47096 14:49:08.541547 read(5,  <unfinished ...>
47095 14:49:08.541585 <... mmap resumed> ) = 0x7f07a3237000
47096 14:49:08.541631 <... read resumed> "a", 1) = 1
47095 14:49:08.541683 mprotect(0x7f07a325c000, 1847296, PROT_NONE <unfinished ...>
47096 14:49:08.541721 close(7)          = 0
47095 14:49:08.541829 <... mprotect resumed> ) = 0
47096 14:49:08.541868 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.541909 mmap(0x7f07a325c000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 5, 0x25000 <unfinished ...>
47096 14:49:08.541953 <... openat resumed> ) = 7
47095 14:49:08.541985 <... mmap resumed> ) = 0x7f07a325c000
47096 14:49:08.542019 read(5,  <unfinished ...>
47095 14:49:08.542048 mmap(0x7f07a33d4000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 5, 0x19d000 <unfinished ...>
47096 14:49:08.542086 <... read resumed> "s", 1) = 1
47095 14:49:08.542123 <... mmap resumed> ) = 0x7f07a33d4000
47096 14:49:08.542177 close(7 <unfinished ...>
47095 14:49:08.542208 mmap(0x7f07a341f000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 5, 0x1e7000 <unfinished ...>
47096 14:49:08.542264 <... close resumed> ) = 0
47095 14:49:08.542297 <... mmap resumed> ) = 0x7f07a341f000
47096 14:49:08.542331 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.542376 mmap(0x7f07a3425000, 13528, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0 <unfinished ...>
47096 14:49:08.542418 <... openat resumed> ) = 7
47095 14:49:08.542448 <... mmap resumed> ) = 0x7f07a3425000
47096 14:49:08.542482 read(5,  <unfinished ...>
47095 14:49:08.542512 close(5 <unfinished ...>
47096 14:49:08.542546 <... read resumed> "d", 1) = 1
47095 14:49:08.542582 <... close resumed> ) = 0
47096 14:49:08.542617 close(7)          = 0
47095 14:49:08.542716 arch_prctl(ARCH_SET_FS, 0x7f07a342a540 <unfinished ...>
47096 14:49:08.542768 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.542818 <... arch_prctl resumed> ) = 0
47096 14:49:08.542858 <... openat resumed> ) = 7
47096 14:49:08.542905 read(5, "f", 1)   = 1
47096 14:49:08.543006 close(7 <unfinished ...>
47095 14:49:08.543043 mprotect(0x7f07a341f000, 12288, PROT_READ <unfinished ...>
47096 14:49:08.543094 <... close resumed> ) = 0
47095 14:49:08.543127 <... mprotect resumed> ) = 0
47096 14:49:08.543162 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.543201 mprotect(0x556204d2f000, 4096, PROT_READ <unfinished ...>
47096 14:49:08.543240 <... openat resumed> ) = 7
47095 14:49:08.543271 <... mprotect resumed> ) = 0
47096 14:49:08.543305 read(5,  <unfinished ...>
47095 14:49:08.543334 mprotect(0x7f07a346c000, 4096, PROT_READ <unfinished ...>
47096 14:49:08.543369 <... read resumed> "d", 1) = 1
47095 14:49:08.543406 <... mprotect resumed> ) = 0
47096 14:49:08.543440 close(7 <unfinished ...>
47095 14:49:08.543470 munmap(0x7f07a342b000, 77941 <unfinished ...>
47096 14:49:08.543519 <... close resumed> ) = 0
47096 14:49:08.543567 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.543612 <... munmap resumed> ) = 0
47096 14:49:08.543651 <... openat resumed> ) = 7
47096 14:49:08.543698 read(5, "\0", 1)  = 1
47096 14:49:08.543790 write(1, "two: string is got\n", 19 <unfinished ...>
47095 14:49:08.543834 write(1, "It's child one\n", 15 <unfinished ...>
47096 14:49:08.543887 <... write resumed> ) = 19
47096 14:49:08.543936 write(1, "two: result written\n", 20 <unfinished ...>
47095 14:49:08.543979 <... write resumed> ) = 15
47096 14:49:08.544017 <... write resumed> ) = 20
47095 14:49:08.544049 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.544097 write(7, "dfdsa", 5 <unfinished ...>
47095 14:49:08.544145 <... openat resumed> ) = 5
47095 14:49:08.544222 read(3,  <unfinished ...>
47096 14:49:08.544278 <... write resumed> ) = 5
47095 14:49:08.544321 <... read resumed> "f", 1) = 1
47096 14:49:08.544363 write(7, "\n", 1 <unfinished ...>
47095 14:49:08.544398 close(5)          = 0
47096 14:49:08.544513 <... write resumed> ) = 1
47095 14:49:08.544546 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.544586 close(7 <unfinished ...>
47095 14:49:08.544615 <... openat resumed> ) = 5
47096 14:49:08.544719 <... close resumed> ) = 0
47095 14:49:08.544770 read(3,  <unfinished ...>
47096 14:49:08.544812 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.544870 <... read resumed> "s", 1) = 1
47096 14:49:08.544924 <... openat resumed> ) = 7
47095 14:49:08.544965 close(5 <unfinished ...>
47096 14:49:08.545008 read(5,  <unfinished ...>
47095 14:49:08.545087 <... close resumed> ) = 0
47096 14:49:08.545137 <... read resumed> "a", 1) = 1
47095 14:49:08.545196 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.545259 close(7 <unfinished ...>
47095 14:49:08.545309 <... openat resumed> ) = 5
47096 14:49:08.545382 <... close resumed> ) = 0
47095 14:49:08.545417 read(3,  <unfinished ...>
47096 14:49:08.545446 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.545486 <... read resumed> "a", 1) = 1
47096 14:49:08.545521 <... openat resumed> ) = 7
47095 14:49:08.545550 close(5 <unfinished ...>
47096 14:49:08.545577 read(5,  <unfinished ...>
47095 14:49:08.545620 <... close resumed> ) = 0
47096 14:49:08.545650 <... read resumed> "s", 1) = 1
47095 14:49:08.545685 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.545721 close(7 <unfinished ...>
47095 14:49:08.545750 <... openat resumed> ) = 5
47096 14:49:08.545792 <... close resumed> ) = 0
47095 14:49:08.545824 read(3,  <unfinished ...>
47096 14:49:08.545853 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.545897 <... read resumed> "f", 1) = 1
47096 14:49:08.545931 <... openat resumed> ) = 7
47095 14:49:08.545960 close(5 <unfinished ...>
47096 14:49:08.545988 read(5,  <unfinished ...>
47095 14:49:08.546030 <... close resumed> ) = 0
47096 14:49:08.546091 <... read resumed> "a", 1) = 1
47095 14:49:08.546172 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.546458 close(7 <unfinished ...>
47095 14:49:08.546526 <... openat resumed> ) = 5
47096 14:49:08.546589 <... close resumed> ) = 0
47095 14:49:08.546684 read(3,  <unfinished ...>
47096 14:49:08.548793 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660) = 7
47096 14:49:08.549011 read(5, "a", 1)   = 1
47096 14:49:08.549125 close(7)          = 0
47096 14:49:08.549311 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660) = 7
47096 14:49:08.549483 read(5, "a", 1)   = 1
47096 14:49:08.549640 close(7)          = 0
47096 14:49:08.549918 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660) = 7
47095 14:49:08.550158 <... read resumed> "a", 1) = 1
47096 14:49:08.550240 read(5,  <unfinished ...>
47095 14:49:08.550314 close(5 <unfinished ...>
47096 14:49:08.550382 <... read resumed> "a", 1) = 1
47095 14:49:08.550563 <... close resumed> ) = 0
47096 14:49:08.550688 close(7 <unfinished ...>
47095 14:49:08.550766 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.551152 <... close resumed> ) = 0
47095 14:49:08.551623 <... openat resumed> ) = 5
47096 14:49:08.552073 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.552289 read(3,  <unfinished ...>
47096 14:49:08.552424 <... openat resumed> ) = 7
47095 14:49:08.552465 <... read resumed> "a", 1) = 1
47096 14:49:08.552544 read(5,  <unfinished ...>
47095 14:49:08.552600 close(5 <unfinished ...>
47096 14:49:08.552687 <... read resumed> "a", 1) = 1
47095 14:49:08.552786 <... close resumed> ) = 0
47096 14:49:08.552840 close(7 <unfinished ...>
47095 14:49:08.552898 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.552998 <... close resumed> ) = 0
47095 14:49:08.553056 <... openat resumed> ) = 5
47096 14:49:08.553109 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.553179 read(3,  <unfinished ...>
47096 14:49:08.553233 <... openat resumed> ) = 7
47095 14:49:08.553280 <... read resumed> "a", 1) = 1
47096 14:49:08.553345 read(5,  <unfinished ...>
47095 14:49:08.553405 close(5 <unfinished ...>
47096 14:49:08.553461 <... read resumed> "a", 1) = 1
47095 14:49:08.553597 <... close resumed> ) = 0
47096 14:49:08.553657 close(7 <unfinished ...>
47095 14:49:08.553711 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.553784 <... close resumed> ) = 0
47096 14:49:08.553904 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.553984 <... openat resumed> ) = 5
47096 14:49:08.554033 <... openat resumed> ) = 7
47095 14:49:08.554085 read(3,  <unfinished ...>
47096 14:49:08.554136 read(5,  <unfinished ...>
47095 14:49:08.554186 <... read resumed> "a", 1) = 1
47096 14:49:08.554249 <... read resumed> "a", 1) = 1
47095 14:49:08.554345 close(5 <unfinished ...>
47096 14:49:08.554401 close(7 <unfinished ...>
47095 14:49:08.554463 <... close resumed> ) = 0
47096 14:49:08.554521 <... close resumed> ) = 0
47095 14:49:08.554577 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.554643 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.554705 <... openat resumed> ) = 5
47096 14:49:08.554749 <... openat resumed> ) = 7
47095 14:49:08.554794 read(3,  <unfinished ...>
47096 14:49:08.554842 read(5,  <unfinished ...>
47095 14:49:08.554898 <... read resumed> "a", 1) = 1
47096 14:49:08.554967 <... read resumed> "a", 1) = 1
47095 14:49:08.555032 close(5 <unfinished ...>
47096 14:49:08.555082 close(7 <unfinished ...>
47095 14:49:08.555140 <... close resumed> ) = 0
47095 14:49:08.555239 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.555324 <... close resumed> ) = 0
47095 14:49:08.555385 <... openat resumed> ) = 5
47096 14:49:08.555436 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.555503 read(3,  <unfinished ...>
47096 14:49:08.555550 <... openat resumed> ) = 7
47095 14:49:08.555596 <... read resumed> "a", 1) = 1
47096 14:49:08.555651 read(5,  <unfinished ...>
47095 14:49:08.555700 close(5 <unfinished ...>
47096 14:49:08.555746 <... read resumed> "a", 1) = 1
47095 14:49:08.555807 <... close resumed> ) = 0
47096 14:49:08.555868 close(7 <unfinished ...>
47095 14:49:08.555913 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.555978 <... close resumed> ) = 0
47095 14:49:08.556035 <... openat resumed> ) = 5
47096 14:49:08.556089 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.556179 read(3,  <unfinished ...>
47096 14:49:08.556232 <... openat resumed> ) = 7
47095 14:49:08.556287 <... read resumed> "\0", 1) = 1
47096 14:49:08.556347 read(5,  <unfinished ...>
47095 14:49:08.556384 write(1, "one: string got\n\0", 17 <unfinished ...>
47096 14:49:08.556427 <... read resumed> "\0", 1) = 1
47095 14:49:08.556486 <... write resumed> ) = 17
47095 14:49:08.556562 write(1, "one: result written\n", 20 <unfinished ...>
47096 14:49:08.557038 write(1, "two: string is got\n", 19 <unfinished ...>
47095 14:49:08.557158 <... write resumed> ) = 20
47096 14:49:08.557214 <... write resumed> ) = 19
47096 14:49:08.557588 write(1, "two: result written\n", 20 <unfinished ...>
47095 14:49:08.557658 write(5, "aaaaaafasf", 10 <unfinished ...>
47096 14:49:08.557725 <... write resumed> ) = 20
47096 14:49:08.557843 write(7, "aaaaaaaaasa", 11 <unfinished ...>
47095 14:49:08.557911 <... write resumed> ) = 10
47096 14:49:08.558023 <... write resumed> ) = 11
47095 14:49:08.558094 write(5, "\n", 1 <unfinished ...>
47096 14:49:08.558148 write(7, "\n", 1 <unfinished ...>
47095 14:49:08.558235 <... write resumed> ) = 1
47096 14:49:08.558282 <... write resumed> ) = 1
47095 14:49:08.558319 close(5 <unfinished ...>
47096 14:49:08.558373 close(7 <unfinished ...>
47095 14:49:08.558768 <... close resumed> ) = 0
47096 14:49:08.558856 <... close resumed> ) = 0
47095 14:49:08.558906 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47096 14:49:08.558971 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.559026 <... openat resumed> ) = 5
47096 14:49:08.559069 <... openat resumed> ) = 7
47095 14:49:08.559107 read(3,  <unfinished ...>
47096 14:49:08.559145 read(5,  <unfinished ...>
47095 14:49:08.559184 <... read resumed> "\0", 1) = 1
47096 14:49:08.559230 <... read resumed> "a", 1) = 1
47095 14:49:08.559287 write(1, "one: string got\n\0", 17) = 17
47096 14:49:08.562628 close(7)          = 0
47095 14:49:08.563196 write(1, "one: result written\n", 20 <unfinished ...>
47096 14:49:08.563328 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.563446 <... write resumed> ) = 20
47096 14:49:08.563523 <... openat resumed> ) = 7
47096 14:49:08.563692 read(5, "d", 1)   = 1
47095 14:49:08.563856 write(5, "", 0 <unfinished ...>
47096 14:49:08.563912 close(7 <unfinished ...>
47095 14:49:08.563958 <... write resumed> ) = 0
47096 14:49:08.564027 <... close resumed> ) = 0
47095 14:49:08.564068 write(5, "\n", 1 <unfinished ...>
47096 14:49:08.564109 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660 <unfinished ...>
47095 14:49:08.564179 <... write resumed> ) = 1
47095 14:49:08.564236 close(5)          = 0
47095 14:49:08.564355 openat(AT_FDCWD, "file_a", O_WRONLY|O_CREAT|O_APPEND, 0660) = 5
47095 14:49:08.564541 read(3, "\1", 1)  = 1
47095 14:49:08.564685 close(3)          = 0
47095 14:49:08.564867 close(16777856)   = -1 EBADF (Неправильный дескриптор файла)
47095 14:49:08.565421 write(1, "one: stop\n", 10) = 10
47095 14:49:08.565734 exit_group(0)     = ?
47096 14:49:08.565873 <... openat resumed> ) = 7
47096 14:49:08.565948 read(5, "s", 1)   = 1
47096 14:49:08.566118 close(7)          = 0
47095 14:49:08.566672 +++ exited with 0 +++
47096 14:49:08.566778 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660) = 7
47096 14:49:08.566949 read(5, "\0", 1)  = 1
47096 14:49:08.567084 write(1, "two: string is got\n", 19) = 19
47096 14:49:08.567272 write(1, "two: result written\n", 20) = 20
47096 14:49:08.567411 write(7, "sda", 3) = 3
47096 14:49:08.567613 write(7, "\n", 1) = 1
47096 14:49:08.567794 close(7)          = 0
47096 14:49:08.567925 openat(AT_FDCWD, "file_b ", O_WRONLY|O_CREAT|O_APPEND, 0660) = 7
47096 14:49:08.568041 read(5, "\1", 1)  = 1
47096 14:49:08.568136 close(5)          = 0
47096 14:49:08.568226 close(16777856)   = -1 EBADF (Неправильный дескриптор файла)
47096 14:49:08.568326 write(1, "two: stop\n", 10) = 10
47096 14:49:08.568849 exit_group(0)     = ?
47096 14:49:08.569172 +++ exited with 0 +++
