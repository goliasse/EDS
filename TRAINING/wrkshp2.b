PROGRAM wrkshp2
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
*-----------------------------------------------------------------------------

GOSUB INPUT1 ; * 








*-----------------------------------------------------------------------------

*** <region name= INPUT>
INPUT1:
*** <desc> </desc>
CRT "ENTER NAME"
INPUT NAME
CRT "ENTER PROFESSWION"
INPUT PROFESSION
CRT "ENTER PHONE NUMBER"
INPUT PHN
CRT "ENTER INTEREST"
INPUT INTEREST
CRT "ENTER EMAIL"
INPUT EMAIL


*RETURN
*** </region>


 GOSUB DISPLAY ; *
*** <region name= DISPLAY>
DISPLAY:

CRT "NAME IS": NAME
CRT "PROFESSION IS": PROFESSION
CRT "PHONE NUMBER IS": PHN
CRT "INTERESTS IS": INTEREST
CRT "EMAIL ID IS": EMAIL
*** <desc> </desc>

*RETURN
*** </region>

END


