        MOV     R0, #-8         ; MOCK
        BL      ABS
        END

ABS
        CMP     R0, #0          ; IS R0 NEGATIVE
        BGE     INNER_ABS_RET   ; NO, NO CHANGES NEEDED
        RSB     R0, R0, #0      ; PERFOM 'R0 = 0 - R0', IF NEGATIVE

INNER_ABS_RET
        MOV     PC, LR          ; RETURN TO CALLER
