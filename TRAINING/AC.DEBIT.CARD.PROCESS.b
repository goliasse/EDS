* @ValidationCode : Mjo4Mjk5OTQxNzc6Q3AxMjUyOjE0ODM1MDk0NjY5NjE6dXJhbmdhOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTYxMi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 04 Jan 2017 11:27:46
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
      SUBROUTINE AC.DEBIT.CARD.PROCESS
*------------------------------------------------------------------------
!** Simple PROCESS template
* @author youremail@temenos.com
* @stereotype subroutine
* @package infra.eb
*!

*** <region name= PROGRAM DESCRIPTION>
*** <desc>Program description</desc>
*------------------------------------------------------------------------
* Program Description

*** </region>

*** <region name= MODIFICATION HISTORY>
*** <desc>Modification History</desc>
*------------------------------------------------------------------------
* Modification History :
*------------------------------------------------------------------------
*** </region>

*** <region name= INSERTS>
*** <desc>Inserts</desc>
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.AC.DEBIT.CARD
$INSERT I_F.AC.CUSTOMER.CARD
*** </region>
*------------------------------------------------------------------------

*** <region name= MAIN PROCESS LOGIC>
*** <desc>Main process logic</desc>

      GOSUB INITIALISE
      GOSUB PROCESS

      RETURN
*** </region>

*------------------------------------------------------------------------

*** <region name= PROCESS>
*** <desc>Process</desc>
PROCESS:

CARD.NO=R.NEW(XX.YY.NO.OF.CARDS)

FOR I = 1 TO CARD.NO
YEAR1=LEFT(TODAY,4)

CALL ALLOCATE.UNIQUE.TIME(SEC.NO)
PRINT SEC.NO
IF R.NEW(XX.YY.DEBIT.CARD.NO)<1,I> EQ '' THEN

NO1=FIELD(SEC.NO,'.',1)
PRINT NO1
NO2=FIELD(SEC.NO,'.',2)
PRINT NO2
NO3=NO1:NO2:YEAR1
PRINT NO3

R.NEW(XX.YY.DEBIT.CARD.NO)<1,I>=NO3

END
NEXT

      RETURN
*** </region>

*------------------------------------------------------------------------

*** <region name= INITIALISE>
*** <desc>Initialise</desc>
INITIALISE:


      RETURN
*** </region>

   END
