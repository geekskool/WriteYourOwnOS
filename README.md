# OS_from_Scratch
---
The main objective of the project is to implement a bootable OS with the help of  ["How to Write an Operating System from Scratch?"](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf) by Nick Blundell.

The README is incomplete!!!!
Please run the following from command line to get a demo of what it does :

```sh
$ nasm boot_sect.asm -f bin -o boot_sect.bin
$ sudo-apt get install qemu
$ qemu-system-x86_64 boot_sect.bin
```

(Optional) If you wish to see the binary contents of the boot_sector:
```sh
$ od -t x1 -A n boot_sect.bin
```


The boot_sector code(mostly in assembly language) is as follows :
  - boot_sect.asm : 
      * The entry point to seize control of the Computer
      * The boot sector is implemented in protected mode. 
      * The last two bytes of the 512-byte sector are set to the magic number 0xaa55, to indicate itself to BIOS
    
  - disk_load.asm : 
      * Reading more data from the disk will be essential for boot-strapping our operating system,
      * Reading the first N sectors following the boot sector from a given disk 
      * Reading from dh Sector of ch cylinder.
      
  - gdt.asm
      * The Global Descriptor Table
      
  - switch_to_pm.asm :
      * Switch off interrupts(CLI)
      * Load Global Descriptor Table(gdt)
      * Jump to Code Segment
      * Update Stack Pointer
      * Begin Protected Mode.
      
  - print_string.asm : printing a string in real mode
  
  - print_string_pm.asm : printing a string in protected mode




