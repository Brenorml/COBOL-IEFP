      ******************************************************************
      * Author: Breno Lucena
      * Date: 26/06/2023
      * Purpose: Exercicio Ficha 12 - UFCD0807
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa12.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  A-MENSAGEM PIC X(50).
       01  O-NUMERO PIC 9(2).
       01  O-ESPACO PIC X.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
      * Iniciar a variavel espaço
           MOVE " " TO O-ESPACO.
      * Começar O-NUMERO em 0
           MOVE 0 TO O-NUMERO.
      * Configurar e mostrar a linha 1
           MOVE "Configurar e mostrar a linha 1," TO A-MENSAGEM.
           PERFORM ADICIONAR-NUMERO-E-MOSTRAR.
      * Configurar e mostrar a linha 2
           MOVE "Configurar e mostrar a linha 2," TO A-MENSAGEM.
           PERFORM ADICIONAR-NUMERO-E-MOSTRAR.
      * Configurar e mostrar a linha 3
           MOVE "Configurar e mostrar a linha 3," TO A-MENSAGEM.
           PERFORM ADICIONAR-NUMERO-E-MOSTRAR.
      * Configurar e mostrar a linha 4
           MOVE "Configurar e mostrar a linha 4," TO A-MENSAGEM.
           PERFORM ADICIONAR-NUMERO-E-MOSTRAR.
      * Configurar e mostrar a linha 5
           MOVE "Configurar e mostrar a linha 5." TO A-MENSAGEM.
           PERFORM ADICIONAR-NUMERO-E-MOSTRAR.
       PROGRAM-DONE.
            STOP RUN.
       ADICIONAR-NUMERO-E-MOSTRAR.
           PERFORM ADICIONAR-NUMERO.
           PERFORM MOSTRAR-A-MENSAGEM.
       ADICIONAR-NUMERO.
           ADD 1 TO O-NUMERO.
       MOSTRAR-A-MENSAGEM.
           DISPLAY
               O-NUMERO
               O-ESPACO
               A-MENSAGEM.
