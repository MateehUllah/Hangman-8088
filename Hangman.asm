[org 0x0100]
jmp start
;;;;;;;;;;;;==============================Dictionary==================================
word_1:db'sing'
word_2:db 'come'
word_3:db 'bell'
word_4:db 'bear'
word_5:db 'play'
word_6:db 'sing'
word_7:db 'bird'
word_8:db 'bean'
word_9:db 'game'
word_10:db 'rice'
word_11:db 'four' 
word_12:db 'five'
word_13:db 'tree'
word_14:db 'keep'
word_15:db 'dark'
;;;;;;;;;;;;;=================================Dictionary===================================
title_word:db'H  A  N  G  M  A  N'
title_len:dw 19
winner_word:db'You Guess it :)'
winner_word_len:dw 15
live_word:db'L I V E'
live_len:dw 7
empty_char:db '_'
empty_len:dw 1
score_word:db'SCORE:'
score_len:dw 6
len:dw 4
score:dw 0
temp_flag:dw 0
chance:dw 4
game_over:db'G A M E  O V E R'
third_last_chance:db'L I V'
third_last_len:dw 5
second_last_chance:db'L I'
second_last_len:dw 3
last_chance_word:db'L '
last_chance_len:dw 2
game_over_len:dw 16
score_2:db'Your Score is:'
score_2_len:dw 14
counter:dw 0
winner:dw 0
flag:dw 0
start:
call clrscr
call clrful

call print_title
call print_live
mov dx,0x0526
call print_dash
mov dx,0x0528
call print_dash
mov dx,0x052A
call print_dash
mov dx,0x052C
call print_dash
call print_score
mov ax,2412
push ax
call printnum
mov ax,[chance]
push ax
mov ax,[len]
push ax
mov ax,word_3
push ax
call hangman
termination:

cmp word[winner],1
je winner_label
cmp word[winner],0
je loser_label
exit:
call print_game_over
call print_score_2
mov ax,1052
push ax
call printnum
mov ax,0x4c00
int 0x21
winner_label:
	call clrscr
	call clrful
	call print_winner
	mov ax,[score]
	add ax,10
	mov [score],ax
	jmp exit
loser_label:call clrscr
			call clrful_2
			jmp exit
clrscr:	 push es 
		 push ax 
		 push cx 
		 push di 
		 mov ax, 0xb800 
		 mov es, ax ; point es to video base 
		 xor di, di ; point di to top left column 
		 mov ax, 0x0720 ; space char in normal attribute 
		 mov cx, 2000 ; number of screen locations 
		 cld ; auto increment mode 
		 rep stosw ; clear the whole screen 
		 pop di
		 pop cx 
		 pop ax 
		 pop es 
		 ret 
print_score:mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,33
			mov dx,0x0F00
			mov cx,[score_len]
			push cs
			pop es
			mov bp,score_word
			int 0x10
			ret
print_score_2:	mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,33
			mov dx,0x0620
			mov cx,[score_2_len]
			push cs
			pop es
			mov bp,score_2
			int 0x10
			ret
