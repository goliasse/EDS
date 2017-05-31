* Version 9 16/05/01  GLOBUS Release No. 200511 31/10/05
*-----------------------------------------------------------------------------
* <Rating>-34</Rating>
*-----------------------------------------------------------------------------
    SUBROUTINE SS.CUSTRANS.VALIDATE
*-----------------------------------------------------------------------------
    !** Simple SUBROUTINE template
* @author youremail@temenos.com
* @stereotype recordcheck
* @package infra.eb
* @uses E
* @uses AF
*!
*----------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.SS.CUSTRANS
    

** Check if the record is okay to input to...
*      GOSUB CHECK.RECORD
*      IF E = '' THEN
*         GOSUB SET.ENRICHMENTS
*         GOSUB POPULATE.COMMONS
*      END
*
*      RETURN
**-----------------------------------------------------------------------
*POPULATE.COMMONS:
*      RETURN
*-----------------------------------------------------------------------------
*SET.ENRICHMENTS:
*      CALL EB.SET.FIELD.ENRICHMENT(FIELD.NUMBER, FIELD.ENRICHMENT)
*      RETURN
*--------------------------------------------------------------------
*CHECK.RECORD:
* Input not allowed for matured contracts!
*      IF V$FUNCTION MATCHES 'I' : VM : 'R' THEN
* TODO add specific checks for blocking functions if required,
*         IF NOT(R.NEW(MY.RECORD.STATUS) EQ 'INAU') AND R.NEW(MY.CONTRACT.STATUS) = 'LIQ' THEN
*            E ='SAMPLE.ERROR.CODE'
*         END
*      END
    CALL LOAD.COMPANY("GB0010001")

    FN.CUSACCOUNT='F.CUSTOMER.ACCOUNT'
    F.CUSACCOUNT=''
    FN.STMT='F.STMT.ENTRY'
    F.STMT=''

    CALL OPF(FN.CUSACCOUNT,F.CUSACCOUNT)

  CUST.ID=R.NEW(XX.YY.CUS.ID)
* CUST.ID='100109'
*CRT CUST.ID

    CALL F.READ(FN.CUSACCOUNT,CUST.ID,R.ACC,F.CUSACCOUNT,READ.ERROR)

    COUNT.ACC=DCOUNT(R.ACC,@FM)

    CRT COUNT.ACC

    FOR I = 1 TO COUNT.ACC
        R.NEW(XX.YY.ACCOUNTS.ID)<1,I> = R.ACC<I>
*        CRT R.ACC<I>
        
*        CALL OPF(FN.STMT,F.STMT)
        
*        CALL F.READ(FN.STMT,'74128',R.STMT,F.STMT,READ.ERROR1)
        
              
*        CRT R.STMT
        
        
    NEXT

*-----------------------------------------------------------------------------
    END
