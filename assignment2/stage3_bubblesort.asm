; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
	; implement your function here
	; remember to push any registers you use to the stack before you use them
	; ( and pop them off at the very end)

	push{r3-r10}
	mov r3,#32	     ; n


	mov r6,#0 ; r6 = i


      loop_out:
	mov r5,#0 ; r5 = j
	sub r7,r3,#4  ; r7 = n-1
	cmp r6,r7      ; i< n -1
	blt loop_in
	bge ending_st3

       loop_in:

	sub r4,r7,r6 ; r4 = n-1-i
	cmp r5,r4
	blt check_swap_st3
	add r6,#4 ; i ++
	b loop_out
	check_swap_st3:
	ldr r8,[r1,r5] ; r8 = arr[j]
	add r10,r5,#4	  ; r10= j+1
	ldr r9,[r1,r10] ; r9 = arr[j+1]
	cmp r8,r9
	bgt swap_st3
	add r5,#4     ; j++
	b loop_in

	swap_st3:
	str r8,[r1,r10]
	str r9,[r1,r5]
	add r5,#4     ; j++
	b loop_in

	ending_st3:
	mov r2,r1
	mov r1,#8
	mov r0,BASE

	push{lr}
	bl stage2_flash_array
	pop{lr}













	pop {r3-r10}

	 bx lr

	; your function must mov the address of the sorted array to r0	   ???????????????



