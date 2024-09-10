; Usando la instruccion ADDINMEM, implementar la funcion processArray que toma un arreglos
; de enteros positivos en memoria y los suma de a pares en memoria, pisando el primer elemento
; de cada par con el resultado. Considerar que el tama-o del arreglo siempre es par.
;
;     processArray(*p,size)
;         for i=0; i<size/2; i=i+2
;             p[i] = p[i] + p[i+1]

main:
	SET R7, 0xFF	;stack
	SET R0, p		;p
	SET R1, 0x10	;size

	PUSH |R7|, R2	
	PUSH |R7|, R1
	PUSH |R7|, R0
	SET R2, 0x02	
	CALL |R7|, processArray
	POP |R7|, R0
	POP |R7|, R1
	POP |R7|, R2	

halt:
	JMP halt

processArray:
	ADDINMEM R0		
	ADD R0, R2		
	SUB R1, R2		
	CMP R1, R2		
	JN fin
	JMP processArray

fin:
	RET |R7|

p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE
