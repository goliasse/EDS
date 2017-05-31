* @ValidationCode : MjotMTY3MzMzMDk2OTpDcDEyNTI6MTQ4MzQyNjYyNTQ0MDp1cmFuZ2E6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNjEyLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 03 Jan 2017 12:27:05
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : uranga
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201612.0
* Version 9 16/05/01  GLOBUS Release No. 200511 31/10/05
*-----------------------------------------------------------------------------
* <Rating>-34</Rating>
*-----------------------------------------------------------------------------
      SUBROUTINE AC.DEBIT.CARD.RECORD
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
$INSERT I_F.AC.DEBIT.CARD

* Check if the record is okay to input to...
      GOSUB CHECK.RECORD
      IF E = '' THEN
         GOSUB SET.ENRICHMENTS
         GOSUB POPULATE.COMMONS
      END

      RETURN
*-----------------------------------------------------------------------
POPULATE.COMMONS:
      RETURN
*-----------------------------------------------------------------------------
SET.ENRICHMENTS:
      CALL EB.SET.FIELD.ENRICHMENT(FIELD.NUMBER, FIELD.ENRICHMENT)
      RETURN
*--------------------------------------------------------------------
CHECK.RECORD:

*ST.DATE=R.NEW(XX.YY.START.DATE)
*
*CALL CDT('',ST.DATE,'+730C')
*
*R.NEW(XX.YY.END.DATE)=ST.DATE

* Input not allowed for matured contracts!
      IF V$FUNCTION MATCHES 'I' : VM : 'R' THEN
* TODO add specific checks for blocking functions if required,
*         IF NOT(R.NEW(MY.RECORD.STATUS) EQ 'INAU') AND R.NEW(MY.CONTRACT.STATUS) = 'LIQ' THEN
*            E ='SAMPLE.ERROR.CODE'
*         END
      END
      RETURN
*-----------------------------------------------------------------------------
END
