* @ValidationCode : MjotOTc4MTkxNjMwOkNwMTI1MjoxNDk1MTgyNzk0NzM3OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 May 2017 14:03:14
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
    $PACKAGE EB.TRANS     ;* COMPONENT INCLUDED
    
* BUILD ROUTINE FOR ACC.STMT ENQUIRY
    SUBROUTINE ACC.DETAILS(ENQ.DATA)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

    $USING ST.AccountStatement  ;* COMPONENT USED FOR AcctStmtPrint AND StmtPrinted APPLICATION
    $USING EB.Reports
    $USING AC.AccountOpening
    
    GOSUB INIT                  ;* INITIALISATION OF VARIABLES
    GOSUB PROCESS               ;* LOGIC FOR FETCHING THE TRANSACTIONS
    GOSUB ENQ.DISPLAY           ;* FETCHED TRANSACTIONS BEING PASSED TO THE ENQUIRY

FINISH:
    RETURN

INIT:

    ACCOUNT.NO=ENQ.DATA<4,1>  ;* ACCOUNT NO FOR WHICH TRANSACTIONS ARE DISPLAYED
    FROM.DATE=ENQ.DATA<4,2>
    TO.DATE=ENQ.DATA<4,3>
    
    R.ACC=AC.AccountOpening.Account.Read(ACCOUNT.NO, Error)
    
    IF(R.ACC EQ '') THEN
        EB.Reports.setEnqError("Invalid Account")
        
        GOSUB FINISH    
    END
    
    MONTH.STMT.COUNT=0
    STMT.ARR=''
    STMT.ENTRY.ID=''
    TRANS.ARR=''
    NO.OF.TRANS=0
    AVAIL=''
    FLAG=1
    
    CRT ACCOUNT.NO
    STMT.ARR= ST.AccountStatement.AcctStmtPrint.Read(ACCOUNT.NO, Error) ;* RECORDS READ FROM AcctStmtPrint APPLICATION AND STORED IN R.ACC R.ACCAY
    
    
    
    MONTH.STMT.COUNT=DCOUNT(STMT.ARR,@FM)       ;* count STORES THE NO OF RECORS FETCHED FROM THE AcctStmtPrint APPLICATION
    CRT MONTH.STMT.COUNT
    RETURN



PROCESS:

    LOOP
    WHILE FLAG EQ 1

        DATE.VAR=FIELD(STMT.ARR<MONTH.STMT.COUNT>,"/",1)
        TRANS.ID=ACCOUNT.NO:"-":DATE.VAR

        TRANS.ARR=ST.AccountStatement.StmtPrinted.Read(TRANS.ID, Error)
        NO.OF.TRANS=DCOUNT(TRANS.ARR,@FM)
        
        
        EB.TRANS.StmtId(TRANS.ARR, AVAIL, FROM.DATE, TO.DATE)
        
        STMT.ENTRY.ID<-1>=AVAIL
        
        MONTH.STMT.COUNT--
        
        IF MONTH.STMT.COUNT LE 0 THEN
        FLAG=0
        END

    REPEAT
    
    RETURN

ENQ.DISPLAY:

    CHANGE @FM TO ' ' IN STMT.ENTRY.ID
        
        CRT STMT.ENTRY.ID
        ENQ.DATA<2,1>="@ID"
        ENQ.DATA<3,1>="EQ"
        ENQ.DATA<4,1>=STMT.ENTRY.ID
        
    RETURN


*-----------------------------------------------------------------------------
    CRT "END"
