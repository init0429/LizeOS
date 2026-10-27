[ORG 0x7C00]
[BITS 16]

%define ENDL 0x0D, 0x0A

start:
    jmp     main

; print a string
; params:
;   ds:si points to string
print:
    push    si
    push    ax
    
.loop:
    lodsb                               ; Loads a byte into AL and advances SI
    or      al, al                      ; Check the next character (null)
    jz      .done
    
    mov     ah, 0x0E                    ; call BIOS interrupt
    mov     bh, 0
    int     0x10
    
    jmp     .loop
    
.done:
    pop     ax
    pop     si
    ret

main:
    ; data segments
    mov     ax, 0
    mov     ds, ax
    mov     es, ax
    
    ; stack
    mov     ss, ax
    mov     sp, 0x7C00

    ; print msg
    mov     si, msg
    call    print
    
    hlt
    
.halt:
    jmp     .halt

msg:        db  "Hello, LizeOS!", ENDL, 0

times 510-($-$$) db 0
dw 0xAA55
