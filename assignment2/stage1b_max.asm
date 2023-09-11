; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
	; implement your function here
	; remember to push any registers you use to the stack before you use them
	; ( and pop them off at the very end)
	 push{r3-r4}
	 mov r3,r0

	 cmp r3,r1
	 bge comparemax1
	 blt comparemax2

	 comparemax1:
	 cmp r3,r2
	 ble finishmax3
	 bgt finishmax1

	 finishmax1:
	 mov r4,r3
	 b endingmax

	 comparemax2:
	 cmp r1,r2
	 bge finishmax2
	 bls finishmax3

	 finishmax2:
	 mov r4,r1
	 b endingmax

	 finishmax3:
	 mov r4,r2
	 b endingmax

	 endingmax:
	 mov r0,r4

	 ; this is a place holder - replace "1" with the register holding the return value
	 pop{r3-r4}

	 bx lr