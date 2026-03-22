        LDR     R0, =ARR        ; MOCK
        BL      LEN
        END

LEN
        SUB     R13, R13, #8    ; ALLOCATE STACK FRAME
        STR     R2, [R13, #4]   ; SAVE R2
        STR     R3, [R13]       ; SAVE R3

        MOV     R1, #0          ; LENGTH COUNTER (RETURNED VALUE)
        MOV     R2, R0          ; WALK POINTER (ADDRESS)

_LEN_INNER
        LDR     R3, [R2]        ; GET CURRENT VALUE OF WALK POINTER
        CMP     R3, #0          ; IS EQUAL TO ZERO?
        BEQ     _LEN_RET        ; YES, NULL-TERMINATOR FOUND, RETURN

        ADD     R1, R1, #1      ; ELSE INCREMENT R1
        ADD     R2, R2, #4      ; ADVANCE POINTER BY 1 WORD
        B       _LEN_INNER

_LEN_RET
        LDR     R3, [R13]
        LDR     R2, [R13, #4]
        ADD     R13, R13, #8    ; FREE STACK FRAME
        MOV     PC, LR          ; RETURN TO CALLER

DAT
ARR     DCD     10, 20, 30, 40, 50, 0
