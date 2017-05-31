* @ValidationCode : MjotNDgyNjg0NjM4OkNwMTI1MjoxNDkwMTU2MzQxMzY1OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 22 Mar 2017 09:49:01
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
$PACKAGE EB.BNFC
SUBROUTINE AC.TRANS.VALIDATE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING EB.SystemTables
$USING AC.AccountOpening
$USING FT.Contract

DEBIT.ACCT.NO=EB.SystemTables.getComi()

R.DEBIT.ACC=AC.AccountOpening.Account.Read(DEBIT.ACCT.NO, Error)

DEBIT.CURR=R.DEBIT.ACC<AC.AccountOpening.Account.Currency>

EB.SystemTables.setRNew(FT.Contract.FundsTransfer.DebitCurrency,DEBIT.CURR)

RETURN
