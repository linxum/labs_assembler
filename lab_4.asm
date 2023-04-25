org 100h
.model tiny
.data
line1 db 'Input you number in numeral system, where radix is 10: $'
line2 db 13,10,'Your result in numeral system, where radix is 7: $'
.code
mov dx, offset line1
mov ah,9
int 21h

mov ah, 1
int 21h
sub al, 30h
mov ah,0
mov bx,10
mov cx,ax
.input:
mov ah,1
int 21h
cmp al,0dh
je End
sub al,30h
cbw
xchg ax, cx
mul bx
add cx, ax
jmp .input
End:
mov ax, cx
mov cx,0 ;counter of numbers in stack
mov bx,7 ;radix of numeral system
.divide:
mov dx,0
div bx
add dx, '0'
push dx
inc cx
cmp ax, 0
jnz .divide
.output:
mov dx, offset line2
mov ah, 9
int 21h
.reverse:
pop ax
mov ah,02h
mov dx, ax
int 21h
dec cx
cmp cx, 0
jnz .reverse

ret
