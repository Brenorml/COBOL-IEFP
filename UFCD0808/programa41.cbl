      ******************************************************************
      *> Author: Breno Lucena
      *> Date: 06/09/2023
      *> Purpose: Exercicio Ficha 40 - UFCD0807
      *> Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. program40.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       COPY "SLVENDOR.CBL".

       SELECT OPTIONAL NEW-FILE
               ASSIGN TO "vendornew.dat"
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       COPY "FDVENDOR.CBL".

       WORKING-STORAGE SECTION.
       77  MENU-PICK PIC 9.
       88  MENU-PICK-IS-VALID VALUE 0 THRU 8.

       77  THE-MODE PIC X(7).
       77  WHICH-FIELD PIC 9.
       77  OK-TO-DELETE PIC X.
       77  RECORD-FOUND PIC X.
       77  VENDOR-NUMBER-FIELD PIC Z(5).

       01 DETAIL-LINE.
           05 DISPLAY-NUMBER PIC 9(5).
           05 FILLER PIC X VALUE SPACE.
           05 DISPLAY-NAME PIC X(30).
           05 FILLER PIC X VALUE SPACE.
           05 DISPLAY-CONTACT PIC X(30).

       01 CITY-STATE-DETAIL.
           05 DISPLAY-CITY PIC X(20).
           05 FILLER PIC X VALUE SPACE.
           05 DISPLAY-STATE PIC X(2).

       01 COLUMN-LINE.
           05 FILLER PIC X(2) VALUE "NO".
           05 FILLER PIC X(4) VALUE SPACE.
           05 FILLER PIC X(12) VALUE "NAME-ADDRESS".
           05 FILLER PIC X(19) VALUE SPACE.
           05 FILLER PIC X(17) VALUE "CONTACT-PHONE-ZIP".

       01 TITLE-LINE.
           05 FILLER PIC X(15) VALUE SPACE.
           05 FILLER PIC X(11) VALUE "VENDOR LIST".
           05 FILLER PIC X(15) VALUE SPACE.
           05 FILLER PIC X(5) VALUE "PAGE:".
           05 FILLER PIC X(1) VALUE SPACE.
           05 DISPLAY-PAGE-NUMBER PIC ZZZZ9.

       77 FILE-AT-END PIC X.
       77 A-DUMMY PIC X.
       77 LINE-COUNT PIC 999 VALUE ZERO.
       77 PAGE-NUMBER PIC 99999 VALUE ZERO.
       77 MAXIMUM-LINES PIC 999 VALUE 15.

       77 DISPLAY-RECORD PIC X(79).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM OPENING-PROCEDURE.
           PERFORM MAIN-PROCESS.
           PERFORM CLOSING-PROCEDURE.

       PROGRAM-DONE.
           STOP RUN.

       OPENING-PROCEDURE.
           OPEN I-O VENDOR-FILE.

       CLOSING-PROCEDURE.
           CLOSE VENDOR-FILE.

       MAIN-PROCESS.
           PERFORM GET-MENU-PICK.
           PERFORM MAINTAIN-THE-FILE UNTIL MENU-PICK = 0.

      *    MENU OPTIONS
       GET-MENU-PICK.
           PERFORM DISPLAY-THE-MENU.
           PERFORM GET-THE-PICK.
           PERFORM MENU-RETRY UNTIL MENU-PICK-IS-VALID.

       DISPLAY-THE-MENU.
           PERFORM CLEAR-SCREEN.
           DISPLAY " PLEASE SELECT:".
           DISPLAY " ".
           DISPLAY " 1. ADD RECORDS".
           DISPLAY " 2. CHANGE A RECORD".
           DISPLAY " 3. LOOK UP A RECORD".
           DISPLAY " 4. DELETE A RECORD".
           DISPLAY " 5. LIST ALL SORTED".
           DISPLAY " 6. LIST ALL".
           DISPLAY " 7. LIST NUMBER/NAME".
           DISPLAY " 8. CREATE FILE".
           DISPLAY " ".
           DISPLAY " 0. EXIT".
           PERFORM SCROLL-LINE 2 TIMES.

       GET-THE-PICK.
           DISPLAY "YOUR CHOICE (0-8)?".
           ACCEPT MENU-PICK.

       MENU-RETRY.
           DISPLAY "INVALID SELECTION - PLEASE RE-TRY.".
           PERFORM GET-THE-PICK.
           CLEAR-SCREEN.
           PERFORM SCROLL-LINE 25 TIMES.

       SCROLL-LINE.
           DISPLAY " ".

       MAINTAIN-THE-FILE.
           PERFORM DO-THE-PICK.
           PERFORM GET-MENU-PICK.

       DO-THE-PICK.
           IF MENU-PICK = 1
               PERFORM ADD-MODE
           ELSE IF MENU-PICK = 2
               PERFORM CHANGE-MODE
           ELSE IF MENU-PICK = 3
               PERFORM INQUIRE-MODE
           ELSE IF MENU-PICK = 4
               PERFORM DELETE-MODE
           ELSE IF MENU-PICK = 5
               PERFORM LIST-SORTED
           ELSE IF MENU-PICK = 6
               PERFORM LIST-ALL
           ELSE IF MENU-PICK = 7
               PERFORM LIST-NUMBER-NAME
           ELSE IF MENU-PICK = 8
               PERFORM CREATE-NEW-FILE.

      *    ADD MODE

       ADD-MODE.
           MOVE "ADD" TO THE-MODE.
           PERFORM GET-NEW-VENDOR-NUMBER.
           PERFORM ADD-RECORDS UNTIL VENDOR-NUMBER = ZEROES.

       GET-NEW-VENDOR-NUMBER.
           PERFORM INIT-VENDOR-RECORD.
           PERFORM ENTER-VENDOR-NUMBER.
           MOVE "Y" TO RECORD-FOUND.
           PERFORM FIND-NEW-VENDOR-RECORD UNTIL RECORD-FOUND = "N" OR
               VENDOR-NUMBER = ZEROES.

       FIND-NEW-VENDOR-RECORD.
           PERFORM READ-VENDOR-RECORD.
           IF RECORD-FOUND = "Y"
               DISPLAY "RECORD ALREADY ON FILE"
               PERFORM ENTER-VENDOR-NUMBER.

       ADD-RECORDS.
           PERFORM ENTER-REMAINING-FIELDS.
           PERFORM WRITE-VENDOR-RECORD
           PERFORM GET-NEW-VENDOR-NUMBER.

       ENTER-REMAINING-FIELDS.
           PERFORM ENTER-VENDOR-NAME.
           PERFORM ENTER-VENDOR-ADDRESS-1.
           PERFORM ENTER-VENDOR-ADDRESS-2.
           PERFORM ENTER-VENDOR-CITY.
           PERFORM ENTER-VENDOR-STATE.
           PERFORM ENTER-VENDOR-ZIP.
           PERFORM ENTER-VENDOR-CONTACT.
           PERFORM ENTER-VENDOR-PHONE.

      *    CHANGE MODE

       CHANGE-MODE.
           MOVE "CHANGE" TO THE-MODE.
           PERFORM GET-VENDOR-RECORD.
           PERFORM CHANGE-RECORDS UNTIL VENDOR-NUMBER = ZEROES.

       CHANGE-RECORDS.
           PERFORM GET-FIELD-TO-CHANGE.
           PERFORM CHANGE-ONE-FIELD UNTIL WHICH-FIELD = ZERO.
           PERFORM GET-VENDOR-RECORD.

       GET-FIELD-TO-CHANGE.
           PERFORM DISPLAY-ALL-FIELDS.
           PERFORM ASK-WHICH-FIELD.

       ASK-WHICH-FIELD.
           DISPLAY "ENTER THE NUMBER OF THE FIELD".
           DISPLAY "TO CHANGE (1-8) OR 0 TO EXIT".
           ACCEPT WHICH-FIELD.
           IF WHICH-FIELD > 8
               DISPLAY "INVALID ENTRY".

       CHANGE-ONE-FIELD.
           PERFORM CHANGE-THIS-FIELD.
           PERFORM GET-FIELD-TO-CHANGE.

       CHANGE-THIS-FIELD.
           IF WHICH-FIELD = 1
               PERFORM ENTER-VENDOR-NAME.
           IF WHICH-FIELD = 2
               PERFORM ENTER-VENDOR-ADDRESS-1.
           IF WHICH-FIELD = 3
               PERFORM ENTER-VENDOR-ADDRESS-2.
           IF WHICH-FIELD = 4
               PERFORM ENTER-VENDOR-CITY.
           IF WHICH-FIELD = 5
               PERFORM ENTER-VENDOR-STATE.
           IF WHICH-FIELD = 6
               PERFORM ENTER-VENDOR-ZIP.
           IF WHICH-FIELD = 7
               PERFORM ENTER-VENDOR-CONTACT.
           IF WHICH-FIELD = 8
               PERFORM ENTER-VENDOR-PHONE.

           PERFORM REWRITE-VENDOR-RECORD.

      *    INQUIRE MODE
       INQUIRE-MODE.
           MOVE "DISPLAY" TO THE-MODE.
           PERFORM GET-VENDOR-RECORD.
           PERFORM INQUIRE-RECORDS UNTIL VENDOR-NUMBER = ZEROES.

       INQUIRE-RECORDS.
           PERFORM DISPLAY-ALL-FIELDS.
           PERFORM GET-VENDOR-RECORD.

      *    DELETE MODE
       DELETE-MODE.
           MOVE "DELETE" TO THE-MODE.
           PERFORM GET-VENDOR-RECORD.
           PERFORM DELETE-RECORDS UNTIL VENDOR-NUMBER = ZEROES.

       DELETE-RECORDS.
           PERFORM DISPLAY-ALL-FIELDS.
           MOVE "X" TO OK-TO-DELETE.
           PERFORM ASK-TO-DELETE UNTIL OK-TO-DELETE = "Y" OR "N".
           IF OK-TO-DELETE = "Y"
               PERFORM DELETE-VENDOR-RECORD.
           PERFORM GET-VENDOR-RECORD.

       ASK-TO-DELETE.
           DISPLAY "DELETE THIS RECORD (Y/N)?".
           ACCEPT OK-TO-DELETE.
           IF OK-TO-DELETE = "y"
               MOVE "Y" TO OK-TO-DELETE.
           IF OK-TO-DELETE = "n"
               MOVE "N" TO OK-TO-DELETE.
           IF OK-TO-DELETE NOT = "Y" AND OK-TO-DELETE NOT = "N"
               DISPLAY "YOU MUST ENTER UES OR NO".

      *    LIST SORTED

       LIST-SORTED.
           MOVE ZEROES TO LINE-COUNT PAGE-NUMBER.
           PERFORM START-NEW-PAGE.
           MOVE "N" TO FILE-AT-END.
           PERFORM READ-NEXT-RECORD.
           IF FILE-AT-END = "Y"
               MOVE "NO RECORDS FOUND" TO DISPLAY-RECORD
               PERFORM PRESS-ENTER
               PERFORM WRITE-DISPLAY-RECORD
           ELSE
               PERFORM DISPLAY-VENDOR-FIELDS UNTIL FILE-AT-END = "Y".
               PERFORM PRESS-ENTER.

       DISPLAY-VENDOR-FIELDS.
           IF LINE-COUNT > MAXIMUM-LINES
               PERFORM START-NEXT-PAGE.
           PERFORM DISPLAY-THE-RECORD.
           PERFORM READ-NEXT-RECORD.

       DISPLAY-THE-RECORD.
           PERFORM DISPLAY-LINE-1.
           PERFORM DISPLAY-LINE-2.
           PERFORM DISPLAY-LINE-3.
           PERFORM DISPLAY-LINE-4.
           PERFORM LINE-FEED.

       DISPLAY-LINE-1.
           MOVE SPACE TO DETAIL-LINE.
           MOVE VENDOR-NUMBER TO DISPLAY-NUMBER.
           MOVE VENDOR-NAME TO DISPLAY-NAME.
           MOVE VENDOR-CONTACT TO DISPLAY-CONTACT.
           MOVE DETAIL-LINE TO DISPLAY-RECORD.
           PERFORM WRITE-DISPLAY-RECORD.

       DISPLAY-LINE-2.
           MOVE SPACE TO DETAIL-LINE.
           MOVE VENDOR-ADDRESS-1 TO DISPLAY-NAME.
           MOVE VENDOR-PHONE TO DISPLAY-CONTACT.
           MOVE DETAIL-LINE TO DISPLAY-RECORD.
           PERFORM WRITE-DISPLAY-RECORD.

       DISPLAY-LINE-3.
           MOVE SPACE TO DETAIL-LINE.
           MOVE VENDOR-ADDRESS-2 TO DISPLAY-NAME.
           IF VENDOR-ADDRESS-2 NOT = SPACE
               MOVE DETAIL-LINE TO DISPLAY-RECORD
               PERFORM WRITE-DISPLAY-RECORD.

       DISPLAY-LINE-4.
           MOVE SPACE TO DETAIL-LINE.
           MOVE VENDOR-CITY TO DISPLAY-CITY.
           MOVE VENDOR-STATE TO DISPLAY-STATE.
           MOVE CITY-STATE-DETAIL TO DISPLAY-NAME.
           MOVE VENDOR-ZIP TO DISPLAY-CONTACT.
           MOVE DETAIL-LINE TO DISPLAY-RECORD.
           PERFORM WRITE-DISPLAY-RECORD.

       WRITE-DISPLAY-RECORD.
           DISPLAY DISPLAY-RECORD.
           ADD 1 TO LINE-COUNT.

       LINE-FEED.
           MOVE SPACE TO DISPLAY-RECORD.
           PERFORM WRITE-DISPLAY-RECORD.

       START-NEXT-PAGE.

           PERFORM END-LAST-PAGE.
           PERFORM START-NEW-PAGE.

       START-NEW-PAGE.
           ADD 1 TO PAGE-NUMBER.
           MOVE PAGE-NUMBER TO DISPLAY-PAGE-NUMBER.
           MOVE TITLE-LINE TO DISPLAY-RECORD.
           PERFORM WRITE-DISPLAY-RECORD.
           PERFORM LINE-FEED.
           MOVE COLUMN-LINE TO DISPLAY-RECORD.
           PERFORM WRITE-DISPLAY-RECORD.
           PERFORM LINE-FEED.

       END-LAST-PAGE.
           PERFORM PRESS-ENTER.
           MOVE ZERO TO LINE-COUNT.

      *    LIST ALL

       LIST-ALL.
           MOVE "N" TO FILE-AT-END.
           PERFORM READ-NEXT-RECORD.
           PERFORM READ-AND-DISPLAY UNTIL FILE-AT-END = "Y".
           PERFORM PRESS-ENTER.

       READ-AND-DISPLAY.
           DISPLAY VENDOR-RECORD.
           PERFORM READ-NEXT-RECORD.

      *    LIST NUMBER/NAME

       LIST-NUMBER-NAME.
           MOVE "N" TO FILE-AT-END.
           PERFORM READ-NEXT-RECORD.
           IF FILE-AT-END = "Y"
               DISPLAY "NO RECORDS FOUND"
               PERFORM PRESS-ENTER
           ELSE
               PERFORM DISPLAY-VENDOR-DETAILS UNTIL FILE-AT-END = "Y".
               PERFORM PRESS-ENTER.

       DISPLAY-VENDOR-DETAILS.
           DISPLAY "NO: " VENDOR-NUMBER " NAME: " VENDOR-NAME.
           PERFORM READ-NEXT-RECORD.

      *    CREATING FILES

       CREATE-NEW-FILE.
           PERFORM CLOSING-PROCEDURE.
           PERFORM NEW-OPENING-PROCEDURE.
           DISPLAY "FILE CREATED SUCESSFULLY."
           PERFORM PRESS-ENTER.

       NEW-OPENING-PROCEDURE.
           OPEN I-O NEW-FILE.


      *    GENERIC ROUTINES
       INIT-VENDOR-RECORD.
           MOVE SPACE TO VENDOR-RECORD.
           MOVE ZEROES TO VENDOR-NUMBER.

       ENTER-VENDOR-NUMBER.
           DISPLAY " ".
           DISPLAY "ENTER VENDOR NUMBER OF THE VENDOR" .
           DISPLAY "TO CHANGE (1-99999)".
           DISPLAY "ENTER 0 TO STOP ENTRY".
           ACCEPT VENDOR-NUMBER-FIELD.

           MOVE VENDOR-NUMBER-FIELD TO VENDOR-NUMBER.

       GET-VENDOR-RECORD.
           PERFORM INIT-VENDOR-RECORD.
           PERFORM ENTER-VENDOR-NUMBER.
           MOVE "N" TO RECORD-FOUND.
           PERFORM FIND-VENDOR-RECORD UNTIL RECORD-FOUND = "Y" OR
               VENDOR-NUMBER = ZEROES.

      *    ROUTINES SHARED ADD AND CHANGE
       FIND-VENDOR-RECORD.
           PERFORM READ-VENDOR-RECORD.
           IF RECORD-FOUND = "N"
               DISPLAY "RECORD NOT FOUND"
               PERFORM ENTER-VENDOR-NUMBER.

       ENTER-VENDOR-NAME.
           DISPLAY "ENTER VENDOR NAME".
           ACCEPT VENDOR-NAME.

       ENTER-VENDOR-ADDRESS-1.
           DISPLAY "ENTER VENDOR ADDRESS-1".
           ACCEPT VENDOR-ADDRESS-1.

       ENTER-VENDOR-ADDRESS-2.
           DISPLAY "ENTER VENDOR ADDRESS-2".
           ACCEPT VENDOR-ADDRESS-2.

       ENTER-VENDOR-CITY.
           DISPLAY "ENTER VENDOR CITY".
           ACCEPT VENDOR-CITY.

       ENTER-VENDOR-STATE.
       DISPLAY "ENTER VENDOR STATE".
       ACCEPT VENDOR-STATE.

       ENTER-VENDOR-ZIP.
           DISPLAY "ENTER VENDOR ZIP".
           ACCEPT VENDOR-ZIP.

       ENTER-VENDOR-CONTACT.
           DISPLAY "ENTER VENDOR CONTACT".
           ACCEPT VENDOR-CONTACT.

       ENTER-VENDOR-PHONE.
           DISPLAY "ENTER VENDOR PHONE".
           ACCEPT VENDOR-PHONE.

      *    ROUTINES SHARED BY CHANGE, INQUIRE AND DELETE
       DISPLAY-ALL-FIELDS.
           DISPLAY " ".
           PERFORM DISPLAY-VENDOR-NUMBER.
           PERFORM DISPLAY-VENDOR-NAME.
           PERFORM DISPLAY-VENDOR-ADDRESS-1.
           PERFORM DISPLAY-VENDOR-ADDRESS-2.
           PERFORM DISPLAY-VENDOR-CITY.
           PERFORM DISPLAY-VENDOR-STATE.
           PERFORM DISPLAY-VENDOR-ZIP.
           PERFORM DISPLAY-VENDOR-CONTACT.
           PERFORM DISPLAY-VENDOR-PHONE.
           DISPLAY " ".

       DISPLAY-VENDOR-NUMBER.
           DISPLAY " VENDOR NUMBER: " VENDOR-NUMBER.

       DISPLAY-VENDOR-NAME.
           DISPLAY "1. VENDOR NAME: " VENDOR-NAME.

       DISPLAY-VENDOR-ADDRESS-1.
           DISPLAY "2. VENDOR ADDRESS-1: " VENDOR-ADDRESS-1.

       DISPLAY-VENDOR-ADDRESS-2.
           DISPLAY "3. VENDOR ADDRESS-2: " VENDOR-ADDRESS-2.

       DISPLAY-VENDOR-CITY.
           DISPLAY "4. VENDOR CITY: " VENDOR-CITY.

       DISPLAY-VENDOR-STATE.
           DISPLAY "5. VENDOR STATE: " VENDOR-STATE.

       DISPLAY-VENDOR-ZIP.
           DISPLAY "6. VENDOR ZIP: " VENDOR-ZIP.

       DISPLAY-VENDOR-CONTACT.
           DISPLAY "7. VENDOR CONTACT: " VENDOR-CONTACT.

       DISPLAY-VENDOR-PHONE.
           DISPLAY "8. VENDOR PHONE: " VENDOR-PHONE.

      *    ROUTINES SHARED BY LIST MODES

       READ-NEXT-RECORD.
           READ VENDOR-FILE NEXT RECORD AT END MOVE "Y" TO FILE-AT-END.

       PRESS-ENTER.
           DISPLAY "PRESS ENTER TO CONTINUE. . .".
           ACCEPT A-DUMMY.

      *    FILE INPUT-OUTPUT ROUTINES
       READ-VENDOR-RECORD.
           MOVE "Y" TO RECORD-FOUND.
           READ VENDOR-FILE RECORD
               INVALID KEY
                   MOVE "N" TO RECORD-FOUND.

       WRITE-VENDOR-RECORD.
           WRITE VENDOR-RECORD
               INVALID KEY
                   DISPLAY "RECORD ALREADY ON FILE".
       REWRITE-VENDOR-RECORD.
           REWRITE VENDOR-RECORD
               INVALID KEY
               DISPLAY "ERROR REWRITING VENDOR RECORD".

       DELETE-VENDOR-RECORD.
           DELETE VENDOR-FILE RECORD
               INVALID KEY
                   DISPLAY "ERROR DELETING VENDOR RECORD".
