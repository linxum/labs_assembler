title lab3

org 100h

.data
a dw 15
b dw 39
f db 0 

.code
mov ax,a
mov bx,b
cmp ax,bx

jl lower
jg higher

;a = b
mov ax,8
jmp short exit

;a < b
lower:
cmp bx,0
je error
cwd
idiv bx
add ax,2
jmp short exit

;a > b
higher:
cmp ax,0
je error
sub bx,9
mov ax,bx
mov bx,a
cwd
idiv bx
jmp short exit

;/0
error:
mov f,1
ret

exit:
ret
