		MOV		R0, #29
		MOV		R1, #7
		BL		DIV
		END
		
DIV
		;		R1 -> result
		;		R2 -> remaining
		CMP		R1, #0
		BEQ		SKIP
		
		SUB		R13, R13, #4
		STR		R0, [R13]
		MOV		R2, #0
		
INNER
		SUB		R0, R0, R1
		ADD		R2, R2, #1
		CMP		R0, R1
		BLT		RET
		B		INNER
		
RET
		MOV		R1, R2
		MOV		R2, R0
		LDR		R0, [R13]
		ADD		R13, R13, #4
		
SKIP
		MOV		R15, R14
