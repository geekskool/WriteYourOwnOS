# OS_from_Scratch
---
The main objective of the project is to implement a bootable OS with the help of  ["How to Write an Operating System from Scratch?"](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf) by Nick Blundell.

The code(mostly in assembly language) is as follows :
  - print_string.asm : printing a string in real mode
  - print_string_pm.asm : printing a string in protected mode
  - disk_load.asm : reading the first N sectors following the boot sector from a given disk 
  - boot_sect.asm : the entry point to seize control of the Computer. The boot sector is implemented in protected mode. Note the last two bytes of the 512-byte sector have been set to the magic number 0xaa55.

