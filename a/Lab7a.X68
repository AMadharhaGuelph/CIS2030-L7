*-----------------------------------------------------------
* Title      : Lab7a
* Written by : Your name goes here
* Date       : dd/mm/yyyy
* Description: Example of Privilege Violation Exception
*-----------------------------------------------------------

        MEMORY ROM 0,1023

* The main program starts below
        ORG     $8000
main    ANDI    #$DFFF,SR
        ORI     #$2000,SR

        SIMHALT


* The code below is included as a system initialization
* program

* Update Vector Table
PRVADDR EQU     $20
        ORG     PRVADDR
        DC.L    PRVHANDLER

* Privilege violation exception handler
        ORG     $400
PRVHANDLER
        LEA     MSG,A1
        MOVE.L  #13,D0
        TRAP    #15

        SIMHALT
MSG     DC.B    'Privilege Violation has occurred. Main code segment termainted.',0

        END     $8000
