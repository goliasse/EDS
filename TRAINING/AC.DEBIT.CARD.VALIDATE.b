* @ValidationCode : MjotMTczMzIwMDM1MDpDcDEyNTI6MTQ4MzQ0MDgzMzU2Njp1cmFuZ2E6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNjEyLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 03 Jan 2017 16:23:53
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : uranga
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201612.0
* Version 2 02/06/00  GLOBUS Release No. G11.0.00 29/06/00
    SUBROUTINE AC.DEBIT.CARD.VALIDATE
*-----------------------------------------------------------------------------
!** Template FOR validation routines
* @author youremail@temenos.com
* @stereotype validator
* @package infra.eb
*!
*-----------------------------------------------------------------------------
*** <region name= Modification History>
*-----------------------------------------------------------------------------
* 07/06/06 - BG_100011433
*            Creation
*-----------------------------------------------------------------------------
*** </region>
*** <region name= Main section>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.AC.DEBIT.CARD
    $INSERT I_F.ACCOUNT
    

    GOSUB INITIALISE
    GOSUB PROCESS.MESSAGE
    GOSUB VALIDATE.DATE ; * 
    GOSUB VALIDATE.NO.CARDS ; * 
    GOSUB VALIDATE.DISPLAY.NAMES ; * 
    GOSUB VALIDATE.CUST.ID ; * 
    RETURN
*** </region>
*-----------------------------------------------------------------------------
VALIDATE:
* TODO - Add the validation code here.
* Set AF, AV and AS to the field, multi value and sub value and invoke STORE.END.ERROR
* Set ETEXT to point to the EB.ERROR.TABLE

*      AF = MY.FIELD.NAME                 <== Name of the field
*      ETEXT = 'EB-EXAMPLE.ERROR.CODE'    <== The error code
*      CALL STORE.END.ERROR               <== Needs to be invoked per error

    RETURN
*-----------------------------------------------------------------------------
*** <region name= Initialise>
INITIALISE:
***

*
    RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= Process Message>
PROCESS.MESSAGE:
    BEGIN CASE
    CASE MESSAGE EQ ''        ;* Only during commit...
        BEGIN CASE
        CASE V$FUNCTION EQ 'D'
            GOSUB VALIDATE.DELETE
        CASE V$FUNCTION EQ 'R'
            GOSUB VALIDATE.REVERSE
        CASE OTHERWISE        ;* The real VALIDATE...
            GOSUB VALIDATE
        END CASE
    CASE MESSAGE EQ 'AUT' OR MESSAGE EQ 'VER'     ;* During authorisation and verification...
        GOSUB VALIDATE.AUTHORISATION
    END CASE
*
    RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= VALIDATE.DELETE>
VALIDATE.DELETE:
* Any special checks for deletion



    RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= VALIDATE.REVERSE>
VALIDATE.REVERSE:
* Any special checks for reversal

    RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= VALIDATE.AUTHORISATION>
VALIDATE.AUTHORISATION:
* Any special checks for authorisation

    RETURN
*** </region>
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------

*** <region name= VALIDATE.DATE>
VALIDATE.DATE:
*** <desc> </desc>
ST.DATE=R.NEW(XX.YY.START.DATE)
ED.DATE=R.NEW(XX.YY.END.DATE)

IF ST.DATE GT ED.DATE THEN

AF=XX.YY.END.DATE
ETEXT="AC-END.DATE"
CALL STORE.END.ERROR
END

RETURN
*** </region>


*-----------------------------------------------------------------------------

*** <region name= VALIDATE.NO.CARDS>
VALIDATE.NO.CARDS:
*** <desc> </desc>

NO.CARDS=R.NEW(XX.YY.NO.OF.CARDS)

IF NO.CARDS GT 5 OR NO.CARDS LT 1 THEN
AF=XX.YY.NO.OF.CARDS
ETEXT="AC-NO.CARDS"
CALL STORE.END.ERROR
END

RETURN
*** </region>


*-----------------------------------------------------------------------------

*** <region name= VALIDATE.DISPLAY.NAMES>
VALIDATE.DISPLAY.NAMES:
*** <desc> </desc>
NO.CARDS=R.NEW(XX.YY.NO.OF.CARDS)
COUNT.NAME=DCOUNT(R.NEW(XX.YY.DISPLAY.NAME),@VM)
IF COUNT.NAME NE NO.CARDS THEN

AF=XX.YY.DISPLAY.NAME
ETEXT="AC-DISPLAY.NAME"
CALL STORE.END.ERROR
END

FOR AV = 1 TO COUNT.NAME
AF=XX.YY.DISPLAY.NAME
IF R.NEW(AF)<1,AV> EQ '' THEN
ETEXT="AC-NAME"
CALL STORE.END.ERROR
END
NEXT

RETURN
*** </region>


*-----------------------------------------------------------------------------

*** <region name= VALIDATE.CUST.ID>
VALIDATE.CUST.ID:
*** <desc> </desc>
FN.ACCOUNT='F.ACCOUNT'
F.ACCOUNT=''

CALL OPF(FN.ACCOUNT,F.ACCOUNT)

ACC.ID=R.NEW(XX.YY.ACCOUNT)

CALL F.READ(FN.ACCOUNT,ACC.ID,R.ACCOUNT,F.ACCOUNT,READ.ERROR)
 
CUS.ID=R.ACCOUNT<AC.CUSTOMER>

R.NEW(XX.YY.CUSTOMER)=CUS.ID

RETURN
*** </region>
END
