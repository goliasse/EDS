$PACKAGE CUS.TXN

SUBROUTINE TXN2.SELECT
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
*$INSERT I_COMMON
*$INSERT I_EQUATE
*-----------------------------------------------------------------------------
    $USING EB.DataAccess
    $USING EB.Service
    
    CONTROL.LIST=EB.Service.getControlList()
    
    IF NOT(CONTROL.LIST) THEN
        CONTROL.LIST<-1>='FUNDS.TRANSFER'
        CONTROL.LIST<-1>='TELLER'
        EB.Service.setControlList(CONTROL.LIST)
    END
    
    TableName=CONTROL.LIST<1,1>
    TheList='ALL.IDS'
    TheArgs=''
    TableSuffix=''
    
    EB.DataAccess.Das(TableName, TheList, TheArgs, TableSuffix)
    EB.Service.BatchBuildList('', TheList)
    
    CRT "IN SELECT ROUTINE"
   
    RETURN

