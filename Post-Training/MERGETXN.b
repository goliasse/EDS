    $PACKAGE CUS.TXN

    SUBROUTINE MERGETXN
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
*$INSERT I_COMMON
*$INSERT I_EQUATE
*-----------------------------------------------------------------------------
    $USING EB.DataAccess
  
    $INSERT I_DAS.AC.CUS.TXN

    TableName='AC.CUS.TXN'
    TheList=DAS.AC.CUS.TXN$SESSION.IDS
    TheArgs=''
    TableSuffix=''
    I=1

*    Fields = "AAAA:BBJIMBB:CCCCC"
*    CRT FIELD(Fields, ":", 3)
*    CRT FIELD(Fields, "JIM", 1)
*
*displays:
*    CCCCC
*    AAAA:BB

    EB.DataAccess.Das(TableName, TheList, TheArgs, TableSuffix)

    NOS=DCOUNT(TheList, @FM)

    LOOP
    WHILE I LE NOS
    
        Cust.Session=TheList<I>
        R.CustSession=CUS.TXN.CusTxn.Read(Cust.Session, READ.ERROR1)
        CustId=FIELD(Cust.Session,"-",1)
        
        R.Cus=CUS.TXN.CusTxn.Read(CustId,READ.ERROR)
            
            NO2=DCOUNT(R.CustSession, @FM)
            
            FOR J = 1 TO NO2
                R.Cus<-1>=R.CustSession<J>
                CUS.TXN.CusTxn.Write(CustId,R.Cus)
            NEXT
        
*            CUS.TXN.CusTxn.Write(CustId,R.Cus)
        CUS.TXN.CusTxn.Delete(Cust.Session)
        I++
    REPEAT
    
    CRT "IN MERGE"

    RETURN

