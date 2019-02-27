			.MODEL medium
			.STACK
			.DATA
			.CODE
			.STARTUP
			mov ah,02
			mov dl,'S'
			int 021h

			mov bx, 65000

			
back2:      mov cx, 64000
back1:      nop
		    loop back1
		   
		    dec bx
		    jnz back2
		   
		    mov ah,02
		    mov dl,'F'
		    int 021h
		   
		   .EXIT
		    END