    SUBROUTINE CARD.LOAD
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_DAS.AC.DEBIT.CARD
    $INSERT I_DAS.AC.DEBIT.CARD.NOTES
    $INSERT I_CARD.STATUS
FN.AC.DEBIT.CARD='F.AC.DEBIT.CARD'
F.AC.DEBIT.CARD=''

CALL OPF(FN.AC.DEBIT.CARD,F.AC.DEBIT.CARD)


    

    END
