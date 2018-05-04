# ############################################################### #
# Vaibhav Patel                                                   #
# program3.ASM                                                    #
# sid last three digit: 100                                       #
# Determine the domain class. It find match domain in any routing #
# table for class A, B, C only.		                          #
# I did not use any resource other than class notes(powerpoint).  #
# ############################################################### #   

.data

IP_ROUTING_TABLE_SIZE:

	.word 10

IP_ROUTING_TABLE:

	.word 0, 146, 163, 255, 255 # 146.163.255.255
	.word 1, 147, 163, 255, 255 # 147.163.255.255
	.word 2, 201, 88, 88, 90 # 201.88.88.90
	.word 3, 182, 151, 44, 56 # 182.151.44.56
	.word 4, 24, 125, 100, 100 # 24.125.100.100
	.word 5, 146, 163, 140, 80 # 146.163.170.80
	.word 6, 146, 163, 147, 80 # 146.163.147.80
	.word 7, 146, 164, 147, 80 # 146.164.147.80
	.word 8, 148, 146, 170, 80 # 148.146.170.80
	.word 9, 193, 77, 77, 10 # 193.77.77.10

Num1:   .word 0

Num2:	.word 0

Num3:	.word 0

Num4:	.word 0

MSG_01: .asciiz "\nenter an IP address \n"

MSG_02: .asciiz "first :  "

MSG_03: .asciiz "second :  "

MSG_04: .asciiz "third :  "

MSG_05: .asciiz "fourth :  "

line:	.asciiz "\n"

MSG_06:	.asciiz "the ip address you entered: "

error:	.asciiz "the number you entered is not in range."

dot:	.asciiz "."

aa:	.asciiz "\nclass A address."

bb:	.asciiz "\nclass B address."

cc:	.asciiz "\nclass C address."

dd:	.asciiz "\nclass D address."

ee:	.asciiz "\nclass E address."

match:	.asciiz "\nMatching domain found at: "

NoMat:	.asciiz "\n No Matching domain found."

end:	.asciiz "\nProgram end Successfully......\n"

        .text         
        .globl main

main:
	lw	$t1, IP_ROUTING_TABLE_SIZE
	li	$t0, 0 

prompt1:la      $a0, MSG_01      
        li      $v0, 4        
        syscall

	la      $a0, MSG_02    
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	bgt	$v0,255,error1
	blt 	$v0,1,error1

	sw	$v0, Num1
        j prompt2



error1:	la      $a0, error    
        li      $v0, 4         
	syscall

	j prompt1

prompt2:
	la      $a0, line  
        li      $v0, 4        
        syscall
	
	la      $a0, MSG_03    
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	bgt	$v0,255,error2
	blt 	$v0,0,error2

	sw	$v0, Num2
        j prompt3	

error2:	la      $a0, error   
        li      $v0, 4         
	syscall

	j prompt2

prompt3:
	la      $a0, line  
        li      $v0, 4        
        syscall
	
	la      $a0, MSG_04    
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	bgt	$v0,255,error3
	blt 	$v0,0,error3

	sw	$v0, Num3
        j prompt4	

error3:	la      $a0, error   
        li      $v0, 4         
	syscall

	j prompt3

prompt4:
	la      $a0, line  
        li      $v0, 4        
        syscall
	
	la      $a0, MSG_05  
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	bgt	$v0,255,error4
	blt 	$v0,0,error4

	sw	$v0, Num4
        j print	

error4:	la      $a0, error   
        li      $v0, 4         
	syscall

	j prompt4

print:
	la      $a0, line  
        li      $v0, 4        
        syscall
	
	la      $a0, MSG_06 
        li      $v0, 4        
        syscall
	
	lw     $a0, Num1
        li      $v0, 1        
        syscall

	la      $a0, dot
        li      $v0, 4        
        syscall

	lw      $a0, Num2
        li      $v0, 1        
        syscall

	la      $a0, dot
        li      $v0, 4        
        syscall

	lw      $a0, Num3
        li      $v0, 1        
        syscall

	la      $a0, dot
        li      $v0, 4        
        syscall

	lw      $a0, Num4
        li      $v0, 1        
        syscall

	la      $a0, line
        li      $v0, 4     
        syscall

	lw	$t5, Num1

	bge	$t5, 240, classE
	bge	$t5, 224, classD
	bge	$t5, 192, classC
	bge	$t5, 128, classB
	bge	$t5,   1, classA

classE:
	la      $a0, ee
        li      $v0, 4        
        syscall

	j Exit

classD:
	la      $a0, dd
        li      $v0, 4        
        syscall
	j Exit

classC:
	la      $a0, cc
        li      $v0, 4        
        syscall

	la	$a1, IP_ROUTING_TABLE

loopC:	beq	$t0, $t1, Exit

	lw	$s0, 4($a1)
	lw	$s1, 8($a1)
	lw	$s2, 12($a1)

	lw	$t2, Num1
	lw	$t3, Num2
	lw	$t4, Num3

	beq	$s0, $t2, check3
next1:	addu	$a1, $a1, 20

	addu	$t0, $t0, 1

	j loopC

classB:
	la      $a0, bb
        li      $v0, 4        
        syscall

	la	$a1, IP_ROUTING_TABLE

loopB:	beq	$t0, $t1, Exit

	lw	$s0, 4($a1)
	lw	$s1, 8($a1)

	lw	$t2, Num1
	lw	$t3, Num2

	beq	$s0, $t2, check2
next:	addu	$a1, $a1, 20

	addu	$t0, $t0, 1

	j loopB

classA:
	la      $a0, aa
        li      $v0, 4        
        syscall

	la	$a1, IP_ROUTING_TABLE

loopA:	beq	$t0, $t1, Exit


	lw	$s0, 4($a1)
	lw	$t2, Num1

	beq	$s0, $t2, exit1
	addu	$a1, $a1, 20

	addu	$t0, $t0, 1

	j loopA

Exit:
	la      $a0, NoMat
        li      $v0, 4     
        syscall

	la      $a0, end
        li      $v0, 4     
        syscall

	jr $31
	
exit1:
	lw	$s7, 0($a1)

	la      $a0, match
        li      $v0, 4     
        syscall

	la      $a0, ($s7)
        li      $v0, 1    
        syscall

	la      $a0, end
        li      $v0, 4     
        syscall

	jr $31

check2: 
	beq	$s1, $t3, exit1
	j next


check3: 
	beq	$s1, $t3, check4
	j next1

check4: 
	beq	$s2, $t4, exit1
	j next1
