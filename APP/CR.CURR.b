* @ValidationCode : MjotNzMyMDUyMDIxOkNwMTI1MjoxNDk2MjMwMDY2MjAwOmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 31 May 2017 16:57:46
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201704.0
$PACKAGE EB.BNFC
SUBROUTINE CR.CURR

    $USING EB.SystemTables
    $USING AC.AccountOpening
    $USING FT.Contract

    CREDIT.ACCT.NO=EB.SystemTables.getComi()

    R.CREDIT.ACC=AC.AccountOpening.Account.Read(CREDIT.ACCT.NO, Error)

    CREDIT.CURR=R.CREDIT.ACC<AC.AccountOpening.Account.Currency>

    EB.SystemTables.setRNew(FT.Contract.FundsTransfer.CreditCurrency,CREDIT.CURR)

RETURN