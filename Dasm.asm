.model small
.stack 100h
.data

    ;Errore messages
    
    open_Errore db 13, 10, "Failed to open file. Name of the file should not be longer than 8 symbols.$"
    create_Errore db 13, 10, "Failed to create file$"
    helpmsg db "Enter the name of a .com file to the command line$"

    close_program db 0

    ;Files info
    
    file_Name db 10 dup(0)
    file_Handle dw 0
    is_it_read db 0
    is_eof db 0
    
    output_Name db 10 dup(0)
    output_Handle dw 0
    
    ;Reding buffer
    read_Buff db 15 dup(?)
    buff_bytes dw 15
    buff_Ind dw 15

    ;Output buffer
    out_Buff db "cs:0100 ", 100 dup(?)
    out_Ind dw 8

    ;Registers
    reg_w1 db 2, "AX"
           db 2, "CX"
           db 2, "DX"
           db 2, "BX"
           db 2, "SP"
           db 2, "BP"
           db 2, "SI"
           db 2, "DI"

    reg_w0 db 2, "AL"
           db 2, "CL"
           db 2, "DL"
           db 2, "BL"
           db 2, "AH"
           db 2, "CH"
           db 2, "DH"
           db 2, "BH"

    reg_cl db 2, "CL"
    reg_dx db 2, "DX"

    ;Register/memory
    reg_mem    db 5, "BX+SI"
               db 5, "BX+DI"
               db 5, "BP+SI"
               db 5, "BP+DI"
               db 2, "SI   "
               db 2, "DI   "
               db 2, "BP   "
               db 2, "BX   "

    ;Segment register
    reg_seg db 2, "ES"
            db 2, "CS"
            db 2, "SS"
            db 2, "DS"
    
    byteptr db 9, "byte ptr "
    wordptr db 9, "word ptr "
    
    ;Variables
    var_opcd  db 0
    var_opcd2 dw 0 ;2 byte

    var_reg db 9

    var_rm_pref db 5
    var_rm  db 0

    var_pos_1 db 0
    var_pos_2 db 0

    var_bo_1 db 0
    var_bo_2 db 0

    var_w   db 0
    dsv     db 0     ;1=d, 2=s, 3=v 
    var_d   db 0
    var_v   db 0
    var_s   db 0
    var_mod db 0

    var_xxx db 0
    var_yyy db 0

    ;Recognised commands
    com_type_1 db 3, "DAA  "
               db 3, "DAS  "
               db 3, "AAA  "
               db 3, "AAS  "
               db 5, "INT 3"
               db 3, "NOP  "
               db 3, "CBW  "
               db 3, "CWD  "
               db 4, "WAIT "
               db 5, "PUSHF"
               db 4, "POPF "
               db 4, "SAHF "
               db 4, "LAHF "
               db 3, "RET  "
               db 4, "RETF "
               db 4, "INTO "
               db 4, "IRET "
               db 4, "XLAT "
               db 4, "LOCK "
               db 5, "REPNZ"
               db 3, "REP  "
               db 3, "HLT  "
               db 3, "CMC  "
               db 3, "CLC  "
               db 3, "STC  "
               db 3, "CLI  "
               db 3, "STI  "
               db 3, "CLD  "
               db 3, "STD  "
               db 3, "AAM  "
               db 3, "AAD  "

    com_type_2 db 3, "INC  "
               db 3, "DEC  "
               db 4, "PUSH "
               db 3, "POP  "

    com_type_3 db 3, "ADD  "
               db 2, "OR   "
               db 3, "ADC  "
               db 3, "SBB  "
               db 3, "AND  "
               db 3, "SUB  "
               db 3, "XOR  "
               db 3, "CMP  "
               db 3, "MOV  "
               db 4, "TEST "
               db 4, "XCHG "
               db 3, "LEA  "
               db 3, "RET  "
               db 4, "RETF "
               db 3, "LES  "
               db 3, "LDS  "

    com_type_5 db 2, "JO   "
               db 3, "JNO  "
               db 2, "JB   "
               db 3, "JAE  "
               db 2, "JE   "
               db 3, "JNE  "
               db 3, "JBE  "
               db 2, "JA   "
               db 2, "JS   "
               db 3, "JNS  "
               db 2, "JP   "
               db 3, "JNP  "
               db 2, "JL   "
               db 3, "JGE  "
               db 3, "JLE  "
               db 2, "JG   "
               db 5, "LOOPN"
               db 5, "LOOPE"
               db 4, "LOOP "
               db 4, "LCXZ "
               db 3, "JMP  "

    com_type_7 db 4, "PUSH "
               db 3, "POP  "

    com_type_8_w db 5, "MOVSW"
                 db 5, "CMPSW"
                 db 5, "STOSW"
                 db 5, "LODSW"
                 db 5, "SCASW" 

    com_type_8_b db 5, "MOVSB"
                 db 5, "CMPSB"
                 db 5, "STOSB"
                 db 5, "LODSB"
                 db 5, "SCASB" 

    com_type_9 db 3, "ROL  "
               db 3, "ROR  "
               db 3, "RCL  "
               db 3, "RCR  "
               db 3, "SHL  "
               db 3, "SHR  "
               db 3, "SAR  "

    com_type_10 db 3, "NOT  "
                db 3, "NEG  "
                db 3, "MUL  "
                db 4, "IMUL "
                db 3, "DIV  "
                db 4, "IDIV "
                db 3, "INC  "
                db 3, "DEC  "
                db 4, "CALL "
                db 4, "CALL "
                db 3, "JMP  "
                db 3, "JMP  "
                db 4, "PUSH "

    com_type_io db 2, "IN   "
                db 3, "OUT  "
    
    com_MOV db 3, "MOV"
    com_POP db 3, "POP"
    com_TEST db 4, "TEST"
    com_INT db 3, "INT"
    com_XCHG db 4, "XCHG"
    com_ESC db 3, "ESC"
    com_cll db 4, "CALL "
            db 3, "JMP  "

    com_Unknown db 7, "UNKNOWN"
    
    
.code
    start:
    mov dx, @data
    mov ds, dx
    
    mov bx, 82h                 ;Bx naudojamas duomenim is command line pasiimti
    mov si, offset file_Name    ;Si naudojamas failo pavadinimo issaugojimui

    cmp byte ptr es:[80h], 0
    je help
    cmp es:[82h], '?/'
    jne code_1
    help:
    mov ah, 09h
    mov dx, offset helpmsg
    int 21h
    jmp progend

    code_1:
    
