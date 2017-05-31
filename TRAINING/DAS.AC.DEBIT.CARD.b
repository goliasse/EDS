    SUBROUTINE DAS.AC.DEBIT.CARD(THE.LIST,THE.ARGS,TABLE.SUFFIX)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_DAS.AC.DEBIT.CARD
    $INSERT I_DAS.AC.DEBIT.CARD.NOTES

    $INSERT I_DAS


*-----------------------------------------------------------------------------
BUILD.DATA:
    MY.TABLE="AC.DEBIT.CARD":TABLE.SUFFIX
    BEGIN CASE

        CASE MY.CMD=DAS.AC.DEBIT.CARD$CUSTOMER.CARD
            MY.FIELDS='CUSTOMER'
            MY.OPERANDS='EQ'
            MY.DATA=THE.ARGS

        CASE MY.CMD=DAS.AC.DEBIT.CARD$CARD.VALIDITY
            MY.FIELDS="START.DATE"
            MY.OPERANDS='EQ'
            MY.DATA=THE.ARGS<1>
            MY.JOINS="AND"
            MY.FIELDS<-1>="END.DATE"
            MY.OPERANDS<-1>='LT'
            MY.DATA<-1>=THE.ARGS<2>

        CASE MY.CMD=DAS.AC.DEBIT.CARD$CARD.LIST
            MY.FIELDS=''
            MY.OPERANDS=''
            MY.DATA=''

           
    END CASE
    RETURN
    END
