* @ValidationCode : Mjo0NDA4MjU1MDQ6Q3AxMjUyOjE0OTY0MDQ5MDE0ODI6aHNoYXNoYW5rOi0xOi0xOjA6MDp0cnVlOk4vQTpERVZfMjAxNzA0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 02 Jun 2017 17:31:41
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : DEV_201704.0
$PACKAGE CUS.TXN
SUBROUTINE AC.CUS.TXN.FIELDS


    $USING EB.SystemTables
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid('CUS.TXN.ID', EB.Template.T24String)
*    EB.Template.TableAddfield('XX.ACCOUNT.ID',EB.Template.T24Account,'','')
    EB.Template.TableAddfield('TXN.ID', EB.Template.T24String, '','')
    EB.Template.TableSetauditposition()
    
RETURN
END
