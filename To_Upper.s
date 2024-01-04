	.file	"To_Upper.s"
	.text
	.globl	To_Upper
	.type	To_Upper, @function

/* **********************
    Name: Ethan Geoffrey Wijaya
    Wisc ID Number: 9082652331
    Wisc Email: egwijaya@wisc.edu
************************ */


To_Upper:

# C version
/* **********************
    Write the equivalent C code to this function here (in the comment block)
	void To_Upper(char* str) {
		while (*str != '\0') {
			if (*str > 96 && *str < 123) {
				*str -= 32;
			}
			str++;
		}
		return;	
	}
************************ */


# Memory Layout
/* ************************ 
    Make a table showing the stack frame for your function (in the comment block)
    The first column should have a memory address (e.g. 8(%rsp))
    The second column should be the name of the C variable used above
    Update the example below with your variables and memory addresses
        
************************ */


# Prologue
ALLOCATE_STACK:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp

INITIALIZE_VARIABLES:
	movq %rdi, -16(%rbp)	# char* c = str (str is the current position on the string)
	movq -16(%rbp), %rax	# Store c in register

# This code prints the letter 'a' (ascii value 97)
# Use this for debugging
# Comment out when finished - your function should not print anything
# Note putchar overwrites all caller saved registers including argument registers
/*
	movl	$97, %eax
	movl	%eax, %edi
	call	putchar@PLT
*/
# Body of function

LOOP_START:			# While loop to traverse through the string
	movb (%rax), %cl	# Store *c in register cl
	cmpb $0, %cl		# Checks if current character is the null terminator '/0'
	je END			# If *c == '\0' end the while loop

IF_STATEMENT:			# Checks if character is a lowercase letter. if (*c > 96 && *c < 123)
	cmpb $97, %cl		# If *c isn't greater than 96, skip the true block
	jl INCREMENT
	cmpb $122, %cl		# If *c isn't lesser than 123, skip the true block
	jg INCREMENT

TRUE_BLOCK:			# Only runs for lowercase letters
	subb $32, %cl		# *c -= 32;
	movb %cl, (%rax)

INCREMENT:			
	addq $1, %rax		# c++;
	movq %rax, -16(%rbp)	# Change value of c in memory once altered as per style guide
	jmp LOOP_START		# Back to loop condition

# Epilogue
END:
	addq $32, %rsp
	popq %rbp
    ret
