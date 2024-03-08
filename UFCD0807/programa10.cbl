      ******************************************************************
      * Author: Breno Lucena
      * Date: 19/06/2023
      * Purpose: Exercicio Ficha 10 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa10.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01  PRIMEIRO-NUMERO  PIC 99.
           01  SEGUNDO-NUMERO   PIC 99.
           01  O-RESULTADO      PIC 999.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           DISPLAY "Este programa vai fazer a adicao de 2 numeros.".
       GET-PRIMEIRO-NUMBER.
           DISPLAY "Indique o primeiro numero.".
           ACCEPT PRIMEIRO-NUMERO.
       GET-SEGUNDO-NUMERO.
           DISPLAY "Indique o segundo numero.".
           ACCEPT SEGUNDO-NUMERO.
       COMPUTE-AND-DISPLAY.
           COMPUTE O-RESULTADO = PRIMEIRO-NUMERO + SEGUNDO-NUMERO
           DISPLAY "O resultado e " O-RESULTADO.
       PROGRAM-DONE.
            STOP RUN.
       END PROGRAM programa10.
