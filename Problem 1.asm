! Program 1
! Hint: op3 for subcc is 010100
.begin
.org 2048
dstart .equ 4000
ld [a], %r1
ld [b], %r2
ld [c], %r3
addcc %r2, %r3, %r0
addcc %r1, %r0, %r4
subcc %r2, %r4, %r2
st %r0, [a]
st %r2, [y]
jmpl %r15 + 4, %r0
.org dstart
a: 15
b: 54
c: -29
y: 0
.end
