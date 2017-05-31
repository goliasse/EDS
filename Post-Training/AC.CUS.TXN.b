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
