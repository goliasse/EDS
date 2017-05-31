$PACKAGE CUS.TXN

SUBROUTINE DAS.AC.CUS.TXN(THE.LIST, THE.ARGS, TABLE.SUFFIX)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_DAS.AC.CUS.TXN
$INSERT I_DAS.AC.CUS.TXN.NOTES
$INSERT I_DAS
*-----------------------------------------------------------------------------
BUILD.DATA:
    MY.TABLE="AC.CUS.TXN"
    
    BEGIN CASE
        
        CASE MY.CMD=DAS.AC.CUS.TXN$ALL.IDS
        
        CASE MY.CMD=DAS.AC.CUS.TXN$SESSION.IDS
        MY.FIELDS="@ID"
        MY.OPERANDS="LK"
        MY.DATA="...":"-":"..."    
    
    END CASE
    
RETURN
