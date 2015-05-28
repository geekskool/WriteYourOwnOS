Continuing from where we had left, the boot_sector binary is created by the NASM Assembler(Note the -f bin format).

```sh
$ nasm boot_sect.asm -f bin -o boot_sect.bin 
```
In contrast, the option -f elf tells the assembler to output an object file of the particular format Executable and Linking Format (ELF), which is the default format output by out C compiler.

```sh
$ nasm kernel_entry.asm -f elf -o kernel_entry.o 
```
The kernel.c program can be compiled this to raw binary as follows:
```sh
$ gcc -m32 -ffreestanding -c kernel.c -o kernel.o 
```
```sh
$ i386-elf-ld -o kernel.bin -Ttext 0x0500 kernel_entry.o kernel.o --oformat binary
```

```sh
$ cat boot_sect.bin kernel.bin > os-image
```


