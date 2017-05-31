* @ValidationCode : MjoyMDcwOTkyNDkwOkNwMTI1MjoxNDgzMzU3MDMzOTgyOnVyYW5nYTotMTotMTowOjA6dHJ1ZTpOL0E6REVWXzIwMTYxMi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 02 Jan 2017 17:07:13
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : uranga
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : DEV_201612.0
*-----------------------------------------------------------------------------
* <Rating>-7</Rating>
*-----------------------------------------------------------------------------
    SUBROUTINE AC.DEBIT.CARD.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine AC.DEBIT.CARD.FIELDS
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
*** </region>
*-----------------------------------------------------------------------------
    CALL Table.defineId("DEBIT.CARD.ID", T24_String) ;* Define Table id
*-----------------------------------------------------------------------------
    CALL Table.addField("XX.LL.SHORT.DES",T24_String,'','')
    CALL Table.addField("ACCOUNT",T24_String,Field_Mandatory,'') ;* Add a new fields
    CALL Field.setCheckFile('ACCOUNT')
    CALL Table.addField("CUSTOMER",T24_String,Field_NoInput,'')
    CALL Table.addField("NO.OF.CARDS",T24_String,'','')
    CALL Field.setDefault(1)
    CALL Table.addField("XX<DISPLAY.NAME",T24_String,'','')
    CALL Table.addField("XX>DEBIT.CARD.NO",T24_String,Field_NoInput,'')
    CALL Table.addField("START.DATE",T24_Date,Field_NoInput,'')
     CALL Field.setDefault(TODAY)
    CALL Table.addField("END.DATE",T24_Date,'','')
    CALL Table.addField("STATUS",T24_String,Field_NoInput,'')
    CALL Table.addReservedField("RESERVED.1")
    CALL Table.addReservedField("RESERVED.2")
    CALL Table.addLocalReferenceField(neighbour)
    CALL Table.addStatementNumbersField(neighbour)
    CALL Table.addOverrideField
*-----------------------------------------------------------------------------
    CALL Table.setAuditPosition ;* Poputale audit information
*-----------------------------------------------------------------------------
    RETURN
*-----------------------------------------------------------------------------
END
