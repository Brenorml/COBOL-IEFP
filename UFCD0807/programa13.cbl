      ******************************************************************
      * Author: Breno Lucena
      * Date: 27/06/2023
      * Purpose: Exercicio Ficha 13 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa13.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  WS-NUM1 PIC Z(9).
       01  WS-NUM2 PIC Z(9).
       01  WS-NUM3 PIC Z(9).
       01  WS-NUM4 PIC Z(9).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           A000-FIRST-PARA.
           MOVE 25 TO WS-NUM1 WS-NUM3.
           MOVE 15 TO WS-NUM2 WS-NUM4.

           DISPLAY '*************  PRIMEIRO IF - AND  *****************'
           IF WS-NUM1 > WS-NUM2 THEN
               DISPLAY 'No primeiro bloco do IF ' WS-NUM1
                   ' E maior que ' WS-NUM2

               IF WS-NUM3 = WS-NUM4 THEN
                   DISPLAY 'No segundo bloco do IF ' WS-NUM3
                       ' e igual a ' WS-NUM4
               ELSE
                   DISPLAY 'No ELSE do segundo bloco ' WS-NUM3
                       ' nao e igual a ' WS-NUM4
               END-IF
           ELSE
               DISPLAY 'No ELSE do primeiro bloco ' WS-NUM1
                   ' nao e maior que ' WS-NUM2
           END-IF

           DISPLAY '*************  SEGUNDO IF - AND  *****************'
           IF WS-NUM1 IS LESS THAN WS-NUM2 AND WS-NUM1 = WS-NUM3 THEN
               DISPLAY'Ambas as condicoes sao verdadeiras'
           ELSE
               IF WS-NUM2 IS EQUAL TO WS-NUM3 AND WS-NUM2 = WS-NUM4
                   DISPLAY 'NUM2 = NUM3 e NUM2 = NUM4'
               ELSE
                   DISPLAY 'A segunda condicao e falsa!'
               END-IF

               DISPLAY 'A primeira condicao e falsa!'
           END-IF
           MOVE 20 TO WS-NUM1 WS-NUM3
           MOVE 25 TO WS-NUM2 WS-NUM4

           DISPLAY '*************  TERCEIRO IF - OR  *****************'

           IF WS-NUM1 IS LESS THAN WS-NUM2 OR WS-NUM1 = WS-NUM3 THEN
               DISPLAY 'Pelo menos uma das condicoes e verdadeira'
           ELSE
               DISPLAY 'A primeira condicao e falsa!'
           END-IF

           DISPLAY '************* QUARTO IF - AND COM OR **************'
           IF ((WS-NUM1 IS LESS THAN WS-NUM2) AND
              (WS-NUM1 IS EQUAL TO WS-NUM3)) OR
              (WS-NUM2 IS EQUAL TO WS-NUM4) THEN
              DISPLAY 'Pelo menos uma das condicoes e verdadera'
           ELSE
               DISPLAY 'Todas as condicoes sao falsas'
           END-IF

           DISPLAY '******* QUINTO IF - AND COM () E DEPOIS OR ********'
           IF(WS-NUM1 > WS-NUM2 AND WS-NUM1 = WS-NUM3) OR
               WS-NUM2 = WS-NUM4 THEN
               DISPLAY 'Pelo menos uma das condicoes e verdadeira'
           ELSE
               DISPLAY 'A primeira condicao e falsa'
           END-IF

           DISPLAY '******* QUINTO IF - OR COM () E DEPOIS AND ********'
           IF (WS-NUM1 > WS-NUM2 AND WS-NUM1 = WS-NUM3) OR
               WS-NUM2 = WS-NUM4 THEN
               DISPLAY 'Pelo menos uma das condicoes e verdadeira'
           ELSE
               DISPLAY 'A primeira condicao e falsa!'
            STOP RUN.
       END PROGRAM programa13.
