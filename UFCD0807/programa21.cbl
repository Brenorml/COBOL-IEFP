      ******************************************************************
      * Author: Breno Lucena
      *> Date: 04/07/2023
      *> Purpose: Exercicio Ficha 21 - UFCD0807
      *> Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa21.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      * Esta e a zona de declaracao OBRIGATORIA de variaveis em memoria
       01 the-result pic Z(3).
       01 THE-RESULT1 PIC S999V99.
       01 9X PIC 99 VALUE 9.
       01 NUM-REAL PIC 999V999 VALUES 12.607.
       01 QUALQUER PIC ZZ9.
       01 THE-VALUE PIC S999V99.
       01 THE-DISPLAY-VALUE PIC ZZZZZ9.99-.
       PROCEDURE DIVISION.
       LER-VARIAVEIS.
           DISPLAY "Introduza um numero real"
           ACCEPT NUM-REAL.
           DISPLAY NUM-REAL.
           COMPUTE the-result=NUM-REAL*9X.
           COMPUTE the-result1=NUM-REAL*9X.
           DISPLAY the-result " - " THE-RESULT1.
           DISPLAY QUALQUER.
           DISPLAY "INTRODUZA UM NUMERO NEGATIVO".
           ACCEPT THE-VALUE.
           COMPUTE THE-RESULT1=THE-VALUE*9X.
           DISPLAY THE-RESULT1.
           COMPUTE THE-DISPLAY-VALUE=THE-VALUE*9X.
           DISPLAY THE-DISPLAY-VALUE.
           PROGRAM-DONE.
            STOP RUN.
       END PROGRAM programa21.
