		GET stm32_EQU.s

MAX_SIZE EQU 0xA

		AREA CONSTANT_FLASH, DATA, READONLY

mas DCB 6, 5, 7, 0, 4, 15, 9, 0, 7, 1
		AREA VERIABLE_RAM, DATA, READWRITE
			
result SPACE 0x24
	
			AREA MAIN, CODE, READONLY
			THUMB

main PROC
		mov R3, #0 ;i
		LDR R6, =mas
		LDR R8,=result
		LDRB R5, [R6, #0]
		push {R0-R8}
		bl var13
		pop {R0-R8}
		bl min_find
loop 

			B loop 

ENDP
	

var13 PROC
		push {lr}
		mov R3, #0 ;i
		LDRB R5, [R6, #0]
		bl mas_cpy
		pop {lr}
		bx lr
		
	ENDP

min_find PROC

MAIN_CMP
		CMP R3, #MAX_SIZE
		BLT COPE
		BGE ST
		bx lr
COPE
		LDRB R7, [R6, R3]
		CMP R7, #0
		BEQ NO
		CMP R7, R5
		BLT YES
		BGT NO
		
NO
		add R3, #1
		B MAIN_CMP
YES
		mov R5, R7
		add R3, #1
		B MAIN_CMP
ST
		mov R3, #0
		b START
START
		CMP R3, #MAX_SIZE
		blt SEARCH
		bx lr
SEARCH	
		LDRB R7, [R6, R3]
		CMP R7, #0
		BEQ ZAMENA
		add R3, 1
		b START
ZAMENA
		STRB R5, [R8, R3]
		add R3, 1
		b START

	
	ENDP
		
mas_cpy PROC
	
DOUBLE		
		mov R3, #0
		B DA
DA
		CMP R3, #MAX_SIZE
		BLT COPY
		bx lr
COPY
		LDRB R7, [R6, R3]
		STRB R7, [R8, R3]
		add R3, #1
		B DA

	
	ENDP
		
	
END