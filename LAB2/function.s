		
; Объявляем макроподстановку для максимального размера массива		
MAX_SIZE	EQU	0x28	
	AREA FUNK, CODE, READONLY

min_find PROC ;Поиск минимального значения и замена 0 на это значение
	EXPORT min_find
START
		mov R2, #0
		mov R3, #0 ; элемент
		LDR R4, [R0, #0] ; мин элемент
MAIN_CMP
		CMP R2, #MAX_SIZE
		BLT COPE
		BGE ST
COPE
		LDR R3, [R0, R2]
		CMP R4, #0
		BEQ CORECT
		CMP R3, #0
		BEQ NO
		CMP R3, R4
		BLT YES
		BGE NO
		
CORECT
		LDRB R4, [R0, R2]
		ADD R2, #4
		B COPE
		
NO
		add R2, #4
		B MAIN_CMP
YES
		mov R4, R3
		add R2, #4
		B MAIN_CMP
ST
		mov R2, #0
		b START1
START1
		CMP R2, #MAX_SIZE
		blt SEARCH
		bx lr
SEARCH	
		LDRB R3, [R0, R2]
		CMP R3, #0
		BEQ ZAMENA
		add R2, #4
		b START1
ZAMENA
		STRB R4, [R1, R2]
		add R2, #4
		b START1

	
	ENDP
		
mas_cpy PROC ;Копирование массива
	EXPORT mas_cpy
DOUBLE		
		mov R2, #0
		B DA
DA
		CMP R2, #MAX_SIZE
		BLT COPY
		bx lr
COPY
		LDRB R3, [R0, R2]
		STRB R3, [R1, R2]
		add R2, #4
		B DA

	
	ENDP
		
	
END