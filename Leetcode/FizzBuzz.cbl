       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 CNT PIC 999 VALUE 1.
           01 MODA PIC 999 VALUE 0.
           01 MODB PIC 999 VALUE 0.

       PROCEDURE DIVISION.
           A-PARA.
           PERFORM B-PARA WITH TEST AFTER UNTIL CNT = 999.
           STOP RUN.

           B-PARA.
           MOVE FUNCTION MOD(CNT, 3) TO MODA
           MOVE FUNCTION MOD(CNT, 5) TO MODB

           IF MODA = 0 AND MODB = 0
               DISPLAY 'FIZZBUZZ'
               PERFORM C-PARA
           END-IF.

           IF MODB = 0
               DISPLAY 'BUZZ'
               PERFORM C-PARA
           END-IF.

           IF MODA = 0
               DISPLAY 'FIZZ'
               PERFORM C-PARA
           END-IF.

           DISPLAY CNT.
           PERFORM C-PARA.

           C-PARA.
           ADD 1 TO CNT.
           CONTINUE.
