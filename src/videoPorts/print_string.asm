print_string:
	mov ah, 0x0e

loop:
	mov al, [bx] ; 
	cmp al, 0
	je out
	int 0x10   ; invoking the screen-related Interrupt Service Routine
	           ;An ISR is simply a sequence of machine instructions, much like our boot sector code, that deals with a
                   ;specific interrupt (e.g. perhaps to read new data from a disk drive or from a network card).
        add bx, 0x01
	jmp loop

out:
	mov al, ' '
	int 0x10
	ret
