! Program 3
.begin
.org 2048
main: ld [x], %r2
top: subcc %r1, 4, %r0
be done
srl %r2, 1, %r2
addcc %r1, 1, %r1
ba top
done: st %r3, [y]
jmpl %r15+4, %r0
.org 3000
x: 800
y: 0
.end