;Pasiimam failo pavadinima

    xor cx, cx                  ;Cx registre bus skaiciuojama kokio ilgio failo pavadinimas
    getFileName:    
    cmp byte ptr es:[bx], 13    ;Tikrinama ar nepasiekta eilutes pabaiga
    je openFile
    cmp byte ptr es:[bx], 20h   ;Tikrinama ar neprideta tarpu
    je skip
    
    inc cx
    cmp cx, 13
    je openerrore

    mov dl, byte ptr es:[bx]    ;Persikeliam raide i registra
    mov [si], dl                ;kad galetume patalpinti i atminti
    inc si
    skip:    
    inc bx
    jmp getFileName

    openFile:
    mov ax, 3D00h               ;Atidaro vartotojo ivesta faila
    mov dx, offset file_Name
    int 21h
    jnc createOutput            ;Tikrinama ar pavyko
    
    openerrore:
    mov ah, 09h
    mov dx, offset open_Errore
    int 21h
    jmp closeprog
;****

;Sukuria output
    createOutput:
    mov [file_Handle], ax
    
    mov bx, 0
    mov si, 0
    nameLoop:
    cmp [file_name+bx], '.'
    je endasm
    mov ah, [file_name+bx]
    mov [output_name+si], ah
    inc si
    inc bx
    jmp nameLoop
    
    endasm:
    mov [output_name+si], '.'
    mov [output_name+si+1], 't'
    mov [output_name+si+2], 'x'
    mov [output_name+si+3], 't'
    
    xor cx, cx
    mov ah, 3Ch                 ;Sukuriamas gabaliukas
    mov dx, offset output_Name
    int 21h
    jnc Program
    
    mov ah, 09h
    mov dx, offset create_Errore
    int 21h
    jmp progEnd
;***

;********************************************CODE**********************************
     
    Program:
    mov [output_Handle], ax
    mov di, 100h

    mainloop:
    call FIXVAR
    call RECOGNISE
    cmp [close_program], 1
    je endlabel
    jmp mainloop

    endlabel: 
    jmp progEnd

;***************************************PROCEDURES*******************************   
    
READFILE PROC NEAR
    
    push bx
    push cx
    push dx
    push ax

    cmp [is_it_read], 1
    je donotskip

    mov [is_it_read], 1
    mov ax, 4000h
    mov bx, [file_Handle]
    mov cx, 100h
    int 21h

    donotskip:
    cmp [is_eof], 1
    jne read
    call progEnd

    read:
    mov ah, 3Fh
    mov bx, [file_Handle]
    mov cx, 0Fh
    mov dx, offset read_Buff
    int 21h
    cmp ax, 0
    jne read1
    call progEnd
    read1:
    cmp ax, 0Fh
    jge rl1
    mov [is_eof], 1
    mov [buff_bytes], ax

    rl1:
    pop ax
    pop dx
    pop cx
    pop bx
    ret
    
READFILE ENDP

PRINTOUT PROC NEAR
    push cx
    push dx
    push bx
    push ax

    mov bx, [output_handle]
    mov cx, [out_ind]
    mov dx, offset out_buff
    mov ah, 40h
    int 21h

    pop ax
    pop bx
    pop dx
    pop cx
    ret
PRINTOUT ENDP

GETBYTE PROC NEAR  ;To AL
    
    push di
    push bx

    mov di, [buff_Ind]
    mov bx, [buff_bytes]
    
    cmp di, bx
    jne skipread
    
    cmp [is_eof], 1
    jne gl1
    mov [close_program], 1
    jmp getbend

    gl1:
    call READFILE
    mov [buff_Ind], 0
    xor di, di
    
    skipread:

    mov al, [read_Buff + di]
    inc [buff_Ind] 
    xor ah, ah

    push ax
    call ADDNUMBERTOBUFF
    pop ax
    inc cx

    getbend:
    pop bx
    pop di
    ret
    
GETBYTE ENDP

FIXVAR PROC NEAR
    mov [out_ind], 8
    mov [var_w]  , 0
    mov [dsv]    , 0 
    mov [var_d]  , 0
    mov [var_v]  , 0
    mov [var_s]  , 0
    mov [var_mod], 0
    mov [var_rm_pref], 5
    mov [var_reg], 9
    ret
FIXVAR ENDP

MAKENICE PROC NEAR
    push ax
    push cx
    mov al, 7
    sub al, cl
    mov cl, al
    cmp cx, 0
    je maken_end
    spaceloop:
    call ADDSPACE
    call ADDSPACE
    loop spaceloop
    maken_end:
    pop cx
    pop ax
    ret
MAKENICE ENDP

;************************************************FORMATS*****************************************************************

