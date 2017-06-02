    $PACKAGE CUS.TXN
    SUBROUTINE TXN2(ID)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
*$INSERT I_COMMON
*$INSERT I_EQUATE
*-----------------------------------------------------------------------------
    $USING FT.Contract
    $USING TT.Contract
    $USING EB.Service
    
    CONTROL.LIST=EB.Service.getControlList()
    SessionId=EB.Service.getSessionNo()
        
* For Funds Transfer
    
    IF(CONTROL.LIST<1,1> EQ 'FUNDS.TRANSFER') THEN
    
    R.Ft=FT.Contract.FundsTransfer.Read(ID,READ.ERROR)
    Debit.Cus=R.Ft<FT.Contract.FundsTransfer.DebitCustomer>   
    Credit.Cus=R.Ft<FT.Contract.FundsTransfer.CreditCustomer> 
    
    ConDebit=Debit.Cus:"-":SessionId
    ConCredit=Credit.Cus:"-":SessionId
    
    IF(Debit.Cus NE '') THEN
        R.DebitCus=CUS.TXN.CusTxn.Read(ConDebit,READ.ERROR1)    
        R.DebitCus<-1>=ID
*        WriteId=Debit.Cus:SessionId
        CUS.TXN.CusTxn.Write(ConDebit,R.DebitCus)
      
    END 
        
    IF(Credit.Cus NE '') THEN
        R.CreditCus=CUS.TXN.CusTxn.Read(ConCredit,READ.ERROR2)
        R.CreditCus<-1>=ID
*        WriteId=Credit.Cus:SessionId        
        CUS.TXN.CusTxn.Write(ConCredit,R.CreditCus)
    END
    
    END

    
* For Teller Transactions    
    
    ELSE IF(CONTROL.LIST<1,1> EQ 'TELLER') THEN    
    
                                                                                                                     
    R.Ft=TT.Contract.Teller.Read(ID,READ.ERROR)
    CusOne=R.Ft<TT.Contract.Teller.TeCustomerOne>
    CusTwo=R.Ft<TT.Contract.Teller.TeCustomerTwo>
    
    ConCusOne=CusOne:"-":SessionId
    ConCusTwo=CusTwo:"-":SessionId
    
    IF(CusOne NE '') THEN
        R.CusOne=CUS.TXN.CusTxn.Read(ConCusOne,READ.ERROR3)
        R.CusOne<-1>=ID
*        WriteId=CusOne:SessionId
        CUS.TXN.CusTxn.Write(ConCusOne,R.CusOne)
    END
    
    IF(CusTwo NE '') THEN
        R.CusTwo=CUS.TXN.CusTxn.Read(ConCusTwo,READ.ERROR4)
        R.CusTwo<-1>=ID
*        WriteId=CusTwo:SessionId
        CUS.TXN.CusTxn.Write(ConCusTwo,R.CusTwo)
    END
     
    
    END
       
RETURN


