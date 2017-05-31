* @ValidationCode : MjozOTI5MDgxMTE6Q3AxMjUyOjE0OTI3NTcxMDU3NzI6aHNoYXNoYW5rOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 21 Apr 2017 12:15:05
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
SUBROUTINE AC1(ID)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------


$USING AC.AccountOpening
$USING EB.Service
$USING ST.Customer
$USING EB.SystemTables
$USING EB.API
$USING AC.ModelBank
$USING EB.Interface
$USING ST.Config


FOUND=''
R.ACC=AC.AccountOpening.Account.Read(ID, Error)
CATEG=R.ACC<AC.AccountOpening.Account.Category>
ARR.ID=R.ACC<AC.AccountOpening.Account.ArrangementId>
CUST.NO=R.ACC<AC.AccountOpening.Account.Customer>
R.CUS=ST.Customer.Customer.Read(CUST.NO, Error)

*IF ARR.ID EQ '' THEN

R.CAT=ST.Config.Category.Read(CATEG, Error)
CAT.NAME=R.CAT<ST.Config.Category.EbCatMnemonic>

FINDSTR "SAVING" IN CAT.NAME SETTING FOUND THEN

*IF ((CATEG GE 6000) AND (CATEG LE 6006)) THEN

    DOB=R.CUS<ST.Customer.Customer.EbCusDateOfBirth>
    
    IF (DOB NE '') THEN
	    TODAY.DATE=EB.SystemTables.getToday()
*	    EB.API.Cdd("",DOB,TODAY.DATE,DAYS)
	    
	    AC.ModelBank.MbCalculateAge(AGE,TODAY.DATE,DOB)
	    
	    IF(AGE GE 18) THEN
		     CRT ID:"-->":CATEG:"-->":AGE
		    
		     OFS.STR='ACCOUNT,/I/PROCESS//0,INPUTT/123456,':ID:',CATEGORY=6003'
             RESPONSE=''
             REQUEST.COMMITED=''
             OFS.SOURCE.ID="TEST.OFS"
             
             EB.Interface.setOfsSourceId(OFS.SOURCE.ID);*initailise the source id
            tmp.OFS1 = EB.Interface.getOfsSourceId()
            tmp.OFS2 = EB.Interface.OfsSource.Read(tmp.OFS1, ERR.VAR)
            
            IF(ERR.VAR) THEN
                CRT "OFS SOURCE NOT SET CORRECTLY"
            END
            
            EB.Interface.setOfsSourceRec(tmp.OFS2)
	         
	 
*	         EB.Interface.OfsAddlocalrequest(OFS.STR, 'ADD', ERR)
             EB.Interface.OfsBulkManager(OFS.STR,RESPONSE,REQUEST.COMMITED)
             CRT "REQUEST STATUS : ":RESPONSE
             CRT "---------------------------"
	    END
    END
END 

*END
RETURN
