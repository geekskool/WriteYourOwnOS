disk_load:
	push dx         ; Store DX on stack so later we can recall
                        ; how many sectors were request to be read!
	
	mov ah, 0x02	; BIOS read sector function
	mov al, dh	; READ dh sectors
	mov ch, 0x00	; select cylinder 0
	mov dh, 0x00	; select head 0
	
	mov cl, 0x02	; start reading from 2nd sector (after boot sector)

	int 0x13	; BIOS interrupt
	jc disk_error

	pop dx          ; pop dx from the stack
	cmp dh, al
	jne disk_error  ; generate disk error if  AL(sectors read) != DH(Expected number of sectors)

	ret
disk_error:             ; disk_error label
	mov bx, [DISK_ERROR_MSG] ; push the error message   
	call print_string        ; print_string is the helper to print string stored in [BX]
	jmp $           ; jump forever

DISK_ERROR_MSG:
	db 'Disk read Error!', 0
