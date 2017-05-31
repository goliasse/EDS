$PACKAGE EB.DebitCard
SUBROUTINE EB.DEBIT.CARD.FIELDS
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
$USING EB.Template
$USING EB.SystemTables

EB.Template.TableDefineid('DEBIT.CARD.ID', EB.Template.T24String)
EB.Template.TableAddfield('XX.LL.SHORT.DESCRIP',EB.Template.T24String,'','')
EB.Template.TableAddfield('ACCOUNT',EB.Template.T24Account,EB.Template.FieldMandatory,'')
EB.Template.FieldSetcheckfile('ACCOUNT')
EB.Template.TableAddfield('CUSTOMER',EB.Template.T24Customer,EB.Template.FieldNoInput,'')
EB.Template.TableAddfield('NO.OF.CARDS',EB.Template.T24String,'','')
EB.Template.FieldSetdefault(1)
EB.Template.TableAddfield('XX<DISPLAY.NAME',EB.Template.T24String,'','')
EB.Template.TableAddfield('XX>DEBIT.CARD.NO',EB.Template.T24Customer,EB.Template.FieldNoInput,'')
EB.Template.TableAddfield('START.DATE',EB.Template.T24Date,EB.Template.FieldNoInput,'')
EB.Template.FieldSetdefault(EB.SystemTables.getToday())
EB.Template.TableAddfield('END.DATE',EB.Template.T24Date,'','')
EB.Template.TableAddfield('STATUS',EB.Template.T24String,EB.Template.FieldNoInput,'')
EB.Template.TableAddreservedfield('RESERVED.2')
EB.Template.TableAddreservedfield('RESERVED.1')
EB.Template.TableAddlocalreferencefield('')
EB.Template.TableAddoverridefield()
EB.Template.TableSetauditposition()

END
