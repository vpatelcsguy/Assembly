# ############################################################### #
# Vaibhav Patel                                                   #
# Program2.ASM                                                    #
# sid last three digit: 100                                       #
# This program computes fibbacci sequence.                        #
#                                                                 #
# ############################################################### #   

.data

Num1:   .word 0

MSG_01: .asciiz "How many Fobonacci numbers you would like to calculate (3-30): "

MSG_02: .asciiz "The entered number is less than 3. \n"

MSG_03: .asciiz "The entered number is lager than 30. \n"

MSG_04: .asciiz " \n"

MSG_05: .asciiz "This program completes. \n"

colon:  .asciiz  ":  "  

        .text         
        .globl main

main:

num:    la      $a0, MSG_01      
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	bgt	$v0,30,error2
	blt 	$v0,3,error1

	sw	$v0, Num1
        j load

error1:	la      $a0, MSG_02     
        li      $v0, 4         
	syscall

	j num	
error2:	la      $a0, MSG_03     
        li      $v0, 4         
	syscall

	j num

load:	li	$t1, 1
	li	$t2, 1
	li	$t3, 0
	li	$t4, 0
	li	$t5, 4
	li	$t6, 0
	li	$t7, 3

	add	$t3, $t2, $t1

	la	$a0, ($t1)
	li      $v0, 1        
        syscall
	
	la   $a0, colon     
        li   $v0, 4           
        syscall

	la	$a0, ($t1)
	li      $v0, 1        
        syscall

        la   $a0, MSG_04     
        li   $v0, 4           
        syscall
	
	la	$a0, ($t3)
	li      $v0, 1        
        syscall

	la   $a0, colon     
        li   $v0, 4           
        syscall


	la	$a0, ($t2)
	li      $v0, 1        
        syscall

        la   $a0, MSG_04     
        li   $v0, 4           
        syscall

	la	$a0, ($t7)
	li      $v0, 1        
        syscall

	la   $a0, colon     
        li   $v0, 4           
        syscall

	la	$a0, ($t3)
	li      $v0, 1        
        syscall

        la   $a0, MSG_04     
        li   $v0, 4           
        syscall

	lw	$t0,	Num1
	beq	$t0, 3, Exit


loop:	add	$t6, $t2, $t3

	la	$a0, ($t5)
	li      $v0, 1        
        syscall

	la   $a0, colon     
        li   $v0, 4           
        syscall
	
	la	$a0, ($t6)
	li      $v0, 1        
        syscall

	la   $a0, MSG_04     
        li   $v0, 4           
        syscall

	la	$t2, ($t3)
	la	$t3, ($t6)
	add	$t5, $t5, $t1
	ble	$t5, $t0, loop

	
Exit:	la   $a0, MSG_05     
        li   $v0, 4           
        syscall

	jr $31
	
