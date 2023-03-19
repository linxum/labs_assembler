title lab2
.model large
org 100h

.data
a dw -8
b dw -2

.code
mov ax,a
mov bx,-15
imul bx
mov cx,ax
mov ax,b
add cx,ax
mov ax,a
mov bx,4  
cwd
idiv bx
sub cx,ax
mov ax,a
mov bx,b
imul bx
dec ax
mov bx,ax
mov ax,cx
cwd  
idiv bx

ret
