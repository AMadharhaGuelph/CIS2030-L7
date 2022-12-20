*-----------------------------------------------------------
* Title      : Lab7d
* Written by : Your name goes here
* Date       : dd/mm/yyyy
* Description: Example of Privilege Violation
*-----------------------------------------------------------

        MEMORY  ROM 0,7

* The code below is included as a system initialization
* program

RESET   EQU     0           ;reset Vector Address
SSP     EQU     $FFFFFFFE   ;initial value of SSP
PC      EQU     $00000400   ;initial value of PC


* Part 1: Update Vector Table

        ORG     RESET
        DC.L    SSP
        DC.L    PC

* Part 2: Simple Monitor Program
        ORG     $400
        LEA     MSG1,A1
        MOVE.L  #13,D0
        TRAP    #15

        SIMHALT

* Part 3: Simple running program
        ORG     $8000
        ANDI    #$DFFF,SR
        LEA     MSG2,A1
        MOVE.L  #13,D0
LOOP    TRAP    #15
        BRA     LOOP

MSG2    DC.B    'Process running as normal',0
MSG1    DC.B    'Reset Exception has occurred, terminating process, and initiating monitor program',0

        END     $8000
