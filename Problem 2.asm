! Program 2
.begin
.org 2048
m_start: ld [x], %r1
ld [y], %r2
subcc %r1, %r2, %r0
bneg else
andcc %r1, %r2, %r3
ba done
else: orcc %r1, %r2, %r3
done: st %r3, [a]
jmpl %r15+4, %r0
x: 30
y: 48
a: 0
.end
