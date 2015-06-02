; boot sector that enters 32 - bit protected mode.
[org 0x7c00]
KERNEL_OFFSET equ 0x1000

mov [BOOT_DRIVE], dl	; BIOS stores our boot drive in DL , so it 's
			; best to remember this for later.

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE ;to print a message on screen, store message in BX Register
call print_string

call load_kernel

call switch_to_pm
jmp $                   ; jump forever(jump to address of current instruction) 

%include "print_string.asm"
%include "disk_load.asm"
%include "print_string_pm.asm"
%include "gdt.asm"
%include "switch_to_pm.asm"

[ bits 16]
load_kernel:
	mov bx, MSG_LOAD_KERNEL ; using BX as a parameter of our function
	call print_string       ; by specifying the address of a string

	mov bx, KERNEL_OFFSET
	mov dh, 30
	mov dl, [BOOT_DRIVE]
        ; with dx having been loaded with number of sectors to read, we will call disk_load
	call disk_load
	ret

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm

	call KERNEL_OFFSET

	jmp $

BOOT_DRIVE:
	db 0

MSG_REAL_MODE:
	db " Hello GeekSkool,Started in 16- bit Real Mode ", 0

MSG_PROT_MODE:
	db " Successfully landed in 32- bit Protected Mode ", 0

MSG_LOAD_KERNEL:
	db " Loading kernel into memory. ", 0

times 510-($-$$) db 0 ; Pad the boot sector out with zeros
                      ; When compiled , our program must fit into 512 bytes ,
                      ; with the last two bytes being the magic number ,
                      ; so here , tell our assembly compiler to pad out our
                      ; program with enough zero bytes (db 0) to bring us to the
                      ; 510 th byte.
dw 0xaa55             ; Last two bytes form the magic number 
                      ; BIOS is informed that we are a boot sector 
