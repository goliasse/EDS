* @ValidationCode : MjoxOTkwMjc2NDpDcDEyNTI6MTQ4ODUzOTg3MDk4Njpoc2hhc2hhbms6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzAxLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 03 Mar 2017 16:47:50
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
$PACKAGE EB.TRANS
SUBROUTINE AMOUNTCONV
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

$USING AC.EntryCreation
$USING EB.Reports
$USING EB.SystemTables

    CURRENCY=EB.SystemTables.getLccy()
    ENQ.CURRENCY=EB.Reports.getRRecord()<AC.EntryCreation.StmtEntry.SteCurrency>

    IF CURRENCY EQ ENQ.CURRENCY THEN
        AMOUNT=EB.Reports.getRRecord()<AC.EntryCreation.StmtEntry.SteAmountLcy>
    END
    
    ELSE
        AMOUNT=EB.Reports.getRRecord()<AC.EntryCreation.StmtEntry.SteAmountFcy>
    END
    
    EB.Reports.setOData(AMOUNT)
    
RETURN
