* @ValidationCode : MjoxNzI0OTA2MDI1OkNwMTI1MjoxNDk2MjEyNTc4MDIxOmhzaGFzaGFuazotMTotMTowOjA6ZmFsc2U6Ti9BOkRFVl8yMDE3MDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 31 May 2017 12:06:18
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : hshashank
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201704.0

SUBROUTINE OFS.SOURCE.CHK.RTN

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.OFS.SOURCE

    FN.OFS.INAU = 'F.OFS.SOURCE$NAU'
    F.OFS.INAU = ''
    R.OFS.INAU = ''
    CALL OPF(FN.OFS.INAU,F.OFS.INAU)

    FN.OFS.LIVE = 'F.OFS.SOURCE'
    F.OFS.LIVE = ''
    R.OFS.LIVE = ''
    CALL OPF(FN.OFS.LIVE,F.OFS.LIVE)


    OFS.ERR.ARR = "EATS.CHQ.IMAGE"
    OFS.ERR.CNT = DCOUNT(OFS.ERR.ARR,'#')
    OFS.ERR.INT = '1'

    LOOP
    WHILE OFS.ERR.INT LE OFS.ERR.CNT
        Y.OFS.ERR.ID = FIELD(OFS.ERR.ARR,'#',OFS.ERR.INT)
        R.OFS.INAU = ''
        CALL F.READ(FN.OFS.INAU,Y.OFS.ERR.ID,R.OFS.INAU,F.OFS.INAU,OFS.INAU.ERR)
        IF R.OFS.INAU THEN
            R.OFS.LIVE = R.OFS.INAU
            IF R.OFS.INAU<OFS.SRC.RECORD.STATUS> EQ 'IHLD' THEN
                R.OFS.LIVE<OFS.SRC.RECORD.STATUS> = ''
                R.OFS.LIVE<OFS.SRC.CURR.NO> = '1'
                WRITE R.OFS.LIVE TO F.OFS.LIVE,Y.OFS.ERR.ID
                DELETE F.OFS.INAU,Y.OFS.ERR.ID
            END
        END

        OFS.ERR.INT = OFS.ERR.INT + 1
    REPEAT

RETURN