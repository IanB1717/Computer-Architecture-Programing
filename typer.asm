.MODEL medium
.STACK
.DATA
.CODE
.STARTUP
nextc:   mov ah,8
		 int 021h
		 mov dl,al
		 cmp dl,'q'
		 jz quit
		 cmp dl,48
		 jc nextc
		 cmp dl,57
		 jnc nextc
		 
		 mov ah,02h
		 int 021h
		 jnz nextc
		 
quit:	 .EXIT
		 END