RECOGNISE PROC NEAR
    xor ax, ax
    xor cx, cx
    xor si, si
    call GETBYTE
    cmp [close_program], 1
    jne pf
    ret
    
    pf:
    ;Prefiksas?
        ;0010 0110: 26h = ES
        cmp ax, 0026h
        jne pf1
        mov [var_rm_pref], 0
        jmp pf4

        pf1:
        ;0010 1110: 2Eh = CS
        cmp ax, 002Eh
        jne pf2
        mov [var_rm_pref], 1
        jmp pf4

        pf2:
        ;0011 0110: 36h = SS
        cmp ax, 0036h
        jne pf3
        mov [var_rm_pref], 2
        jmp pf4

        pf3:
        ;0011 1110: 3Eh = DS
        cmp ax, 003Eh
        jne commands
        mov [var_rm_pref], 3

        pf4:
        call GETBYTE
    ;***

        commands:
        mov [var_opcd], al

    ;TYPE1
        xor si, si
        mov al, [var_opcd]
        cmp al, 00100111b ;DAA
        je type_1
        inc si
        cmp al, 00101111b ;DAS
        je type_1
        inc si
        cmp al, 00110111b ;AAA
        je type_1
        inc si
        cmp al, 00111111b ;AAS
        je type_1
        inc si
        cmp al, 11001100b ;INT 3
        je type_1
        inc si
        cmp al, 10010000b ;NOP
        je type_1
        inc si
        cmp al, 10011000b ;CBW
        je type_1
        inc si
        cmp al, 10011001b ;CWD
        je type_1

        jmp type_1_1
        type_1:
        call TYPE1
        jmp recclose
        type_1_1:

        inc si
        cmp al, 10011011b ;WAIT
        je type_1
        inc si
        cmp al, 10011100b ;PUSHF
        je type_1
        inc si
        cmp al, 10011101b ;POPF
        je type_1
        inc si
        cmp al, 10011110b ;SAHF
        je type_1
        inc si
        cmp al, 10011111b ;LAHF
        je type_1
        inc si
        cmp al, 11000011b ;RET
        je type_1
        inc si
        cmp al, 11001011b ;RETF
        je type_1
        inc si
        cmp al, 11001110b ;INTO
        je type_1
        inc si
        cmp al, 11001111b ;IRET
        je type_1
        inc si
        cmp al, 11010111b ;XLAT
        je type_1
        inc si
        cmp al, 11110000b ;LOCK
        je type_1
        inc si
        cmp al, 11110010b ;REPNZ
        je type_1
        inc si
        cmp al, 11110011b ;REP
        je type_1
        inc si
        cmp al, 11110100b ;HLT
        je type_1
        inc si
        cmp al, 11110101b ;CMC
        je type_1
        inc si
        cmp al, 11111000b ;CLC
        je type_1
        inc si
        cmp al, 11111001b ;STC
        je type_1
        inc si
        cmp al, 11111010b ;CLI
        je type_1
        inc si
        cmp al, 11111011b ;STI
        je type_1
        inc si
        cmp al, 11111100b ;CLD
        je type_1
        inc si
        cmp al, 11111101b ;STD
        je type_1
    ;***
    
    ;TYPE2
        xor si, si
        mov al, [var_opcd]
        and al, 11111000b
        cmp al, 01000000b   ;INC
        je type_2
        inc si
        cmp al, 01001000b   ;DEC
        je type_2
        inc si
        cmp al, 01010000b   ;PUSH
        je type_2
        inc si
        cmp al, 01011000b   ;POP
        je type_2
    ;***

        jmp tp1
        type_2:
        call TYPE2
        jmp recclose
        tp1:

    ;TYPE3
        xor si, si
        mov al, [var_opcd]
        and al, 11111100b   
        cmp al, 00000000b   ;ADD
        je type_3
        inc si
        cmp al, 00001000b   ;OR
        je type_3
        inc si
        cmp al, 00010000b   ;ADC
        je type_3
        inc si
        cmp al, 00011000b   ;SBB
        je type_3
        inc si
        cmp al, 00100000b   ;AND
        je type_3
        inc si
        cmp al, 00101000b   ;SUB
        je type_3
        inc si
        cmp al, 00110000b   ;XOR
        je type_3
        inc si
        cmp al, 00111000b   ;CMP
        je type_3
        inc si
        cmp al, 10001000b   ;MOV
        je type_3
    ;***

        jmp tp2
        type_3:
        mov al, [var_opcd]
        call TYPE3
        jmp recclose
        tp2:

    ;TYPE3.1
        inc si
        mov al, [var_opcd]
        and al, 11111110b
        cmp al, 10000100b   ;TEST
        je type_3_1
        inc si
        cmp al, 10000110b   ;XCHG
        je type_3_1
    ;*** 

        jmp tp2_1
        type_3_1:
        mov al, [var_opcd]
        or al, 00000010b
        call TYPE3
        jmp recclose

    ;TYPE3.2
        tp2_1:
        inc si
        mov al, [var_opcd]
        cmp al, 10001101b   ;LEA
        jne tp_2_2
        or al , 00000011b
        call TYPE3
        jmp recclose
    ;***

        tp_2_2:

    ;TYPE3.3
        add si, 3
        mov al, [var_opcd]
        cmp al, 11000100b   ;LES
        je tpye_3_3
        inc si
        cmp al, 11000101b   ;LDS
        je tpye_3_3 
    ;***
        jmp tp_2_3
        tpye_3_3:
        or al, 00000011b
        mov [var_opcd], al
        call TYPE3
        jmp recclose
        tp_2_3:

    ;TYPE5
        xor si, si
        mov al, [var_opcd]
        cmp al, 70h ;JO
        je type_5
        inc si
        cmp al, 71h ;JNO
        je type_5
        inc si
        cmp al, 72h ;JB
        je type_5
        inc si
        cmp al, 73h ;JAE
        je type_5
        inc si
        cmp al, 74h ;JE
        je type_5
        inc si
        cmp al, 75h ;JNE
        je type_5
        inc si
        cmp al, 76h ;JBE
        je type_5
        inc si
        cmp al, 77h ;JA
        je type_5
        inc si
        cmp al, 78h ;JS
        je type_5
        inc si
        cmp al, 79h ;JNS
        je type_5
        inc si
        cmp al, 7Ah ;JP
        je type_5
        inc si
        cmp al, 7Bh ;JNP
        je type_5
        inc si
        cmp al, 7Ch ;JL
        je type_5
        inc si
        cmp al, 7Dh ;JGE
        je type_5
        inc si
        cmp al, 7Eh ;JLE
        je type_5
        inc si
        cmp al, 7Fh ;JG
        je type_5
        inc si
        cmp al, 0E0h ;LOOPN
        je type_5
        inc si
        cmp al, 0E1h ;LOOPE
        je type_5
        inc si
        cmp al, 0E2h ;LOOP
        je type_5
        inc si
        cmp al, 0E3h ;JCXZ
        je type_5
        inc si
        cmp al, 0EBh ;JMP
        je type_5
    ;***

        jmp tp3
        type_5:
        call TYPE5
        jmp recclose
        tp3:

    ;TYPE6
        xor si, si
        mov al, [var_opcd]
        and al, 11111110b
        cmp al, 00000100b   ;ADD
        je type_6
        inc si
        cmp al, 00001100b   ;OR
        je type_6
        inc si
        cmp al, 00010100b   ;ADC
        je type_6
        inc si
        cmp al, 00011100b   ;SBB
        je type_6
        inc si
        cmp al, 00100100b   ;AND
        je type_6
        inc si
        cmp al, 00101100b   ;SUB
        je type_6
        inc si
        cmp al, 00110100b   ;XOR
        je type_6
        inc si
        cmp al, 00111100b   ;CMP
        je type_6
        inc si
        inc si
        cmp al, 10101000b   ;TEST
        je type_6
        add si, 3
        cmp al, 11000010b   ;RET
        je type_6
        inc si
        cmp al, 11001010b   ;RETF
        je type_6
    ;***

        jmp tp4
        type_6:
        call TYPE6
        jmp recclose
        tp4:

    ;TYPE7
        xor si, si
        mov al, [var_opcd]
        and al, 11100111b
        cmp al, 00000110b   ;PUSH
        je type_7
        inc si
        cmp al, 00000111b   ;POP
        je type_7
    ;***

        jmp tp5
        type_7:
        call TYPE7
        jmp recclose
        tp5:

    ;TYPECALL
        xor si, si
        mov al, [var_opcd]
        cmp al, 10011010b ;CALL (isorinis tiesioginis)
        jne tp6
        call TYPECLL
        jmp recclose
        tp6:
        inc si
        cmp al, 11101010b ;JMP (isorinis tiesioginis)
        jne tp7 
        call TYPECLL
        jmp recclose
    ;***

        tp7:

    ;TYPECALL2.0
        xor si, si
        mov al, [var_opcd]
        cmp al, 11101000b ;CALL (vidinis tiesioginis)
        je type_20
        inc si
        cmp al, 11101001b ;JMP (vidinis tiesioginis)
        je type_20
    ;***

        jmp tp7_1
        type_20:
        CALL TYPE20
        jmp recclose
        tp7_1:


    ;TYPE8
        xor si, si
        mov al, [var_opcd]
        and al, 11111110b
        cmp al, 10100100b ;MOVSB
        je type_8
        inc si
        cmp al, 10100110b ;CMPSB
        je type_8
        inc si
        cmp al, 10101010b ;STOSB
        je type_8
        inc si
        cmp al, 10101100b ;LODSB
        je type_8
        inc si
        cmp al, 10101110b ;SCASB
        je type_8
    ;***

        jmp tp8
        type_8:
        call TYPE8
        jmp recclose
        tp8:

        ;TYPEMOVAKAT
            mov al, [var_opcd]
            and al, 11111110b
            cmp al, 10100000b ;MOV akumuliatoriu <- amintis
            je type_movak
            cmp al, 10100010b ;MOV atmintis <- akumuliatorius
            je type_movak
        ;***

        jmp tp9
        type_movak:
        call TYPEMOVAK
        jmp recclose
        tp9:

        ;TYPEMOVREGBO
            mov al, [var_opcd]
            and al, 11110000b
            cmp al, 10110000b ;MOV reg <- bo
            jne tp10
            call TYPEMOVREGBO
            jmp recclose
        ;***

            tp10:

        ;TYPE INT
            mov al, [var_opcd]
            cmp al, 11001101b ;INT
            jne tp11
            call GETBYTE
            call MAKENICE
            call ADDSPACE
            mov bx, offset com_int
            call ADDNAME
            call ADDSPACE
            call ADDNUMBERTOBUFF
            call ADDH
            call ADDENTER
            call PRINTOUT
            call INCCS
            jmp recclose
        ;***

        tp11:

        ;TYPEIO
            mov al, [var_opcd]
            xor si, si
            and al, 11111110b
            cmp al, 11101100b   ;IN
            je type_io
            cmp al, 11100100b
            je type_io
            inc si
            cmp al, 11100110b   ;OUT
            je type_io
            cmp al, 11101110b
            je type_io
        ;***

        jmp tp12
        type_io:
        call TYPEINOUT
        jmp recclose
        tp12:


        ;TYPEXCHG
            mov al, [var_opcd]
            and al, 11111000b
            cmp al, 10010000b ;EXCHG
            jne tp13
            call TYPEXCHG
            jmp recclose
        ;***

        tp13:

    ;*********************************Types that need 2 bytes

        call GETBYTE
        mov ah, [var_opcd]
        mov [var_opcd2], ax
    ;TYPE4
        xor si, si
        mov ax, [var_opcd2]
        and ax, 1111110000111000b
        cmp ax, 1000000000000000b   ;ADD
        je type_4 
        inc si
        cmp ax, 1000000000001000b   ;OR
        je type_4
        inc si
        cmp ax, 1000000000010000b   ;ADC
        je type_4
        inc si
        cmp ax, 1000000000011000b   ;SBB
        je type_4
        inc si
        cmp ax, 1000000000100000b   ;AND
        je type_4
        inc si
        cmp ax, 1000000000101000b   ;SUB
        je type_4
        inc si
        cmp ax, 1000000000110000b   ;XOR
        je type_4
        inc si
        cmp ax, 1000000000111000b   ;CMP
        je type_4
        inc si
        cmp ax, 1100010000000000b   ;MOV
        je tp4_4
        inc si
        cmp ax, 1111010000000000b   ;TEST
        je tp4_4
        jmp tp20
        tp4_4:
        mov ax, [var_opcd2]
        and ax, 1111110111111111b
        mov [var_opcd2], ax
        jmp type_4
    ;***
        jmp tp20
        type_4:
        call TYPE4
        jmp recclose
        tp20:

    ;TYPEMOVSRRM
        mov ax, [var_opcd2]
        and ax, 1111110100100000b
        cmp ax, 1000110000000000b ;MOV sr <> r/m
        jne tp21
        call TYPEMOVSRRM
        jmp recclose
    ;**

        tp21:

    ;TYPEPOPRM
        mov ax, [var_opcd2]
        and ax, 1111111100111000b
        cmp ax, 1000111100000000b ;POP r/m
        jne tp22
        call TYPEPOPRM
        jmp recclose
    ;**

        tp22:

    ;TYPE9
        xor si, si
        mov ax, [var_opcd2]
        and ax, 1111110000111000b
        cmp ax, 1101000000000000b ;ROL
        je type_9
        inc si
        cmp ax, 1101000000001000b ;ROR
        je type_9
        inc si
        cmp ax, 1101000000010000b ;RCL
        je type_9
        inc si
        cmp ax, 1101000000011000b ;RCR
        je type_9
        inc si
        cmp ax, 1101000000100000b ;SHL
        je type_9
        inc si
        cmp ax, 1101000000101000b ;SHR
        je type_9
        inc si
        cmp ax, 1101000000111000b ;SAR
        je type_9

    ;***

        jmp tp23
        type_9:
        call TYPE9
        jmp recclose
        tp23:

    ;TYPE10
        xor si, si
        mov ax, [var_opcd2]
        and ax, 1111111000111000b 
        cmp ax, 1111011000010000b ;NOT
        je type_10
        inc si
        cmp ax, 1111011000011000b ;NEG
        je type_10
        inc si
        cmp ax, 1111011000100000b ;MUL
        je type_10
        inc si
        cmp ax, 1111011000101000b ;IMUL
        je type_10
        inc si
        cmp ax, 1111011000110000b ;DIV
        je type_10
        inc si
        cmp ax, 1111011000111000b ;IDIV
        je type_10
        inc si
        cmp ax, 1111111000000000b ;INC
        je type_10
        inc si
        cmp ax, 1111111000001000b ;DEC
        je type_10
        inc si
        cmp ax, 1111111000010000b ;CALL (vidinis netiesioginis)
        je type_10
        inc si
        cmp ax, 1111111000011000b ;CALL (irosinis netiesioginis)
        je type_10
        inc si
        cmp ax, 1111111000100000b ;JMP (vidinis netiesioginis)
        je type_10
        inc si
        cmp ax, 1111111000101000b ;JMP (isorinis netiesioginis)
        je type_10
        inc si
        cmp ax, 1111111000110000b ;PUSH r/m
        je type_10
    ;**

        jmp tp24
        type_10:
        call TYPE10
        jmp recclose
        tp24:

    ;TYPE1
        mov si, 29
        mov ax, [var_opcd2]
        cmp ax, 1101010000001010b ;AAM
        je type1_2
        inc si
        cmp ax, 1101010100001010b ;AAD
        je type1_2
    ;***

        jmp tp25
        type1_2:
        call TYPE1
        jmp recclose
        tp25:

    ;UKNOWN
    mov bx, offset com_unknown
    call MAKENICE
    call ADDSPACE
    call ADDNAME
    call ADDENTER
    call PRINTOUT
    call INCCS
    jmp recclose

    recclose:
    ret
