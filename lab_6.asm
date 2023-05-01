org 100h

.data
size dw 10
arr dw 4, 6, 0, 0, 2, 10, 8, -2, -1, 0
c dw -4
d dw 8 
res_pos dw 0
res_neg dw 0
res_zero dw 0  

.code
  mov ax, @data
  mov ds, ax
  cld
  lea si, arr
  mov cx, [size]

check:
  lodsw
  cmp ax, [c]
  jl skip
  cmp ax, [d]
  jg skip
  cmp ax, 0
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
  loop check

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

  mov ah, 4ch
  int 21h
ret