clrful_2:push es 
		 push ax 
		 push cx 
		 push di 
		 mov ax, 0xb800 
		 mov es, ax ; point es to video base 
		 xor di, di ; point di to top left column 
		 mov ax, 0x2020 ; space char in normal attribute 
		 mov cx, 2000 ; number of screen locations 
		 cld ; auto increment mode 
		 rep stosw ; clear the whole screen 
		 						 mov di, 1202 ; point di to top left column 
				 mov ax,0x207C
				 mov word[es:di],ax
				 add di,160
				 mov word[es:di],ax
				 add di,160
				 mov word[es:di],ax
				 mov di,1678
				 mov ax,0x202F
				 mov word[es:di],ax
				 mov di,1836
				 mov word[es:di],ax
				  mov di,1994
				 mov word[es:di],ax
				 add di,160
				 mov ax,0x207C
				 mov word[es:di],ax
				 add di,162
				 mov ax, 0x205C
				 mov word[es:di],ax
				 add di,162
				 mov word[es:di],ax
				 add di,2
				 mov ax, 0x205F
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov ax,0x202F
				 mov word[es:di],ax
				 sub di,160
				 add di,2
				 mov word[es:di],ax
				 sub di,160
				 add di,2
				 mov ax,0x207C
				 mov word[es:di],ax
				  sub di,162
				 mov ax,0x205C
				 mov word[es:di],ax
				 sub di,162
				 mov word[es:di],ax
				 sub di,162
				 mov word[es:di],ax
				 ;_____
				 add di,932		
				 mov ax,0x245F
				 mov word[es:di],ax
				 sub di,2
				 mov word[es:di],ax
				 sub di,2
				 mov si,di
				 mov word[es:di],ax
				 add di,158
				 mov ax,0x242F
				 mov word[es:di],ax
				 add di,158
				 mov word[es:di],ax
				 add di,162
				 mov ax,0x245C
				 mov word[es:di],ax
				 add di,2
				 mov ax,0x245F
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov ax,0x242F
				 mov word[es:di],ax
				 sub di,158
				 mov word[es:di],ax
				 sub di,162
				 mov ax,0x245C
				 mov word[es:di],ax
				 mov di,si
				 add di,160
				 mov ax,0x242A
				 mov [es:di],ax
				 add di,4
				 mov ax,0x242A
				 mov [es:di],ax
				 add di,158
				 mov si,di
				 mov ax,0x247F
				 mov [es:di],ax
				 add di,160
				 mov ax,0x243C
				 mov [es:di],ax
				 mov di,si
				 add di,8
				 mov ax,0x245F
				 mov [es:di],ax
				  add di,2
				 mov [es:di],ax
				  add di,2
				 mov [es:di],ax
				  add di,2
				 mov [es:di],ax
				  add di,2
				 mov [es:di],ax
				 add di,2
				 mov [es:di],ax
		 MOV SI,DI
		 add di,2
		 mov [es:di],ax
		 add di,2
		 mov [es:di],ax
		 add di,2
		 mov [es:di],ax
		 add di,2
		 mov [es:di],ax
		 add di,2
		 mov [es:di],ax
		 add di,162
		 mov ax, 0x245C
		 mov [es:di],ax
		 add di,162
		 mov ax, 0x245C
		 mov [es:di],ax
		 sub di,322
		 mov ax,0x242F
		 mov [es:di],ax
		 sub di,158
		 mov [es:di],ax
		 mov di,si
		 mov ax,0x247C
		 mov [es:di],ax
		 sub di,160
		 mov [es:di],ax
		 add di,320
		 mov [es:di],ax
		 add di,160
		 mov [es:di],ax
		 pop di
		 pop cx 
		 pop ax 
		 pop es 
		 ret 

clrful:	 push es 
		 push ax 
		 push cx 
		 push di
		 mov ax, 0xb800 
		 mov es, ax ; point es to video base 
		 xor di, di ; point di to top left column 
		 mov ax, 0x2020 ; space char in normal attribute 
		 mov cx, 2000 ; number of screen locations 
		 cld ; auto increment mode 
		 rep stosw ; clear the whole screen 
						 mov di, 1202 ; point di to top left column 
				 mov ax,0x207C
				 mov word[es:di],ax
				 add di,160
				 mov word[es:di],ax
				 add di,160
				 mov word[es:di],ax
				 mov di,1678
				 mov ax,0x202F
				 mov word[es:di],ax
				 mov di,1836
				 mov word[es:di],ax
				  mov di,1994
				 mov word[es:di],ax
				 add di,160
				 mov ax,0x207C
				 mov word[es:di],ax
				 add di,162
				 mov ax, 0x205C
				 mov word[es:di],ax
				 add di,162
				 mov word[es:di],ax
				 add di,2
				 mov ax, 0x205F
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov ax,0x202F
				 mov word[es:di],ax
				 sub di,160
				 add di,2
				 mov word[es:di],ax
				 sub di,160
				 add di,2
				 mov ax,0x207C
				 mov word[es:di],ax
				 sub di,162
				 mov ax,0x205C
				 mov word[es:di],ax
				 sub di,162
				 mov word[es:di],ax
				 sub di,162
				 mov word[es:di],ax
				 mov di,1684
				 mov ax,0x205F
				 mov word[es:di],ax
				 sub di,2
				 mov word[es:di],ax
				 add di,158
				 mov ax,0x202F
				 mov word[es:di],ax
				 add di,158
				 mov word[es:di],ax
				 mov di,1846
				 mov ax,0x205c
				 mov word[es:di],ax
				 add di,162
				 mov word[es:di],ax
				 add di,160
				 mov ax,0x202F
				 mov word[es:di],ax
				 mov di,2158
				 mov ax,0x205C
				 mov word[es:di],ax
				 add di,2
				 mov ax,0x205F
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 add di,2
				 mov word[es:di],ax
				 mov di,1844
				 mov ax,0x202A
				 mov word[es:di],ax
				 mov di,1842
				 mov word[es:di],ax
				 add di,160
				 mov ax,0x207F
				 mov word[es:di],ax
				 add di,158
				 mov ax,0x203C
				 mov word[es:di],ax
				 add di,164
				 mov ax,0x207C
				 mov word[es:di],ax
				 add di,160
				 mov word[es:di],ax
				 add di,160
				 mov word[es:di],ax;2644
				 add di,160
				 mov word[es:di],ax			;5F= - ,5C="\", 7c="|" , 7F="|" 2F="/"
				 add di,160
				 mov word[es:di],ax
				 add di,158
				 mov si,di
				 mov ax,0x202F
				 MOV WORD[es:di],ax
				 add di,4
				 mov word[es:di],0x205C
				 add di,164
				 mov word[es:di],0x205C
				 add di,2
				 mov word[es:di],0x205F
				  add di,2
				 mov word[es:di],0x205F
				 mov di,si
				 add di,156
				 mov word[es:di],0x202F
				 sub di,2
				 mov word[es:di],0x205F
				  sub di,2
				 mov word[es:di],0x205F
				 mov di,2642
				 mov word[es:di],0x205F
				 sub di,2
				 mov word[es:di],0x205F
				  sub di,2
				 mov word[es:di],0x205F
				  sub di,2
				 mov word[es:di],0x205F
				 add di,10
				  mov word[es:di],0x205F
				  add di,2
				  mov word[es:di],0x205F
				  add di,2
				  mov word[es:di],0x205F
				  add di,2
				  mov word[es:di],0x205F
		 pop di
		 pop cx 
		 pop ax 
		 pop es 
		 ret 
