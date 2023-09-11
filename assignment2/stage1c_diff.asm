; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
	; implement your function here
	; remember to push any registers you use to the stack before you use them
	; ( and pop them off at the very end)
	 push{r3-r9}
	 mov r3,r0
	 push{lr}
	 bl stage1a_min
	 pop{lr}
	 mov r4,r0 ; r4 = min


	 mov r0,r5
	 mov r1,r6
	 mov r2,r7
	 push{lr}
	 bl stage1b_max
	 pop{lr}
	 mov r5,r0 ; r5 = max
	 sub r0,r5,r4  ; r0 = max - min

	 pop{r3-r9}

	 ; this is a place holder - replace "1" with the register holding the return value
	 bx lr



