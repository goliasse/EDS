* @ValidationCode : Mjo0NjE2NDgwMjE6Q3AxMjUyOjE0ODk0NzU3NDQ5OTE6aHNoYXNoYW5rOi0xOi0xOjA6MDpmYWxzZTpOL0E6REVWXzIwMTcwMS4wOi0xOi0x
* @ValidationInfo : Timestamp         : 14 Mar 2017 12:45:44
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
    $PACKAGE FT.WKSHP
    SUBROUTINE CR.DATE.INPT
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $USING EB.API 
    $USING FT.Contract
    $USING EB.SystemTables 
    $USING EB.OverrideProcessing

    DAY.TYPE=''

    CR.VALUE.DATE=EB.SystemTables.getRNew(FT.Contract.FundsTransfer.CreditValueDate)    ;* Get Credit Value Date

    EB.API.Awd("", CR.VALUE.DATE, DAY.TYPE)                                             ;* Get date classification

    IF DAY.TYPE EQ 'H' THEN                                                             ;* Set Override if credit value date is holiday
        EB.SystemTables.setText("CREDIT.DATE.HOLIDAY")
        EB.OverrideProcessing.StoreOverride(CurrNo)
    END



    RETURN
