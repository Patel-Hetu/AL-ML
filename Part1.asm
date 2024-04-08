! Lab 04 Part A - myFact subroutine with stack and result being stored in memory location 4048
! Hetu Patel
! 501215707

		.begin
		.org 3000
result		.equ 4048				! result is where the caller program will store the final result from %r3

		addcc %r0, 128, %r14			! stack is being initialized at location 128+ %r0 which is 128

		ld [input],%r1			! loading the input in r1
		addcc %r1,-2,%r2			! Initializes r2 to be the number of times the multiplication will go on for 'input-2' times
		addcc %r1,-1,%r4			! Initializes r4 this is the main loop that will run for 'input - 1' times in order to give us 'input * (input-1)! ' 

		addcc %r14,-4,%r14			! reserving memory by going backwards since it is a stack in order to store r1
		st %r1, %r14				! storing r1

		addcc %r14,-4,%r14			! reserving memory by going backwards since it is a stack in order to store r2
		st %r2, %r14				! storing r2

		addcc %r14,-4,%r14			! reserving memory by going backwards since it is a stack in order to store r4
		st %r4,%r14				! storing r4

		add %r0, %r0, %r3			! Initializes r3 to be 0, this will later store the sum

		call myFact				! subroutine 'myFact' is being called

		st %r3,[result]			! the subroutine will then make changes to %r3 and in this line it will be stored in result
	
		halt


myFact:	andcc %r4,%r4,%r0			! Check if r4 is 0, if it is then we go to the next part of the factorial,eg if input is 6 then this is where we go to 5x4
		be next				! next is where r4 is changed to count down again from r4 -1 (i.e. to give us the next bit of the factorial)
		add %r1,%r3,%r3			! r3 is where the result is stored from r1, first it is 6+6+... and then 30+30+.. and so on until it is 360+360
		addcc %r4,-1,%r4
		ba myFact

next:		add %r2,-1,%r4
		add %r2,-1,%r2
		add %r3,%r0,%r1
		andcc %r2,%r2,%r0
		be end
		ba myFact
end:	
	
		jmpl %r15 + 4, %r0

input: 9


	.end

