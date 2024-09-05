main:
    SET R7, 0xFF
    SET R2, 0x50
    SET R3, 0x70
    SET R1, 0x4f
    SET R0, 0x51
    STR [R2], R3 ; para comprobar funcionamiento
    STR [R0], R1 ; para comprobar funcionamiento
aca:
    ADDE10S R2, R3
    JMP halt
halt:
    JMP halt