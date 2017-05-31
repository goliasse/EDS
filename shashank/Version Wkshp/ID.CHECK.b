* @ValidationCode : MjotMTI5NTQ0NDY4MjpDcDEyNTI6MTQ5NjIxMjUwMzk1Mjpoc2hhc2hhbms6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzA0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 31 May 2017 12:05:03
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201704.0

$PACKAGE FT.WKSHP
SUBROUTINE ID.CHECK
*-----------------------------------------------------------------------------
*
*---------------------------------- -------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $USING EB.SystemTables
    $USING AC.AccountOpening
    $USING EB.ErrorProcessing

    R.ID=EB.SystemTables.getComi()                                  ;* Get Record Id from version
    ID=FIELD(R.ID,".",1)                                            ;* Get Account No

    R.ACC=AC.AccountOpening.Account.Read(ID, Error)
    INACTIVE.MARKER=R.ACC<AC.AccountOpening.Account.InactivMarker>  ;* Get Inactive status for account

    CRT INACTIVE.MARKER

    IF INACTIVE.MARKER EQ 'Y' THEN                                  ;* Set error if account is inactive
        EB.SystemTables.setE('AC-INACTIVE.ACCOUNT')
    END

RETURN
