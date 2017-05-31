* @ValidationCode : MjotMTcwNTE3NDU3MzpDcDEyNTI6MTQ5MDE2MDE3NTA3ODpoc2hhc2hhbms6LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzAxLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 22 Mar 2017 10:52:55
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
$PACKAGE EB.BNFC
SUBROUTINE IFSC.VALIDATE
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING EB.SystemTables
$USING FT.LocalClearing
$USING EB.ErrorProcessing
$USING ST.Payments

IFSC=EB.SystemTables.getComi()
	
R.IFSC=FT.LocalClearing.BcSortCode.Read(IFSC, Error)
BRANCH.NAME=R.IFSC<FT.LocalClearing.BcSortCode.EbBscName>
	
EB.SystemTables.setRNew(ST.Payments.Beneficiary.ArcBenBcSortCode, BRANCH.NAME)

RETURN