RECOGNISE ENDP

TYPE1 PROC NEAR
    mov al, [var_opcd]
    call COMNAMEPOS
    call MAKENICE
    call ADDSPACE
    mov bx, offset com_type_1
    add bx, si
    call ADDNAME
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE1 ENDP 

TYPE2 PROC NEAR
    mov al, [var_opcd]
    call COMNAMEPOS
    mov bx, offset com_type_2
    add bx, si
    call MAKENICE
    call ADDSPACE
    call ADDNAME
    call NIBBLE
    mov [var_w], 1
    and al, 00000111b
    mov [var_reg], al
    call GETREGNAME
    call ADDSPACE
    call ADDNAME
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE2 ENDP

TYPE20 PROC NEAR
    mov [var_mod], 2
    call GETPOS
    call MAKENICE
    call ADDSPACE
    call COMNAMEPOS
    mov bx, offset com_cll
    add bx, si
    call ADDNAME
    call ADDSPACE
    mov ah, [var_pos_1]
    mov al, [var_pos_2]
    add ax, 3
    add ax, di
    mov bh, al
    mov al, ah
    call ADDNUMBERTOBUFF
    mov al, bh
    call ADDNUMBERTOBUFF
    call ADDH
    call ADDENTER
    call PRINTOUT
    call INCCS
    RET
