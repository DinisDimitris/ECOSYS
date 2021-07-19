      SUBROUTINE outsh(I,J,NT,NE,NAX,NDX,NTX,NEX,NHW,NHE,NVN,NVS)
C
C     THIS SUBROUTINE WRITES HOURLY OUTPUT FOR SOIL
C     C, N, P, WATER AND HEAT TO OUTPUT FILES DEPENDING
C     ON SELECTIONS MADE IN OUTPUT CONTROL FILES IN
C     THE RUN SCRIPT
C
      include "parameters.h"
      include "filec.h"
      include "files.h"
      include "blkc.h"
      include "blk2a.h"
      include "blk2b.h"
      include "blk2c.h"
      include "blk8a.h"
      include "blk8b.h"
      include "blk11a.h"
      include "blk11b.h"
      include "blk13a.h"
      include "blk13b.h"
      include "blk13c.h"
      include "blk15a.h"
      include "blk15b.h"
      include "blk16.h"
      include "blk18a.h"
      include "blk18b.h"
      include "blk20f.h"
      CHARACTER*16 DATA(30),DATAC(30,250,250),DATAP(JP,JY,JX)
     2,DATAM(JP,JY,JX),DATAX(JP),DATAY(JP),DATAZ(JP,JY,JX)
     3,OUTS(10),OUTP(10),OUTFILS(10,JY,JX),OUTFILP(10,JP,JY,JX)
      CHARACTER*3 CHOICE(102,20)
      CHARACTER*8 CDATE
      DIMENSION HEAD(50)
      DO 1040 N=21,25
      IF(DATAC(N,NE,NEX).NE.'NO')THEN
      DO 1010 M=1,50
      HEAD(M)=0.0
1010  CONTINUE
      LUN=N+10
      DO 9995 NX=NHW,NHE
      DO 9990 NY=NVN,NVS
C
C     WRITE HOURLY SOIL DATA TO OUTPUT FILES
C
      M=0
C
C     HOURLY SOIL C OUTPUT
C
      IF(N.EQ.21)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1021 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=HCO2G(NY,NX)/AREA(3,NU(NY,NX),NY,NX)*23.14815
      IF(K.EQ.2)HEAD(M)=TCNET(NY,NX)/AREA(3,NU(NY,NX),NY,NX)*23.14815
      IF(K.EQ.3)HEAD(M)=HCH4G(NY,NX)/AREA(3,NU(NY,NX),NY,NX)*23.14815
      IF(K.EQ.4)HEAD(M)=HOXYG(NY,NX)/AREA(3,NU(NY,NX),NY,NX)*8.68056
      IF(K.EQ.5)HEAD(M)=CCO2S(1,NY,NX)
      IF(K.EQ.6)HEAD(M)=CCO2S(2,NY,NX)
      IF(K.EQ.7)HEAD(M)=CCO2S(3,NY,NX)
      IF(K.EQ.8)HEAD(M)=CCO2S(4,NY,NX)
      IF(K.EQ.9)HEAD(M)=CCO2S(5,NY,NX)
      IF(K.EQ.10)HEAD(M)=CCO2S(6,NY,NX)
      IF(K.EQ.11)HEAD(M)=CCO2S(7,NY,NX)
      IF(K.EQ.12)HEAD(M)=CCO2S(8,NY,NX)
      IF(K.EQ.13)HEAD(M)=CCO2S(9,NY,NX)
      IF(K.EQ.14)HEAD(M)=CCO2S(10,NY,NX)
      IF(K.EQ.15)HEAD(M)=CCO2S(11,NY,NX)
      IF(K.EQ.16)HEAD(M)=CCO2S(12,NY,NX)
      IF(K.EQ.17)HEAD(M)=CCO2S(13,NY,NX)
      IF(K.EQ.18)HEAD(M)=CCO2S(14,NY,NX)
      IF(K.EQ.19)HEAD(M)=CCO2S(0,NY,NX)
      IF(K.EQ.20)HEAD(M)=CCH4S(1,NY,NX)
      IF(K.EQ.21)HEAD(M)=CCH4S(2,NY,NX)
      IF(K.EQ.22)HEAD(M)=CCH4S(3,NY,NX)
      IF(K.EQ.23)HEAD(M)=CCH4S(4,NY,NX)
      IF(K.EQ.24)HEAD(M)=CCH4S(5,NY,NX)
      IF(K.EQ.25)HEAD(M)=CCH4S(6,NY,NX)
      IF(K.EQ.26)HEAD(M)=CCH4S(7,NY,NX)
      IF(K.EQ.27)HEAD(M)=CCH4S(8,NY,NX)
      IF(K.EQ.28)HEAD(M)=CCH4S(9,NY,NX)
      IF(K.EQ.29)HEAD(M)=CCH4S(10,NY,NX)
      IF(K.EQ.30)HEAD(M)=CCH4S(11,NY,NX)
      IF(K.EQ.31)HEAD(M)=CCH4S(12,NY,NX)
      IF(K.EQ.32)HEAD(M)=CCH4S(13,NY,NX)
      IF(K.EQ.33)HEAD(M)=CCH4S(14,NY,NX)
      IF(K.EQ.34)HEAD(M)=CCH4S(15,NY,NX)
      IF(K.EQ.35)HEAD(M)=COXYS(1,NY,NX)
      IF(K.EQ.36)HEAD(M)=COXYS(2,NY,NX)
      IF(K.EQ.37)HEAD(M)=COXYS(3,NY,NX)
      IF(K.EQ.38)HEAD(M)=COXYS(4,NY,NX)
      IF(K.EQ.39)HEAD(M)=COXYS(5,NY,NX)
      IF(K.EQ.40)HEAD(M)=COXYS(6,NY,NX)
      IF(K.EQ.41)HEAD(M)=COXYS(7,NY,NX)
      IF(K.EQ.42)HEAD(M)=COXYS(8,NY,NX)
      IF(K.EQ.43)HEAD(M)=COXYS(9,NY,NX)
      IF(K.EQ.44)HEAD(M)=COXYS(10,NY,NX)
      IF(K.EQ.45)HEAD(M)=COXYS(11,NY,NX)
      IF(K.EQ.46)HEAD(M)=COXYS(12,NY,NX)
      IF(K.EQ.47)HEAD(M)=COXYS(13,NY,NX)
      IF(K.EQ.48)HEAD(M)=COXYS(14,NY,NX)
      IF(K.EQ.49)HEAD(M)=COXYS(15,NY,NX)
      IF(K.EQ.50)HEAD(M)=COXYS(0,NY,NX)
      ENDIF
