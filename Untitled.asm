! Read a character from keyboard
		.begin
BASE 		.equ 0x3fffc0
COUT 		.equ 0x0
COSTAT 	.equ 0x4
CIN 		.equ 0x8
CICTL 		.equ 0xc

		.org 2048
		add %r0, %r0, %r4 !Clear r4
		sethi BASE, %r4
InWait: 	halt
		ldub [%r4 + CICTL], %r1
		andcc %r1, 0x80, %r1
		be InWait
		ld [%r4 + CIN], %r3
		subcc %r3, 27, %r5 ! 27 is Escape
		be End ! stop if it is.
Wait: 		ldub [%r4 + COSTAT], %r1
		andcc %r1, 0x80, %r1
		be Wait
		st %r3, [%r4 + COUT]
		ba InWait
End: 		halt
		.end