print_title:
			mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,33
			mov dx,0x0020
			mov cx,[title_len]
			push cs
			pop es
			mov bp,title_word
			int 0x10
			ret
print_live:	mov bl,36
			mov dx,0x0326
			mov cx,[live_len]
			push cs
			pop es
			mov bp,live_word
			int 0x10
			ret
print_dash:
			mov bl,32
			mov cx,[empty_len]
			push cs
			pop es
			mov bp,empty_char
			int 0x10
			ret 
print_game_over:
			mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,33
			mov dx,0x1620
			mov cx,[game_over_len]
			push cs
			pop es
			mov bp,game_over
			int 0x10
			ret
print_winner:
			mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,33
			mov dx,0x0420
			mov cx,[winner_word_len]
			push cs
			pop es
			mov bp,winner_word
			int 0x10
			ret
printnum: push bp 
			 mov bp, sp 
			 push es 
			 push ax 
			 push bx 
			 push cx 
			 push dx 
			 push di 
			 mov ax, 0xb800 
			 mov es, ax ; point es to video base 
			 mov ax, [score] ; load number in ax 
			 mov bx, 10 ; use base 10 for division 
			 mov cx, 0 ; initialize count of digits 
nextdigit: 	 mov dx, 0 ; zero upper half of dividend 
			 div bx ; divide by 10 
			 add dl, 0x30 ; convert digit into ascii value 
			 push dx ; save ascii value on stack 
			
			 inc cx ; increment count of values 
			 cmp ax, 0 ; is the quotient zero 
			 jnz nextdigit ; if no divide it again 
			 mov di, [bp+4] ; point di to top left column
			 nextpos: pop dx ; remove a digit from the stack 
			 mov dh, 33 ; use normal attribute 
			 mov [es:di], dx ; print char on screen 
			 add di, 2 ; move to next screen location 
			 loop nextpos ; repeat for all digits on stack
			 pop di 
			 pop dx 
			 pop cx 
			 pop bx 
			 pop ax 
			 pop es 
			 pop bp 
			 ret 2

;isko dry run krna ha
hangman:push bp
		mov bp,sp
		push ax
		push bx
		push cx
		push dx
		push si
		push di
		;mov di,0
		mov bx,[bp+4]
		mov cx,[bp+8]
		;mov di, 876 ; point di to top left column 
		
		;isko check krna ha
loop1:	jmp checks
		
ret_label: 	
			mov word[flag],0
			mov si,0;is line ko check krna ha
			mov ah,0
			int 0x16
loop2:	
		;termination_3

		cmp al,[bx+si]
		je print_match
;;;;;;;;;;;;;Idhr say lay kr 		
label_2:cmp word[counter],4
		je label_3
		inc si;print kay bad idhr label lagyega
		cmp si,4
		jne loop2
		cmp word[flag],0
		je not_match
		jmp ret_label
;;4 character pury krny ki logic add krni ha is area ma wo mai di ko use kruga
;;;Thori logic set krni ha	
label_3:	jmp termination_3  
not_match_2:dec cx
			mov di,[counter]
			dec di
			mov [counter],di
			jmp loop1
print_match:mov word[flag],1
			mov di,[counter]
			inc di
			mov word[counter],di
			cmp si,0
			je print_first_blank
			cmp si,1
			je print_second_blank
			cmp si,2
			je print_third_blank
			cmp si,3
			je print_last_blank
not_match:dec cx
		  jmp loop1			

print_first_blank:	
		push bx
		mov bl,al
		push ax
		push es
		push di
		mov ax, 0xb800 ; load video base in ax 
		mov es, ax ; point es to video base 
		mov bh,32
		mov di,876
		cmp word[es:di],0x205F
		je equal_1
		pop di
		pop es
		pop ax
		pop bx
		jmp not_match_2
