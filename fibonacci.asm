		MOV		R0, #1000 ; base memory address
		MOV		R1, #0 ; first fibo number
		MOV		R2, #1 ; second fibo number
		MOV		R3, #0 ; loop counter
		
		STR		R1, [R0]
		ADD		R0, R0, #4
		STR		R2, [R0]
		ADD		R0, R0, #4
		
FIBONACCI
		
		LDR		R4, [R0, #-8]
		LDR		R5, [R0, #-4]
		ADD		R1, R4, R5
		STR		R1, [R0]
		ADD		R0, R0, #4
		ADD		R3, R3, #1
		CMP		R3, #5
		BNE		FIBONACCI
		END