TYPE20 ENDP 

TYPE3 PROC NEAR
    mov [dsv], 1
    call GETDSVW
    call GETBYTE
    call GETMOD
    call GETREG
    call GETRM
    cmp [var_mod], 1
    je t3_1pos
    cmp [var_mod], 2
    je t3_2pos
    cmp [var_mod], 0
    jne t3_out
    cmp [var_rm], 6
    je t3_2pos
    jmp t3_out

    t3_1pos:
    call GETBYTE
    mov [var_pos_2], al
    jmp t3_out
    t3_2pos:
    call GETBYTE
    mov [var_pos_2], al
    call GETBYTE
    mov [var_pos_1], al

    t3_out:
    call COMNAMEPOS
    mov bx, offset com_type_3
    add bx, si
    call MAKENICE
    call ADDSPACE
    call ADDNAME
    ;Tvarkom isvedima
    cmp [var_d], 1
    je t3_d1
    call FREGTRM
    jmp t3_end
    t3_d1:
    call FRMTREG
    t3_end:
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE3 ENDP

TYPE4 PROC NEAR
    mov ax, [var_opcd2]
    mov [dsv], 2
    mov al, ah
    xor ah, ah
    call GETDSVW
    mov ax, [var_opcd2]
    xor ah, ah
    call GETMOD
    call GETRM
    call GETPOS
    call GETBO

    call COMNAMEPOS
    mov bx, offset com_type_3
    add bx, si
    call MAKENICE
    call ADDSPACE
    call ADDNAME
    call FBOTRM
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE4 ENDP

TYPE5 PROC NEAR
    call GETBYTE
    call MAKENICE
    call ADDSPACE
    call COMNAMEPOS
    mov bx, offset com_type_5
    add bx, si
    call ADDNAME
    call ADDSPACE
    cmp al, 80h
    jle type5_add
    push ax
    and al, 10000000b
    cmp al, 10000000b
    je type5_FF
    pop ax
    jmp type5_add
    type5_FF:
    pop ax
    mov ah, 0FFh
    type5_add:
    add ax, di
    add ax, 2
    mov bh, al
    mov al, ah
    call ADDNUMBERTOBUFF
    mov al, bh
    call ADDNUMBERTOBUFF
    call ADDH
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE5 ENDP

TYPE6 PROC NEAR
    mov al, [var_opcd]
    cmp al, 11000010b
    jb notret
    mov [var_w], 1
    jmp type6_bo
    notret:
    call GETDSVW
    type6_bo:
    call GETBO
    call MAKENICE
    call ADDSPACE
    call COMNAMEPOS
    mov bx, offset com_type_3
    add bx, si
    call ADDNAME
    call ADDSPACE
    cmp al, 11000010b
    jae retai
    cmp [var_w], 1
    je type6_w1
    mov bx, offset reg_w0
    jmp type6_add
    type6_w1:
    mov bx, offset reg_w1
    type6_add:
    call ADDNAME
    call ADDCOMMA
    call ADDSPACE
    retai:
    call ADDBO
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE6 ENDP

