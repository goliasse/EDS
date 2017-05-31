    $PACKAGE CUS.TXN
    SUBROUTINE AC.CUS.TXN.FIELDS
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
    EB.Template.TableDefineid('CUS.TXN.ID', EB.Template.T24String)
*    EB.Template.TableAddfield('XX.ACCOUNT.ID',EB.Template.T24Account,'','')
    EB.Template.TableAddfield('TXN.ID', EB.Template.T24String, '','')
    EB.Template.TableSetauditposition()
    
    RETURN
    END
