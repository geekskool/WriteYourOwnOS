#include "../cpu/isr.h"
#include "../drivers/screen.h"
#include "kernel.h"
#include "../libc/string.h"

void main() {
    isr_install();
    irq_install();

    display("Text Editor. Type END to halt the CPU\n ");
}

void user_input(char *input) {
    if (strcmp(input, "END") == 0) {
        display("Stopping the CPU. Bye!\n");
        asm volatile("hlt");
    }
    display("You said: ");
    display(input);
    display("\n> ");
}
