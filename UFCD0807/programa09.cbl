      ******************************************************************
      * Author: Breno Lucena
      * Date: 19/06/2023
      * Purpose: Exercicio Ficha 9 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa09.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *> 01  A-MENSAGEM  PIC IS  X(20).
       01  O-NOME      PICTURE IS  X(20).
       01  A-IDADE     PICTURE IS  9(2).
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            DISPLAY "Indique o seu nome."

            ACCEPT O-NOME

            DISPLAY "Qual sua idade?"

            ACCEPT A-IDADE

            DISPLAY "Ola " O-NOME ", sua idade e " A-IDADE

            DISPLAY "Ola " O-NOME

            DISPLAY "Sua idade e " A-IDADE.
       PROGRAM-DONE.
            STOP RUN.
       END PROGRAM programa09.
