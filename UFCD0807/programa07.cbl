      ******************************************************************
      * Author: Breno Lucena
      * Date: 23/06/2023
      * Purpose: Exercicio Ficha 7 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa07.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  A-MENSAGEM  PIC X(20) VALUES "A MENSAGEM".
       01  O-NOME      PIC X(10) VALUES "O NOME".
       01  O-NUMERO    PIC 99 VALUES 10.
       01  O-TANTO-FAZ PIC 999 VALUES 1.
       01  O-ESPACO PIC X.
       01  DOIS-PONTOS PIC X(2) VALUES ": ".
       01  SEPARADOR   PIC X(3) VALUES " - ".
      * VALUES " ".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

           MOVE " " TO O-ESPACO
           DISPLAY A-MENSAGEM O-NOME O-NUMERO O-ESPACO O-TANTO-FAZ
           DISPLAY "Indique o nome de alguem."
           ACCEPT O-NOME
           MOVE "Ola" TO A-MENSAGEM
           MOVE 1 TO O-NUMERO
           DISPLAY "Mensagem ", O-NUMERO, DOIS-PONTOS, A-MENSAGEM
               O-ESPACO O-NOME
           MOVE "Diga Boa noite," TO A-MENSAGEM
           MOVE 2 TO O-NUMERO
           DISPLAY "Mensagem " O-NUMERO ": " A-MENSAGEM
               SEPARADOR
               O-NOME.
       PROGRAM-DONE.
            STOP RUN.
       END PROGRAM programa07.
