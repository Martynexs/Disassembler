.MODEL SMALL
.CODE
ORG 0100h
start:
mov ah, es:[1h]
JZ      mylabel
JZ      mylabel 
JL      mylabel
JLE     mylabel
JB      mylabel
JBE     mylabel
JPE     mylabel
JO      mylabel
JS      mylabel
JNZ     mylabel
JNZ     mylabel
JGE     mylabel
JG      mylabel
JAE     mylabel
JA      mylabel
JPO     mylabel
JNO     mylabel
JNS     mylabel
LOOP    mylabel
LOOPZ   mylabel
LOOPZ   mylabel
LOOPNZ  mylabel
LOOPNZ  mylabel
JCXZ    mylabel
CALL    labelle
CALL    WORD PTR [BX]
CALL    WORD PTR [BX+78h]
CALL    WORD PTR [BX+3456h]
CALL    WORD PTR [BX+SI]
CALL    WORD PTR [BX+SI+79h]
CALL    WORD PTR [BX+SI+5678h]
CALL    WORD PTR [BX+DI]
CALL    WORD PTR [BX+DI+29h]
CALL    WORD PTR [BX+DI+5678h]
CALL    WORD PTR [SI]
CALL    WORD PTR [SI+28h]
CALL    WORD PTR [SI+3456h]
CALL    WORD PTR [DI]
CALL    AX
CALL    BX
CALL    CX
CALL    DX
CALL    SP
CALL    DI
CALL    BP
CALL    SI
CALL    BP
DB 		0FFh, 58h, 54h  ;CALL word ptr [BX+SI+54h] Isorinis netiesioginis
call far [BX+DI]
mylabel:
DB      9Ah,45h,22h,56h,34h ; CALL 3456:2245
JMP     labelle
JMP     mylabel
JMP     WORD PTR [BX]
JMP     WORD PTR [BX+78h]
JMP     WORD PTR [BX+3456h]
JMP     WORD PTR [BX+SI]
JMP     WORD PTR [BX+SI+79h]
JMP     WORD PTR [BX+SI+5678h]
JMP     WORD PTR [BX+DI]
JMP     WORD PTR [BX+DI+29h]
JMP     WORD PTR [BX+DI+5678h]
JMP     WORD PTR [SI]
JMP     WORD PTR [SI+28h]
JMP     WORD PTR [SI+3456h]
JMP     WORD PTR [DI]
JMP     AX
JMP     BX
JMP     CX
JMP     DX
JMP     SP
JMP     DI
JMP     BP
JMP     SI
JMP     BP
DB 		0FFh, 68h, 54h  ;JMP word ptr [BX+SI+54h] Isorinis netiesioginis
DB 		0EAh,45h,22h,56h,34h ; JMP 3456:2245
RET
RET     0123h
RETF
RETF    2345h
INT     3
INTO
INT     21h
INT     80h
DB      8Bh, 0Eh, 54h, 89h ;MOV CX, [8954h]
MOV     CX,[BX]
MOV     DX,[BX+78h]
MOV     BX,[BX+3456h]
MOV     SI,[BX+SI]
MOV     DI,[BX+SI+79h]
MOV     BP,[BX+SI+5678h]
MOV     SI,[BX+DI]
MOV     DI,[BX+DI+29h]
MOV     BP,[BX+DI+5678h]
MOV     SP,[SI]
MOV     DX,[SI+28h]
MOV     BX,[SI+3456h]
MOV     AX,[DI]
MOV     DX,[DI+58h]
MOV     BX,[DI+3456h]
MOV     CX,[BP+00h]
MOV     DX,[BP+58h]
MOV     BX,[BP+3456h]
MOV     SI,[BP+SI]
MOV     DI,[BP+SI+39h]
MOV     BP,[BP+SI+5678h]
MOV     SI,[BP+DI]
MOV     DI,[BP+DI+49h]
MOV     BP,[BP+DI+5678h]
MOV     [BX],CX
MOV     [BX+78h],DX
MOV     [BX+3456h],BX
MOV     [BX+SI],AX
MOV     [BX+SI+69h],SP
MOV     [BX+SI+5678h],DI
MOV     [BX+DI],BP
MOV     [BX+DI+49h],SI
MOV     [BX+DI+5678h],DI
MOV     [SI],AX
MOV     [SI+78h],CX
MOV     [SI+3456h],DX
MOV     [DI],BP
MOV     [DI+78h],SP
MOV     [DI+3456h],SI
MOV     [BP+00h],DI
MOV     [BP+78h],CX
MOV     [BP+3456h],DX
MOV     [BP+SI],SI
MOV     [BP+SI+59h],DI
MOV     [BP+SI+5678h],AX
MOV     [BP+DI],DI
MOV     [BP+DI+19h],BX
MOV     [BP+DI+5678h],DX
MOV     AL,[DI]
MOV     AH,[DI+78h]
MOV     BH,[DI+3456h]
MOV     CL,[BP+00h]
MOV     DL,[BP+78h]
MOV     BL,[BP+3456h]
MOV     CH,[BP+SI]
MOV     [DI+78h],DH
MOV     [DI+3456h],DL
MOV     [BP+00h],CH
MOV     [BP+56h],CL
MOV     [BP+3456h],BH
MOV     [BP+SI],BL
MOV     [BP+SI+45h],AH
MOV     [BP+SI+5678h],AL
MOV     BYTE PTR [DI+78h],15h
MOV     BYTE PTR [DI+3456h],16h
MOV     BYTE PTR [BP+00h],28h
MOV     BYTE PTR [BP+56h],88h
MOV     WORD PTR [BP+3456h],1234h
MOV     WORD PTR [BP+SI],3415h
MOV     WORD PTR [BP+SI+45h],4785h
MOV     WORD PTR [BP+SI+5678h],1536h
MOV     AL,15h
MOV     AH,16h
MOV     CL,28h
MOV     DH,88h
MOV     BX,1234h
MOV     SI,3415h
MOV     SP,4785h
MOV     BP,1536h
MOV     BP,5412h
MOV     SS,WORD PTR [BX+3456h]
MOV     ES,WORD PTR [BX+SI]
MOV     DS,WORD PTR [BX+SI+69h]
SHL     WORD PTR [BX],1
SHL     BYTE PTR [BX+78h],CL
SHL     WORD PTR [BX+3456h],1
SHL     DI,CL
SHL     BYTE PTR [BX+SI+69h],1
SHL     WORD PTR [BX+SI+5678h],CL
SHL     WORD PTR [BX+DI],1
SHL     WORD PTR [BX+DI+49h],CL
SHL     SI,1
SHL     BYTE PTR [SI],CL
SHL     WORD PTR [SI+78h],1
SHL     BYTE PTR [SI+3456h],CL
SHL     WORD PTR [DI],1
SHL     BYTE PTR [DI+78h],CL
SHL     WORD PTR [DI+3456h],1
SHL     WORD PTR [BP+00h],CL
SHL     WORD PTR [BP+78h],1
SHL     DH,CL
SHL     BYTE PTR [BP+SI],1
SHL     WORD PTR [BP+SI+59h],CL
SHL     WORD PTR [BP+SI+5678h],1
SHL     BYTE PTR [BP+DI],CL
SHL     WORD PTR [BP+DI+19h],1
SHL     WORD PTR [BP+DI+5678h],CL
SHR     WORD PTR [BX],1
SHR     BYTE PTR [BX+78h],CL
SHR     WORD PTR [BX+3456h],1
SHR     WORD PTR [BX+SI],CL
SHR     BYTE PTR [BX+SI+69h],1
SHR     WORD PTR [BX+SI+5678h],CL
SHR     WORD PTR [BX+DI],1
SHR     WORD PTR [BX+DI+49h],CL
SHR     WORD PTR [BX+DI+5678h],1
SHR     BYTE PTR [SI],CL
SHR     WORD PTR [SI+78h],1
SHR     BYTE PTR [SI+3456h],CL
SHR     WORD PTR [DI],1
SHR     AL,CL
SHR     WORD PTR [DI+3456h],1
SHR     WORD PTR [BP+00h],CL
SHR     WORD PTR [BP+78h],1
SHR     CX,CL
SHR     BYTE PTR [BP+SI],1
SHR     WORD PTR [BP+SI+59h],CL
SHR     WORD PTR [BP+SI+5678h],1
SHR     BYTE PTR [BP+DI],CL
SHR     BP,1
SHR     WORD PTR [BP+DI+5678h],CL
ROL     WORD PTR [BX],1
ROL     BYTE PTR [BX+78h],CL
ROL     WORD PTR [BX+3456h],1
ROL     DI,CL
ROL     BYTE PTR [BX+SI+69h],1
ROL     WORD PTR [BX+SI+5678h],CL
ROL     WORD PTR [BX+DI],1
ROL     WORD PTR [BX+DI+49h],CL
ROL     SI,1
ROL     BYTE PTR [SI],CL
ROL     WORD PTR [SI+78h],1
ROL     BYTE PTR [SI+3456h],CL
ROL     WORD PTR [DI],1
ROL     BYTE PTR [DI+78h],CL
ROL     WORD PTR [DI+3456h],1
ROL     WORD PTR [BP+00h],CL
ROL     WORD PTR [BP+78h],1
ROL     DH,CL
ROL     BYTE PTR [BP+SI],1
ROL     WORD PTR [BP+SI+59h],CL
ROL     WORD PTR [BP+SI+5678h],1
ROL     BYTE PTR [BP+DI],CL
ROL     WORD PTR [BP+DI+19h],1
ROL     WORD PTR [BP+DI+5678h],CL
ROR     WORD PTR [BX],1
ROR     BYTE PTR [BX+78h],CL
ROR     WORD PTR [BX+3456h],1
ROR     DI,CL
ROR     BYTE PTR [BX+SI+69h],1
ROR     WORD PTR [BX+SI+5678h],CL
ROR     WORD PTR [BX+DI],1
ROR     WORD PTR [BX+DI+49h],CL
ROR     SI,1
ROR     BYTE PTR [SI],CL
ROR     WORD PTR [SI+78h],1
ROR     BYTE PTR [SI+3456h],CL
ROR     WORD PTR [DI],1
ROR     BYTE PTR [DI+78h],CL
ROR     WORD PTR [DI+3456h],1
ROR     WORD PTR [BP+00h],CL
ROR     WORD PTR [BP+78h],1
ROR     DH,CL
ROR     BYTE PTR [BP+SI],1
ROR     WORD PTR [BP+SI+59h],CL
ROR     WORD PTR [BP+SI+5678h],1
ROR     BYTE PTR [BP+DI],CL
ROR     WORD PTR [BP+DI+19h],1
ROR     WORD PTR [BP+DI+5678h],CL
RCR     WORD PTR [BX],1
RCR     BYTE PTR [BX+78h],CL
RCR     WORD PTR [BX+3456h],1
RCR     DI,CL
RCR     BYTE PTR [BX+SI+69h],1
RCR     WORD PTR [BX+SI+5678h],CL
RCR     WORD PTR [BX+DI],1
RCR     WORD PTR [BX+DI+49h],CL
RCR     SI,1
RCR     BYTE PTR [SI],CL
RCR     WORD PTR [SI+78h],1
RCR     BYTE PTR [SI+3456h],CL
RCR     WORD PTR [DI],1
RCR     BYTE PTR [DI+78h],CL
RCR     WORD PTR [DI+3456h],1
RCR     WORD PTR [BP+00h],CL
RCR     WORD PTR [BP+78h],1
RCR     DH,CL
RCR     BYTE PTR [BP+SI],1
RCR     WORD PTR [BP+SI+59h],CL
RCR     WORD PTR [BP+SI+5678h],1
RCR     BYTE PTR [BP+DI],CL
RCR     WORD PTR [BP+DI+19h],1
RCR     WORD PTR [BP+DI+5678h],CL
RCL     WORD PTR [BX],1
RCL     BYTE PTR [BX+78h],CL
RCL     WORD PTR [BX+3456h],1
RCL     DI,CL
RCL     BYTE PTR [BX+SI+69h],1
RCL     WORD PTR [BX+SI+5678h],CL
RCL     WORD PTR [BX+DI],1
RCL     WORD PTR [BX+DI+49h],CL
RCL     SI,1
RCL     BYTE PTR [SI],CL
RCL     WORD PTR [SI+78h],1
RCL     BYTE PTR [SI+3456h],CL
RCL     WORD PTR [DI],1
RCL     BYTE PTR [DI+78h],CL
RCL     WORD PTR [DI+3456h],1
RCL     WORD PTR [BP+00h],CL
RCL     WORD PTR [BP+78h],1
RCL     DH,CL
RCL     BYTE PTR [BP+SI],1
RCL     WORD PTR [BP+SI+59h],CL
RCL     WORD PTR [BP+SI+5678h],1
RCL     BYTE PTR [BP+DI],CL
RCL     WORD PTR [BP+DI+19h],1
RCL     WORD PTR [BP+DI+5678h],CL
NOT     BP
NOT     WORD PTR [BP+58h]
NOT     WORD PTR [BP+3456h]
NOT     CX
NOT     WORD PTR [BP+SI+39h]
NOT     WORD PTR [BP+SI+5678h]
NOT     DX
NOT     WORD PTR [BP+DI+49h]
NOT     SI
NOT     BYTE PTR [DI+78h]
NOT     BYTE PTR [DI+3456h]
NOT     DH
NOT     BYTE PTR [BP+78h]
NOT     BYTE PTR [BP+3456h]
NOT     AH
NOT     BL
NOT     BYTE PTR [DI+3456h]
AND     CX,[BX]
AND     DX,[BX+78h]
AND     BX,[BX+3456h]
AND     SI,[BX+SI]
AND     DI,[BX+SI+79h]
AND     BP,[BX+SI+5678h]
AND     SI,[BX+DI]
AND     DI,[BX+DI+29h]
AND     BP,[BX+DI+5678h]
AND     SP,[SI]
AND     DX,[SI+28h]
AND     BX,[SI+3456h]
AND     AX,[DI]
AND     DX,[DI+58h]
AND     BX,[DI+3456h]
AND     CX,[BP+00h]
AND     DX,[BP+58h]
AND     BX,[BP+3456h]
AND     SI,[BP+SI]
AND     DI,[BP+SI+39h]
AND     BP,[BP+SI+5678h]
AND     SI,[BP+DI]
AND     DI,[BP+DI+49h]
AND     BP,[BP+DI+5678h]
AND     [BX],CX
AND     [BX+78h],DX
AND     [BX+3456h],BX
AND     [BX+SI],AX
AND     [BX+SI+69h],SP
AND     [BX+SI+5678h],DI
AND     [BX+DI],BP
AND     [BX+DI+49h],SI
AND     [BX+DI+5678h],DI
AND     [SI],AX
AND     [SI+78h],CX
AND     [SI+3456h],DX
AND     [DI],BP
AND     [DI+78h],SP
AND     [DI+3456h],SI
AND     [BP+00h],DI
AND     [BP+78h],CX
AND     [BP+3456h],DX
AND     [BP+SI],SI
AND     [BP+SI+59h],DI
AND     [BP+SI+5678h],AX
AND     [BP+DI],DI
AND     [BP+DI+19h],BX
AND     [BP+DI+5678h],DX
AND     AL,[DI]
AND     AH,[DI+78h]
AND     BH,[DI+3456h]
AND     CL,[BP+00h]
AND     DL,[BP+78h]
AND     BL,[BP+3456h]
AND     CH,[BP+SI]
AND     [DI+78h],DH
AND     [DI+3456h],DL
AND     [BP+00h],CH
AND     [BP+56h],CL
AND     [BP+3456h],BH
AND     [BP+SI],BL
AND     [BP+SI+45h],AH
AND     [BP+SI+5678h],AL
AND     BYTE PTR [DI+78h],15h
AND     BYTE PTR [DI+3456h],16h
AND     BYTE PTR [BP+00h],28h
AND     BYTE PTR [BP+56h],88h
AND     WORD PTR [BP+3456h],1234h
AND     WORD PTR [BP+SI],3415h
AND     WORD PTR [BP+SI+45h],4785h
AND     WORD PTR [BP+SI+5678h],1536h
AND     CL,15h
AND     CH,16h
AND     DL,28h
AND     AH,88h
AND     BX,1234h
AND     DI,3415h
AND     SP,4785h
AND     BP,1536h
AND     AL,15h
AND     AX,1615h
TEST    [BX],CX
TEST    [BX+78h],DX
TEST    [BX+3456h],BX
TEST    [BX+SI],SI
TEST    [BX+SI+79h],DI
TEST    [BX+SI+5678h],BP
TEST    [BX+DI],SI
TEST    [BX+DI+29h],DI
TEST    [BX+DI+5678h],BP
TEST    [SI],SP
TEST    [SI+28h],DX
TEST    [SI+3456h],BX
TEST    [DI],AX
TEST    [DI+58h],DX
TEST    [DI+3456h],BX
TEST    [BP+00h],CX
TEST    [BP+58h],DX
TEST    [BP+3456h],BX
TEST    [BP+SI],SI
TEST    [BP+SI+39h],DI
TEST    [BP+SI+5678h],BP
TEST    [BP+DI],SI
TEST    [BP+DI+49h],DI
TEST    [BP+DI+5678h],BP
TEST    [BX],CX
TEST    [BX+78h],DX
TEST    [BX+3456h],BX
TEST    [BX+SI],AX
TEST    [BX+SI+69h],SP
TEST    [BX+SI+5678h],DI
TEST    [BX+DI],BP
TEST    [BX+DI+49h],SI
TEST    [BX+DI+5678h],DI
TEST    [SI],AX
TEST    [SI+78h],CX
TEST    [SI+3456h],DX
TEST    [DI],BP
TEST    [DI+78h],SP
TEST    [DI+3456h],SI
TEST    [BP+00h],DI
TEST    [BP+78h],CX
TEST    [BP+3456h],DX
TEST    [BP+SI],SI
TEST    [BP+SI+59h],DI
TEST    [BP+SI+5678h],AX
TEST    [BP+DI],DI
TEST    [BP+DI+19h],BX
TEST    [BP+DI+5678h],DX
TEST    [DI],AL
TEST    [DI+78h],AH
TEST    [DI+3456h],BH
TEST    [BP+00h],CL
TEST    [BP+78h],DL
TEST    [BP+3456h],BL
TEST    [BP+SI],CH
TEST    [DI+78h],DH
TEST    [DI+3456h],DL
TEST    [BP+00h],CH
TEST    [BP+56h],CL
TEST    [BP+3456h],BH
TEST    [BP+SI],BL
TEST    [BP+SI+45h],AH
TEST    [BP+SI+5678h],AL
TEST    BYTE PTR [DI+78h],15h
TEST    BYTE PTR [DI+3456h],16h
TEST    BYTE PTR [BP+00h],28h
TEST    BYTE PTR [BP+56h],88h
TEST    WORD PTR [BP+3456h],1234h
TEST    WORD PTR [BP+SI],3415h
TEST    WORD PTR [BP+SI+45h],4785h
TEST    WORD PTR [BP+SI+5678h],1536h
TEST    CL,15h
TEST    CH,16h
TEST    DL,28h
TEST    AH,88h
TEST    BX,1234h
TEST    DI,3415h
TEST    SP,4785h
TEST    BP,1536h
TEST    AL,15h
TEST    AX,1615h
OR      CX,[BX]
OR      DX,[BX+78h]
OR      BX,[BX+3456h]
OR      SI,[BX+SI]
OR      DI,[BX+SI+79h]
OR      BP,[BX+SI+5678h]
OR      SI,[BX+DI]
OR      DI,[BX+DI+29h]
OR      BP,[BX+DI+5678h]
OR      SP,[SI]
OR      DX,[SI+28h]
OR      BX,[SI+3456h]
OR      AX,[DI]
OR      DX,[DI+58h]
OR      BX,[DI+3456h]
OR      CX,[BP+00h]
OR      DX,[BP+58h]
OR      BX,[BP+3456h]
OR      SI,[BP+SI]
OR      DI,[BP+SI+39h]
OR      BP,[BP+SI+5678h]
OR      SI,[BP+DI]
OR      DI,[BP+DI+49h]
OR      BP,[BP+DI+5678h]
OR      [BX],CX
OR      [BX+78h],DX
OR      [BX+3456h],BX
OR      [BX+SI],AX
OR      [BX+SI+69h],SP
OR      [BX+SI+5678h],DI
OR      [BX+DI],BP
OR      [BX+DI+49h],SI
OR      [BX+DI+5678h],DI
OR      [SI],AX
OR      [SI+78h],CX
OR      [SI+3456h],DX
OR      [DI],BP
OR      [DI+78h],SP
OR      [DI+3456h],SI
OR      [BP+00h],DI
OR      [BP+78h],CX
OR      [BP+3456h],DX
OR      [BP+SI],SI
OR      [BP+SI+59h],DI
OR      [BP+SI+5678h],AX
OR      [BP+DI],DI
OR      [BP+DI+19h],BX
OR      [BP+DI+5678h],DX
OR      AL,[DI]
OR      AH,[DI+78h]
OR      BH,[DI+3456h]
OR      CL,[BP+00h]
OR      DL,[BP+78h]
OR      BL,[BP+3456h]
OR      CH,[BP+SI]
OR      [DI+78h],DH
OR      [DI+3456h],DL
OR      [BP+00h],CH
OR      [BP+56h],CL
OR      [BP+3456h],BH
OR      [BP+SI],BL
OR      [BP+SI+45h],AH
OR      [BP+SI+5678h],AL
OR      BYTE PTR [DI+78h],15h
OR      BYTE PTR [DI+3456h],16h
OR      BYTE PTR [BP+00h],28h
OR      BYTE PTR [BP+56h],88h
OR      WORD PTR [BP+3456h],1234h
OR      WORD PTR [BP+SI],3415h
OR      WORD PTR [BP+SI+45h],4785h
OR      WORD PTR [BP+SI+5678h],1536h
OR      CL,15h
OR      CH,16h
OR      DL,28h
OR      AH,88h
OR      BX,1234h
OR      DI,3415h
OR      SP,4785h
OR      BP,1536h
OR      AL,15h
OR      AX,1617h
XOR     CX,[BX]
XOR     DX,[BX+78h]
XOR     BX,[BX+3456h]
XOR     SI,[BX+SI]
XOR     DI,[BX+SI+79h]
XOR     BP,[BX+SI+5678h]
XOR     SI,[BX+DI]
XOR     DI,[BX+DI+29h]
XOR     BP,[BX+DI+5678h]
XOR     SP,[SI]
XOR     DX,[SI+28h]
XOR     BX,[SI+3456h]
XOR     AX,[DI]
XOR     DX,[DI+58h]
XOR     BX,[DI+3456h]
XOR     CX,[BP+00h]
XOR     DX,[BP+58h]
XOR     BX,[BP+3456h]
XOR     SI,[BP+SI]
XOR     DI,[BP+SI+39h]
XOR     BP,[BP+SI+5678h]
XOR     SI,[BP+DI]
XOR     DI,[BP+DI+49h]
XOR     BP,[BP+DI+5678h]
XOR     [BX],CX
XOR     [BX+78h],DX
XOR     [BX+3456h],BX
XOR     [BX+SI],AX
XOR     [BX+SI+69h],SP
XOR     [BX+SI+5678h],DI
XOR     [BX+DI],BP
XOR     [BX+DI+49h],SI
XOR     [BX+DI+5678h],DI
XOR     [SI],AX
XOR     [SI+78h],CX
XOR     [SI+3456h],DX
XOR     [DI],BP
XOR     [DI+78h],SP
XOR     [DI+3456h],SI
XOR     [BP+00h],DI
XOR     [BP+78h],CX
XOR     [BP+3456h],DX
XOR     [BP+SI],SI
XOR     [BP+SI+59h],DI
XOR     [BP+SI+5678h],AX
XOR     [BP+DI],DI
XOR     [BP+DI+19h],BX
XOR     [BP+DI+5678h],DX
XOR     AL,[DI]
XOR     AH,[DI+78h]
XOR     BH,[DI+3456h]
XOR     CL,[BP+00h]
XOR     DL,[BP+78h]
XOR     BL,[BP+3456h]
XOR     CH,[BP+SI]
XOR     [DI+78h],DH
XOR     [DI+3456h],DL
XOR     [BP+00h],CH
XOR     [BP+56h],CL
XOR     [BP+3456h],BH
XOR     [BP+SI],BL
XOR     [BP+SI+45h],AH
XOR     [BP+SI+5678h],AL
XOR     BYTE PTR [DI+78h],15h
XOR     BYTE PTR [DI+3456h],16h
XOR     BYTE PTR [BP+00h],28h
XOR     BYTE PTR [BP+56h],88h
XOR     WORD PTR [BP+3456h],1234h
XOR     WORD PTR [BP+SI],3415h
XOR     WORD PTR [BP+SI+45h],4785h
XOR     WORD PTR [BP+SI+5678h],1536h
XOR     CL,15h
XOR     CH,16h
XOR     DL,28h
XOR     AH,88h
XOR     BX,1234h
XOR     DI,3415h
XOR     SP,4785h
XOR     BP,1536h
XOR     AL,18h
XOR     AX,5677h
LODSB
LODSW
MOVSB
MOVSW
CMPSB
CMPSW
SCASB
SCASW
STOSB
STOSW
REPE    CMPSB
REPNE   CMPSB
CLC
CMC
STC
CLD
STD
CLI
STI
HLT
PUSH    WORD PTR [BX]
PUSH    WORD PTR [BX+78h]
PUSH    WORD PTR [BX+3456h]
PUSH    WORD PTR [BX+SI]
PUSH    WORD PTR [BX+SI+79h]
PUSH    WORD PTR [BX+SI+5678h]
PUSH    WORD PTR [BX+DI]
PUSH    WORD PTR [DI]
PUSH    WORD PTR [DI+58h]
PUSH    WORD PTR [DI+3456h]
PUSH    WORD PTR [BP+00h]
PUSH    WORD PTR [BP+58h]
PUSH    WORD PTR [BP+3456h]
PUSH    WORD PTR [BP+DI+5678h]
PUSH    DS
PUSH    CS
PUSH    SS
PUSH    ES
POP     WORD PTR [BX]
POP     WORD PTR [BX+78h]
POP     WORD PTR [BX+3456h]
POP     WORD PTR [BX+SI]
POP     WORD PTR [BX+SI+79h]
POP     WORD PTR [BX+SI+5678h]
POP     WORD PTR [BX+DI]
POP     WORD PTR [DI]
POP     WORD PTR [DI+58h]
POP     WORD PTR [DI+3456h]
POP     WORD PTR [BP+00h]
POP     WORD PTR [BP+58h]
POP     WORD PTR [BP+3456h]
POP     WORD PTR [BP+DI+5678h]
POP     DS
DB      0Fh
POP     SS
POP     ES
PUSH    AX
PUSH    CX
PUSH    DX
PUSH    BX
PUSH    SP
PUSH    BP
PUSH    SI
PUSH    DI
POP     AX
POP     CX
POP     DX
POP     BX
POP     SP
POP     BP
POP     SI
POP     DI
XCHG    AH,AL
XCHG    AH,CL
XCHG    BL,AL
XCHG    CH,DL
XCHG    BH,DH
XCHG    CX,BX
XCHG    BX,BX
XCHG    CX,DX
XCHG    BX,CX
XCHG    BP,SP
XCHG    DI,SI
XCHG    DI,CX
XCHG    SI,DI
XCHG    CX,BP
XCHG    BP,DX
XCHG    AL,[BX]
XCHG    CL,[BP+00h]
XCHG    AL,[BX+SI]
XCHG    DL,[BP+2345h]
XCHG    DH,[SI+2354h]
XCHG    SI,[BX]
XCHG    CX,[BP+DI]
XCHG    AX,[BX+SI+15h]
XCHG    BP,[BP+DI+2345h]
XCHG    DX,[SI+2354h]
NOP
XCHG    AX,CX
XCHG    AX,DX
XCHG    AX,BX
XCHG    AX,SP
XCHG    AX,BP
XCHG    AX,SI
XCHG    AX,DI
IN      AL,12h
IN      AX,15h
IN      AL,DX
IN      AX,DX
OUT     17,AL
OUT     45,AX
OUT     DX,AL
OUT     DX,AX
XLATB
LEA     BX,[BX+SI+2354h]
LEA     CX,[BP+SI+54h]
LEA     DX,[BP+00h]
LES     BX,[BX+SI+2354h]
LDS     CX,[BP+SI+54h]
LES     DX,[BP+00h]
LAHF
SAHF
PUSHF
POPF
ADD     CX,[BX]
ADD     DX,[BX+78h]
ADD     BX,[BX+3456h]
ADD     SI,[BX+SI]
ADD     DI,[BX+SI+79h]
ADD     BP,[BX+SI+5678h]
ADD     SI,[BX+DI]
ADD     DI,[BX+DI+29h]
ADD     BP,[BX+DI+5678h]
ADD     SP,[SI]
ADD     DX,[SI+28h]
ADD     BX,[SI+3456h]
ADD     AX,[DI]
ADD     DX,[DI+58h]
ADD     BX,[DI+3456h]
ADD     CX,[BP+00h]
ADD     DX,[BP+58h]
ADD     BX,[BP+3456h]
ADD     SI,[BP+SI]
ADD     DI,[BP+SI+39h]
ADD     BP,[BP+SI+5678h]
ADD     SI,[BP+DI]
ADD     DI,[BP+DI+49h]
ADD     BP,[BP+DI+5678h]
ADD     [BX],CX
ADD     [BX+78h],DX
ADD     [BX+3456h],BX
ADD     [BX+SI],AX
ADD     [BX+SI+69h],SP
ADD     [BX+SI+5678h],DI
ADD     [BX+DI],BP
ADD     [BX+DI+49h],SI
ADD     [BX+DI+5678h],DI
ADD     [SI],AX
ADD     [SI+78h],CX
ADD     [SI+3456h],DX
ADD     [DI],BP
ADD     [DI+78h],SP
ADD     [DI+3456h],SI
ADD     [BP+00h],DI
ADD     [BP+78h],CX
ADD     [BP+3456h],DX
ADD     [BP+SI],SI
ADD     [BP+SI+59h],DI
ADD     [BP+SI+5678h],AX
ADD     [BP+DI],DI
ADD     [BP+DI+19h],BX
ADD     [BP+DI+5678h],DX
ADD     AL,[DI]
ADD     AH,[DI+78h]
ADD     BH,[DI+3456h]
ADD     CL,[BP+00h]
ADD     DL,[BP+78h]
ADD     BL,[BP+3456h]
ADD     CH,[BP+SI]
ADD     [DI+78h],DH
ADD     [DI+3456h],DL
ADD     [BP+00h],CH
ADD     [BP+56h],CL
ADD     [BP+3456h],BH
ADD     [BP+SI],BL
ADD     [BP+SI+45h],AH
ADD     [BP+SI+5678h],AL
ADD     BYTE PTR [DI+78h],15h
ADD     BYTE PTR [DI+3456h],16h
ADD     BYTE PTR [BP+00h],28h
ADD     BYTE PTR [BP+56h],88h
ADD     WORD PTR [BP+3456h],1234h
ADD     WORD PTR [BP+SI],3415h
ADD     WORD PTR [BP+SI+45h],4785h
ADD     WORD PTR [BP+SI+5678h],1536h
ADD     CL,15h
ADD     CH,16h
ADD     DL,28h
ADD     AH,88h
ADD     BX,1234h
ADD     DI,3415h
ADD     SP,4785h
ADD     BP,1536h
ADD     AL,17h
ADD     AX,5217h
ADC     CX,[BX]
ADC     DX,[BX+78h]
ADC     BX,[BX+3456h]
ADC     SI,[BX+SI]
ADC     DI,[BX+SI+79h]
ADC     BP,[BX+SI+5678h]
ADC     SI,[BX+DI]
ADC     DI,[BX+DI+29h]
ADC     BP,[BX+DI+5678h]
ADC     SP,[SI]
ADC     DX,[SI+28h]
ADC     BX,[SI+3456h]
ADC     AX,[DI]
ADC     DX,[DI+58h]
ADC     BX,[DI+3456h]
ADC     CX,[BP+00h]
ADC     DX,[BP+58h]
ADC     BX,[BP+3456h]
ADC     SI,[BP+SI]
ADC     DI,[BP+SI+39h]
ADC     BP,[BP+SI+5678h]
ADC     SI,[BP+DI]
ADC     DI,[BP+DI+49h]
ADC     BP,[BP+DI+5678h]
ADC     [BX],CX
ADC     [BX+78h],DX
ADC     [BX+3456h],BX
ADC     [BX+SI],AX
ADC     [BX+SI+69h],SP
ADC     [BX+SI+5678h],DI
ADC     [BX+DI],BP
ADC     [BX+DI+49h],SI
ADC     [BX+DI+5678h],DI
ADC     [SI],AX
ADC     [SI+78h],CX
ADC     [SI+3456h],DX
ADC     [DI],BP
ADC     [DI+78h],SP
ADC     [DI+3456h],SI
ADC     [BP+00h],DI
ADC     [BP+78h],CX
ADC     [BP+3456h],DX
ADC     [BP+SI],SI
ADC     [BP+SI+59h],DI
ADC     [BP+SI+5678h],AX
ADC     [BP+DI],DI
ADC     [BP+DI+19h],BX
ADC     [BP+DI+5678h],DX
ADC     AL,[DI]
ADC     AH,[DI+78h]
ADC     BH,[DI+3456h]
ADC     CL,[BP+00h]
ADC     DL,[BP+78h]
ADC     BL,[BP+3456h]
ADC     CH,[BP+SI]
ADC     [DI+78h],DH
ADC     [DI+3456h],DL
ADC     [BP+00h],CH
ADC     [BP+56h],CL
ADC     [BP+3456h],BH
ADC     [BP+SI],BL
ADC     [BP+SI+45h],AH
ADC     [BP+SI+5678h],AL
ADC     BYTE PTR [DI+78h],15h
ADC     BYTE PTR [DI+3456h],16h
ADC     BYTE PTR [BP+00h],28h
ADC     BYTE PTR [BP+56h],88h
ADC     WORD PTR [BP+3456h],1234h
ADC     WORD PTR [BP+SI],3415h
ADC     WORD PTR [BP+SI+45h],4785h
ADC     WORD PTR [BP+SI+5678h],1536h
ADC     CL,15h
ADC     CH,16h
ADC     DL,28h
ADC     AH,88h
ADC     BX,1234h
ADC     DI,3415h
ADC     SP,4785h
ADC     BP,1536h
ADD     AL,17h
ADD     AX,5217h
CMP     CX,[BX]
CMP     DX,[BX+78h]
CMP     BX,[BX+3456h]
CMP     SI,[BX+SI]
CMP     DI,[BX+SI+79h]
CMP     BP,[BX+SI+5678h]
CMP     SI,[BX+DI]
CMP     DI,[BX+DI+29h]
CMP     BP,[BX+DI+5678h]
CMP     SP,[SI]
CMP     DX,[SI+28h]
CMP     BX,[SI+3456h]
CMP     AX,[DI]
CMP     DX,[DI+58h]
CMP     BX,[DI+3456h]
CMP     CX,[BP+00h]
CMP     DX,[BP+58h]
CMP     BX,[BP+3456h]
CMP     SI,[BP+SI]
CMP     DI,[BP+SI+39h]
CMP     BP,[BP+SI+5678h]
CMP     SI,[BP+DI]
CMP     DI,[BP+DI+49h]
CMP     BP,[BP+DI+5678h]
CMP     [BX],CX
CMP     [BX+78h],DX
CMP     [BX+3456h],BX
CMP     [BX+SI],AX
CMP     [BX+SI+69h],SP
CMP     [BX+SI+5678h],DI
CMP     [BX+DI],BP
CMP     [BX+DI+49h],SI
CMP     [BX+DI+5678h],DI
CMP     [SI],AX
CMP     [SI+78h],CX
CMP     [SI+3456h],DX
CMP     [DI],BP
CMP     [DI+78h],SP
CMP     [DI+3456h],SI
CMP     [BP+00h],DI
CMP     [BP+78h],CX
CMP     [BP+3456h],DX
CMP     [BP+SI],SI
CMP     [BP+SI+59h],DI
CMP     [BP+SI+5678h],AX
CMP     [BP+DI],DI
CMP     [BP+DI+19h],BX
CMP     [BP+DI+5678h],DX
CMP     AL,[DI]
CMP     AH,[DI+78h]
CMP     BH,[DI+3456h]
CMP     CL,[BP+00h]
CMP     DL,[BP+78h]
CMP     BL,[BP+3456h]
CMP     CH,[BP+SI]
CMP     [DI+78h],DH
CMP     [DI+3456h],DL
CMP     [BP+00h],CH
CMP     [BP+56h],CL
CMP     [BP+3456h],BH
CMP     [BP+SI],BL
CMP     [BP+SI+45h],AH
CMP     [BP+SI+5678h],AL
CMP     BYTE PTR [DI+78h],15h
CMP     BYTE PTR [DI+3456h],16h
CMP     BYTE PTR [BP+00h],28h
CMP     BYTE PTR [BP+56h],88h
CMP     WORD PTR [BP+3456h],1234h
CMP     WORD PTR [BP+SI],3415h
CMP     WORD PTR [BP+SI+45h],4785h
CMP     WORD PTR [BP+SI+5678h],1536h
CMP     CL,15h
CMP     CH,16h
CMP     DL,28h
CMP     AH,88h
CMP     BX,1234h
CMP     DI,3415h
CMP     SP,4785h
CMP     BP,1536h
ADD     AL,17h
ADD     AX,5217h
SUB     CX,[BX]
SUB     DX,[BX+78h]
SUB     BX,[BX+3456h]
SUB     SI,[BX+SI]
SUB     DI,[BX+SI+79h]
SUB     BP,[BX+SI+5678h]
SUB     SI,[BX+DI]
SUB     DI,[BX+DI+29h]
SUB     BP,[BX+DI+5678h]
SUB     SP,[SI]
SUB     DX,[SI+28h]
SUB     BX,[SI+3456h]
SUB     AX,[DI]
SUB     DX,[DI+58h]
SUB     BX,[DI+3456h]
SUB     CX,[BP+00h]
SUB     DX,[BP+58h]
SUB     BX,[BP+3456h]
SUB     SI,[BP+SI]
SUB     DI,[BP+SI+39h]
SUB     BP,[BP+SI+5678h]
SUB     SI,[BP+DI]
SUB     DI,[BP+DI+49h]
SUB     BP,[BP+DI+5678h]
SUB     [BX],CX
SUB     [BX+78h],DX
SUB     [BX+3456h],BX
SUB     [BX+SI],AX
SUB     [BX+SI+69h],SP
SUB     [BX+SI+5678h],DI
SUB     [BX+DI],BP
SUB     [BX+DI+49h],SI
SUB     [BX+DI+5678h],DI
SUB     [SI],AX
SUB     [SI+78h],CX
SUB     [SI+3456h],DX
SUB     [DI],BP
SUB     [DI+78h],SP
SUB     [DI+3456h],SI
SUB     [BP+00h],DI
SUB     [BP+78h],CX
SUB     [BP+3456h],DX
SUB     [BP+SI],SI
SUB     [BP+SI+59h],DI
SUB     [BP+SI+5678h],AX
SUB     [BP+DI],DI
SUB     [BP+DI+19h],BX
SUB     [BP+DI+5678h],DX
SUB     AL,[DI]
SUB     AH,[DI+78h]
SUB     BH,[DI+3456h]
SUB     CL,[BP+00h]
SUB     DL,[BP+78h]
SUB     BL,[BP+3456h]
SUB     CH,[BP+SI]
SUB     [DI+78h],DH
SUB     [DI+3456h],DL
SUB     [BP+00h],CH
SUB     [BP+56h],CL
SUB     [BP+3456h],BH
SUB     [BP+SI],BL
SUB     [BP+SI+45h],AH
SUB     [BP+SI+5678h],AL
SUB     BYTE PTR [DI+78h],15h
SUB     BYTE PTR [DI+3456h],16h
SUB     BYTE PTR [BP+00h],28h
SUB     BYTE PTR [BP+56h],88h
SUB     WORD PTR [BP+3456h],1234h
SUB     WORD PTR [BP+SI],3415h
SUB     WORD PTR [BP+SI+45h],4785h
SUB     WORD PTR [BP+SI+5678h],1536h
SUB     CL,15h
SUB     CH,16h
SUB     DL,28h
SUB     AH,88h
SUB     BX,1234h
SUB     DI,3415h
SUB     SP,4785h
SUB     BP,1536h
ADD     AL,17h
ADD     AX,5217h
SBB     CX,[BX]
SBB     DX,[BX+78h]
SBB     BX,[BX+3456h]
SBB     SI,[BX+SI]
SBB     DI,[BX+SI+79h]
SBB     BP,[BX+SI+5678h]
SBB     SI,[BX+DI]
SBB     DI,[BX+DI+29h]
SBB     BP,[BX+DI+5678h]
SBB     SP,[SI]
SBB     DX,[SI+28h]
SBB     BX,[SI+3456h]
SBB     AX,[DI]
SBB     DX,[DI+58h]
SBB     BX,[DI+3456h]
SBB     CX,[BP+00h]
SBB     DX,[BP+58h]
SBB     BX,[BP+3456h]
SBB     SI,[BP+SI]
SBB     DI,[BP+SI+39h]
SBB     BP,[BP+SI+5678h]
SBB     SI,[BP+DI]
SBB     DI,[BP+DI+49h]
SBB     BP,[BP+DI+5678h]
SBB     [BX],CX
SBB     [BX+78h],DX
SBB     [BX+3456h],BX
SBB     [BX+SI],AX
SBB     [BX+SI+69h],SP
SBB     [BX+SI+5678h],DI
SBB     [BX+DI],BP
SBB     [BX+DI+49h],SI
SBB     [BX+DI+5678h],DI
SBB     [SI],AX
SBB     [SI+78h],CX
SBB     [SI+3456h],DX
SBB     [DI],BP
SBB     [DI+78h],SP
SBB     [DI+3456h],SI
SBB     [BP+00h],DI
SBB     [BP+78h],CX
SBB     [BP+3456h],DX
SBB     [BP+SI],SI
SBB     [BP+SI+59h],DI
SBB     [BP+SI+5678h],AX
SBB     [BP+DI],DI
SBB     [BP+DI+19h],BX
SBB     [BP+DI+5678h],DX
SBB     AL,[DI]
SBB     AH,[DI+78h]
SBB     BH,[DI+3456h]
SBB     CL,[BP+00h]
SBB     DL,[BP+78h]
SBB     BL,[BP+3456h]
SBB     CH,[BP+SI]
SBB     [DI+78h],DH
SBB     [DI+3456h],DL
SBB     [BP+00h],CH
SBB     [BP+56h],CL
SBB     [BP+3456h],BH
SBB     [BP+SI],BL
SBB     [BP+SI+45h],AH
SBB     [BP+SI+5678h],AL
SBB     BYTE PTR [DI+78h],15h
SBB     BYTE PTR [DI+3456h],16h
SBB     BYTE PTR [BP+00h],28h
SBB     BYTE PTR [BP+56h],88h
SBB     WORD PTR [BP+3456h],1234h
SBB     WORD PTR [BP+SI],3415h
SBB     WORD PTR [BP+SI+45h],4785h
SBB     WORD PTR [BP+SI+5678h],1536h
SBB     CL,15h
SBB     CH,16h
SBB     DL,28h
SBB     AH,88h
SBB     BX,1234h
SBB     DI,3415h
SBB     SP,4785h
SBB     BP,1536h
ADD     AL,17h
ADD     AX,5217h
MUL     WORD PTR [BX]
MUL     WORD PTR [BX+78h]
MUL     WORD PTR [BX+3456h]
MUL     WORD PTR [BX+SI]
MUL     WORD PTR [BX+SI+79h]
MUL     WORD PTR [BX+SI+5678h]
MUL     WORD PTR [BX+DI]
MUL     WORD PTR [BX+DI+29h]
MUL     WORD PTR [BX+DI+5678h]
MUL     WORD PTR [SI]
MUL     WORD PTR [SI+28h]
MUL     WORD PTR [SI+3456h]
MUL     WORD PTR [DI]
MUL     WORD PTR [DI+58h]
MUL     WORD PTR [DI+3456h]
MUL     BP
MUL     WORD PTR [BP+58h]
MUL     WORD PTR [BP+3456h]
MUL     CX
MUL     WORD PTR [BP+SI+39h]
MUL     WORD PTR [BP+SI+5678h]
MUL     DX
MUL     WORD PTR [BP+DI+49h]
MUL     SI
MUL     BYTE PTR [DI+78h]
MUL     BYTE PTR [DI+3456h]
MUL     DH
MUL     BYTE PTR [BP+78h]
MUL     BYTE PTR [BP+3456h]
MUL     AH
MUL     BL
MUL     BYTE PTR [DI+3456h]
IMUL    WORD PTR [BX]
IMUL    WORD PTR [BX+78h]
IMUL    WORD PTR [BX+3456h]
IMUL    WORD PTR [BX+SI]
IMUL    WORD PTR [BX+SI+79h]
IMUL    WORD PTR [BX+SI+5678h]
IMUL    WORD PTR [BX+DI]
IMUL    WORD PTR [BX+DI+29h]
IMUL    WORD PTR [BX+DI+5678h]
IMUL    WORD PTR [SI]
IMUL    WORD PTR [SI+28h]
IMUL    WORD PTR [SI+3456h]
IMUL    WORD PTR [DI]
IMUL    WORD PTR [DI+58h]
IMUL    WORD PTR [DI+3456h]
IMUL    BP
IMUL    WORD PTR [BP+58h]
IMUL    WORD PTR [BP+3456h]
IMUL    CX
IMUL    WORD PTR [BP+SI+39h]
IMUL    WORD PTR [BP+SI+5678h]
IMUL    DI
IMUL    WORD PTR [BP+DI+49h]
IMUL    SI
IMUL    BYTE PTR [DI+78h]
IMUL    BYTE PTR [DI+3456h]
IMUL    DH
IMUL    BYTE PTR [BP+78h]
IMUL    BYTE PTR [BP+3456h]
IMUL    AH
IMUL    BL
IMUL    BYTE PTR [DI+3456h]
DIV     WORD PTR [BX]
DIV     WORD PTR [BX+78h]
DIV     WORD PTR [BX+3456h]
DIV     WORD PTR [BX+SI]
DIV     WORD PTR [BX+SI+79h]
DIV     WORD PTR [BX+SI+5678h]
DIV     WORD PTR [BX+DI]
DIV     WORD PTR [BX+DI+29h]
DIV     WORD PTR [BX+DI+5678h]
DIV     WORD PTR [SI]
DIV     WORD PTR [SI+28h]
DIV     WORD PTR [SI+3456h]
DIV     WORD PTR [DI]
DIV     WORD PTR [DI+58h]
DIV     WORD PTR [DI+3456h]
DIV     BP
DIV     WORD PTR [BP+58h]
DIV     WORD PTR [BP+3456h]
DIV     CX
DIV     WORD PTR [BP+SI+39h]
DIV     WORD PTR [BP+SI+5678h]
DIV     DX
DIV     WORD PTR [BP+DI+49h]
DIV     SI
DIV     BYTE PTR [DI+78h]
DIV     BYTE PTR [DI+3456h]
DIV     DH
DIV     BYTE PTR [BP+78h]
DIV     BYTE PTR [BP+3456h]
DIV     DL
DIV     BL
DIV     BYTE PTR [DI+3456h]
IDIV    WORD PTR [BX]
IDIV    WORD PTR [BX+78h]
IDIV    WORD PTR [BX+3456h]
IDIV    WORD PTR [BX+SI]
IDIV    WORD PTR [BX+SI+79h]
IDIV    WORD PTR [BX+SI+5678h]
IDIV    WORD PTR [BX+DI]
IDIV    WORD PTR [BX+DI+29h]
IDIV    WORD PTR [BX+DI+5678h]
IDIV    WORD PTR [SI]
IDIV    WORD PTR [SI+28h]
IDIV    WORD PTR [SI+3456h]
IDIV    WORD PTR [DI]
IDIV    WORD PTR [DI+58h]
IDIV    WORD PTR [DI+3456h]
IDIV    BP
IDIV    WORD PTR [BP+58h]
IDIV    WORD PTR [BP+3456h]
IDIV    AX
IDIV    WORD PTR [BP+SI+39h]
IDIV    WORD PTR [BP+SI+5678h]
IDIV    DX
IDIV    WORD PTR [BP+DI+49h]
IDIV    SI
IDIV    BYTE PTR [DI+78h]
IDIV    BYTE PTR [DI+3456h]
IDIV    DH
IDIV    BYTE PTR [BP+78h]
IDIV    BYTE PTR [BP+3456h]
IDIV    AH
IDIV    BL
IDIV    BYTE PTR [DI+3456h]
INC     WORD PTR [BX]
INC     WORD PTR [BX+78h]
INC     WORD PTR [BX+3456h]
INC     WORD PTR [BX+SI]
INC     WORD PTR [BX+SI+79h]
INC     WORD PTR [BX+SI+5678h]
INC     WORD PTR [BX+DI]
INC     WORD PTR [BX+DI+29h]
INC     WORD PTR [BX+DI+5678h]
INC     WORD PTR [SI]
INC     WORD PTR [SI+28h]
INC     WORD PTR [SI+3456h]
INC     WORD PTR [DI]
INC     WORD PTR [DI+58h]
INC     WORD PTR [DI+3456h]
INC     AL
INC     CL
INC     DL
INC     BL
INC     AH
INC     CH
INC     BH
INC     DH
INC     AX
INC     CX
INC     DX
INC     BX
INC     SP
INC     BP
INC     SI
INC     DI
DEC     WORD PTR [BX]
DEC     WORD PTR [BX+78h]
DEC     WORD PTR [BX+3456h]
DEC     WORD PTR [BX+SI]
DEC     WORD PTR [BX+SI+79h]
DEC     WORD PTR [BX+SI+5678h]
DEC     WORD PTR [BX+DI]
DEC     WORD PTR [BX+DI+29h]
DEC     WORD PTR [BX+DI+5678h]
DEC     WORD PTR [SI]
DEC     WORD PTR [SI+28h]
DEC     WORD PTR [SI+3456h]
DEC     WORD PTR [DI]
DEC     WORD PTR [DI+58h]
DEC     WORD PTR [DI+3456h]
DEC     AL
DEC     CL
DEC     DL
DEC     BL
DEC     AH
DEC     CH
DEC     BH
DEC     DH
DEC     AX
DEC     CX
DEC     DX
DEC     BX
DEC     SP
DEC     BP
DEC     SI
DEC     DI
AAA
AAD     
AAS
AAM     
DAA
DAS
NEG     BP
NEG     WORD PTR [BP+58h]
NEG     WORD PTR [BP+3456h]
NEG     CX
NEG     WORD PTR [BP+SI+39h]
NEG     WORD PTR [BP+SI+5678h]
NEG     DX
NEG     WORD PTR [BP+DI+49h]
NEG     SI
NEG     BYTE PTR [DI+78h]
NEG     BYTE PTR [DI+3456h]
NEG     DH
NEG     BYTE PTR [BP+78h]
NEG     BYTE PTR [BP+3456h]
NEG     AH
NEG     BL
NEG     BYTE PTR [DI+3456h]
CBW
CWD
labelle:
END start
