       IDENTIFICATION DIVISION.
       PROGRAM-ID. DetectCapital.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 WORD PIC X(5) VALUE 'HELLO'.
           01 UPPER_WORD PIC X(5).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           MOVE FUNCTION UPPER-CASE(WORD) to UPPER_WORD
           IF WORD = UPPER_WORD
               DISPLAY "All uppercase"
           ELSE
               DISPLAY "Not all uppercase"
           END-IF
           STOP RUN.
       END PROGRAM DetectCapital.
