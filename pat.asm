.MODEL MEDIUM
.STACK
.DATA
.CODE
.STARTUP
 mov bl,10
 mov cl,48
nextline: mov dl,'0' ; '0' is ASCII 48
inc cl
nextchar: mov ah,02h ; print ASCII char in dl
 int 021h
 inc dl;

 cmp dl,cl ; ‘4' is ASCII 53
 jnz nextchar

 push dx ; save value of dl and dh on stack
 mov ah,02h ; print ASCII char in dl
 mov dl,13 ; carriage return (move to start of line)
 int 021h
 mov dl,10 ; line feed (next line)
int 021h
 pop dx ; restore value in dl (and dh)
 dec bl
 jnz nextline
 .EXIT
END