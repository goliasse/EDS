* @ValidationCode : MjotMjc3Njg2NjY5OkNwMTI1MjoxNDg4NTM3NzAzNjE3OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 03 Mar 2017 16:11:43
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
    $PACKAGE EB.TRANS
    SUBROUTINE WKSHP.NOFILE(DETAILS)
    
    $USING EB.Reports
    $USING AC.AccountOpening
    $USING EB.SystemTables
    
    GOSUB INITIALISE
    GOSUB PROCESS
    
    INITIALISE:                                 ;* Initialise Variables
	    ACC.NO=''
	    SHORT.TITLE=''
	    CURR=''
	    BAL=''
	    R.CUS.ACC=''
	    R.ACC=''
    RETURN
    
    PROCESS:
	    
	    LOCATE "CUSTOMER.NO" IN EB.Reports.getDFields()<-1> SETTING CUS.POS THEN       ;* Get Customer No from Dynamic Selection
	    CUSTOMER.NO=EB.Reports.getDRangeAndValue()<CUS.POS>
	    END
	
	    R.CUS.ACC=AC.AccountOpening.CustomerAccount.Read(CUSTOMER.NO, Error)       ;* Get list of all accounts for a customer
	
	    FOR NO.OF.ACCOUNTS=1 TO DCOUNT(R.CUS.ACC,@FM)
	    
	        ACC.NO=R.CUS.ACC<NO.OF.ACCOUNTS>   
	        R.ACC=AC.AccountOpening.Account.Read(ACC.NO, Error)            ;* Get account details
	        SHORT.TITLE=R.ACC<AC.AccountOpening.Account.ShortTitle>
	        
	        CURR=R.ACC<AC.AccountOpening.Account.Currency>
	        BAL=R.ACC<AC.AccountOpening.Account.OnlineActualBal>
	        
	        IF BAL EQ '' THEN
	        BAL=0
	        END
	        
	    DETAILS<-1>=ACC.NO:"*":SHORT.TITLE:"*":CURR:"*":BAL                ;* Set enquiry data to be displayed
        CRT DETAILS
        NEXT
        
     RETURN

    RETURN
