      ******************************************************************
      * Author: Breno Lucena
      *> Date: 14/07/2023
      *> Purpose: Exercicio Ficha 24 - UFCD0807
      *> Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. programa24.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL PHONE-FILE
               ASSIGN TO "phone.dat"
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  PHONE-FILE.
      *     LABEL RECORDS ARE STANDARD.
       01  PHONE-RECORD.
           05 PHONE-LAST-NAME      PIC X(20).
           05 PHONE-FIRST-NAME     PIC X(20).
           05 PHONE-NUMBER         PIC X(15).

       WORKING-STORAGE SECTION.
       01  PROMPT-1                PIC X(11)    VALUE "Ultimo nome".
       01  PROMPT-2                PIC X(13)   VALUE "Primeiro nome".
       01  PROMPT-3                PIC X(6)    VALUE "Numero".

       01  YES-NO                  PIC X.
       01  ENTRY-OK                PIC X.

       PROCEDURE DIVISION.
       MAIN-LOGIC-SECTION.
       PROGRAM-BEGIN.

           PERFORM OPENING-PROCEDURE.
           MOVE "S" TO YES-NO.
           PERFORM ADD-RECORDS UNTIL YES-NO = "N".
           PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
            STOP RUN.

      *    ABRINDO E FECHANDO

       OPENING-PROCEDURE.
           OPEN EXTEND PHONE-FILE.

       CLOSING-PROCEDURE.
           CLOSE PHONE-FILE.

       ADD-RECORDS.
           MOVE "N" TO ENTRY-OK.
           PERFORM GET-FIELDS UNTIL ENTRY-OK = "S".
           PERFORM ADD-THIS-RECORD.
           PERFORM GO-AGAIN.

       GET-FIELDS.
           MOVE SPACE TO PHONE-RECORD.
           DISPLAY PROMPT-1 " ? ".
           ACCEPT PHONE-LAST-NAME.
           DISPLAY PROMPT-2 " ? ".
           ACCEPT PHONE-FIRST-NAME.
           DISPLAY PROMPT-3 " ? ".
           ACCEPT PHONE-NUMBER.
           PERFORM VALIDATE-FIELDS.

       VALIDATE-FIELDS.
           MOVE "S" TO ENTRY-OK.
           IF PHONE-LAST-NAME = SPACE
               DISPLAY "Ultimo nome deve ser introduzido "
               MOVE "N" TO ENTRY-OK.

       ADD-THIS-RECORD.
           WRITE PHONE-RECORD.

       GO-AGAIN.
           DISPLAY "Deseja inserir novo registo? (s/n)"
           ACCEPT YES-NO.
           IF YES-NO = "s"
               MOVE "S" TO YES-NO.
           IF YES-NO NOT = "S"
               MOVE "N" TO YES-NO.
       END PROGRAM programa24.
