.model small ; Define el segmento.
.data        ; Inicia segmento de datos.
    mensaje1 db 13,10, 'Ingrese el primer digito: $'  ;primer mensaje en pantalla.
    mensaje2 db 13,10, 'Ingrese el segundo digito: $'  ;segundo mensaje en pantalla.
    mensaje3 db 13,10, 'la multiplicacion es: $';tercer mensaje en pantalla.
    digito1 db ?
    digito2 db ?
    resultado db ?
.code ;segmento del codigo.

    main proc

      mov ax,@data
      mov ds, ax
      ;solicitar el primer digito.
      mov ah, 09h
      lea dx, mensaje1
      int 21h
      ;leer primer digito.
      mov ah, 01h
      int 21h
      sub al,'0' ; copnvertir ASCII a número.
      mov digito1, al
      ;solicitar segundo digito.
      mov ah, 09h
      lea dx, mensaje2
      int 21h
      ;leer primer digito.
      mov ah, 01h
      int 21h
      sub al,'0' ; copnvertir ASCII a número.
      mov digito2, al
      ;multiplicar los digitoss.
      mov al, digito1
      imul digito2
      mov resultado, al
      ;mostrar resultado.
      mov ah, 09h
      lea dx, mensaje3
      int 21h
      ;imprmir resultados.
      mov al,resultado
      aam
      mov bx,02h
      mov dl,bh
      mov dl,30h
      int 21h

      mov ah,02h
      mov dl,bl
      mov dl,30h
      int 21h
      ;salir del programa.
      mov ah,4CH
      int 21h
    main endp
    end main