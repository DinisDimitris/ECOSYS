      SUBROUTINE outpd(I,NT,NE,NAX,NDX,NTX,NEX,NHW,NHE,NVN,NVS)
C
C     THIS SUBROUTINE WRITES DAILY OUTPUT FOR PLANT
C     C, N, P, WATER AND HEAT TO OUTPUT FILES DEPENDING
C     ON SELECTIONS MADE IN OUTPUT CONTROL FILES IN
C     THE RUN SCRIPT
C
      include "parameters.h"
      include "filec.h"
      include "files.h"
      include "blkc.h"
      include "blk1cp.h"
      include "blk1cr.h"
      include "blk1g.h"
      include "blk1n.h"
      include "blk1p.h"
      include "blk3.h"
      include "blk8a.h"
      include "blk8b.h"
      include "blk9a.h"
      include "blk9b.h"
      include "blk9c.h"
      include "blk12a.h"
      include "blk12b.h"
      include "blk14.h"
      CHARACTER*16 DATA(30),DATAC(30,250,250),DATAP(JP,JY,JX)
     2,DATAM(JP,JY,JX),DATAX(JP),DATAY(JP),DATAZ(JP,JY,JX)
     3,OUTS(10),OUTP(10),OUTFILS(10,JY,JX),OUTFILP(10,JP,JY,JX)
      CHARACTER*3 CHOICE(102,20)
      CHARACTER*8 CDATE
      CHARACTER*16 CHEAD
      DIMENSION HEAD(50)
      DO 1040 N=26,30
      IF(DATAC(N,NE,NEX).NE.'NO')THEN
      DO 1010 M=1,50
      HEAD(M)=0.0
1010  CONTINUE
      LUN=N+20
      DO 9995 NX=NHW,NHE
      DO 9990 NY=NVN,NVS
      DO 9985 NZ=1,NP0(NY,NX)
C     IF(IFLGC(NZ,NY,NX).EQ.1)THEN
C
C     WRITE DAILY CROP DATA TO OUTPUT FILES
C
      M=0
C
C     DAILY PLANT C OUTPUT
C
      IF(N.EQ.26)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1026 K=51,100
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.51)HEAD(M)=WTSHT(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.52)HEAD(M)=WTLF(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.53)HEAD(M)=WTSHE(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.54)HEAD(M)=WTSTK(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.55)HEAD(M)=WTRSV(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.56)HEAD(M)=(WTHSK(NZ,NY,NX)+WTEAR(NZ,NY,NX))
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.57)HEAD(M)=WTGR(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.58)HEAD(M)=WTRT(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.59)HEAD(M)=WTND(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.60)HEAD(M)=WTRVC(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.61)HEAD(M)=GRNO(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.62)HEAD(M)=ARLFP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.63)HEAD(M)=CARBN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.64)HEAD(M)=TCUPTK(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.65)HEAD(M)=TCSNC(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.66)HEAD(M)=TCSN0(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.67)HEAD(M)=TCO2T(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.68)HEAD(M)=TCO2A(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.69)HEAD(M)=CCPOLP(NZ,NY,NX)
      IF(K.EQ.70)HEAD(M)=HVSTC(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.71)HEAD(M)=RTDNP(1,1,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.72)HEAD(M)=RTDNP(1,2,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.73)HEAD(M)=RTDNP(1,3,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.74)HEAD(M)=RTDNP(1,4,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.75)HEAD(M)=RTDNP(1,5,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.76)HEAD(M)=RTDNP(1,6,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.77)HEAD(M)=RTDNP(1,7,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.78)HEAD(M)=RTDNP(1,8,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.79)HEAD(M)=RTDNP(1,9,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.80)HEAD(M)=RTDNP(1,10,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.81)HEAD(M)=RTDNP(1,11,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.82)HEAD(M)=RTDNP(1,12,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.83)HEAD(M)=RTDNP(1,13,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.84)HEAD(M)=RTDNP(1,14,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.85)HEAD(M)=RTDNP(1,15,NZ,NY,NX)*PP(NZ,NY,NX)
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.86)HEAD(M)=BALC(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.87)HEAD(M)=WTSTG(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.88)HEAD(M)=VCOXF(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.89)HEAD(M)=0.0
      IF(K.EQ.90)HEAD(M)=ZNPP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.91)HEAD(M)=ZC(NZ,NY,NX)
      IF(K.EQ.92)HEAD(M)=PP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      ENDIF
