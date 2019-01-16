BITS 16
ORG 0x7C00

; Clear screen
mov ax, 0x0003
int 0x10

; Show the message
mov si, message
mov ah, 0x0E
L:
	lodsb
	test al, al
	jz END
	int 0x10
	jmp L
END:
	jmp $

message db "This hard disk is fucked.", 0

times 510-($-$$) db 0
dw 0xAA55
