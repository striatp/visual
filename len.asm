		LDR		R0, =ARR
		BL		GET_LEN
		END
		
GET_LEN
		STMFD	R13!, {R2, R3, R14}
		
		MOV		R1, #0 ; len counter
		MOV		R3, R0 ; walk pointer
		
LOOP
		LDR		R2, [R3]
		CMP		R2, #0
		BEQ		DONE
		
		ADD		R1, R1, #1
		ADD		R3, R3, #4
		B		LOOP
		
DONE
		LDMFD	R13!, {R2, R3, PC}
		
DAT
ARR		DCD		10, 20, 30, 40, 50, 0
