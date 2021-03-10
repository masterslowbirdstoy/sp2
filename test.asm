section .data
	pmsg db 'Sum of positive values:'
	pmsg_len equ $-pmsg
	
	nmsg db 'Sum of negative values:-'
	nmsg_len equ $-nmsg

	elnsum db '7th bit:'
	elnsum_len equ $-elnsum

	nwline db 10

	array dw -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 2
	arrcnt equ 12

	psm dw 0 ; Сумма полож элементов
	nln dw 0 ; Нужный бит в сумме отриц элементов
	nsm dw 0 ; Сумма отриц элементов

	message db "Value =%d", 10, 0

; Макрос с двумя параметрами, который реализует системный вызов sys_write
%macro print 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .text
	global _start

_start:

	mov esi, array  ; Первый элемент массива
	mov ecx, arrcnt ; Кол-во элементов массива

	xor edx, edx ; Обнуление по умному
	xor ebx, ebx

top:
	; Проверка явяляется ли число отрицательным
        bt word[esi], 15 ; проверяет один бит своего первого операнда, индекс которого задается вторым операндом, и сохраняют значение этого бита во флаге переноса
        jnc pnxt ; Если флаг переноса 0, то переход в pnxt иначе след команда
	add edx, [esi]
        jmp pskip

pnxt:
	add ebx, [esi]
pskip:
	add esi, 2 ; След элемент
	dec ecx ; Уменьшение счетчика
        jnz top ; Если счетчик не 0 то в top

	add ebx, '0'
	mov [psm], ebx

	mov ebx, edx
	bt ebx, 7
	jnc zero
	mov ebx, 1
	jmp skip
zero:	mov ebx, 0
skip:	add ebx, '0'
	mov [nln], ebx

	; Преобразование из прямого в дополнительный
	sub edx, 1
	not edx
	add edx, '0'
	mov [nsm], edx

        print pmsg, pmsg_len
	print psm, 1
	print nwline, 1

        print nmsg, nmsg_len
	print nsm, 1

	print nwline, 1

	print elnsum, elnsum_len
	print nln, 1	

        print nwline, 1

exit:
        mov eax, 01
        mov ebx, 0
        int 80h