1021  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,I8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,J,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     HOURLY SOIL WATER OUTPUT
C
      IF(N.EQ.22)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1022 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=TEVAPG(NY,NX)*1000.0/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.2)HEAD(M)=-WQRH(NY,NX)*1000.0/TAREA
      IF(K.EQ.3)HEAD(M)=USEDOU(NY,NX)*1000.0/TAREA
      IF(K.EQ.4)HEAD(M)=UVOLW(NY,NX)*1000.0/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.5)HEAD(M)=HVOLO(NY,NX)*1000.0/TAREA
      IF(K.EQ.6)HEAD(M)=AMAX1(1.0E-64,(VOLSS(NY,NX)+VOLIS(NY,NX)
     2*DENSI+VOLWS(NY,NX))*1000.0/AREA(3,NU(NY,NX),NY,NX))
      IF(K.EQ.7)HEAD(M)=THETWZ(1,NY,NX)
      IF(K.EQ.8)HEAD(M)=THETWZ(2,NY,NX)
      IF(K.EQ.9)HEAD(M)=THETWZ(3,NY,NX)
      IF(K.EQ.10)HEAD(M)=THETWZ(4,NY,NX)
      IF(K.EQ.11)HEAD(M)=THETWZ(5,NY,NX)
      IF(K.EQ.12)HEAD(M)=THETWZ(6,NY,NX)
      IF(K.EQ.13)HEAD(M)=THETWZ(7,NY,NX)
      IF(K.EQ.14)HEAD(M)=THETWZ(8,NY,NX)
      IF(K.EQ.15)HEAD(M)=THETWZ(9,NY,NX)
      IF(K.EQ.16)HEAD(M)=THETWZ(10,NY,NX)
      IF(K.EQ.17)HEAD(M)=THETWZ(11,NY,NX)
      IF(K.EQ.18)HEAD(M)=THETWZ(12,NY,NX)
      IF(K.EQ.19)HEAD(M)=THETWZ(13,NY,NX)
      IF(K.EQ.20)HEAD(M)=THETWZ(14,NY,NX)
      IF(K.EQ.21)HEAD(M)=THETWZ(15,NY,NX)
      IF(K.EQ.22)HEAD(M)=THETWZ(16,NY,NX)
      IF(K.EQ.23)HEAD(M)=THETWZ(17,NY,NX)
      IF(K.EQ.24)HEAD(M)=THETWZ(18,NY,NX)
      IF(K.EQ.25)HEAD(M)=THETWZ(19,NY,NX)
      IF(K.EQ.26)HEAD(M)=THETWZ(20,NY,NX)
      IF(K.EQ.27)HEAD(M)=THETWZ(0,NY,NX)
      IF(K.EQ.28)HEAD(M)=THETIZ(1,NY,NX)
      IF(K.EQ.29)HEAD(M)=THETIZ(2,NY,NX)
      IF(K.EQ.30)HEAD(M)=THETIZ(3,NY,NX)
      IF(K.EQ.31)HEAD(M)=THETIZ(4,NY,NX)
      IF(K.EQ.32)HEAD(M)=THETIZ(5,NY,NX)
      IF(K.EQ.33)HEAD(M)=THETIZ(6,NY,NX)
      IF(K.EQ.34)HEAD(M)=THETIZ(7,NY,NX)
      IF(K.EQ.35)HEAD(M)=THETIZ(8,NY,NX)
      IF(K.EQ.36)HEAD(M)=THETIZ(9,NY,NX)
      IF(K.EQ.37)HEAD(M)=THETIZ(10,NY,NX)
      IF(K.EQ.38)HEAD(M)=THETIZ(11,NY,NX)
      IF(K.EQ.39)HEAD(M)=THETIZ(12,NY,NX)
      IF(K.EQ.40)HEAD(M)=THETIZ(13,NY,NX)
      IF(K.EQ.41)HEAD(M)=THETIZ(14,NY,NX)
      IF(K.EQ.42)HEAD(M)=THETIZ(15,NY,NX)
      IF(K.EQ.43)HEAD(M)=THETIZ(16,NY,NX)
      IF(K.EQ.44)HEAD(M)=THETIZ(17,NY,NX)
      IF(K.EQ.45)HEAD(M)=THETIZ(18,NY,NX)
      IF(K.EQ.46)HEAD(M)=THETIZ(19,NY,NX)
      IF(K.EQ.47)HEAD(M)=THETIZ(20,NY,NX)
      IF(K.EQ.48)HEAD(M)=THETIZ(0,NY,NX)
      IF(K.EQ.49)HEAD(M)=-(DPTHA(NY,NX)-CDPTH(NU(NY,NX)-1,NY,NX))
      IF(K.EQ.50)HEAD(M)=-(DPTHT(NY,NX)-CDPTH(NU(NY,NX)-1,NY,NX))
      ENDIF
