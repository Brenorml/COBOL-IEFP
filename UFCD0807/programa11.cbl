      ******************************************************************
      * Author: Breno Lucena
      * Date: 26/06/2023
      * Purpose: Exercicio Ficha 11 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa11.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
           DISPLAY "Hoje a mensagem e:".
           PERFORM DIGA-ALGO.
           PERFORM DIGA-ADEUS.

       PROGRAM-DONE.
            STOP RUN.

       DIGA-ALGO.
           DISPLAY "Esta e uma constante literal do tipo TEXTO"
           DISPLAY "Este e um numero inteiro: " 55.
           DISPLAY "Este e um numero real: " 12.607.

       DIGA-ADEUS.
           DISPLAY "Adeus utilizador".
           DISPLAY "Acabou o programa".
