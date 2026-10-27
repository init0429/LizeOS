[ORG 0x7C00]
[BITS 16]

start:
    hlt

.halt:
    jmp     .halt

times 510-($-$$) db 0
dw    0xAA55
