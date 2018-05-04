# ############################################################### #
# Vaibhav Patel                                                   #
# Program1.ASM                                                    #
# sid last three digit: 100                                       #
# This program computes letter grade for a course.                #
#                                                                 #
# ############################################################### #   

.data

Num1:   .word 0

Num2:   .word 0

MSG_01: .asciiz "Enter your current driving speed in MPH (1 to 200): "

MSG_02: .asciiz "The number you entered is not a valid number. Enter valid number. \n"

MSG_03: .asciiz "Enter current speed limit. (15 - 70): "

MSG_04: .asciiz "You are safe. \n"

MSG_05: .asciiz "fine $120. \n"

MSG_06: .asciiz "fine $140. \n"

MSG_07: .asciiz "fine $1500. \n"

MSG_08: .asciiz "fine $2500. \n"


        .text         
        .globl main

main:

score:  la      $a0, MSG_01      
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	bgt	$v0,200,error1
	blt 	$v0,0,error1

	sw	$v0, Num1
        j curve

error1:	la      $a0, MSG_02     
        li      $v0, 4         
	syscall

	j score


curve:  la      $a0, MSG_03 
        li      $v0, 4 
        syscall

        li      $v0, 5        
	syscall

	bgt	$v0,8,error2
	blt 	$v0,2,error2

	sw	$v0, Num2
	j load

error2:	la      $a0, MSG_02
        li      $v0, 4
	syscall
	j curve		

load:	lw	$t0,Num1
	lw	$t1,Num2

        add     $t3,$t1,$t0
	
	bge     $t3,92, Grade_A
	bge	$t3,82, Grade_B
	bge	$t3,72, Grade_C
	bge	$t3,62, Grade_D
	ble	$t3,61, Grade_F

Grade_A:la      $a0, MSG_04
        	li      $v0, 4
        	syscall
		j Exit

Grade_B:la      $a0, MSG_05
        	li      $v0, 4
        	syscall
		j Exit

Grade_C:la      $a0, MSG_06
        	li      $v0, 4
        	syscall
		j Exit

Grade_D:la      $a0, MSG_07
        	li      $v0, 4
        	syscall
		j Exit

Grade_F:la      $a0, MSG_08
        	li      $v0, 4
        	syscall
		j Exit

Exit:
        	jr $31