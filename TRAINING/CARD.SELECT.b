    SUBROUTINE CARD.SELECT
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.AC.DEBIT.CARD
    $INSERT I_CARD.STATUS
    $INSERT I_DAS.AC.DEBIT.CARD
    $INSERT I_DAS.AC.DEBIT.CARD.NOTES

*-----------------------------------------------------------------------------
    THE.LIST=DAS.AC.DEBIT.CARD$CARD.LIST
    THE.ARGS=''
    TABLE.SUFF=''
    
    CALL DAS('AC.DEBIT.CARD',THE.LIST,THE.ARGS,TABLE.SUFF)
    
    CALL BATCH.BUILD.LIST('',THE.LIST)
*    CRT THE.LIST
*    INPUT DUMMY
*    END


    END
