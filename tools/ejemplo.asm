main:
    SET R7, 0xFF ; 1 m.i.
    SET R2, 0x50 ; 1 m.i.
    SET R3, 0x70 ; 1 m.i. 
    SET R1, 0x01 ; 1 m.i.
    SET R0, 0x00 ; 1 m.i.
        aca:
            CMP R3, R2 ; 3 m.i.
            JZ fin ; 2 m.i.
            CALL |R7|, coso2 ; 6 m.i.
            ADD R2, R1 ; 4 m.i.
            JMP aca ; 1 m.i.
coso2:
    PUSH |R7|, R0 ; 5 m.i.
    SET R0, 0xFF ; 1 m.i.
    SUB R0, R2 ; 4 m.i.
    STR [R2], R0 ; 2 m.i.
    POP |R7|, R0 ; 5 m.i.
    RET |R7| ; 5 m.i.
fin:
    DB 0xA0 ; 1 m.i. 
    DB 0x00 ; 1 m.i.
halt:
    JMP halt