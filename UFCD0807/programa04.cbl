      ******************************************************************
      * Author: Breno Lucena
      * Date: 19/06/2023
      * Purpose: Primeiro Programa Cobol - Variaveis
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa04.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      * Esta e a zona de declaracao de VARIAVEIS de memoria
       01  PRIMEIRO-NUMERO     PICTURE IS  99.
       01  SEGUNDO-NUMERO      PIC     IS  99.
       01  O-RESULTADO         PIC     IS  999.
      * A IDE aceita variaveis iniciadas em numeros mas nao e uma boa pratica
       01  9X                  PIC     IS  99.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            DISPLAY "Introduza o primeiro numero (99)"
            ACCEPT PRIMEIRO-NUMERO
            DISPLAY "Introduza o segundo numero (99)"
            ACCEPT SEGUNDO-NUMERO
            COMPUTE O-RESULTADO = PRIMEIRO-NUMERO + SEGUNDO-NUMERO
            DISPLAY "O resultado e:"
            DISPLAY O-RESULTADO.
            DISPLAY "Introduza um numero para variavel 9X (9)"
            ACCEPT 9X
            COMPUTE 9X = 9X * 2
            DISPLAY 9X.
       PROGRAM-END.
            STOP RUN.
       END PROGRAM programa04.
