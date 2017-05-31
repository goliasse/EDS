* @ValidationCode : MjotMTc2MjMyOTkyNDpDcDEyNTI6MTQ5MjQzMjk3Nzk4NDpoc2hhc2hhbms6LTE6LTE6MDowOnRydWU6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 17 Apr 2017 18:12:57
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : DEV_201701.0
$PACKAGE FT.WKSHP

SUBROUTINE DAS.AC.SAVINGS(THE.LIST, THE.ARGS, TABLE.SUFFIX)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_DAS.AC.SAVINGS
$INSERT I_DAS.AC.SAVINGS.NOTES
$INSERT I_DAS
*-----------------------------------------------------------------------------
BUILD.DATA:
    MY.TABLE="ACCOUNT"
    
    BEGIN CASE
        
        CASE MY.CMD=DAS.ACCOUNT$ALL.IDS
            
    END CASE
    
RETURN
