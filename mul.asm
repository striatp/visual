		MOV		R0, #5
		MOV		R1, #6
		BL		MUL ; R0 * R1
		END
		
MUL
		SUB		R13, R13, #8
		STR		R0, [R13, #4]
		STR		R2, [R13]
		
		MOV		R2, R1
		MOV		R1, #0
		
INNER
		ADD		R1, R1, R2
		SUB		R0, R0, #1
		CMP		R0, #0
		BNE		INNER
		
		LDR		R2, [R13]
		LDR		R0, [R13, #4]
		ADD		R13, R13, #8
		
		MOV		R15, R14
