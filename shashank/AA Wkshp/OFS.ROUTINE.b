* @ValidationCode : MjotOTEyODYxNjA3OkNwMTI1MjoxNDkyNjY4MTcyMzY5OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Apr 2017 11:32:52
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
$PACKAGE FT.WKSHP
SUBROUTINE OFS.ROUTINE(PARAM.IN, PARAM.OUT)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
$USING AC.AccountOpening

CURR=''
BAL=''
NOS=DCOUNT(PARAM.IN,",")
I=1
PARAM.OUT=''

LOOP 
    ACC=FIELD(PARAM.IN,",",I)
    I++
    NOS--
WHILE NOS GE 0 DO

IF (ACC EQ '') THEN
    CRT "PLEASE SEND AN ACCOUNT NUMBER"
END

ELSE 
    R.ACC=AC.AccountOpening.Account.Read(ACC, Error)
    
    IF (R.ACC EQ '') THEN
        CRT "INVALID ACCOUNT"
    END
    ELSE
        CURR=R.ACC<AC.AccountOpening.Account.Currency>
        BAL=R.ACC<AC.AccountOpening.Account.WorkingBalance>
        CRT "Working Balance for Account No ":ACC:" = ":BAL:" ":CURR
    END
END
REPEAT

RETURN
