		LDR		R0, =MY_DATA
		MOV		R1, #68
		STR		R1, [R0] ; derefencing
		
		LDR		R0, =MY_S_DA
		STR		R1, [R0]
		STR		R1, [R0, #4]
		
DAT
MY_DATA	DCD		42
MY_S_DA	FILL		8
