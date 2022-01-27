org 100h
.data 
	arr db 25H,12H,15H,1FH,2BH
	sum db 0
.code   
    main proc
	mov ax, @data
	mov dx,ax
	
	mov ax,0
	mov cx,5
	
	mov bx,offset arr
	
again:
	add al,[bx]
	inc bx
	dec cx
	
	jnz again
	
	mov sum,al
	mov dl,sum
	mov ah,2
	int 21h
	
	mov ah,4ch
	int 21h
end