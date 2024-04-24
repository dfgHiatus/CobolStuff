       IDENTIFICATION DIVISION.
       PROGRAM-ID. ReverseString.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 WORD PIC X(5) VALUE 'HELLO'.
       PROCEDURE DIVISION.
            DISPLAY "Word: " WORD
            DISPLAY "Reversed: " FUNCTION REVERSE (FUNCTION TRIM (WORD))
            STOP RUN.
       END PROGRAM ReverseString.
