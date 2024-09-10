main:
    SET R1, 0x03   
    SET R2, 0x1a
aca:
    ADDE10S R1, R2
    JMP halt
halt:
    JMP halt