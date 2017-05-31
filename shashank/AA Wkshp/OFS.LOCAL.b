* @ValidationCode : MjotMTEwMjI4ODM1NDpDcDEyNTI6MTQ5MjYwNDE3MDQwMDpoc2hhc2hhbms6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzAxLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Apr 2017 17:46:10
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
SUBROUTINE OFS.LOCAL
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
$USING EB.SystemTables
$USING EB.Interface

*-----------------------------------------------------------------------------

 TODAY.D= EB.SystemTables.getToday()
 ID=EB.SystemTables.getIdNew()
 OFS.STR='ACCOUNT.STATEMENT,/I/PROCESS//0,INPUTT/123456,':ID:',STMT.FQU.1=':TODAY.D:'M0131'
 ERROR=''
 
 EB.Interface.OfsAddlocalrequest(OFS.STR,'ADD', ERR)
 
 
CRT TODAY.D

 RETURN
 