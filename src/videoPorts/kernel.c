/*
 * Read --or-- Write a byte --or-- a word from --or-- to a specified port
 */

unsigned char port_byte_in (unsigned short port)
{
    unsigned char result;
    __asm__("in %%dx, %%al" : "=a" (result) : "d" (port));
    //Thanks to GAS, source and destination reigsters are flipped	
    //AL = A , DX = PORT
    return result;
}

void port_byte_out (unsigned short port, unsigned char data)
{
    __asm__("out %%al, %%dx" : : "a" (data), "d" (port));
}

unsigned short port_word_in (unsigned short port)
{
    unsigned short result;
    __asm__("in %%dx, %%ax" : "=a" (result) : "d" (port));
    return result;
}

void port_word_out (unsigned short port, unsigned short data)
{
    __asm__("out %%ax, %%dx" : : "a" (data), "d" (port));
}


void main() 
{
    /* Screen cursor position: ask VGA control register (0x3d4) for bytes
     * 14 = high byte of cursor and 15 = low byte of cursor. */
    port_byte_out(0x3d4, 14); /* Requesting byte 14: high byte of cursor pos */
    /* Data is returned in VGA data register (0x3d5) */
    int position = port_byte_in(0x3d5);
    position = position << 8; /* high byte */

    port_byte_out(0x3d4, 15); /* requesting low byte */
    position += port_byte_in(0x3d5);

    /* VGA 'cells' consist of the character and its control data
     * e.g. 'white on black background', 'red text on white bg', etc */
    int offset_from_vga = position * 2;

    char *vga = (char *)0xb8000;
    vga[offset_from_vga] = 'H'; 
    vga[offset_from_vga++] = 0x0f; /* White text on black background */

    vga[offset_from_vga++] = 'A'; 
    vga[offset_from_vga++] = 0x0f; /* White text on black background */

    vga[offset_from_vga++] = 'S'; 
    vga[offset_from_vga++] = 0x0f; /* White text on black background */

    vga[offset_from_vga++] = 'G'; 
    vga[offset_from_vga++] = 0x0f; /* White text on black background */

    vga[offset_from_vga++] = 'E'; 
    vga[offset_from_vga++] = 0x0f; /* White text on black background */

    vga[offset_from_vga++] = 'E'; 
    vga[offset_from_vga+1] = 0x0f; /* White text on black background */

    vga[offset_from_vga++] = 'K'; 
    vga[offset_from_vga+1] = 0x0f; /* White text on black background */
}

