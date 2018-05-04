# ############################################################### #
# Vaibhav Patel                                                   #
# Project2.ASM                                                    #
# sid last three digit: 100                                       #
# This program computes fibonacci numbers backwards               #
#  recursively.                                                   #
#                                                                 #
# ############################################################### #  

.data

MSG_01: .asciiz "\nEnter a valid Fibonacci number: "

MSG_02: .asciiz "\nEnter the number of Fibonacci numbers to be displayed: "

MSG_03: .asciiz " is not a valid Fibonacci number. \n"

MSG_04: .asciiz " \n"

MSG_05: .asciiz "\nNo more Fibonacci numbers. \n"

MSG_06: .asciiz "\n This number is not allowed. \n "

  

        .text         
        .globl main

main:	la      $a0, MSG_01      		#asking user to enter fib#.
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall
	
	move	$t0, $v0			#user's fib# storing in $t0

	la      $a0, MSG_02     		#asking user for how many fib# to display
        li      $v0, 4         
	syscall

	li      $v0, 5        
	syscall

	move	$t1, $v0			#store how many fib# to display

	li 	$t2, 1
	li 	$t3, 1
	li 	$t4, 0
	jal	fib


exit:	li      $v0, 10				#exit recrsive program
	syscall

fib:	addi	$sp, $sp, 4			#creating space on a stack pointer
	sw	$ra, 0($sp)			#storing $ra on stack

	add 	$t4, $t2, $t3			#f(n) = f(n-1)+f(n-2)
	la  	$t2, ($t3)			#update $t2
	la  	$t3, ($t4)			#update $t3

	
	blt 	$t4, $t0, fib	 		#if(f(n) == user's fib #) go to prompt2
	bgt	$t4, $t0, notvalid		#if(f(n) > user's fib #) fib# is notvalid
	
	lw	$ra, 0($sp)
	sub	$t1, $t1, 1

	
	la	$a0, ($t4)			#printing result
	li 	$v0, 1
	syscall

	la      $a0, MSG_04     
        li      $v0, 4         
	syscall
	
	beq	$t1, 0, exit

	jr	$ra



notvalid:					#printing not valid message and going back to main
	la      $a0, MSG_04     
        li      $v0, 4        
        syscall

	la      $a0, ($t0)     
        li      $v0, 1       
        syscall

	la      $a0, MSG_03      
        li      $v0, 4        
        syscall

	j main