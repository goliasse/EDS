PROGRAM WORKSHOP1

*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
*$INSERT I_COMMON


GOSUB DISPLAY.DATA;

DISPLAY.DATA:

X=30
X1=50
INPUT X2

CRT "X=" :X
CRT "X1=" :X1
CRT "X2=" :X2

CALL WORKSHOPSUBROUTINE1

CRT "X=" :X
CRT "X1=" :X1
CRT "X2=" :X2


RETURN


*-----------------------------------------------------------------------------
*CRT " HI MY FIRST PRG"
*PRINT "SOURAV IS A TOPPER"
*CALL WORKSHOPSUBROUTINE1
*CRT " AFTER THE CALL TO SUBROUTINE"
*EXECUTE " WORKSHOP2"


*-----------------------------------------------------------------------------

*** <region name= INPUT.DETAILS>
INPUT.DETAILS:
*** <desc> </desc>

RETURN
*** </region>

END

