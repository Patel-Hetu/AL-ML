.begin
ld [a], %r1
add %r14,-4, %r14
st %r1, %r14
add %r0, 2, %r1
add %r0, 1, %r8
sqrt: ld %r14, %r5

add %r14, 4, %r14 
start: subcc %r5, %r2, %r0

add %r14,-4, %r14

st %r2, %r14 
bneg endneg

be end

addcc %r8, 1, %r8

add %r8, 0, %r1

add %r1,-1, %r1

add %r8, 0, %r2

multiply: andcc %r1,%r1, %r0

be start

addcc %r8, %r2, %r2

add %r1,-1, %r1

ba multiply
endneg: add %r8, 0, %r12 
add %r8,-1, %r8
ld %r14, %r26

add %r14, 4, %r14

ld %r14, %r27

add %r14, 4, %r14

subcc %r26, %r5, %r28

subcc %r5, %r27, %r29

subcc %r28, %r29, %r0

bneg one

bpos two
two: st %r8, [6048] 
add %r8, 0, %r3

halt

one: add %r12, %r0, %r8

st %r8, [6048] 
add %r8, 0, %r3

halt

end: st %r8, [6048]

add %r8, 0, %r3

halt

a: 64

.end
