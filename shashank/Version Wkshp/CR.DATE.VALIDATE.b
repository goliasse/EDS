* @ValidationCode : MjoxOTE0NDcxODUwOkNwMTI1MjoxNDg5NzUyNDYyNTQ3OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 17 Mar 2017 17:37:42
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
    SUBROUTINE CR.DATE.VALIDATE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $USING EB.API
    $USING EB.ErrorProcessing
    $USING FT.Contract
    $USING EB.SystemTables
 
    GOSUB INITIALISE
    GOSUB PROCESS
    
    INITIALISE:
	    DAY.TYPE=''
*	    ERR.MSG="Enter Credit Date After Next 2 Working Days"
	    CR.VALUE.DATE=EB.SystemTables.getComi()                 ;* Get Credit Value Date
	    TODAY.DATE=EB.SystemTables.getToday()                   ;* Get Today's Date
    RETURN
    
    PROCESS:
	    IF CR.VALUE.DATE EQ '' THEN                            ;* Error if Credit Value Date is empty
	    EB.SystemTables.setEtext('AC-VALID.DATE')
        EB.SystemTables.setAf(FT.Contract.FundsTransfer.CreditValueDate)   ;* Set Error on Credit Value Date
        EB.ErrorProcessing.StoreEndError()
	    RETURN
	    END
	    
	    EB.API.Cdt("", TODAY.DATE, "+02W")                     ;* Add 2 working days to today
	    EB.API.Cdd("",TODAY.DATE,CR.VALUE.DATE, DAYS)          ;* Difference between updated today and credit value date
	    
	    CRT DAYS
	    EB.SystemTables.setAf(FT.Contract.FundsTransfer.CreditValueDate)   ;* Set Error on Credit Value Date
	    
	    IF DAYS LT 2 THEN                   ;* Raise error if difference between updated today and credit value date is more than 2 days
	    EB.SystemTables.setEtext('AC-CREDIT.DATE')
	    EB.SystemTables.setAf(FT.Contract.FundsTransfer.CreditValueDate)   ;* Set Error on Credit Value Date
	    EB.ErrorProcessing.StoreEndError()
	    END
    
    RETURN
    

    RETURN
