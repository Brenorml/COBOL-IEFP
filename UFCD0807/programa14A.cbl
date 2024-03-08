      ******************************************************************
      * Author: Breno Lucena
      * Date: 27/06/2023
      * Purpose: Exercicio Ficha 14 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa14.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  YES-OR-NO  PIC X.
       01  MENU-PICK  PIC 9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM GET-THE-MENU-PICK.
           PERFORM DO-THE-MENU-PICK.

           PERFORM MAIN-LOGIC.

       PROGRAM-DONE.
           DISPLAY "Fim do programa"
            STOP RUN.

       SHALL-WE-CONTINUE.
           DISPLAY "Continue (Y/N)?".
           ACCEPT YES-OR-NO.
           IF YES-OR-NO = "n" OR YES-OR-NO = "N"
               MOVE "N" TO YES-OR-NO
               PERFORM PROGRAM-DONE
           ELSE
               IF YES-OR-NO = "y" OR YES-OR-NO = "Y"
                   MOVE "Y" TO YES-OR-NO
                   PERFORM MAIN-LOGIC
                   PERFORM MAIN-PROCEDURE
               ELSE
                   DISPLAY "Sua entrada foi invalida.".

       MAIN-LOGIC.
           DISPLAY "Este e o main logic.".

      *    LEVEL 2 ROUTINES

           GET-THE-MENU-PICK.
               PERFORM DISPLAY-THE-MENU.
               PERFORM GET-THE-PICK.

               DO-THE-MENU-PICK.
               IF MENU-PICK < 1 OR MENU-PICK > 4
                   DISPLAY "Selecao invalida".

               IF MENU-PICK = 1
                   DISPLAY "Um para o dinheiro.".

               IF MENU-PICK = 2
                   DISPLAY "Dois para o show.".

               IF MENU-PICK = 3
                   DISPLAY "Tres para comecar.".

               IF MENU-PICK = 4
                   PERFORM PROGRAM-DONE.

               PERFORM SHALL-WE-CONTINUE.

      *    LEVEL 3 ROUTINES

           DISPLAY-THE-MENU.

           PERFORM CLEAR-SCREEN 25 TIMES.
               DISPLAY "*************** O MENU ************************"
               DISPLAY "Indique o numero da mensagem que deseja mostrar"
      *    Display a blank line
               DISPLAY " ".
               DISPLAY "1. Primeira mensagem".
               DISPLAY "2. Segunda mensagem".
               DISPLAY "3. Terceira mensagem".
               DISPLAY "4. Sair do programa".
      *    Display a blank line
               DISPLAY " ".
               DISPLAY"Qual a sua selecao (1-4)?".

               GET-THE-PICK.
               ACCEPT MENU-PICK.

           CLEAR-SCREEN.
               DISPLAY " ".
       END PROGRAM programa14.
