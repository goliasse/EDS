* @ValidationCode : Mjo2MzQ0MTU1OTQ6Q3AxMjUyOjE0ODg0NTQ1NTk2MTE6aHNoYXNoYW5rOi0xOi0xOjA6MDp0cnVlOk4vQTpERVZfMjAxNzAxLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 02 Mar 2017 17:05:59
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : DEV_201701.0
$PACKAGE EB.BNFC
SUBROUTINE EB.BENEFICIARY.FIELDS
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $USING EB.Template

*-----------------------------------------------------------------------------
*    EB.Template.TableDefineid('CUSTOMER', EB.Template.T24Customer)
*    EB.Template.TableAddfield('ACCOUNT',EB.Template.T24Account,Field_Mandatory,'')
*    EB.Template.TableAddfield('NAME',EB.Template.T24String,Field_Mandatory,'')
*    EB.Template.TableAddfield('EMAIL', EB.Template.T24String,Field_Mandatory,'')
*    EB.Template.TableAddfield('IFSC', EB.Template.T24String,'','')
    
    Idname = 'CUSTOMER'
    Datatype = EB.Template.T24Customer
    EB.Template.TableDefineid(Idname, Datatype)
    
    Fieldname = 'XX<ACCOUNT'
    Fieldtype = EB.Template.T24Account
    Args = EB.Template.FieldMandatory
    Neighbour = ''
    
    EB.Template.TableAddfield(Fieldname, Fieldtype, Args, Neighbour)
*    EB.Template.TableAddfielddefinition(Fieldlength, Fieldname, Fieldtype, Neighbour)
    
    Fieldname = 'XX-NAME'
    Fieldtype = EB.Template.T24String
    Args = EB.Template.FieldMandatory
    Neighbour = ''
    
    EB.Template.TableAddfield(Fieldname, Fieldtype, Args, Neighbour)
    
    Fieldname = 'XX-EMAIL'
    Fieldtype = EB.Template.T24String
    Args = EB.Template.FieldMandatory
    Neighbour = ''
    
    EB.Template.TableAddfield(Fieldname, Fieldtype, Args, Neighbour)
    
    Fieldname = 'XX>IFSC'
    Fieldtype = EB.Template.T24String
    Args = ''
    Neighbour = ''
    
    EB.Template.TableAddfield(Fieldname, Fieldtype, Args, Neighbour)
    EB.Template.TableSetauditposition()
    
    RETURN

