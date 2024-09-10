; Usando la instruccion ADDE10S, implementar la funcion sumE10S que toma un par de arreglos
; de numeros en notacion exceso 10 y suma los elementos entre si. El resultado de cada operacion
; se almacena en ambos arreglos por cada elemento sumado.
;     sumE10S(*p,*t,size)
;         for i=0; i<size; i++
;             r = sumExceso10Sat(p[i], t[i])
;             p[i] = r
;             t[i] = r

main:
	SET R7, 0xFF	;stack
	SET R0, p		;p
	SET R1, t		;t
	SET R2, 0x10	;size


    PUSH |R7|, R3
    PUSH |R7|, R2
    PUSH |R7|, R1
	PUSH |R7|, R0	
    SET R3, 0x01
	CALL |R7|, sumE10S
    POP |R7|, R2	
    POP |R7|, R3	
    

halt:
	JMP halt

sumE10S:
    LOAD R0, [R0]
    LOAD R1, [R1]
	ADDE10S R1, R0
    POP |R7|, R0
    STR [R0], R1
    POP |R7|, R1
    PUSH |R7|, R0	 
    PUSH |R7|, R1
    LOAD R0, [R0]
    POP |R7|, R1
    STR [R1], R0
    POP |R7|, R0
    ADD R1, R3
	ADD R0, R3
    SUB R2, R3
    CMP R2, R3 		
	JN fin
	JMP sumE10S 

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

t:
DB 0x01
DB 0x01
DB 0x34
DB 0x02
DB 0x03
DB 0x23
DB 0xAA
DB 0xCF
DB 0x0F
DB 0x4F
DB 0x50
DB 0x0C
DB 0xC0
DB 0x54
DB 0x88
DB 0xA0