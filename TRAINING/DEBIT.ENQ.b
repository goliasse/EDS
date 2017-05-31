SUBROUTINE DEBIT.ENQ
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.AC.DEBIT.CARD
$INSERT I_F.CUSTOMER

GOSUB INIT
GOSUB PROCESS
RETURN

INIT:

FN.CUSTOMER='F.CUSTOMER'
F.CUSTOMER=''
CALL OPF(FN.CUSTOMER,F.CUSTOMER)
RETURN

PROCESS:
CUS.NO=R.RECORD<XX.YY.CUSTOMER>
CALL F.READ(FN.CUSTOMER,CUS.NO,R.CUSTOMER,F.CUSTOMER,C.ER)
O.DATA=R.CUSTOMER<EB.CUS.NAME.1>
RETURN
*-----------------------------------------------------------------------------

END
