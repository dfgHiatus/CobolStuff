       IDENTIFICATION DIVISION.
       PROGRAM-ID. ONE-DIMENSIONAL.
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 TARGET PIC 9(02) VALUE 10.

           *> Don't forget!!! COBOL is 1-indexed!
           01 OUTER_COUNT PIC 9(02) VALUE 1.
           01 INNER_COUNT PIC 9(02) VALUE 1.
           01 OUTER_VALUE PIC 9(02) VALUE 0.
           01 INNER_VALUE PIC 9(02) VALUE 0.

           *> Eh, maybe make it work for larger arrays
           *> We need to define table size in addition to the tables
           01 TABLE-SIZE PIC 9(02) VALUE 6.
           01 F_VALUE VALUE
               "12345".
                   05 F_ARR OCCURS 5 TIMES PIC A(1).
           01 S_VALUE VALUE
               "54321".
                   05 S_ARR OCCURS 5 TIMES PIC A(1).

       PROCEDURE DIVISION.
           *> Start the outer loop. This will go 0..n times n times
           PERFORM VARYING OUTER_COUNT
               FROM 1 BY 1
               UNTIL OUTER_COUNT = TABLE-SIZE

           *> Get the values of the table using the indices
           MOVE FUNCTION NUMVAL(F_ARR(OUTER_COUNT)) TO OUTER_VALUE
           MOVE FUNCTION NUMVAL(S_ARR(INNER_COUNT)) TO INNER_VALUE

           *> Check for twosum
           IF OUTER_VALUE + INNER_VALUE = TARGET THEN
           *> If we match the target, dispay the indices NOT values!
               DISPLAY OUTER_COUNT " " INNER_COUNT
               STOP RUN
           *> Else, bump the inner count and try again
           ELSE
               ADD 1 TO INNER_COUNT
               *> Note, we don't want to increment outer count just yet
               *> So, keep setting the outer loop unless inner is done
               *> 1-1, 1-2, 1-3, ..., 2-1, 2-2, etc.
               IF INNER_COUNT = TABLE-SIZE THEN
                   MOVE 1 TO OUTER_COUNT
               *> Else, we are done here and OUTER_COUNT may increment
               *> Don't forget to reset
               ELSE
                   MOVE 1 TO INNER_COUNT
               END-IF
           END-IF

           END-PERFORM.
