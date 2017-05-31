* @ValidationCode : MjoyODM5NTE1NzQ6Q3AxMjUyOjE0OTAxNzU2NDIzNTg6aHNoYXNoYW5rOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 22 Mar 2017 15:10:42
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
SUBROUTINE BNFC.VALIDATE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
*$INSERT I_COMMON
*$INSERT I_EQUATE
**-----------------------------------------------------------------------------
$USING EB.SystemTables
$USING AC.AccountOpening
$USING ST.Payments
$USING ST.Customer

BEN.ACCT.NO=EB.SystemTables.getComi()

R.ACC=AC.AccountOpening.Account.Read(BEN.ACCT.NO, Error)
CUST.NO=R.ACC<AC.AccountOpening.Account.Customer>

R.CUS=ST.Customer.Customer.Read(CUST.NO, Error)
CUS.NAME=R.CUS<ST.Customer.Customer.EbCusShortName>

EB.SystemTables.setRNew(ST.Payments.Beneficiary.ArcBenBenCustomer,CUST.NO)
EB.SystemTables.setRNew(ST.Payments.Beneficiary.ArcBenNameOne, CUS.NAME)


RETURN
