SUBROUTINE CUS.SUBROUTINE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.CUSTOMER
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER.ACCOUNT
*-----------------------------------------------------------------------------
FN.CUSTOMER="F.CUSTOMER"
F.CUSTOMER=""

CUSTOMER.ID="100100"
R.CUSTOMER=""
READ.ERROR=""

CALL OPF(FN.CUSTOMER,F.CUSTOMER)

CRT "AFTER OPEN FILE NAME IS":FN.CUSTOMER
CALL F.READ(FN.CUSTOMER,CUSTOMER.ID,R.CUSTOMER,F.CUSTOMER,READ.ERROR)

CRT "CUSTOMER MNEMONIC":R.CUSTOMER<EB.CUS.MNEMONIC>
CRT "CUSTOMER SECTOR" :R.CUSTOMER<EB.CUS.SECTOR>

INPUT DUMMY
RETURN

END
