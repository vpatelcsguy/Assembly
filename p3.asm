# ############################################################### #
# Vaibhav Patel                                                   #
# Program3.ASM                                                    #
# sid last three digit: 100                                       #
# This program is about chinese zodiac.                           #
#                                                                 #
# ############################################################### #   

.data

year:  .word 0

age:   .word 0

MSG_01: .asciiz "Enter this year (2016 - 2116): "

MSG_02: .asciiz "The year you entered is before 2016.\n"

MSG_03: .asciiz "The year you entered is after 2116.\n"

MSG_04: .asciiz "Enter your age (0 - 110): "

MSG_05: .asciiz "You are too young to use this program.\n"

MSG_06: .asciiz "You are too old to use this program.\n"

MSG_07:	.asciiz "The year you were born is: "

NEW_LINE: .asciiz "\n"

MSG_RAT1: .asciiz "You were born in a rat year in Chinese Zodiac ... \n"
MSG_RAT2: .asciiz "The Rat is intelligent, hardworking and competitive. By wanting to achieve his (or her) goals as fast as possible, he (or she) will always use his (her) wily ways.\n"

MSG_OX1: .asciiz "You were born in an ox year in Chinese Zodiac ... \n"
MSG_OX2: .asciiz "Patient, hardworking and a great heart are the qualities most associated with the Ox. Under that cool and calm exterior belies a hot temper though so people should be wary not to provoke the Ox.\n"

MSG_TIGER1: .asciiz "You were born in a tiger year in Chinese Zodiac ... \n"
MSG_TIGER2: .asciiz "Tiger is the animal that represents authority. They are proud and will exert their leadership as they are born leaders. Forceful and aggressive, they are usually in the lead and it is difficult to deny them their rights.\n"

MSG_HARE1: .asciiz "You were born in a hare year in Chinese Zodiac ... \n"
MSG_HARE2: .asciiz "This graceful, well-mannered gentle character is among the most likeable in the zodiac. Always one to maintain peace and harmony, the Hare is a tremendous asset to any group  whether social or at work.\n"

MSG_DRAGON1: .asciiz "You were born in a dragon year in Chinese Zodiac ... \n"
MSG_DRAGON2: .asciiz "Many Chinese believe that life will be more exciting when a Dragon is born into their family. If there are three Dragons within the family, they believe that they are blessed with incredible luck and prosperity.\n"

MSG_SNAKE1: .asciiz "You were born in a snake year in Chinese Zodiac ... \n"
MSG_SNAKE2: .asciiz "The most astute and intelligent of all the animals, the Snake has the added blessing of having profound wisdom. Many very prominent spiritual leaders and teachers are Snakes.\n"

MSG_HORSE1: .asciiz "You were born in a horse year in Chinese Zodiac ... \n"
MSG_HORSE2: .asciiz "The Horse is among the most likeable animals in the zodiac, with a great flair for socializing and an inherently happy, outgoing attitude that uplifts those around him (or her).\n"

MSG_RAM1: .asciiz "You were born in a ram year in Chinese Zodiac ... \n"
MSG_RAM2: .asciiz "The Ram is the most feminine of all the signs associated with affection, care, trust and selflessness. Sheep are gentle mannered and sincere. They also have a compassionate nature, are sentimental, sensitive, understanding of others faults and quick to forgive.\n"

MSG_MONKEY1: .asciiz "You were born in a monkey year in Chinese Zodiac ... \n"
MSG_MONKEY2: .asciiz "The mischievous Monkey is a delight to be around but be wary of that wiliness behind the friendly and cheerful faade.\n"

MSG_ROOSTER1: .asciiz "You were born in a rooster year in Chinese Zodiac ... \n"
MSG_ROOSTER2: .asciiz "Roosters  you love em or you hate em. One of the most colourful characters of the Chinese zodiac, Roosters will always want to be the life of the party and whether you like it or not, they will find their way to the heart of every occasion.\n"

MSG_DOG1: .asciiz "You were born in a dog year in Chinese Zodiac ... \n"
MSG_DOG2: .asciiz "The Dog is the most likeable of the signs being very amiable and extremely accommodating to others needs. He finds it easy and natural to be giving and helpful altruism is an inherent part of who he is and all that he does.\n"

MSG_PIG1: .asciiz "You were born in a pig year in Chinese Zodiac ... \n"
MSG_PIG2: .asciiz "The Pig is the darling of the zodiac. He is much loved for his honest, kind and forgiving nature. Not one for confrontation, the Pig believes in harmony and maintaining the peace.\n"

