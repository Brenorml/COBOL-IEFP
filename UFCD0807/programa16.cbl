      *>*****************************************************************
      *> Author: Breno Lucena
      *> Date: 29/06/2023
      *> Purpose: Exercicio Ficha 16 - UFCD0807
      *> Tectonics: cobc
      *>*****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa16.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  THE-NUMBER      PIC 99.
       01  THE-MULTIPLIER  PIC 999.
       01  THE-PRODUCT     PIC 9999.
       01  HOW-MANY        PIC 99.
       PROCEDURE DIVISION.
      *>    LVL 1 ROUTINES
       PROGRAM-BEGIN.
           PERFORM PROGRAM-INIT.
           PERFORM GET-TABLE-NUMBER.
           PERFORM DISPLAY-THE-TABLE.
       PROGRAM-DONE.
           DISPLAY "Fim do programa."
            STOP RUN.
      *>    LVL 2 ROUTINES
           PROGRAM-INIT.
               DISPLAY "Qual o numero que deseja calcular (01-99)? ".
               PERFORM GET-THE-NUMBER.
               DISPLAY "Quantas vezes deseja multiplicar (01-99)? ".
               PERFORM GET-THE-HOW-MANY.
           GET-TABLE-NUMBER.
               PERFORM CALCULATE-THE-TABLE.
           DISPLAY-THE-TABLE.
               PERFORM DISPLAY-RESULT.
      *>    LVL 3 ROUTINES
               GET-THE-NUMBER.
                   ACCEPT THE-NUMBER.
               GET-THE-HOW-MANY.
                   ACCEPT HOW-MANY.

               CALCULATE-THE-TABLE.
                       ADD 1 TO THE-MULTIPLIER
                       COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
                       DISPLAY-RESULT.
                           DISPLAY THE-NUMBER " X " THE-MULTIPLIER " = " THE-PRODUCT.
               IF(THE-MULTIPLIER < HOW-MANY)
                  PERFORM GET-TABLE-NUMBER
                  PERFORM DISPLAY-THE-TABLE
               ELSE
                  PERFORM PROGRAM-DONE.
       END PROGRAM programa16.
