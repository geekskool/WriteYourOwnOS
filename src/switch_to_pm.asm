[bits 16]

switch_to_pm:
	cli	; We must switch off interrupts until we have
		; set -up the protected mode interrupt vector
		; otherwise interrupts will run riot.

	lgdt [gdt_descriptor]

	mov eax, cr0	; see we are using 32 register (eax) here in 16 bit, we can do that
	or eax, 0x1     ; set the first bit of CR0, a control register
	mov cr0, eax

	jmp CODE_SEG:init_pm ;Make a far jump ( i.e. to a new segment ) to our 32 - bit
                             ;code.

[bits 32]
init_pm:
	mov ax, DATA_SEG	 ; Now we are in protected mode , our old segments are meaningless ,
	mov ds, ax		 ; so we point our segment registers to the
	mov ss, ax		 ; data selector we defined in our GDT
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000         ; Updating stack position so that it is right at the top of free space.
	mov esp, ebp

	call BEGIN_PM
