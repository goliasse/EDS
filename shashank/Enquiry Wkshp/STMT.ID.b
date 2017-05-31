* @ValidationCode : MjoyMDUzNjgwNzk4OkNwMTI1MjoxNDkzMDI5NjM2OTY4OmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDEuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 24 Apr 2017 15:57:16
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201701.0
$PACKAGE EB.TRANS
SUBROUTINE STMT.ID(ID, AVAIL.ID, FROM.DATE, TO.DATE)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
$USING AC.EntryCreation
*-----------------------------------------------------------------------------

AVAIL.ID=''

NOS=DCOUNT(ID,@FM)

FOR I=1 TO NOS

R.STMT.ENTRY=AC.EntryCreation.StmtEntry.Read(ID<I>, Error)
BOOK.DATE=R.STMT.ENTRY<AC.EntryCreation.StmtEntry.SteBookingDate>

IF (BOOK.DATE GE FROM.DATE) AND (BOOK.DATE LE TO.DATE) THEN
    AVAIL.ID<-1>=ID<I>
END

NEXT

CRT "EXITING STMT.ID"
RETURN
