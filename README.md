# OS_from_Scratch
The main objective of the project is to implement a bootable OS with the help of  ["How to Write an Operating System from Scratch?"] by Nick Blundell.

The code(mostly in assembly language) is as follows :
  - print_string.asm ; printing a string in real mode
  - print_string_pm.asm ; printing a string in protected mode
  - disk_load.asm ; reading the first N sectors following the boot sector from a given disk 
  - boot_sect.asm ; demonstrates the switch from real mode to protected mode using above helper functions.