1026  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILP(N-20,NZ,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY PLANT WATER OUTPUT
C
      IF(N.EQ.27)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1027 K=51,100
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.51)HEAD(M)=-CTRAN(NZ,NY,NX)*1000.0/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.52)HEAD(M)=WSTR(NZ,NY,NX)
      IF(K.EQ.53)HEAD(M)=OSTR(NZ,NY,NX)
      IF(K.EQ.54)HEAD(M)=VOLWP(NZ,NY,NX)*1000.0/AREA(3,NU(NY,NX),NY,NX)
      ENDIF
1027  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILP(N-20,NZ,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY PLANT N OUTPUT
C
      IF(N.EQ.28)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1028 K=51,100
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.51)HEAD(M)=WTSHN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.52)HEAD(M)=WTLFN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.53)HEAD(M)=WTSHEN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.54)HEAD(M)=WTSTKN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.55)HEAD(M)=WTRSVN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.56)HEAD(M)=(WTHSKN(NZ,NY,NX)+WTEARN(NZ,NY,NX))
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.57)HEAD(M)=WTGRNN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.58)HEAD(M)=WTRTN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.59)HEAD(M)=WTNDN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.60)HEAD(M)=WTRVN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.61)HEAD(M)=TZUPTK(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.62)HEAD(M)=TZSNC(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.63)HEAD(M)=TZUPFX(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.64)HEAD(M)=CZPOLP(NZ,NY,NX)
      IF(K.EQ.65)THEN
      IF(WTLF(NZ,NY,NX).GT.ZEROP(NZ,NY,NX))THEN
      HEAD(M)=(WTLFN(NZ,NY,NX)+ZPOOLP(NZ,NY,NX))
     2/(WTLF(NZ,NY,NX)+CPOOLP(NZ,NY,NX))
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.66)HEAD(M)=CPPOLP(NZ,NY,NX)
      IF(K.EQ.67)THEN
      IF(WTLF(NZ,NY,NX).GT.ZEROP(NZ,NY,NX))THEN
      HEAD(M)=(WTLFP(NZ,NY,NX)+PPOOLP(NZ,NY,NX))
     2/(WTLF(NZ,NY,NX)+CPOOLP(NZ,NY,NX))
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.68)HEAD(M)=TNH3C(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.69)HEAD(M)=HVSTN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.70)HEAD(M)=BALN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.71)HEAD(M)=WTSTGN(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.72)HEAD(M)=VNOXF(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.73)HEAD(M)=TZSN0(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      ENDIF
1028  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILP(N-20,NZ,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY PLANT P OUTPUT
C
      IF(N.EQ.29)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1029 K=51,100
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.51)HEAD(M)=WTSHP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.52)HEAD(M)=WTLFP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.53)HEAD(M)=WTSHEP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.54)HEAD(M)=WTSTKP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.55)HEAD(M)=WTRSVP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.56)HEAD(M)=(WTHSKP(NZ,NY,NX)+WTEARP(NZ,NY,NX))
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.57)HEAD(M)=WTGRNP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.58)HEAD(M)=WTRTP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.59)HEAD(M)=WTNDP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.60)HEAD(M)=WTRVP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.61)HEAD(M)=TPUPTK(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.62)HEAD(M)=TPSNC(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.63)HEAD(M)=CPPOLP(NZ,NY,NX)
      IF(K.EQ.64)THEN
      IF(WTLF(NZ,NY,NX).GT.ZEROP(NZ,NY,NX))THEN
      HEAD(M)=(WTLFP(NZ,NY,NX)+PPOOLP(NZ,NY,NX))
     2/(WTLF(NZ,NY,NX)+CPOOLP(NZ,NY,NX))
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.65)HEAD(M)=HVSTP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.66)HEAD(M)=BALP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.67)HEAD(M)=WTSTGP(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.68)HEAD(M)=VPOXF(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.69)HEAD(M)=TPSN0(NZ,NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      ENDIF
1029  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,50E16.7E3)')OUTFILP(N-20,NZ,NY,NX)
     2,DOY,CDATE,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     DAILY PLANT HEAT OUTPUT
