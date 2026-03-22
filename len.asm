        LDR     R0, =ARR        ; MOCK
        BL      LEN
        END

LEN
        SUB     R13, R13, #8    ; MAKE ROOM ON THE STACK
        STR     R2, [R13, #4]
        STR     R3, [R13]

        MOV     R1, #0          ; RESULT STORED IN R1
        MOV     R2, R0          ; WALK POINTER (ADDRESS)

_LEN_INNER
        LDR     R3, [R2]        ; GET CURRENT VALUE OF WALK POINTER
        CMP     R3, #0          ; IS EQUAL TO ZERO?
        BEQ     _LEN_RET        ; NULL-TERMINATOR FOUND, RETURN

        ADD     R1, R1, #1      ; ELSE INCREMENT R1
        ADD     R2, R2, #4      ; ADD 4 BYTES (WORD) TO WALK POINTER
                                ; TO GET THE NEXT ITEM OF THE ARRAY
        B       _LEN_INNER

_LEN_RET
        LDR     R3, [R13]
        LDR     R2, [R13, #4]
        ADD     R13, R13, #8    ; FREE THE ROOM MADE ON THE STACK
                                ; AND PUT THEIR RESPECTIVE VALUES BACK
        MOV     PC, LR          ; RETURN TO CALLER

DAT
ARR     DCD     10, 20, 30, 40, 50, 0
