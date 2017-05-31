* @ValidationCode : MToxNzI0MTY3ODI0OlVURi04OjE0Nzg2MDUyNjA2MTg6dXJhbmdhOi0xOi0xOjA6MDp0cnVlOk4vQQ==
* @ValidationInfo : Timestamp         : 08 Nov 2016 17:11:00
* @ValidationInfo : Encoding          : UTF-8
* @ValidationInfo : User Name         : uranga
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
*-----------------------------------------------------------------------------
* <Rating>-7</Rating>
*-----------------------------------------------------------------------------
    SUBROUTINE AC.CUSTOMER.CARD.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine AC.CUSTOMER.CARD.FIELDS
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
   CALL Table.defineId("CUSTOMER.ID", T24_String) ;* Define Table id
*-----------------------------------------------------------------------------
    CALL Table.addField("XX.CARD.ID",T24_String,'' ,'')
*-----------------------------------------------------------------------------
    RETURN
*-----------------------------------------------------------------------------
END
