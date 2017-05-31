* @ValidationCode : MjoxMzQzNzUzNzU6Q3AxMjUyOjE0OTIwNzg1NDEzMzA6aHNoYXNoYW5rOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 13 Apr 2017 15:45:41
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
SUBROUTINE OFS.MSG
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
$USING EB.SystemTables
$USING EB.Interface
*$USING EB.TransactionControl

 TODAY.D= EB.SystemTables.getToday()
 ID=EB.SystemTables.getIdNew()
 OFS.STR='ACCOUNT.STATEMENT,/I/PROCESS,INPUTT/123456,':ID:',STMT.FQU.1=':TODAY.D:'M0131'
 OFS.SRC='GENERIC.OFS.PROCESS'
 OFS.MSG.ID=''
 OPTIONS=''
 EB.Interface.OfsPostMessage(OFS.STR,OFS.MSG.ID,OFS.SRC,OPTIONS)
 RETURN