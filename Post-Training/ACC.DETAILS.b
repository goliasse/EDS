* @ValidationCode : MjotMTY5MzUxMjIxNzpDcDEyNTI6MTQ4ODE5MjYzMDAzMTp2a3Nzb3VyYWJoOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 27 Feb 2017 16:20:30
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : vkssourabh
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
SUBROUTINE ACC.DETAILS(ENQ.DATA)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$USING ST.AccountStatement

ACC=ENQ.DATA<4,1>
CRT ACC
ARR= ST.AccountStatement.AcctStmtPrint.Read(ACC, Error)
count=DCOUNT(ARR,@FM)
CRT count
ctr=0
rec=""
FLAG=1
I=0

LOOP
I++ 
WHILE FLAG EQ 1
IF count EQ 0 THEN
BREAK
END
    
    DAT=FIELD(ARR<I>,"/",1)
    ACC1=ACC:"-":DAT
    
    ENTRY=ST.AccountStatement.StmtPrinted.Read(ACC1, Error)
    J=DCOUNT(ENTRY,@FM)
    
  LOOP WHILE J GT 0
       
* CRT "HI"
        ctr=ctr+1
       
        IF ctr GT 5 THEN
        FLAG=0
        BREAK
        END
   
    ENQ.DATA<2,-1>="@ID"
    ENQ.DATA<3,-1>="EQ"
     ENQ.DATA<4,-1>=ENTRY<J>
    J--
  REPEAT
  count--
    
    
REPEAT

*-----------------------------------------------------------------------------
CRT "END"
END