TYPE7 PROC NEAR
    mov al, [var_opcd]
    and al, 00011000b
    xor ah, ah
    shr al, 3
    call COMNAMEPOS
    mov bx, offset com_type_7
    add bx, si
    call MAKENICE
    call ADDSPACE
    call ADDNAME
    call ADDSPACE
    mov bl, 3
    mul bl
    mov bx, offset reg_seg
    add bx, ax
    call ADDNAME
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE7 ENDP

TYPE8 PROC NEAR
    mov al, [var_opcd]
    call GETDSVW
    call COMNAMEPOS
    cmp [var_w], 1
    je type8_w1
    mov bx, offset com_type_8_b
    add bx, si
    jmp type8_add
    type8_w1:
    mov bx, offset com_type_8_w
    add bx, si
    type8_add:
    call MAKENICE
    call ADDSPACE
    call ADDNAME
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE8 ENDP

TYPE9 PROC NEAR
    mov ax, [var_opcd2]
    mov al, ah
    xor ah, ah
    mov [dsv], 3
    call GETDSVW
    mov ax, [var_opcd2]
    xor ah, ah
    call GETMOD
    call GETRM
    call GETPOS
    call MAKENICE
    call COMNAMEPOS
    call ADDSPACE
    mov bx, offset com_type_9
    add bx, si
    call ADDNAME
    call ADDSPACE
    call PUTRM
    cmp [var_v], 1
    jne type9_end
    call ADDCOMMA
    call ADDSPACE
    mov bx, offset reg_cl
    call ADDNAME
    type9_end:
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE9 ENDP

TYPE10 PROC NEAR
    mov ax, [var_opcd2]
    mov al, ah
    call GETDSVW
    mov ax, [var_opcd2]
    xor ah, ah
    call GETMOD
    call GETRM
    call GETPOS
    call MAKENICE
    call COMNAMEPOS
    call ADDSPACE
    mov bx, offset com_type_10
    add bx, si
    call ADDNAME
    call ADDSPACE
    call PUTRM
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPE10 ENDP

TYPEINOUT PROC NEAR
    mov al, [var_opcd]
    call GETDSVW
    and al, 11111110b
    cmp al, 11101100b
    jae typeio_1
    call GETBYTE
    mov [var_pos_2], al
    mov al, [var_opcd]
    typeio_1:
    call MAKENICE
    call ADDSPACE
    call COMNAMEPOS
    mov bx, offset com_type_io
    add bx, si
    call ADDNAME
    call ADDSPACE

    and al, 11111110b
    cmp al, 11100110b
    je typeio_o
    cmp al, 11101110b
    je typeio_o
    
    call typeio_ax
    call ADDCOMMA
    call ADDSPACE
    call typeio_port
    jmp typeio_end

    typeio_o:
    call typeio_port
    call ADDCOMMA
    call ADDSPACE
    call typeio_ax

    typeio_end:
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
    
    typeio_ax:
    cmp [var_w], 1
    je typeio_w1
    mov bx, offset reg_w0
    jmp typeio_2
    typeio_w1:
    mov bx, offset reg_w1
    typeio_2:
    call ADDNAME
    ret

    typeio_port:
    cmp al, 11101100b
    jl typeio_3
    mov bx, offset reg_dx
    call ADDNAME
    ret
    typeio_3:
    mov al, [var_pos_2]
    call ADDNUMBERTOBUFF
    ret
TYPEINOUT ENDP

TYPEMOVSRRM PROC NEAR
    mov ax, [var_opcd2]
    and ah, 00000010b
    shr ah, 1
    mov [var_d], ah
    xor ah, ah
    call GETMOD
    call GETRM
    call GETPOS
    call MAKENICE
    call ADDSPACE
    mov bx, offset com_mov
    call ADDNAME
    call ADDSPACE
    and al, 00011000b
    shr al, 3
    mov bl, 3
    mul bl
    mov bx, offset reg_seg
    add bx, ax
    call ADDNAME
    call ADDCOMMA
    call ADDSPACE
    mov [var_w], 1
    call PUTRM
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPEMOVSRRM ENDP

TYPEPOPRM PROC NEAR
    mov ax, [var_opcd2]
    xor ah, ah
    call GETMOD
    call GETRM
    call GETPOS
    call MAKENICE
    call ADDSPACE
    mov bx, offset com_pop
    call ADDNAME
    call ADDSPACE
    mov [var_w], 1
    call PUTRM
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPEPOPRM ENDP 

TYPECLL PROC NEAR
    call GETBYTE
    mov [var_pos_2], al
    call GETBYTE
    mov [var_pos_1], al
    call GETBYTE
    mov [var_bo_2], al
    call GETBYTE
    mov [var_bo_1], al
    call MAKENICE
    call ADDSPACE
    call COMNAMEPOS
    mov bx, offset com_cll
    add bx, si
    call ADDNAME
    call ADDSPACE
    mov al, [var_bo_1]
    call ADDNUMBERTOBUFF
    mov al, [var_bo_2]
    call ADDNUMBERTOBUFF
    call ADDDOTS
    mov al, [var_pos_1]
    call ADDNUMBERTOBUFF
    mov al, [var_pos_2]
    call ADDNUMBERTOBUFF
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret 
TYPECLL ENDP

TYPEMOVAK PROC NEAR
    mov al, [var_opcd]
    mov [var_s], 0
    mov [var_w], 1
    call GETBO
    call GETDSVW
    call MAKENICE
    call ADDSPACE
    mov bx, offset com_mov
    call ADDNAME
    call ADDSPACE

    cmp [var_w], 1
    je typemovak_w1
    mov bx, offset reg_w0
    jmp typemovak_add
    typemovak_w1:
    mov bx, offset reg_w1
    typemovak_add:

    and al, 00000010b
    cmp al, 00000010b
    je movatak
    call ADDNAME
    call ADDCOMMA
    call ADDSPACE
    call ADDBYTEPTR
    call ADDPREFIX
    call ADDLBRACK
    mov [var_w], 1
    call ADDBO
    call ADDRBRACK
    jmp movak_end
    movatak:
    call ADDBYTEPTR
    call ADDPREFIX
    call ADDLBRACK
    mov [var_w], 1
    call ADDBO
    call ADDRBRACK
    call ADDCOMMA
    call ADDSPACE
    call ADDNAME

    movak_end:
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPEMOVAK ENDP

