    $PACKAGE CUS.TXN

    SUBROUTINE TXN1
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
*$INSERT I_COMMON
*$INSERT I_EQUATE
    $USING AC.AccountOpening
*    $USING CUS.TXN
    $USING ST.Customer
    $USING EB.Display
    $USING EB.TransactionControl
    $USING EB.ErrorProcessing
    $USING EB.SystemTables
    $USING EB.DataAccess
    $USING FT.Contract
    $USING EB.Service
*-----------------------------------------------------------------------------
*    CustId='100384'
    Customer.Arr=''
    Txn.Arr=''
    SEL.LIST=''
    READ.ERROR=''
    R.Cus=''
     
*    R.Acc=AC.AccountOpening.CustomerAccount.Read(CustId,READ.ERROR)
*        
*    IF (READ.ERROR EQ '')
*    THEN
*    
*    FOR I = 1 TO DCOUNT(R.Acc,@FM)
*    CRT R.Acc<I>
**    CUS.TXN.CusTxn.Write(CustId,R.Acc)
*     Customer.Arr<CUS.TXN.CusTxn.AccountId,-1>=R.Acc<I>
*    NEXT
*     
**     CUS.TXN.CusTxn.Write(CustId,Customer.Arr) 
**     EB.TransactionControl.JournalUpdate(CustId)
*     
*    END
    
    TableName='FUNDS.TRANSFER'
    TheList='ALL.IDS'
    TheArgs=''
    TableSuffix=''
        EB.DataAccess.Das(TableName, TheList, TheArgs, TableSuffix)
*   EB.Service.BatchBuildList(ListParameters, Ft.List)
    
*    CRT DCOUNT(TheList,@FM)
    FOR I = 1 TO DCOUNT(TheList,@FM)
    
    R.Ft=FT.Contract.FundsTransfer.Read(TheList<I>,READ.ERROR)

*CHECK CUSTOMER id  
*    IF((R.Txn<FT.Contract.FundsTransfer.DebitCustomer> EQ CustId)OR(R.Txn<FT.Contract.FundsTransfer.CreditCustomer> EQ CustId) )
*    THEN
*    Customer.Arr<CUS.TXN.CusTxn.TxnId,-1>=TheList<I>
*    END
    Debit.Cus=R.Ft<FT.Contract.FundsTransfer.DebitCustomer>
    
    R.Cus=CUS.TXN.CusTxn.Read(Debit.Cus,READ.ERROR)
    

        R.Cus<-1>=TheList<I>
        CUS.TXN.CusTxn.Write(Debit.Cus,R.Cus) 
    NEXT
    
    
    
    EB.TransactionControl.JournalUpdate(CustId)     
    
    INPUT DRY
    RETURN
    END
