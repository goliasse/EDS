* @ValidationCode : MjoxNTAyNTQyNzY3OkNwMTI1MjoxNDgzNjE3MDQ2NDY3OlRyYWluaW5nOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTYxMi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 05 Jan 2017 17:20:46
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Training
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201612.0
SUBROUTINE CARD(ID)
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

CALL F.READU(FN.AC.DEBIT.CARD,ID,R.DEBIT,F.AC.DEBIT.CARD,READ.ERROR,'')
SD=R.DEBIT<XX.YY.START.DATE>
ED= R.DEBIT<XX.YY.END.DATE>
IF SD LT ED THEN
    R.DEBIT<XX.YY.STATUS>='CURRENT'
END ELSE
    R.DEBIT<XX.YY.STATUS>='EXPIRE'
END
CALL F.WRITE(FN.AC.DEBIT.CARD,ID,R.DEBIT)

END