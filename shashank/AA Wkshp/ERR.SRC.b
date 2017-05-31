* @ValidationCode : MjotNTA2ODg5MDA5OkNwMTI1MjoxNDkyNjA0MzQxMjI3OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Apr 2017 17:49:01
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
SUBROUTINE ERR.SRC
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
 
 $USING EB.SystemTables 
 $USING EB.ErrorProcessing 
 $USING FT.Contract
 
DEBIT= EB.SystemTables.getRNew(FT.Contract.FundsTransfer.DebitAmount) 
 
 IF DEBIT GE 100 THEN
  EB.SystemTables.setEtext('AC-DEBIT')
        EB.SystemTables.setAf(FT.Contract.FundsTransfer.DebitAmount)   ;* Set Error on Credit Value Date
        EB.ErrorProcessing.StoreEndError()
 END

RETURN