1022  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,I8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,J,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     HOURLY SOIL N OUTPUT
C
      IF(N.EQ.23)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1023 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=HN2OG(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.2)HEAD(M)=HN2GG(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.3)HEAD(M)=HNH3G(NY,NX)/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.4)HEAD(M)=UDINQ(NY,NX)/TAREA
      IF(K.EQ.5)HEAD(M)=UDIND(NY,NX)/TAREA
      IF(K.EQ.6)HEAD(M)=CZ2OS(1,NY,NX)
      IF(K.EQ.7)HEAD(M)=CZ2OS(2,NY,NX)
      IF(K.EQ.8)HEAD(M)=CZ2OS(3,NY,NX)
      IF(K.EQ.9)HEAD(M)=CZ2OS(4,NY,NX)
      IF(K.EQ.10)HEAD(M)=CZ2OS(5,NY,NX)
      IF(K.EQ.11)HEAD(M)=CZ2OS(6,NY,NX)
      IF(K.EQ.12)HEAD(M)=CZ2OS(7,NY,NX)
      IF(K.EQ.13)HEAD(M)=CZ2OS(8,NY,NX)
      IF(K.EQ.14)HEAD(M)=CZ2OS(9,NY,NX)
      IF(K.EQ.15)HEAD(M)=CZ2OS(10,NY,NX)
      IF(K.EQ.16)HEAD(M)=CZ2OS(11,NY,NX)
      IF(K.EQ.17)HEAD(M)=CZ2OS(12,NY,NX)
      IF(K.EQ.18)HEAD(M)=CZ2OS(13,NY,NX)
      IF(K.EQ.19)HEAD(M)=CZ2OS(14,NY,NX)
      IF(K.EQ.20)HEAD(M)=CZ2OS(15,NY,NX)
      IF(K.EQ.21)HEAD(M)=CNH3S(1,NY,NX)
      IF(K.EQ.22)HEAD(M)=CNH3S(2,NY,NX)
      IF(K.EQ.23)HEAD(M)=CNH3S(3,NY,NX)
      IF(K.EQ.24)HEAD(M)=CNH3S(4,NY,NX)
      IF(K.EQ.25)HEAD(M)=CNH3S(5,NY,NX)
      IF(K.EQ.26)HEAD(M)=CNH3S(6,NY,NX)
      IF(K.EQ.27)HEAD(M)=CNH3S(7,NY,NX)
      IF(K.EQ.28)HEAD(M)=CNH3S(8,NY,NX)
      IF(K.EQ.29)HEAD(M)=CNH3S(9,NY,NX)
      IF(K.EQ.30)HEAD(M)=CNH3S(10,NY,NX)
      IF(K.EQ.31)HEAD(M)=CNH3S(11,NY,NX)
      IF(K.EQ.32)HEAD(M)=CNH3S(12,NY,NX)
      IF(K.EQ.33)HEAD(M)=CNH3S(13,NY,NX)
      IF(K.EQ.34)HEAD(M)=CNH3S(14,NY,NX)
      IF(K.EQ.35)HEAD(M)=CNH3S(15,NY,NX)
      IF(K.EQ.36)HEAD(M)=CZ2OS(0,NY,NX)
      IF(K.EQ.37)HEAD(M)=CNH3S(0,NY,NX)
      ENDIF
