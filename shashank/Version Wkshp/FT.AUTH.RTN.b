* @ValidationCode : MjoxNzc3MjYxNjE1OkNwMTI1MjoxNDkwOTUwNjE1MDAzOmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 31 Mar 2017 14:26:55
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
SUBROUTINE FT.AUTH.RTN
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING FT.Contract
$USING EB.SystemTables 

R.ID=''

DEBIT.ACCT.NO=EB.SystemTables.getRNew(FT.Contract.FundsTransfer.DebitAcctNo)
DEBIT.AMOUNT=EB.SystemTables.getRNew(FT.Contract.FundsTransfer.DebitAmount)
DEBIT.CURRENCY=EB.SystemTables.getRNew(FT.Contract.FundsTransfer.DebitCurrency)
DEBIT.VALUE.DATE=EB.SystemTables.getRNew(FT.Contract.FundsTransfer.DebitValueDate)
CREDIT.VALUE.DATE=EB.SystemTables.getRNew(FT.Contract.FundsTransfer.CreditValueDate)
ID=EB.SystemTables.getIdNew()
TODAY.DATE=EB.SystemTables.getToday()

R.ID=ID:"*":TODAY.DATE:"*":DEBIT.ACCT.NO:"*":DEBIT.AMOUNT:"*":DEBIT.CURRENCY:"*":DEBIT.VALUE.DATE:"*":CREDIT.VALUE.DATE

FT.WKSHP.FtDetails.Write(R.ID, '')

RETURN
