       IDENTIFICATION DIVISION.
       PROGRAM-ID. ReverseString.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 WORD PIC X(7) VALUE 'TACOCAT'.
           01 REVERSED_WORD PIC X(7).
       PROCEDURE DIVISION.
           DISPLAY "Word: " WORD
           MOVE FUNCTION REVERSE (FUNCTION TRIM(WORD)) TO REVERSED_WORD
           DISPLAY "Reversed Word: " REVERSED_WORD
           *> EQUALS (by itself) does not work
           *> IS = works
           *> = works
           *> IS EQUAL TO works
           *> https://stackoverflow.com/questions/25590973/comparing-2-pic-x-strings-of-characters-in-cobol#37200802
           IF WORD = REVERSED_WORD
               DISPLAY "Palindrome"
           ELSE
               DISPLAY "Not a Palindrome"
           END-IF
           STOP RUN.
       END PROGRAM ReverseString.
