title lab2
.model large
org 100h

.data
a dw 1
b dw 0
d dw 2
result dw 0   
   
.code
mov ax,-53
mov bx,a
cwd
idiv bx
mov cx,ax
mov ax,d
add cx,ax
mov ax,a
mov bx,4  
imul bx
sub cx,ax
mov ax,a
mov bx,b
imul bx
inc ax
mov bx,ax
mov ax,cx
cwd  
idiv bx
mov result,ax

ret
