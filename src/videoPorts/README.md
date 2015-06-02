```sh
$ nasm boot_sect.asm -f bin -o boot_sect.bin
```

```sh
$ nasm kernel_entry.asm -f elf -o kernel_entry.o
```

```sh
$ gcc -m32 -ffreestanding -c kernel.c -o kernel.o
```

```sh
$ i386-elf-ld -o kernel.bin -Ttext 0x0500 kernel_entry.o kernel.o --oformat binary
```

```sh
$ cat boot_sect.bin kernel.bin > os-image
```
