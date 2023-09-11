; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
	; implement your function here
	; remember to push any registers you use to the stack before you use them
	; ( and pop them off at the very end)
	 push{r3-r4}
	 mov r3,r0	 ; r3=r0= first value
	 cmp r3,r1
	 ble comparemin1
	 bgt comparemin2

	 comparemin1:
	 cmp r3,r2
	 ble finishmin1
	 bgt finishmin2

	 comparemin2:
	 cmp r1,r2
	 ble finishmin3
	 bgt finishmin2



	 finishmin1:
	 mov r4,r3
	 b endingmin

	 finishmin2:
	 mov r4,r2
	 b endingmin

	 finishmin3:
	 mov r4,r1
	 b endingmin

	 endingmin:
	 mov r0,r4

	 pop{r3-r4}


	 ; this is a place holder - replace "1" with the register holding the return value

	 bx lr