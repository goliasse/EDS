* @ValidationCode : Mjo1OTg4Mzc1MzE6Q3AxMjUyOjE0OTAxMDUwNDE3MTM6aHNoYXNoYW5rOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 21 Mar 2017 19:34:01
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
SUBROUTINE BEN.OBNK.VALIDATE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING EB.SystemTables
$USING AC.AccountOpening
$USING ST.Payments

BEN.NAME=EB.SystemTables.getComi()

EB.SystemTables.setRNew(ST.Payments.Beneficiary.ArcBenBenCustomer,BEN.NAME)
EB.SystemTables.setRNew(ST.Payments.Beneficiary.ArcBenNameOne, BEN.NAME)


RETURN
