*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
            ORG         $8000
main:       TRAP        #0
            TRAP        #0
            TRAP        #0
            TRAP        #0

            SIMHALT   

VTABLE      EQU         $80
            ORG         VTABLE
            DC.L        HANDLER
          
            ORG         $400     
HANDLER                                        
            MOVEM.L     D1/A1,-(SP)          ;saving working registers
           
            MOVE.W      8(SP),D1             ;moving SR to D1
            ANDI        #$2000,D1            ;removing all other bit values 
            CMPI.L      #$2000,D1            ;is 13 on or off?
            BEQ         OFF                  ;on -> turnoff
                
            ORI         #$2000,8(SP)         ;otherwise, turning on bit 13
            BRA         RETURN               ;return
                
OFF         ANDI        #$DFFF,8(SP)         ;turning off bit 13
                
RETURN      MOVEM.L     (SP)+,D1/A1          ;restoring working registers
            RTE 

            END         main      


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
