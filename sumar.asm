.MODEL SMALL ; Define el segmento.
.STACK        ; Info sobre la pila del programa.
.DATA        ; Inicia segmento de datos.
    numero1 db 0     ;variable que contendrá el primer número.
    numero2 db 0     ;variable que contendrá el segundo número.
    suma db 0        ;variable que hará la suma del primer y segundo número.
    mensaje1 db 13,10, "Ingrese el primer numero:",'$'  ;primer mensaje en pantalla.
    mensaje2 db 13,10, "Ingrese el segundo numero:",'$'  ;segundo mensaje en pantalla.
    resultado db 13,10, "el resultado de la suma es:",'$';tercer mensaje en pantalla.
.CODE ;segmento del codigo.
    MAIN PROC
        ;función principal donde se ejecutará el programa
      MOV AX, @DATA             ; inicio de los datos, donde se mueve la información definida en las variable db.
      MOV DS, AX                ; se mueve el mensaje de AX a DS.
        ; solicitamos el primer número.
        MOV AH, 09h              ; llamamos la función print para imprimir los datos.
        LEA DX,mensaje1          ; se carga el valor de primer número.
        INT 21h
        ; lectura del primer número.
        MOV AH,01h ; captura el primer número ingresado a la consola.
        INT 21h
        SUB AL,30h
        ;guardamos el valor del primer número.
        MOV numero1, AL
        ;solicitamos el segundo número.
        MOV AH, 09h              ; llamamos la función print para imprimir los datos.
        LEA DX,mensaje2          ; se carga el valor de segundo número.
        INT 21h
     ; lectura del segundo número.
        MOV AH,01h 
        INT 21h
        SUB AL,30h
         ;guardamos el valor del segundo número.
        MOV numero2, AL
        ; proceso de suma de los números.
        MOV AL, numero1   ;pasamos la variable de numeo1 a AL.
        ADD AL, numero2   ;suma la variable de numeo2 a AL.
        ADD AL, 30h
        MOV suma, AL      ;operación de suma.
        ; resultado de la suma obtenida.
        MOV AH, 09h
        LEA DX, resultado ; carga el resultado.
        INT 21h
        ; imprimir el resultado.
        MOV AH,02
        MOV Dl, suma
        INT 21h

        MOV AH, 4CH
        INT 21h
    MAIN ENDP
    END MAIN