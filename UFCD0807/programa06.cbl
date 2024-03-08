      ******************************************************************
      * Author: Breno Lucena
      * Date: 19/06/2023
      * Purpose: Exercicio Ficha 6 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa06.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  A-MENSAGEM  PIC IS  X(20).
       01  O-NOME      PIC IS  X(10).
       01  O-NUMERO    PIC IS  99.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
            DISPLAY "Indique o nome de alguem:"
            ACCEPT O-NOME
            MOVE "Ola" TO A-MENSAGEM
            MOVE 1 TO O-NUMERO
            DISPLAY "Mensagem " O-NUMERO ": " A-MENSAGEM O-NOME
            MOVE "Diga boa noite," TO A-MENSAGEM
            MOVE 2 TO O-NUMERO
            DISPLAY "Mensagem " O-NUMERO ": " A-MENSAGEM O-NOME.
       PROGRAM-DONE.
            STOP RUN.
       END PROGRAM programa06.
