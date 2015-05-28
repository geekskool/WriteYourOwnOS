;The linker takes object files as inputs, then joins them together,
;but resolves any labels to their correct addresses.

[bits 32]
[extern main] ; Define calling point. Must have same name as kernel.c 'main' function
call main ; Calls the C function. The linker will know where it is placed in memory
jmp $
