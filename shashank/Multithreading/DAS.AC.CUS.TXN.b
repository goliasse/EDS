* @ValidationCode : MjotMTkxMjYzMzk0MjpDcDEyNTI6MTQ5NjQwNTM4NjI3Mjpoc2hhc2hhbms6LTE6LTE6MDowOnRydWU6Ti9BOkRFVl8yMDE3MDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 02 Jun 2017 17:39:46
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : DEV_201704.0
$PACKAGE CUS.TXN

SUBROUTINE DAS.AC.CUS.TXN(THE.LIST, THE.ARGS, TABLE.SUFFIX)

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
