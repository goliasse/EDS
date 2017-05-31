*-----------------------------------------------------------------------------
* <Rating>-7</Rating>
*-----------------------------------------------------------------------------
    SUBROUTINE SS.CUSTRANS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine SS.CUSTRANS.FIELDS
*
* @author tcoleman@temenos.com
* @stereotype fields template
* @uses Table
* @public Table Creation
* @package infra.eb
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 19/10/07 - EN_10003543
*            New Template changes
*
* 14/11/07 - BG_100015736
*            Exclude routines that are not released
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_DataTypes
    $INSERT I_F.SS.CUSTRANS
    
*** </region>
*-----------------------------------------------------------------------------
    CALL Table.defineId("SS.CUSTRANS.ID", T24_String) ;* Define Table id
*-----------------------------------------------------------------------------
     fieldLength = '35.1'
     fieldType<1> = 'CUS'
*     fieldType<3> = 'MANDATORY'
     fieldType<9> = 'HOT.VALIDATE'
     neighbour = ''
*     CALL Table.addField('CUS.ID', T24_Customer, '', '') ;* Add a new fields
     
    CALL Table.addFieldDefinition('CUS.ID', fieldLength, fieldType, neighbour) ;* Add a new field
    CALL Field.setCheckFile('CUSTOMER')        ;* Use DEFAULT.ENRICH from SS or just field 1
*    CALL Table.addFieldWithEbLookup(fieldName,virtualTableName,neighbour) ;* Specify Lookup values
*    CALL Field.setDefault(defaultValue) ;* Assign default value
     CALL Table.addField('XX.ACCOUNTS.ID', T24_Account,Field_NoInput, '')
     CALL Table.addField('XX.TRANS.ID', T24_String,Field_NoInput, '')
*-----------------------------------------------------------------------------
    CALL Table.setAuditPosition ;* Poputale audit information
*-----------------------------------------------------------------------------
    RETURN
*-----------------------------------------------------------------------------
END
