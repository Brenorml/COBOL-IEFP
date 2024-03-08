      ******************************************************************
      * Author: Breno Lucena
      * Date: 19/06/2023
      * Purpose: Exercicio Ficha 5 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa05.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  O-NOME  PICTURE IS XXXXXXXXXX.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            DISPLAY "Indique o seu nome:"
            ACCEPT O-NOME
            DISPLAY "Ola " O-NOME.
       PROGRAM-DONE.
            STOP RUN.
       END PROGRAM programa05.
