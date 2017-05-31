$PACKAGE EB.DebitCard
SUBROUTINE EB.DEBIT.CARD
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING EB.Template

EB.Template.setTableName('EB.DEBIT.CARD')

EB.Template.setTableStereotype('H')
EB.Template.setTableProduct('EB')
EB.Template.setTableSubproduct('')
EB.Template.setTableClassification('FIN')
EB.Template.setTableSystemclearfile('Y')
EB.Template.setTableRelatedfiles('')
EB.Template.setTableIspostclosingfile('')
EB.Template.setTableEquateprefix('')

EB.Template.setTableIdprefix('DBC')
EB.Template.setTableBlockedfunctions('R D V')

RETURN
END
