*-----------------------------------------------------------
* Title      : Lab7c
* Written by : Your name goes here
* Date       : dd/mm/yyyy
* Description: Example of Address Error
*-----------------------------------------------------------

        ORG     $8000

        LEA     $9000,A0
        MOVE.B  (A0)+,D0
        MOVE.W  (A0),D1

        END     $8000