1023  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,I8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,J,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     HOURLY SOIL P OUTPUT
C
      IF(N.EQ.24)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1024 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=UDIPQ(NY,NX)/TAREA
      IF(K.EQ.2)HEAD(M)=UDIPD(NY,NX)/TAREA
      ENDIF
1024  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,I8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,J,(HEAD(K),K=1,M)
      ENDIF
      ENDIF
C
C     HOURLY SOIL HEAT OUTPUT
C
      IF(N.EQ.25)THEN
      IF(I.GE.IDATA(N).AND.I.LE.IDATA(N+20))THEN
      DO 1025 K=1,50
      IF(CHOICE(K,N-20).EQ.'YES')THEN
      M=M+1
      IF(K.EQ.1)HEAD(M)=RAD(NY,NX)*277.8
      IF(K.EQ.2)HEAD(M)=TCA(NY,NX)
      IF(K.EQ.3)HEAD(M)=VPK(NY,NX)
      IF(K.EQ.4)HEAD(M)=UA(NY,NX)/3600.0
      IF(K.EQ.5)HEAD(M)=(PRECR(NY,NX)+PRECW(NY,NX))*1000.0
     2/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.6)HEAD(M)=HEATI(NY,NX)*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.7)HEAD(M)=HEATE(NY,NX)*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.8)HEAD(M)=HEATS(NY,NX)*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.9)HEAD(M)=-(HEATH(NY,NX)-HEATV(NY,NX))
     2*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.10)HEAD(M)=TRN(NY,NX)*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.11)HEAD(M)=TLE(NY,NX)*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.12)HEAD(M)=TSH(NY,NX)*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.13)HEAD(M)=TGH(NY,NX)*277.8/AREA(3,NU(NY,NX),NY,NX)
      IF(K.EQ.14)HEAD(M)=TCS(1,NY,NX)
      IF(K.EQ.15)HEAD(M)=TCS(2,NY,NX)
      IF(K.EQ.16)HEAD(M)=TCS(3,NY,NX)
      IF(K.EQ.17)HEAD(M)=TCS(4,NY,NX)
      IF(K.EQ.18)HEAD(M)=TCS(5,NY,NX)
      IF(K.EQ.19)HEAD(M)=TCS(6,NY,NX)
      IF(K.EQ.20)HEAD(M)=TCS(7,NY,NX)
      IF(K.EQ.21)HEAD(M)=TCS(8,NY,NX)
      IF(K.EQ.22)HEAD(M)=TCS(9,NY,NX)
      IF(K.EQ.23)HEAD(M)=TCS(10,NY,NX)
      IF(K.EQ.24)HEAD(M)=TCS(11,NY,NX)
      IF(K.EQ.25)HEAD(M)=TCS(12,NY,NX)
      IF(K.EQ.26)HEAD(M)=TCS(13,NY,NX)
      IF(K.EQ.27)HEAD(M)=TCS(14,NY,NX)
      IF(K.EQ.28)HEAD(M)=TCS(15,NY,NX)
      IF(K.EQ.29)HEAD(M)=TCS(16,NY,NX)
      IF(K.EQ.30)HEAD(M)=TCS(17,NY,NX)
      IF(K.EQ.31)HEAD(M)=TCS(18,NY,NX)
      IF(K.EQ.32)HEAD(M)=TCS(19,NY,NX)
      IF(K.EQ.33)HEAD(M)=TCS(20,NY,NX)
      IF(K.EQ.34)HEAD(M)=TCS(0,NY,NX)
      IF(K.EQ.35)HEAD(M)=TCW(1,NY,NX)
      ENDIF
1025  CONTINUE
      WRITE(LUN,'(A16,F8.3,4X,A8,I8,50E16.7E3)')OUTFILS(N-20,NY,NX)
     2,DOY,CDATE,J,(HEAD(K),K=1,M)
      ENDIF 
      ENDIF
9990  CONTINUE
9995  CONTINUE
      ENDIF
1040  CONTINUE
      RETURN
      END
