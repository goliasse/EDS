* @ValidationCode : MjoyMTQzMzcwOTQ6Q3AxMjUyOjE0ODkwNTQyMTkwOTc6aHNoYXNoYW5rOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 09 Mar 2017 15:40:19
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
SUBROUTINE DB.DATE.INIT
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING EB.API
$USING FT.Contract
$USING EB.SystemTables

DEBIT.VALUE.DATE=EB.SystemTables.getToday()    ;* Get Today's date

EB.API.Cdt("",DEBIT.VALUE.DATE,"+01W")         ;* Add 2 working days to today

EB.SystemTables.setRNew(FT.Contract.FundsTransfer.DebitValueDate, DEBIT.VALUE.DATE) ;* Initialise Debit Value Date

RETURN
