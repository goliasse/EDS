* @ValidationCode : MjoxNjEwODE0MTQ1OkNwMTI1MjoxNDkzMDMxNzYxMzEwOmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 24 Apr 2017 16:32:41
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
SUBROUTINE CONV
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING ST.AccountStatement
$USING AC.AccountOpening
$USING AC.EntryCreation
$USING EB.Reports
$USING EB.SystemTables

   
    ACC.NO=EB.Reports.getRRecord()<AC.EntryCreation.StmtEntry.SteAccountNumber>     ;* Get Account Number 
    R.ACC=AC.AccountOpening.Account.Read(ACC.NO, Error)                             ;* Read ACCOUNT application
    ENQKEYS.COUNT=DCOUNT(EB.Reports.getEnqKeys(),@FM)
    
    CURRENCY=EB.SystemTables.getLccy()
    ENQ.CURRENCY=EB.Reports.getRRecord()<AC.EntryCreation.StmtEntry.SteCurrency>
    
    IF CURRENCY EQ ENQ.CURRENCY THEN
        AMOUNT=EB.Reports.getRRecord()<AC.EntryCreation.StmtEntry.SteAmountLcy>
    END
    
    ELSE
        AMOUNT=EB.Reports.getRRecord()<AC.EntryCreation.StmtEntry.SteAmountFcy>
    END
    
    UPDATED.BALANCE=EB.TRANS.getUpdatedBalance()
        
    IF UPDATED.BALANCE EQ 0 THEN
    
        UPDATED.BALANCE=R.ACC<AC.AccountOpening.Account.OnlineActualBal>
        EB.Reports.setOData(UPDATED.BALANCE)
        UPDATED.BALANCE=UPDATED.BALANCE-AMOUNT
        EB.TRANS.setUpdatedBalance(UPDATED.BALANCE)
    END
    
    ELSE   
        EB.Reports.setOData(UPDATED.BALANCE)
        UPDATED.BALANCE=UPDATED.BALANCE-AMOUNT
        EB.TRANS.setUpdatedBalance(UPDATED.BALANCE)
    END
    
    IF ENQKEYS.COUNT EQ 0 THEN
    EB.TRANS.setUpdatedBalance(0)
    END
    
    CRT "-----------------------"   
    CRT UPDATED.BALANCE

RETURN
