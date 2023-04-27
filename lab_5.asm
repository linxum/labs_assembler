org 100h

.data
arr db 4, 6, 0, 2, 10, 8, -2, -1
c db -4
d db 8 
res_pos dw 0
res_neg dw 0
res_zero dw 0

.code
main proc
mov cx, 8
mov bh, [c]
mov dh, [d]
compare:
mov si, cx 
sub si,1
cmp arr[si], bh
jl skip
cmp arr[si], dh
jg skip
cmp arr[si], 0
jl nega
jg pos
je zero

nega:
    inc res_neg
    jmp skip
pos:
    inc res_pos
    jmp skip
zero:
    inc res_zero
    jmp skip
skip:
loop compare 
  mov ah, 02h 
  add res_pos, 30h
  mov dx, res_pos
  int 21h
  
  mov ah, 02h 
  add res_neg, 30h
  mov dx, res_neg
  int 21h
  
  mov ah, 02h 
  add res_zero, 30h
  mov dx, res_zero
  int 21h
main endp
ret
