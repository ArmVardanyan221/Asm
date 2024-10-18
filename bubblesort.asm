section .data
	size equ 10
section .rodata
	fmtscan db "%d",0
	fmt db "%d ",0
section .bss
	arr resd 10
section .text
	global main
	extern scanf
	extern printf
main:
	push rbp
	mov rbp,rsp
	sub rsp,16
	
	mov rbx,0
	scanff:
	mov rax,0
	mov rdi,fmtscan
	lea rsi,dword[arr + rbx*4]
	call scanf
	inc rbx
	cmp rbx,size
	jne scanff


	mov dword[rbp-4],size
noric:
	mov rbx,0
	mov r15,1	
	

	start:

	movsx rax,dword[arr + rbx*4]
	movsx rcx,dword[arr + r15*4]
	

	inc rbx
	inc r15
	
	cmp rbx,size
	je end

	cmp rax,rcx
	jle start
	
	dec rbx
	dec r15
	mov dword[arr + rbx*4],ecx
	mov dword[arr + r15*4],eax
	inc rbx
	inc r15
	jmp start
	end:
	dec dword[rbp-4]
	cmp dword[rbp-4],1
	jne noric


	mov rbx,0
printff:
	mov rax,0
	mov rdi,fmt
	movsx rsi,dword[arr + rbx*4]
	call printf
	inc rbx
	cmp rbx, size
	jne printff
	
		

	xor rax,rax
	leave 
	ret

