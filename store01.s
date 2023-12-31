/* -- store01.s */

/* -- Data section */
.data

/* Ensure variable is 4-byte aligned */
.align 4
/* Define storage for myvar1 */
myvar1:
	@ Contents of myvar1 is just '0'
	.word 0

/* Ensure variable is 4-byte aligned */
.align 4
/* Define storage for myvar2 */
myvar2:
	@ Contents of myvar2 is just '0'
	.word 4

/* -- Code section */
.text

/* Ensure code is 4 byte aligned */
.balign 4
.global main
main:
	ldr r1, addr_of_myvar1	@ r1 <- &myvar1
	mov r3, #3		@ r3 <- 3
	str r3, [r1]		@ *r1 <- r3
	ldr r2, addr_of_myvar2	@ r2 <- &myvar2
	mov r3, #4		@ r3 <- 4
	str r3, [r2]		@ *r2 <- r3

/* Same as instructions above */
	ldr r1, addr_of_myvar1	@ r1 <- &myvar1
	ldr r1, [r1]		@ r1 <- *r1
	ldr r2, addr_of_myvar2	@ r2 <- &myvar2
	ldr r2, [r2]		@ r2 <- *r2
	add r0, r1, r2		@ r0 <- r1 + r2
	bx	lr

/* Labels needed to access data */
addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2
