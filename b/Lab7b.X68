*-----------------------------------------------------------
* Title      : Lab7b
* Written by : Your name goes here
* Date       : dd/mm/yyyy
* Description: Example of Privilege Violation Exception
*              with return from handler
*-----------------------------------------------------------

        MEMORY ROM 0,1023

* The main program starts below
        ORG     $8000
main    ANDI    #$DFFF,SR
        ORI     #$2000,SR

* Execute upon return from exception
        LEA     MSG2,A1
        MOVE.L  #13,D0
        TRAP    #15

        SIMHALT

MSG2    DC.B    'Return from Exception (RTE) successful! Running Main code.',0

* The code below is included as a system initialization
* program

* Update Vector Table
PRVADDR EQU     $20
        ORG     PRVADDR
        DC.L    PRVHANDLER

* Privilege violation exception handler
        ORG     $400
PRVHANDLER
        MOVEM.L  A1/D0,-(A7)     ;save working registers
        LEA     MSG,A1
        MOVE.L  #13,D0
        TRAP    #15
        MOVEM.L  (A7)+,A1/D0     ;restore working registers
        RTE                     ;return from exception

        SIMHALT
MSG     DC.B    'Privilege Violation has occurred. Program terminated.',0

        END     $8000
