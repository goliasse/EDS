* @ValidationCode : MjotNDU0ODgxNDA5OkNwMTI1MjoxNDk2NDA0ODgzODUyOmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 02 Jun 2017 17:31:23
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201704.0
$PACKAGE CUS.TXN
SUBROUTINE AC.CUS.TXN
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
*$INSERT I_COMMON
*$INSERT I_EQUATE
    $USING EB.SystemTables
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.setTableName('AC.CUS.TXN')

    EB.Template.setTableStereotype('T')
    EB.Template.setTableProduct('AC')
    EB.Template.setTableSubproduct('')
    EB.Template.setTableClassification('CUS')
    EB.Template.setTableSystemclearfile('Y')
    EB.Template.setTableRelatedfiles('')
    EB.Template.setTableIspostclosingfile('')
    EB.Template.setTableEquateprefix('')
    EB.Template.setTableIdprefix('')
    EB.Template.setTableBlockedfunctions('')

RETURN

END
