.model medium
	.8087			; Tell MASM co-processor is present
	.STACK 100h
	.DATA

	SX  dd 	3.0		; short real 4 bytes SX = 4.0
	SY  dd 	9.0		;
    	HY  dd 	0.0   		; 
    	cntrl 	dw   	03FFh  	; Control word for 8087
	stat	dw 	0	; Status after calculation

	.CODE           		; Start of Program
	.STARTUP
	FINIT           		; Set FPU to default state
	FLDCW		cntrl     	; Round even, Mask Interrupts
	FLD 		SX  ; Push SX onto FP stack
    	FMUL		ST,ST(0)	; Multiply ST*ST result on ST
    FLD         SX
    	FMUL        ST,ST(1)
    	FLD 		SY          	; Push SY onto FP stack
		FSQRT
  	;FMUL		ST,ST(0)   	; Multiply ST*ST
 	FADD 		ST,ST(1)   	; ADD top two numbers on stack
	;FSQRT       SY   			; Square root number on stack
 	FSTSW	stat      		; Load FPU status into [stat]
	mov 		ax,stat		; Copy [stat] into ax
	and al,0BFh     		; Check all 6 status bits
	jnz pass				; If any bit set then jump
	FSTP HY         		; Copy result from stack into HY

	
        mov 	bx,OFFSET HY      	;bx=[RESULT+2]+256*[RESULT+3]
        inc 	bx
        inc 	bx
        mov 	ax,[bx]
        mov 	bx,ax

mov	cx,16
back:  	rol     bx,1    		; Rotate bx
		jc	set		; Check MSB first
       	mov     dl,'0'  		; If carry set dl='0'
		jmp	over    
set:   	mov     dl,'1'  		; If carry not set dl='1'
over:	mov	ah,02h			; Print ASCII of dl
		int	021h
        loop   back    		; Repeat 16 times

        mov 	bx,OFFSET HY 	;bx=[RESULT+0]+256*[RESULT+1]
        mov 	ax,[bx]
        mov 	bx,ax

	mov	cx,16
back1:	rol	bx,1     		; Rotate bx
	jc	set1			; Check MSB first
       	mov     dl,'0'  		; If carry set dl=‘0’
	jmp	over1    
set1:  	mov     dl,'1'			; If carry not set dl=‘1’
over1:	mov	ah,02h			; Print ASCII of dl
	int	021h
       loop    back1			; Repeat 16 times

pass:	.EXIT
END