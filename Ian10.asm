 .MODEL medium
 .STACK
 .DATA
msg1 BYTE "Ian Berigan",13,10,"$"
 .CODE
 .STARTUP
 mov cx,10
labe: mov bx,OFFSET msg1
back: mov dx,[bx] ;dl=letters
 cmp dl,'$'
 jz done
 mov ah,02h
 int 021h
 inc bx
 jmp back
done: dec cx 
      jnz labe
	  nop
 .EXIT
END 