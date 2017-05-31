* @ValidationCode : MjoxMTM0MDgwMTcyOkNwMTI1MjoxNDk2MjE0MDAzNjI4OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 31 May 2017 12:30:03
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
SUBROUTINE ENQ.FTDETAILS(ENQ.DATA)

    $USING EB.DataAccess


    TABLE.RECORDS='SELECT FBNK.FT.DETAILS'
    EB.DataAccess.Readlist(TABLE.RECORDS, KeyList,'', Selected, SystemReturnCode)
    CHANGE @FM TO ' ' IN KeyList
    ENQ.DATA<2,1>='@ID'
    ENQ.DATA<3,1>='EQ'
    ENQ.DATA<4,1>=KeyList
RETURN
