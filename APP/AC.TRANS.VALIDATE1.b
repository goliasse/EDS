* @ValidationCode : MjotMTUzNzUwOTQyODpDcDEyNTI6MTQ5MDI0MjM2NDU1NDpoc2hhc2hhbms6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzAxLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 23 Mar 2017 09:42:44
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
SUBROUTINE AC.TRANS.VALIDATE1
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING EB.SystemTables
$USING AC.AccountOpening
$USING FT.Contract

BEN.ACCT.NO=EB.SystemTables.getComi()

R.CREDIT.ACC=AC.AccountOpening.Account.Read(BEN.ACCT.NO, Error)

BEN.CUS=R.CREDIT.ACC<AC.AccountOpening.Account.Customer>

EB.SystemTables.setRNew(FT.Contract.FundsTransfer.BenCustomer,BEN.CUS)

RETURN