TYPEMOVREGBO PROC NEAR
    mov al, [var_opcd]
    and al, 00001000b
    shr al, 3
    mov [var_w], al
    mov al, [var_opcd]
    and al, 00000111b
    mov [var_reg], al
    call GETBO
    call MAKENICE
    call ADDSPACE
    mov bx, offset com_mov
    call ADDNAME
    call ADDSPACE
    call GETREGNAME
    call ADDNAME
    call ADDCOMMA
    call ADDSPACE
    call ADDBO
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPEMOVREGBO ENDP

TYPEXCHG PROC NEAR
    mov al, [var_opcd]
    and al, 00000111b
    mov [var_reg], al
    call MAKENICE
    call ADDSPACE
    mov bx, offset com_xchg
    call ADDNAME
    call ADDSPACE
    mov bx, offset reg_w1
    call ADDNAME
    call ADDCOMMA
    call ADDSPACE
    mov [var_w], 1
    call GETREGNAME
    call ADDNAME
    call ADDENTER
    call PRINTOUT
    call INCCS
    ret
TYPEXCHG ENDP

;*******************************************************TOOLS***********************************************************
COMNAMEPOS PROC NEAR ;To si from si
    push ax
    push bx
    xor ax, ax
    mov ax, si
    mov bl, 6
    mul bl
    mov si, ax
    pop bx
    pop ax
    ret
COMNAMEPOS ENDP

GETBO PROC NEAR
    push ax
    cmp [var_w], 0
    je bo_w0
    cmp [var_s], 0
    je bo_s0

    call GETBYTE
    mov [var_bo_2], al
    and al, 10000000b
    cmp al, 10000000b
    je bo_fill1
    mov [var_bo_1], 0
    jmp bo_end
    bo_fill1:
    mov [var_bo_1], 0FFh
    jmp bo_end
    bo_s0:
    call GETBYTE
    mov [var_bo_2], al
    call GETBYTE
    mov [var_bo_1], al
    jmp bo_end

    bo_w0:
    call GETBYTE
    mov [var_bo_2], al

    bo_end:
    pop ax
    ret
GETBO ENDP

GETPOS PROC NEAR
    push ax

    cmp [var_mod], 1
    je t4_1pos
    cmp [var_mod], 2
    je t4_2pos
    cmp [var_mod], 0
    jne t4_out
    cmp [var_rm], 6
    je t4_2pos
    jmp t4_out

    t4_1pos:
    call GETBYTE
    mov [var_pos_2], al
    jmp t4_out
    t4_2pos:
    call GETBYTE
    mov [var_pos_2], al
    call GETBYTE
    mov [var_pos_1], al
    t4_out:

    pop ax
    ret
GETPOS ENDP

GETMOD PROC NEAR
    push ax
    call NIBBLE
    and ah, 1100b
    shr ah, 2
    mov [var_mod], ah
    pop ax
    ret
GETMOD ENDP

GETREG PROC NEAR
    push ax
    and ax, 00111000b
    shr ax, 3
    mov [var_reg], al
    pop ax
    ret
GETREG ENDP

GETRM PROC NEAR
    push ax
    and al, 0111b
    mov [var_rm], al
    pop ax
    ret
GETRM ENDP

GETDSVW PROC NEAR ;from al
    push ax

    and al, 0010b

    cmp [dsv], 1
    jne dsv2
    cmp al, 0010b
    je one1
    mov [var_d], 0
    jmp ww
    one1:
    mov [var_d], 1
    jmp ww

    dsv2:
    cmp [dsv], 2
    jne dsv3
    cmp al, 0010b
    je one2
    mov [var_s], 0
    jmp ww
    one2:
    mov [var_s], 1
    jmp ww

    dsv3:
    cmp [dsv], 3
    jne ww
    cmp al, 0010b
    je one3
    mov [var_v], 0
    jmp ww
    one3:
    mov [var_v], 1
    jmp ww

    ww:
    pop ax
    push ax
    and al, 0001b
    mov [var_w], al

    pop ax
    ret
GETDSVW ENDP

GETRMNAME PROC NEAR ;PUTS RM NAME TO BX 
    push ax
    push dx
    xor ax, ax
    mov al, [var_rm]
    mov dl, 6
    mul dl
    mov bx, offset reg_mem
    add bl, al
    pop dx
    pop ax
    ret
GETRMNAME ENDP

GETREGNAME PROC NEAR ;Puts reg name to bx
    push dx
    push ax
    xor ax, ax
    mov al, [var_reg]
    mov dl, 3
    mul dl

    cmp [var_w], 1
    je words
    mov bx, offset reg_w0
    add bl, al
    jmp getrl
    words:
    mov bx, offset reg_w1
    add bx, ax
    getrl:
    pop ax
    pop dx
    ret
GETREGNAME ENDP

FRMTREG PROC NEAR
    push bx
    push ax
    call GETREGNAME
    call ADDSPACE
    call ADDNAME
    call ADDCOMMA
    call ADDSPACE

    call PUTRM

    rmreg_end:
    pop ax
    pop bx
    ret 
FRMTREG ENDP

FREGTRM PROC NEAR
    push bx
    push ax

    call ADDSPACE
    
    call PUTRM

    regrm_reg:
    call ADDCOMMA
    call ADDSPACE
    call GETREGNAME
    call ADDNAME

    regrm_end:
    pop ax
    pop bx
    ret
FREGTRM ENDP

FBOTRM PROC NEAR
    push ax
    push bx
    call ADDSPACE

    call PUTRM

    borm_bo:
    call ADDCOMMA
    call ADDSPACE
    cmp [var_w], 1
    je borm_w1
    mov al, [var_bo_2]
    call ADDNUMBERTOBUFF
    jmp borm_end
    borm_w1:
    mov al, [var_bo_1]
    call ADDNUMBERTOBUFF
    mov al, [var_bo_2]
    call ADDNUMBERTOBUFF

    borm_end:
    call ADDH
    pop bx
    pop ax
    ret
FBOTRM ENDP

