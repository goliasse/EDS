* @ValidationCode : MjotMjA0NDczODc3NjpDcDEyNTI6MTQ4MzUxMjU3MzI2ODp1cmFuZ2E6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNjEyLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 04 Jan 2017 12:19:33
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : uranga
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201612.0
*-----------------------------------------------------------------------------
* <Rating>-22</Rating>
*-----------------------------------------------------------------------------
      SUBROUTINE AC.DEBIT.CARD.AUTHORISE
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.AC.DEBIT.CARD
$INSERT I_F.AC.CUSTOMER.CARD

*** </region>
*-----------------------------------------------------------------------------

*** <region name= MAIN PROCESS LOGIC>
*** <desc>Main process logic</desc>
      GOSUB INITIALISE
      GOSUB PROCESS

      RETURN
*** </region>
*-----------------------------------------------------------------------------

*** <region name= PROCESS>
*** <desc>Process</desc>
PROCESS:

CUST.ID=R.NEW(XX.YY.CUSTOMER)

FN.CUSTOMER.CARD='F.AC.CUSTOMER.CARD'
F.AC.CUSTOMER.CARD=''

CALL OPF(FN.CUSTOMER.CARD,F.AC.CUSTOMER.CARD)

CARD.COUNT=R.NEW(XX.YY.NO.OF.CARDS)

FOR I = 1 TO CARD.COUNT

R.AC.CUSTOMER.CARD<1,-1>=R.NEW(XX.YY.DEBIT.CARD.NO)<1,I>

NEXT

CALL F.WRITE(FN.CUSTOMER.CARD,CUST.ID,R.AC.CUSTOMER.CARD)

      RETURN
*** </region>
*-----------------------------------------------------------------------------

*** <region name= INITIALISE>
*** <desc>Initialise</desc>
INITIALISE:

      RETURN
*** </region>

END
