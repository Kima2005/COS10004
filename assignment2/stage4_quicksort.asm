; function stage4_quicksort
; sorts given array using the sorting algorithm quicksort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage4_quicksort:
	; implement your function here
	; remember to push any registers you use to the stack before you use them
	; ( and pop them off at the very end)
	push{r3-r10}

	; your function must mov the address of the sorted array to r0
	mov r0,r1 ; r0 = array
	mov r3,#0 ; r3 = first
	mov r4,#28 ; r4 = last
	mov r2,#2 ; r2 = index to out loop
quick_sort:
	   ; r0 = array
	   ; r3 = 0 = first
	   ; r4 = 28 = last
      cmp r3,r4
      blt partition
      cmp r2,#1    ; move to quick sort right if index = 1
      beq quick_sort_right
      b final_end
      continue3:

      partition:
	assign:
	ldr r9,[r0,r4] ; r9 = arr[pivot]
	mov r6,r3 ; r6 = i = first
	sub r7,r4,#4 ; r7 = j = last-1

	loop_stage4: ; loop_stage4

	task_1:
	ldr r8,[r0,r6] ; r8 = arr[i]

	check_plus_i:
	cmp r8,r9	    ; arr[i] <= arr[pivot]
	blt check_plus_i_2
	b task_2
	check_plus_i_2:
	cmp r6,r7	    ; i <= j
	ble plus_i
	b task_2
	plus_i:
	add r6,#4 ; i++
	b task_1

	task_2:
	ldr r10,[r0,r7] ; r10 = arr[j]
	check_minus_j_1:
	cmp r10,r9  ; arr[j] > arr[pivot]
	bgt check_minus_j_2
	b check_end_loop_stage4
	check_minus_j_2:

	cmp r6,r7	    ; i < j
	ble minus_j
	b check_end_loop_stage4
	minus_j:
	sub r7,#4
	b task_2

	check_end_loop_stage4:
	cmp r6,r7  ; i >= j
	bge end_loop_stage4

	end_task:	     ;swap arr[i] arr[j]
	str r10,[r0,r6]
	str r8,[r0,r7]
	add r6,#4
	sub r7,#4

	b loop_stage4

	end_loop_stage4:
	str r8,[r0,r4]	     ;swap arr[pivot] arr[i]
	str r9,[r0,r6]

	cmp r2,#2
	bne continue
	push{r6}; return i
	sub r2,#1
	continue:

	quick_sort_left:

	mov r3,#0
	sub r4,r6,#4
	b quick_sort

	quick_sort_right:

	cmp r2,#1
	bne continue2
	pop{r6}
	sub r2,#1
	continue2:
	add r3,r6,#4
	mov r4,#28
	b quick_sort


 final_end:
	mov r2,r0
	mov r1,#8
	BASE = $3F000000
	mov r0,BASE

	push{lr}
	bl stage2_flash_array
	pop{lr}

	pop{r3-r10}
	 bx lr