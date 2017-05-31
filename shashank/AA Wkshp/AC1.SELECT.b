* @ValidationCode : Mjo1MjQ2NTA0NjY6Q3AxMjUyOjE0OTI0MzI5Mjc0Njc6aHNoYXNoYW5rOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 17 Apr 2017 18:12:07
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
SUBROUTINE AC1.SELECT
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $USING EB.DataAccess
    $USING EB.Service
    
    
    TableName='ACCOUNT'
    TheList='ALL.IDS'
    TheArgs=''
    TableSuffix=''
    
    EB.DataAccess.Das(TableName, TheList, TheArgs, TableSuffix)
    EB.Service.BatchBuildList('', TheList)
    
    CRT "IN SELECT ROUTINE"
   
    RETURN
