
extern printf
extern scanf
section .rodata
	prompt: db "Enter a number: ", 0	
	isprime: db "number is a prime", 10, 0
	notprime: db "Number is not a prime" ,10,0
	inp: dd "%d", 0
	db '%d', 10, 0
	
section .bss
	num: resb 2
section .text
	global main
	main:

		push ebp
		mov ebp,esp
		
		push prompt
		call printf

		push num
		push inp
		call scanf

		mov ebx, 2
		
		mov eax,[num]
		cmp eax,2
		je isaprime
	
  prime_check:
		
		mov edx,0
		mov eax,[num]
		div ebx
		cmp edx,0
        je notaprime
        inc ebx
        cmp ebx,[num]
		je isaprime
        jmp prime_check

        isaprime:
                push isprime
                call printf
                add esp,4
                leave
                ret

        notaprime:
                push notprime
                call printf
                add esp,4
                leave
                ret

	mov esp,ebp
	pop ebp
	ret
