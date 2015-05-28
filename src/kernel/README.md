nasm boot_sect.asm -f bin -o boot_sect.bin
nasm kernel_entry.asm -f elf -o kernel_entry.o
gcc -m32 -ffreestanding -c kernel.c -o kernel.o
i386-elf-ld -o kernel.bin -Ttext 0x0500 kernel_entry.o kernel.o --oformat binary
cat boot_sect.bin kernel.bin > os-image



