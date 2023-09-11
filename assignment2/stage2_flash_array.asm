; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
	; implement your function here
	; remember to push any registers you use to the stack before you use them
	; ( and pop them off at the very end)



	push{r3-r9}
	mov r5,#0    ; r5 = index array
	mov r4,r1    ;	r4 = size array
	mov r6,r2    ;r6 = array
       loopstage2:

	ldr r9, [r6,r5]    ; r9 = arr[index]
	mov r2,$80000  ; pass flash timer delay
	mov r1, r9  ; pass number to flash
	push{lr}
	bl FLASH
	pop{lr}
	mov r1,$200000	; 2 seconds delay
	push{lr}
	bl PAUSE  ; Pause for 2 seconds
	pop{lr}

	add r5,#4
	sub r4,#1
	cmp r4,#0    ; cmp to out loop
	bne loopstage2




	; your function should make use of the existing functions PLASH and PAUSE
	pop{r3-r9}
	bx lr



