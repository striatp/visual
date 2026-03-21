		MOV		R0, #2
		MOV		R1, #4
		BL		POW
		END
		
POW
		SUB		R13, R13, #16
		STR		R14, [R13, #12]
		STR		R3, [R13, #8]
		STR		R2, [R13, #4]
		STR		R0, [R13]
		
		MOV		R2, R1 ; counter
		MOV		R3, R0 ; preserved base
		MOV		R1, R0 ; accumulator = base
		
POW_INNER
		MOV		R0, R1 ; current accumulator
		MOV		R1, R3 ; base
		BL		MUL    ; R1 = accumulator * base
		SUB		R2, R2, #1
		CMP		R2, #1
		BGT		POW_INNER
		
		LDR		R0, [R13]
		LDR		R2, [R13, #4]
		LDR		R3, [R13, #8]
		LDR		R14, [R13, #12]
		ADD		R13, R13, #16
		MOV		PC, LR
		
		
MUL
		SUB		R13, R13, #8
		STR		R0, [R13, #4]
		STR		R2, [R13]
		MOV		R2, R1
		MOV		R1, #0
MUL_INNER
		ADD		R1, R1, R2
		SUB		R0, R0, #1
		CMP		R0, #0
		BNE		MUL_INNER
		LDR		R2, [R13]
		LDR		R0, [R13, #4]
		ADD		R13, R13, #8
		MOV		PC, LR