PUTRM PROC NEAR
    push ax
    push bx

    cmp [var_mod], 3
    je putrm_3

    cmp [var_mod], 0
    jne putrm_n
    cmp [var_rm], 6
    je putrm_0

    putrm_n:
    call ADDBYTEPTR
    call ADDPREFIX
    call ADDLBRACK
    call GETRMNAME
    call ADDNAME
    cmp [var_mod], 1
    je putrm_1
    cmp [var_mod], 2
    je putrm_2
    jmp putrm_br

    putrm_1:
    xor ax, ax
    mov al, [var_pos_2]
    call ADDPLUS
    call ADDNUMBERTOBUFF
    call ADDH
    jmp putrm_br
    putrm_2:
    xor ax, ax
    mov al, [var_pos_1]
    call ADDPLUS
    call ADDNUMBERTOBUFF
    xor ax, ax
    mov al, [var_pos_2]
    call ADDNUMBERTOBUFF
    call ADDH

    putrm_br:
    call ADDRBRACK
    jmp putrmend

    putrm_0:
    call ADDBYTEPTR
    call ADDPREFIX
    call ADDLBRACK
    xor ax, ax
    mov al, [var_pos_1]
    call ADDNUMBERTOBUFF
    xor ax, ax
    mov al, [var_pos_2]
    call ADDNUMBERTOBUFF
    call ADDH
    call ADDRBRACK
    jmp putrmend

    putrm_3:
    mov al, [var_reg]
    mov bl, [var_rm]
    mov [var_reg], bl
    call GETREGNAME
    mov [var_reg], al
    call ADDNAME

    putrmend:
    pop bx
    pop ax
    ret
PUTRM ENDP

ADDBO PROC NEAR
    push ax
    cmp [var_w], 1
    je bo_w1
    mov al, [var_bo_2]
    call ADDNUMBERTOBUFF
    jmp addbo_end
    bo_w1:
    mov al, [var_bo_1]
    call ADDNUMBERTOBUFF
    mov al, [var_bo_2]
    call ADDNUMBERTOBUFF
    addbo_end:
    call ADDH
    pop ax
    ret
ADDBO ENDP

ADDPREFIX PROC NEAR ;checks if prefix is needed and puts it to buff
    push bx
    push ax
    xor ax, ax
    cmp [var_rm_pref], 5
    je skippf
    mov al, [var_rm_pref]
    mov bl, 3
    mul bl
    mov bx, offset reg_seg
    add bx, ax

    call ADDNAME
    call ADDDOTS
    skippf:
    pop ax
    pop bx
    ret
ADDPREFIX ENDP

NIBBLE PROC NEAR    ;Splits al into 2 nibbles (ah=1, al=2) 
    push bx
    mov bl, 10h
    div bl
    mov bl, al
    mov al, ah
    mov ah, bl
    pop bx
    ret
NIBBLE ENDP

ADDNAME PROC NEAR ;Command in bx is put to buff
    push cx
    push di
    push ax
    xor cx, cx
    mov di, [out_ind]
    mov cl, [bx]
    inc bx
    cmdnameloop:
    mov al, [bx]
    mov [out_buff+di], al
    inc di
    inc [out_ind]
    inc bx
    loop cmdnameloop

    pop ax
    pop di
    pop cx

    ret
ADDNAME ENDP

HEXTOASCII PROC NEAR ;Change ax to ascii (ah=2nr, al=1nr)
    push bx
    xor ah, ah
    mov bl, 10h
    div bl

    cmp al, 0Ah
    jge letter1
    add al, 30h
    jmp nr2 
    letter1:
    add al, 37h

    nr2:
    cmp ah, 0Ah
    jge letter2
    add ah, 30h
    jmp nr3
    letter2:
    add ah, 37h

    nr3:
    pop bx
    ret
HEXTOASCII ENDP

INCCS PROC NEAR ;How much in cx
    add di, cx
    push di
    csloop:

    mov di, 6
    cmp [out_buff+di], 'F'
    je tens
    jmp ishex
    tens:
    mov [out_buff+di], '0'
    dec di
    cmp [out_buff+di], 'F'
    je hundreds
    jmp ishex
    hundreds:
    mov [out_buff+di], '0'
    dec di
    cmp [out_buff+di], 'F'
    je thousands
    jmp ishex
    thousands:
    mov [out_buff+di], '0'
    dec di

    ishex:
    cmp [out_buff+di], '9'
    je hexletter
    inc [out_buff+di]
    jmp inccsl
    hexletter:
    mov [out_buff+di], 'A'

    inccsl:
    loop csloop
    pop di
    ret
INCCS ENDP

ADDSPACE PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], ' '
    inc [out_ind]
    pop di
    ret
ADDSPACE ENDP

ADDCOMMA PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], ','
    inc [out_ind]
    pop di
    ret
ADDCOMMA ENDP

ADDLBRACK PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], '['
    inc [out_ind]
    pop di
    ret
ADDLBRACK ENDP

ADDRBRACK PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], ']'
    inc [out_ind]
    pop di
    ret
ADDRBRACK ENDP

ADDDOTS PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], ':'
    inc [out_ind]
    pop di
    ret
ADDDOTS ENDP

ADDENTER PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], 13
    mov [out_buff+di+1], 10
    add [out_ind], 2
    pop di
    ret
ADDENTER ENDP

ADDPLUS PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], '+'
    inc [out_ind]
    pop di
    ret
ADDPLUS ENDP

ADDBYTEPTR PROC NEAR
    push bx
    cmp [var_reg], 9
    jne abprtend
    cmp [var_mod], 3
    je abprtend
    cmp [var_w], 1
    je wordptrlab

    mov bx, offset byteptr
    call ADDNAME
    jmp abprtend
    wordptrlab:
    cmp [var_reg], 9
    jne abprtend
    cmp [var_rm_pref], 5
    jne abprtend
    mov bx, offset wordptr
    call ADDNAME

    abprtend:
    pop bx
    ret
ADDBYTEPTR ENDP

ADDH PROC NEAR
    push di
    mov di, [out_ind]
    mov [out_buff+di], 'h'
    inc [out_ind]
    pop di
    ret
ADDH ENDP

ADDNUMBERTOBUFF PROC NEAR ;From al
    push di
    call HEXTOASCII
    mov di, [out_ind]
    mov [out_buff+di], al
    inc [out_ind]
    mov [out_buff+di+1], ah
    inc [out_ind]
    pop di
    ret
ADDNUMBERTOBUFF ENDP

    progEnd:

    mov ah, 3Eh
    mov bx, [file_handle]
    int 21h
    mov bx, [output_handle]
    int 21h

    closeprog:
    mov ax, 4C00h               ;Uzbaigiama programa
    int 21h

end start