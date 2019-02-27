.MODEL medium
.STACK
.DATA
.CODE
.STARTUP
nextc:   mov ah,8
		 int 021h
		 mov dl,al
		 cmp dl,27
		 jz quit
		 cmp dl,97
		 jnc convert
		 jmp print
		 
convert: cmp dl,123
		 jc subtr
		 jmp print
		 
subtr:   sub dl,32
         jmp print
		 
print:	 mov ah,02h
		 int 021h
		 jnz nextc
		 
quit:	 .EXIT
		 END