MSG_AREAN1: .asciiz "The year you were born does not belong to any of the 12 animals in Chinese Zodiac ... \n"
MSG_AREAN2: .asciiz "You must be an alien from the outer space.  Enjoy this planet!\n"

.text
.globl main

main:

proj3:  la      $a0, MSG_01      
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	blt 	$v0,2016,error2
	bgt	$v0,2116,error1

	sw	$v0, year
	j born

error1:	la      $a0, MSG_03     
        li      $v0, 4         
	syscall
	j proj3


error2:	la      $a0, MSG_02
        li      $v0, 4
	syscall
	j proj3


born:   la      $a0, MSG_04      
        li      $v0, 4        
        syscall
		
        li      $v0, 5        
	syscall

	bgt	$v0,110,error3
	blt 	$v0,0,error4

	sw	$v0, age
	j load

error3:	la      $a0, MSG_06     
        li      $v0, 4         
	syscall
	j born


error4:	la      $a0, MSG_05
        li      $v0, 4
	syscall
	j born

load:	lw	$t0, year
	lw	$t1, age
	sub	$t2, $t0, $t1

	la      $a0, MSG_07
        li      $v0, 4
        syscall

	la      $a0, ($t2)
        li      $v0, 1
        syscall


	la      $a0, NEW_LINE
        li      $v0, 4
        syscall
	
	li	$t3, 1900
	li	$t5, 12
	sub	$t4, $t2, $t3


	bgt	$t4, 12, loop
	j msg
loop:	sub	$t4, $t4, $t5
	bgt	$t4, 12, loop
	j msg
	


msg:	beq	$t4, 0, msg0
	beq	$t4, 1, msg1
	beq	$t4, 2, msg2
	beq	$t4, 3, msg3
	beq	$t4, 4, msg4
	beq	$t4, 5, msg5
	beq	$t4, 6, msg6
	beq	$t4, 7, msg7
	beq	$t4, 8, msg8
	beq	$t4, 9, msg9	
	beq	$t4, 10, msg10
	beq	$t4, 11, msg11

msg0:   la      $a0, MSG_RAT1
        li      $v0, 4
        syscall
	la      $a0, MSG_RAT2
        li      $v0, 4
        syscall
	j Exit
msg1:   la      $a0, MSG_OX1
        li      $v0, 4
        syscall
	la      $a0, MSG_OX2
        li      $v0, 4
        syscall
	j Exit
msg2:   la      $a0, MSG_TIGER1
        li      $v0, 4
        syscall
	la      $a0, MSG_TIGER2
        li      $v0, 4
        syscall
	j Exit
msg3:   la      $a0, MSG_HARE1
        li      $v0, 4
        syscall
	la      $a0, MSG_HARE2
        li      $v0, 4
        syscall
	j Exit
msg4:   la      $a0, MSG_DRAGON1
        li      $v0, 4
        syscall
	la      $a0, MSG_DRAGON2
        li      $v0, 4
        syscall
	j Exit
msg5:   la      $a0, MSG_SNAKE1
        li      $v0, 4
        syscall
	la      $a0, MSG_SNAKE2
        li      $v0, 4
        syscall
	j Exit
msg6:   la      $a0, MSG_HORSE1
        li      $v0, 4
        syscall
	la      $a0, MSG_HORSE2
        li      $v0, 4
        syscall
	j Exit
msg7:   la      $a0, MSG_RAM1
        li      $v0, 4
        syscall
	la      $a0, MSG_RAM2
        li      $v0, 4
        syscall
	j Exit
msg8:   la      $a0, MSG_MONKEY1
        li      $v0, 4
        syscall
	la      $a0, MSG_MONKEY2
        li      $v0, 4
        syscall
	j Exit
msg9:   la      $a0, MSG_ROOSTER1
        li      $v0, 4
        syscall
	la      $a0, MSG_ROOSTER2
        li      $v0, 4
        syscall
	j Exit
msg10:  la      $a0, MSG_DOG1
        li      $v0, 4
        syscall
	la      $a0, MSG_DOG2
        li      $v0, 4
        syscall
	j Exit
msg11:  la      $a0, MSG_PIG1
        li      $v0, 4
        syscall
	la      $a0, MSG_PIG2
        li      $v0, 4
        syscall
	j Exit
Exit:   jr $31