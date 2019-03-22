.MODEL small
 .STACK
 .DATA
 .CODE
 .STARTUP
 mov ax,0b800h ; Base address of screen memory
 mov es,ax ; Use extra segment register to access 0x800...
 mov bx,1960 ; Screen position x=0, y=0, (2*((80*y)+x))=0
 mov al,'I' ; Print 'Hello' on the screen
 mov es:[bx],al
 inc bx
 mov al,14 ; Bright red on a black background
 mov es:[bx],al
 inc bx ; Black on a red background
 mov al,'B'
 mov es:[bx],al
 inc bx
 mov al,105
 mov es:[bx],al
quit: .EXIT
END 
