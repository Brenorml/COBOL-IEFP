      *>*****************************************************************
      *> Author: Breno Lucena
      *> Date: 28/06/2023
      *> Purpose: Exercicio Ficha 15 - UFCD0807
      *> Tectonics: cobc
      *>*****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa15.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  THE-NUMBER      PIC 99.
       01  THE-MULTIPLIER  PIC 999.
       01  THE-PRODUCT     PIC 9999.
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
               PERFORM GET-THE-PICK.
           DISPLAY-THE-TABLE.
               PERFORM CALCULATE-THE-TABLE UNTIL THE-MULTIPLIER = 12.
      *>    LVL 3 ROUTINES
               GET-THE-PICK.
                   ACCEPT THE-NUMBER.
               CALCULATE-THE-TABLE.
                       ADD 1 TO THE-MULTIPLIER
                       COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
                       DISPLAY THE-NUMBER " X " THE-MULTIPLIER " = " THE-PRODUCT.
       END PROGRAM programa15.
