      ******************************************************************
      * Author: Breno Lucena
      * Date: 23/06/2023
      * Purpose: Exercicio Ficha 8 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa08.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  A-MENSAGEM  PIC X(50).
       01  O-NUMERO    PIC 9(2).
       01  O-ESPACO    PIC X   VALUES " ".
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
      *Configuração e impressão da linha 1
           MOVE 1 TO O-NUMERO
           MOVE "Joao e agil," TO A-MENSAGEM
           DISPLAY O-NUMERO " " A-MENSAGEM
      *Configuração e impressão da linha 2
           ADD 1 TO O-NUMERO
           MOVE "Joao e rapido," TO A-MENSAGEM
           DISPLAY O-NUMERO " " A-MENSAGEM
      *Configuração e impressão da linha 3
           ADD 1 TO O-NUMERO
           MOVE "Joao pula sobre o candelabro." TO A-MENSAGEM
           DISPLAY O-NUMERO " " A-MENSAGEM.
       PROGRAM-DONE.
            STOP RUN.
       END PROGRAM programa08.