equal_1:	mov word [es:di], bx ; clear next char on screen 
			pop di
		pop es
		pop ax
		pop bx
		jmp label_2
print_second_blank:	push bx
		mov bl,al
		push ax
		push es
		push di
		mov ax, 0xb800 ; load video base in ax 
		mov es, ax ; point es to video base 
		mov bh,32
		mov di,880
		cmp word[es:di],0x205F
		je equal_2
		pop di
		pop es
		pop ax
		pop bx
		jmp not_match_2
equal_2:	mov word [es:di], bx ; clear next char on screen 
		pop di
		pop es
		pop ax
		pop bx
		jmp label_2
print_third_blank:push bx
		mov bl,al
		push ax
		push es
		push di
		mov ax, 0xb800 ; load video base in ax 
		mov es, ax ; point es to video base 
		mov bh,32
		mov di,884
		cmp word[es:di],0x205F
		je equal_3
		pop di
		pop es
		pop ax
		pop bx
		jmp not_match_2
equal_3:	mov word [es:di], bx ; clear next char on screen 
		pop di
		pop es
		pop ax
		pop bx
		jmp label_2
print_last_blank:push bx
		mov bl,al
		push ax
		push es
		push di
		mov ax, 0xb800 ; load video base in ax 
		mov es, ax ; point es to video base 
		mov bh,32
		mov di,888
		cmp word[es:di],0x205F
		je equal_4
		pop di
		pop es
		pop ax
		pop bx
		jmp not_match_2
equal_4:	mov word [es:di], bx ; clear next char on screen 
		pop di
		pop es
		pop ax
		pop bx
		jmp label_2

checks:	cmp cx,0
		je loser
		cmp cx,1
		je last_chance
		cmp cx,2
		je second_last
		cmp cx,3
		je third_last
		jmp ret_label
loser:mov word[winner],0
		jmp termination_2
last_chance:call clear_row
			;call clear_tang
			call print_last_chance_live
			jmp ret_label
second_last:call clear_row
			call print_second_last_live
			jmp ret_label
third_last:call clear_row
			call print_third_last_live
			jmp ret_label
termination_3: 	cmp cx,0
				je termination_2
				mov word[winner],1
termination_2:	pop di;push ax
				pop si;push bx
				pop dx;push cx
				pop cx;push dx
				pop bx;push si
				pop ax;push di
				pop bp
				ret 6
				
clear_row:   push es 
			 push ax 
			 push cx 
			 push di 
			 mov ax, 0xb800 
			 mov es, ax ; point es to video base 
			 mov di,480; point di to top left column 
			 mov ax, 0x2020 ; space char in normal attribute 
			 mov cx, 80 ; number of screen locations 
			 cld ; auto increment mode 
			 rep stosw ; clear the whole screen 
			 pop di
			 pop cx 
			 pop ax 
			 pop es 
			 ret 
print_third_last_live:
			push di
			push ax
			push bx
			push cx
			push dx
			push bp
			push es
			mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,36
			mov dx,0x0326
			mov cx,[third_last_len]
			push cs
			pop es
			mov bp,third_last_chance
			int 0x10
			mov ax, 0xb800
			mov es,ax
			mov di,2642
			mov word[es:di],0x2020
			sub di,2
			mov word[es:di],0x2020
			sub di,2
			mov word[es:di],0x2020
			sub di,2
			mov word[es:di],0x2020
			pop es
			pop bp
			pop dx
			pop cx
			pop bx
			pop ax
			pop di
			ret
print_second_last_live:
			push di
			push ax
			push bx
			push cx
			push dx
			push bp
			push es
			mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,36
			mov dx,0x0326
			mov cx,[second_last_len]
			push cs
			pop es
			mov bp,second_last_chance
			int 0x10
			mov ax, 0xb800
			mov es,ax
			mov di,2646
			mov word[es:di],0x2020
			add di,2
			mov word[es:di],0x2020
			add di,2
			mov word[es:di],0x2020
			add di,2
			mov word[es:di],0x2020
			pop es
			pop bp
			pop dx
			pop cx
			pop bx
			pop ax
			pop di
			ret
print_last_chance_live:
			push di
			push ax
			push bx
			push cx
			push dx
			push bp
			push es
			mov ah,0x13
			mov al,1
			mov bh,0
			mov bl,36
			mov dx,0x0326
			mov cx,[last_chance_len]   
			push cs
			pop es
			mov bp,last_chance_word
			int 0x10
			mov ax,0xb800
			mov es,ax
			mov di,3122
			mov word[es:di],0x2020
			add di,156
			mov word[es:di],0x2020
			sub di,2
			mov word[es:di],0x2020
			sub di,2
			mov word[es:di],0x2020
			pop es
			pop bp
			pop dx
			pop cx
			pop bx
			pop ax
			pop di
			ret