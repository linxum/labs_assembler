org 100h

.data
arr dw 4, 6, 0, 0, 2, 10, 8, -2, -1
c dw -4
d dw 8 
res_pos dw 0
res_neg dw 0
res_zero dw 0

.code
main proc
mov ax, @data
mov ds, ax

mov cx, 9
lea si, arr

mov bx, c
mov dx, d

mov ax, 0

compare:
cmp word ptr [si], bx
jl skip
cmp word ptr [si], dx
jg skip
cmp word ptr [si], 0
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
add si, 2
loop compare 
  mov ah, 02h 
  add res_pos, 30h
  mov dx, res_pos
  int 21h
  
  mov dx, 20h
  int 21h
  
  mov ah, 02h 
  add res_neg, 30h
  mov dx, res_neg
  int 21h
  
  mov dx, 20h
  int 21h
  
  mov ah, 02h 
  add res_zero, 30h
  mov dx, res_zero
  int 21h
main endp
ret
