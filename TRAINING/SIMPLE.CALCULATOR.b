* @ValidationCode : MTo2MDk2ODE1ODk6VVRGLTg6MTQ3ODE1MzA4ODgyNDp1cmFuZ2E6LTE6LTE6MDowOmZhbHNlOk4vQQ==
* @ValidationInfo : Timestamp         : 03 Nov 2016 11:34:48
* @ValidationInfo : Encoding          : UTF-8
* @ValidationInfo : User Name         : uranga
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false

SUBROUTINE SIMPLE.CALCULATOR(OPERATOR, OPERAND1, OPERAND2, RESULT, RETURN.ERROR)
*----------------------------------------------------------------------------------------------------
* Program Description
*
* This program is intended to do a simple mathematical calculations namely addition, subtraction, 
* multiplication & division of 2 numbers
* i.e. RESULT = IN.VALUE1 OPERAND IN.VALUE2
** Links:
* It inturn uses APIs namely NUMBER.ADDITION, NUMBER.SUBTRACTION, NUMBER.DIVISION & NUMBER.MULTIPLICATION
* Uses I_COMMON & I_EQUATE for usage of common ETEXT & delimiter VM
*
*-----------------------------------------------------------------------------
*** <region name= Arguments>
*** <desc>Input and Output arguments</desc>
* Arguments
*
* Input
* @param Operator               Indicates the Operator required for this calculation
* @param Operand1               1st Operand required for the operation
* @param Operand2               2nd Operand required for the operation
*
* Output
* @return Result      Calculated result is the outcome of the operation.
* @return ReturnError           Exceptions if any
*** </region>
*-----------------------------------------------------------------------------
*** <region name= Main Control>
*** <desc>Main Control of the routine</desc>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    GOSUB INITIALISE ;*Initialise return values
    GOSUB DO.BASIC.CHECKS ;*Do basic checks for generic numeric operations this API is capable of handling
    IF DO.PROCESS THEN ;*If basic checks are fine,
        GOSUB DO.CALCULATION ;*then go ahead
    END
    
    RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= Initialise>
*** <desc>Initialise</desc>
INITIALISE:
    RESULT = "" ;*Initialise the return arguments
    RETURN.ERROR = "" ;*Initialise the return arguments    
    RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= Basic Checks>
*** <desc>Basic checks verification are being handled here</desc>
DO.BASIC.CHECKS:
    DO.PROCESS = 1 ;*By default do processing assuming all values are valid.
    BEGIN CASE
    CASE NOT(OPERATOR MATCHES "+":VM:"-":VM:"*":VM:"/") ;*Check if the operand is allowed one
        RETURN.ERROR = 1 ;*Set Error Flag
        DO.PROCESS = "0" ;*Stop further processing
        ETEXT = "EB-INVALID.OPERATOR"
        CALL STORE.END.ERROR
    CASE NOT(ISDIGIT(OPERAND1)) ;*Check if Operand 1 is a valid digit
        RETURN.ERROR = 1 ;*Set Error Flag
        DO.PROCESS = "0" ;*Stop further processing
        ETEXT = "EB-INVALID.OPERAND":FM:OPERAND1
        CALL STORE.END.ERROR
    CASE NOT(ISDIGIT(OPERAND2)) ;*Check if Operand 2 is a valid digit
        RETURN.ERROR = 1 ;*Set Error Flag
        DO.PROCESS = "0" ;*Stop further processing
        ETEXT = "EB-INVALID.OPERAND":FM:OPERAND2
        CALL STORE.END.ERROR
    END CASE
    
    RETURN
*** </region>

*-----------------------------------------------------------------------------
*** <region name= Calculation Processing>
*** <desc>Real Calculation processing is done here</desc>
DO.CALCULATION:
    
    BEGIN CASE
    CASE OPERATOR EQ "+"
        RESULT = OPERAND1 + OPERAND2
    CASE OPERATOR EQ "-"
        CALL NUMBER.SUBTRACTION(OPERATOR, OPERAND1, OPERAND2, RESULT, RETURN.ERROR)
    CASE OPERATOR EQ "*"
        CALL NUMBER.MULTIPLICATION(OPERATOR, OPERAND1, OPERAND2, RESULT, RETURN.ERROR)
    CASE OPERATOR EQ "/"
   CALL NUMBER.DIVISION(OPERATOR, OPERAND1, OPERAND2, RESULT, RETURN.ERROR)
    END CASE
    
    RETURN
*** </region>
*-----------------------------------------------------------------------------

END
