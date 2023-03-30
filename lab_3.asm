title lab3

org 100h

.data
a dw 24
b dw 16
f db 0
result dw 0 

.code
mov ax,a
mov bx,b
cmp ax,bx

jl lower
jg higher

;a = b
mov ax,-11
jmp short exit

;a < b
lower:
cmp bx,0
je error
sub ax,8
cwd
idiv bx
jmp short exit

;a > b
higher:
cmp ax,0
je error
mov ax,b
mov bx,a
cwd
idiv bx
add ax,2
jmp short exit

;/0
error:
mov f,1
ret

exit:
mov result,ax
ret
