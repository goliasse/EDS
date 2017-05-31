* @ValidationCode : MjotMTg3NDI2NTkxNDpDcDEyNTI6MTQ4MzUwNjY5NDQ2NTp1cmFuZ2E6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNjEyLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 04 Jan 2017 10:41:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : uranga
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201612.0
* Version 3 15/11/00  GLOBUS Release No. 200508 30/06/05
*-----------------------------------------------------------------------------
* <Rating>51</Rating>
*-----------------------------------------------------------------------------
      SUBROUTINE AC.DEBIT.CARD.OVERRIDES
*-----------------------------------------------------------------------------
!** Template FOR override routines
* @author youremail@temenos.com
* @stereotype validator
* @package infra.eb
*!
*-----------------------------------------------------------------------------
*** <region name= Modification History>
*-----------------------------------------------------------------------------
* 

*** </region>
*-----------------------------------------------------------------------------
*** <region name= Main section>
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.AC.DEBIT.CARD

*      GOSUB INITIALISE
      GOSUB OVERRIDES
      RETURN
*** </region>
*-----------------------------------------------------------------------------
OVERRIDES:

*CUST.ID=R.NEW(XX.YY.CUSTOMER)
*
*SD.DATE=R.NEW(XX.YY.START.DATE)
*ED.DATE=R.NEW(XX.YY.END.DATE)
*
*DIFF='C'
*
*CALL CDD('',SD.DATE,ED.DATE,DIFF)
*
*IF DIFF GT 730 THEN
*
*YEAR1=INT(DIFF/365)
*
*TEXT="AC-OVERRIDE":FM:CUST.ID:VM:YEAR1
*
*CALL STORE.OVERRIDE(CURR.NO)
*END
*

* TODO Add your override here
* Set TEXT to be the key to the override you want to use form the OVERRIDE table
* Set AF/AV/AS to be the field that is relevant to the override.
*
* AF = AC.RETURN.FIELD
* TEXT = "SAMPLE.OVERRIDE.KEY"
* GOSUB DO.OVERRIDE
*
      RETURN
*-----------------------------------------------------------------------------
*** <region name= Add an override>
*** 
*DO.OVERRIDE:
*
*
*      CALL STORE.OVERRIDE(CURR.NO)
*      IF TEXT = 'NO' THEN
*         GOTO EXIT.SUB
*      END
*      RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= Initialise>
*** 
INITIALISE:
      CURR.NO = 0
      CALL STORE.OVERRIDE(CURR.NO)

      RETURN

*** </region>
*-----------------------------------------------------------------------------
*** <region name= Exit>
*** 
EXIT.SUB:
      RETURN TO EXIT.SUB
      RETURN
*** </region>*-----------------------------------------------------------------------------
*
   END