C
      IF(N.EQ.30)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      CHEAD=' '
      IF(IFLGC(NZ,NY,NX).EQ.1)THEN
      DO 1030 K=51,100
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.51)THEN
      DO 2030 KN=10,0,-1
      IF(KN.EQ.0)THEN
      CHEAD='  PLANTING'
      GO TO 1030
      ELSE
      IF(IDAY(KN,NB1(NZ,NY,NX),NZ,NY,NX).EQ.0)THEN
      GO TO 2030
      ELSE
      IF(KN.EQ.1)CHEAD='  EMERGENCE'
      IF(KN.EQ.2)CHEAD='  FLORAL_INIT.'
      IF(KN.EQ.3)CHEAD='  JOINTING'
      IF(KN.EQ.4)CHEAD='  ELONGATION'
      IF(KN.EQ.5)CHEAD='  HEADING'
      IF(KN.EQ.6)CHEAD='  ANTHESIS'
      IF(KN.EQ.7)CHEAD='  SEED_FILL'
      IF(KN.EQ.8)CHEAD='  SEED_NO._SET'
      IF(KN.EQ.9)CHEAD='  SEED_MASS_SET'
      IF(KN.EQ.10)CHEAD='  END_SEED_FILL'
      GO TO 1030
      ENDIF
      ENDIF
2030  CONTINUE
      ENDIF
      IF(K.EQ.52)IHEAD=NBR(NZ,NY,NX)
      IF(K.EQ.53)HEAD(M)=VSTG(NB1(NZ,NY,NX),NZ,NY,NX)
      IF(K.EQ.54)HEAD(M)=FDBKP(NZ,NY,NX)
      IF(K.EQ.55)THEN
      IF(WTLF(NZ,NY,NX).GT.ZEROP(NZ,NY,NX))THEN
      HEAD(M)=(WTLFN(NZ,NY,NX)+ZPOOLP(NZ,NY,NX))
     2/(WTLF(NZ,NY,NX)+CPOOLP(NZ,NY,NX))
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.56)THEN
      IF(WTLF(NZ,NY,NX).GT.ZEROP(NZ,NY,NX))THEN
      HEAD(M)=(WTLFP(NZ,NY,NX)+PPOOLP(NZ,NY,NX))
     2/(WTLF(NZ,NY,NX)+CPOOLP(NZ,NY,NX))
      ELSE
      HEAD(M)=0.0
      ENDIF
      ENDIF
      IF(K.EQ.57)HEAD(M)=PSILZ(NZ,NY,NX)
      IF(K.EQ.58)HEAD(M)=OSTR(NZ,NY,NX)
      IF(K.EQ.59)HEAD(M)=TFN3(NZ,NY,NX)
      ENDIF
1030  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,A16,I16,50E16.7E3)')
     2OUTFILP(N-20,NZ,NY,NX),DOY,CDATE,CHEAD,IHEAD,(HEAD(K),K=3,M)
      ELSE
      CHEAD='  NOT_ALIVE'
      IHEAD=0
      WRITE(LUN,'(A16,F8.3,4X,A8,A16,I16)')
     2OUTFILP(N-20,NZ,NY,NX),DOY,CDATE,CHEAD,IHEAD
      ENDIF
      ENDIF
      ENDIF
C     ENDIF
9985  CONTINUE
9990  CONTINUE
9995  CONTINUE
      ENDIF
1040  CONTINUE
      RETURN
      END
