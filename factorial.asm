			MOV		R0, #5 ; factorial
			MOV		R1, #1 ; result
			CMP		R0, #0
			BNE		FACTORIAL_LOOP
			END
			
FACTORIAL_LOOP
			MOV		R2, R1
			MOV		R3, R0
			MOV		R1, #0
			
MULTIPLY
			ADD		R1, R1, R2
			SUB		R3, R3, #1
			CMP		R3, #0
			BGT		MULTIPLY
			
			SUB		R0, R0, #1
			CMP		R0, #1
			BGT		FACTORIAL_LOOP
			
			END
