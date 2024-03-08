      *>*****************************************************************
      *> Author: Breno Lucena
      *> Date: 29/06/2023
      *> Purpose: Exercicio Ficha 17 - UFCD0807
      *> Tectonics: cobc
      *>*****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa17.
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
               DISPLAY "Qual o numero que deseja calcular? ".
           GET-TABLE-NUMBER.
               PERFORM GET-THE-NUMBER.
               PERFORM DISPLAY-HOW-MANY.
               PERFORM GET-HOW-MANY.
           DISPLAY-THE-TABLE.
               PERFORM CALCULATE-THE-TABLE
               VARYING THE-MULTIPLIER FROM 1 BY 1
               UNTIL THE-MULTIPLIER > HOW-MANY.
      *>    LVL 3 ROUTINES
               GET-THE-NUMBER.
                   ACCEPT THE-NUMBER.
               DISPLAY-HOW-MANY.
                   DISPLAY "Quantas vezes deseja calcular? ".
               GET-HOW-MANY.
                   ACCEPT HOW-MANY.
               CALCULATE-THE-TABLE.
                       COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
                       DISPLAY THE-NUMBER " X " THE-MULTIPLIER " = " THE-PRODUCT.
       END PROGRAM programa17.
