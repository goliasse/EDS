    PROGRAM EXERCISE1
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
*-------------
    CH=0
    I=1
  
    LOOP
        CRT "ENTER YOUR OPTION"
        CRT "1-STORE EMPLOYEE INFORMATION"
        CRT "2-DISPLAY EMPLOYEE QUALIFICATION"
        CRT "3-ADD ANOTHER EMAIL ID FOR THE EMPLOYEE"
        CRT "4-EXIT"

        INPUT CH
        WHILE CH GE 0
            IF CH=1 THEN
            GOSUB EMPLOYEE.DETAILS
            END ELSE IF CH=2 THEN
            GOSUB EMPLOYEE.QUAL
            END ELSE IF CH=3 THEN
            GOSUB ADD.EMAIL
            END ELSE IF CH =4 THEN
           GOSUB BAHAR.NIKAL ; * 
            END ELSE CONTINUE
            REPEAT
      

            *-----------------------------------------------------------------------------

*** <region name= EMPLOYEE.DETAILS>
EMPLOYEE.DETAILS:
CRT "ENTER NAME"
INPUT NAME
EMP<I,-1>=NAME
I++

CRT "ENTER DEPT"
INPUT DEPT
EMP<I,-1>=DEPT
I++

CH1="Y"
LOOP
G=I
UNTIL CH1 EQ "N"
CRT "ENTER DEGREE"
INPUT DEG
EMP<I,-1>=DEG

CRT "ENTER UNIVERSITY"
INPUT UNI
EMP<I,-1>= UNI

CRT "ENTER YEAR"
INPUT YEAR
EMP<I,-1>=YEAR

CRT "DO YOU WISH TO CONTINUE(Y/N)"
INPUT CH1

REPEAT

I++
CH1="Y"

LOOP
UNTIL CH1 EQ "N"
CRT " INPUT PHN NO"
INPUT NO
EMP<I,-1>=NO
CRT "DO YOU WISH TO CONTINUE(Y/N)"
INPUT CH1
REPEAT

I++
CH1="Y"

LOOP
UNTIL CH1 EQ "N"
CRT " EMAIL ID"
INPUT ID
EMP<I,-1>=ID
CRT "DO YOU WISH TO CONTINUE(Y/N)"
INPUT CH1
REPEAT

*** <desc> INPUT DETAILS OF THE EMPLOYEE </desc>

            RETURN
*** </region>


            *-----------------------------------------------------------------------------

*** <region name= EMPLOYEE.QUAL>
EMPLOYEE.QUAL:


CRT EMP<G>
CRT EMP<G+2>
*** <desc> DISPLAY QUALIFICATIONS OF EMPLOYEE </desc>

            RETURN
*** </region>


            *-----------------------------------------------------------------------------

*** <region name= ADD.EMAIL>
ADD.EMAIL:

INPUT ID
EMP<I,-1>=ID
*** <desc> ADD ANOTHER EMAIL </desc>

            RETURN
*** </region>


*-----------------------------------------------------------------------------


*-----------------------------------------------------------------------------

*** <region name= BAHAR.NIKAL>
BAHAR.NIKAL:
*** <desc> </desc>

*RETURN
*** </region>

END





