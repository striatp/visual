        MOV     R0, #-8
        BL      ABS
        END

ABS
        CMP     R0, #0
        BGE     ABS_RET
        RSB     R0, R0, #0

ABS_RET
        MOV     PC, LR
