.MODEL SMALL ; Define el segmento.
.STACK        ; Info sobre la pila del programa.
.DATA         ; inica seción de datos.
    Nombre db "JUAN FELIPE HERRENO" ,13,10,'$'; variable nombre completo.
    Documento db "1000854971",13,10,'$'              ; variable número de identificación.
.CODE                             ; segmento de codigo.
    MAIN PROC                     ; inicio del programa.
        MOV AX, @DATA             ; inicio de los datos, donde se mueve la información definida en las variable db.
        MOV DS, AX                ; se mueve el mensaje de AX a DS.
        MOV AH, 09                ; llamamos la función print para imprimir los datos.
        LEA DX,Nombre             ; se carga la operación fuente.
        INT 21h
         ; pedimos que muestre la segunda variable.

        MOV AH, 09
        LEA DX,Documento          ; se carga la segunda operación fuente de la variable.
        INT 21h
        ; cargamos en pantalla.
        MOV AH, 4CH
        INT 21h
    MAIN ENDP   ; cierre del programa.
    END MAIN
