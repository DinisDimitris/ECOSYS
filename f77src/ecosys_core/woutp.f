
      SUBROUTINE woutp(I,NHW,NHE,NVN,NVS)
C
C     THIS SUBROUTINE WRITES OUT ALL PLANT VARIABLES TO
C     CHECKPOINT FILES AT THE FREQUENCY GIVEN IN THE OPTIONS
C     FILE SO THAT OUTPUTS FROM EARLIER MODEL RUNS CAN BE USED
C     TO INITIALIZE LATER MODEL RUNS
C
      include "parameters.h"
      include "files.h"
      include "blkc.h"
      include "blk1cp.h"
      include "blk1cr.h"
      include "blk1g.h"
      include "blk1n.h"
      include "blk1p.h"
      include "blk1s.h"
      include "blk3.h"
      include "blk5.h"
      include "blk8a.h"
      include "blk8b.h"
      include "blk9a.h"
      include "blk9b.h"
      include "blk9c.h"
      include "blk12a.h"
      include "blk12b.h"
      include "blk14.h"
      include "blk18a.h"
      include "blk18b.h"
      DO 9990 NX=NHW,NHE
      DO 9985 NY=NVN,NVS
      WRITE(26,90)I,IDATA(3),NP(NY,NX),IFLGT(NY,NX)
      DO 9975 NZ=1,NP(NY,NX)
      WRITE(26,90)I,IDATA(3),IFLGC(NZ,NY,NX),IDTH(NZ,NY,NX) 
9975  CONTINUE
      DO 9976 NZ=1,NP(NY,NX)
      WRITE(26,97)I,IDATA(3) 
     2,(WTSTDG(M,NZ,NY,NX),M=1,5)
     3,(WTSTDN(M,NZ,NY,NX),M=1,5) 
     4,(WTSTDP(M,NZ,NY,NX),M=1,5)
     5,TCD(NZ,NY,NX),TKD(NZ,NY,NX),TKQD(NZ,NY,NX),VPQD(NZ,NY,NX)
9976  CONTINUE
      IF(IFLGT(NY,NX).GT.0)THEN
      DO 9980 NZ=1,NP(NY,NX)
      IF(IFLGC(NZ,NY,NX).NE.0)THEN
      WRITE(26,91)I,IDATA(3),NZ,IYR0(NZ,NY,NX),IDAY0(NZ,NY,NX)
     2,IYRH(NZ,NY,NX),IDAYH(NZ,NY,NX),NG(NZ,NY,NX),IDTHP(NZ,NY,NX) 
     3,IDTHR(NZ,NY,NX),NBR(NZ,NY,NX),NBT(NZ,NY,NX),NB1(NZ,NY,NX)
     4,IFLGI(NZ,NY,NX),NRT(NZ,NY,NX),NIX(NZ,NY,NX),MY(NZ,NY,NX) 
     5,(NINR(NR,NZ,NY,NX),NR=1,NRT(NZ,NY,NX))
      WRITE(26,93)I,IDATA(3),NZ,TCUPTK(NZ,NY,NX),TCSNC(NZ,NY,NX)
     2,TZUPTK(NZ,NY,NX),TZSNC(NZ,NY,NX),TPUPTK(NZ,NY,NX),TPSNC(NZ,NY,NX)
     3,TZUPFX(NZ,NY,NX),TCO2T(NZ,NY,NX),CTRAN(NZ,NY,NX),CARBN(NZ,NY,NX)
     4,TCC(NZ,NY,NX),TKC(NZ,NY,NX),TCG(NZ,NY,NX),TKG(NZ,NY,NX)
     5,TFN3(NZ,NY,NX),WVSTK(NZ,NY,NX),VOLWP(NZ,NY,NX),DWTSHT(NZ,NY,NX)
     6,PSILT(NZ,NY,NX),PSILO(NZ,NY,NX),PSILG(NZ,NY,NX),WTRTA(NZ,NY,NX)
     7,ARLFP(NZ,NY,NX),ARSTP(NZ,NY,NX),HVSTC(NZ,NY,NX)
     8,HVSTN(NZ,NY,NX),HVSTP(NZ,NY,NX),THVSTC(NZ,NY,NX),THVSTN(NZ,NY,NX)
     3,THVSTP(NZ,NY,NX),TCO2A(NZ,NY,NX),RSETC(NZ,NY,NX),RSETN(NZ,NY,NX)
     9,RSETP(NZ,NY,NX),TNH3C(NZ,NY,NX),TCSN0(NZ,NY,NX),PPZ(NZ,NY,NX) 
     1,PPX(NZ,NY,NX),WTSTG(NZ,NY,NX),WTSTGN(NZ,NY,NX) 
     2,WTSTGP(NZ,NY,NX),ZC(NZ,NY,NX),ZG(NZ,NY,NX),VOLWC(NZ,NY,NX) 
     3,VOLWQ(NZ,NY,NX),HCBFCZ(NZ,NY,NX),HCBFDZ(NZ,NY,NX),VCOXF(NZ,NY,NX)
     4,VNOXF(NZ,NY,NX),VPOXF(NZ,NY,NX),TKQC(NZ,NY,NX),VPQC(NZ,NY,NX)
     5,CF(NZ,NY,NX),ARSTG(NZ,NY,NX)
      WRITE(26,92)I,IDATA(3),NZ,(GROUP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(PSTG(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(PSTGI(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(PSTGF(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(VSTG(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(VSTGX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(GSTGI(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(GSTGF(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(TGSTGI(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(TGSTGF(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(VRNS(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(VRNF(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(VRNY(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(VRNZ(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(ATRP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(FLG4(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,92)I,IDATA(3),NZ,(FLGZ(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(IFLGA(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(IFLGE(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(IFLGF(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(IFLGR(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(IFLGQ(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(IDTHB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(NBTB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(KLEAF(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(KVSTG(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(26,95)I,IDATA(3),NZ,(KVSTGN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      DO 9955 N=1,10
9955  WRITE(26,95)I,IDATA(3),NZ,(IDAY(N,NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,96)I,IDATA(3),NZ
     2,CPOOLP(NZ,NY,NX),CPOLNP(NZ,NY,NX),WTSHT(NZ,NY,NX)
     3,WTLS(NZ,NY,NX),WTRT(NZ,NY,NX),WTSHN(NZ,NY,NX),WTSHP(NZ,NY,NX)
     4,WTLF(NZ,NY,NX),WTSHE(NZ,NY,NX),WTSTK(NZ,NY,NX),WTRSV(NZ,NY,NX)
     5,WTHSK(NZ,NY,NX),WTEAR(NZ,NY,NX),WTGR(NZ,NY,NX),WTND(NZ,NY,NX)
     6,WTRVC(NZ,NY,NX),WTRVN(NZ,NY,NX),WTRVP(NZ,NY,NX),HTCTL(NZ,NY,NX)
     7,SDPTH(NZ,NY,NX),WSTR(NZ,NY,NX),CHILL(NZ,NY,NX),WVPLT(NZ,NY,NX)
     8,HEAT(NZ,NY,NX),WTRTS(NZ,NY,NX),FRADP(NZ,NY,NX) 
      WRITE(27,92)I,IDATA(3),NZ,(CPOOL(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(ZPOOL(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(PPOOL(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(CPOLNB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(ZPOLNB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(PPOLNB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSHTB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTLFB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTNDB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSHEB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSTKB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WVSTKB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTRSVB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTHSKB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTEARB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTGRB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTLSB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSHTN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTLFBN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTNDBN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSHBN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSTBN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTRSBN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTHSBN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTEABN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTGRBN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSHTP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTLFBP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTNDBP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSHBP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSTBP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTRSBP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTHSBP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTEABP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTGRBP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(GRNXB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(GRNOB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(GRWTB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(ARLFB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WGLFX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WGLFNX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WGLFPX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(ARLFZ(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(RCZLX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(RCPLX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(RCCLX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WGSHEX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WGSHNX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WGSHPX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(HTSHEX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(RCZSX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(RCPSX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(RCCSX(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSTXB(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSTXN(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,92)I,IDATA(3),NZ,(WTSTXP(NB,NZ,NY,NX),NB=1,NBR(NZ,NY,NX))
      WRITE(27,94)I,IDATA(3),NZ,(ARLFV(L,NZ,NY,NX),L=1,JC)
      WRITE(27,94)I,IDATA(3),NZ,(ARSTV(L,NZ,NY,NX),L=1,JC)
      WRITE(27,94)I,IDATA(3),NZ,(ARSTD(L,NZ,NY,NX),L=1,JC)
      DO 9945 NB=1,NBR(NZ,NY,NX)
      WRITE(28,93)I,IDATA(3),NZ,(CPOOL4(K,NB,NZ,NY,NX),K=1,25)
      WRITE(28,93)I,IDATA(3),NZ,(CPOOL3(K,NB,NZ,NY,NX),K=1,25)
      WRITE(28,93)I,IDATA(3),NZ,(CO2B(K,NB,NZ,NY,NX),K=1,25)
      WRITE(28,93)I,IDATA(3),NZ,(HCOB(K,NB,NZ,NY,NX),K=1,25)
      WRITE(28,93)I,IDATA(3),NZ,(ARLF(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGLF(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WSLF(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(HTSHE(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGSHE(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WSSHE(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(HTNODE(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(HTNODX(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGNODE(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGLFN(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGSHN(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGNODN(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGLFP(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGSHP(K,NB,NZ,NY,NX),K=0,25)
      WRITE(28,93)I,IDATA(3),NZ,(WGNODP(K,NB,NZ,NY,NX),K=0,25)
      DO 9950 K=0,25
      WRITE(28,94)I,IDATA(3),NZ,(ARLFL(L,K,NB,NZ,NY,NX),L=1,JC)
      WRITE(28,94)I,IDATA(3),NZ,(WGLFL(L,K,NB,NZ,NY,NX),L=1,JC)
      WRITE(28,94)I,IDATA(3),NZ,(WGLFLN(L,K,NB,NZ,NY,NX),L=1,JC)
      WRITE(28,94)I,IDATA(3),NZ,(WGLFLP(L,K,NB,NZ,NY,NX),L=1,JC)
      IF(K.NE.0)THEN
      DO 9940 N=1,4
      WRITE(28,94)I,IDATA(3),NZ,(SURF(N,L,K,NB,NZ,NY,NX),L=1,JC)
9940  CONTINUE
      ENDIF
9950  CONTINUE
      WRITE(28,94)I,IDATA(3),NZ,(ARSTK(L,NB,NZ,NY,NX),L=1,JC)
      DO 9945 L=1,JC
      WRITE(28,92)I,IDATA(3),NZ,(SURFB(N,L,NB,NZ,NY,NX),N=1,4)
9945  CONTINUE
      DO 9970 N=1,MY(NZ,NY,NX)
      WRITE(29,92)I,IDATA(3),NZ,PORT(N,NZ,NY,NX)
      WRITE(29,94)I,IDATA(3),NZ,(PSIRT(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(PSIRO(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(PSIRG(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTN1(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTNL(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTLGP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTDNP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTVLP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTVLW(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RRAD1(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RRAD2(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTARP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTLGA(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RCO2M(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RCO2A(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RCO2N(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(CO2A(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(OXYA(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(CH4A(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(Z2OA(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(ZH3A(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(CO2P(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(OXYP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(CH4P(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(Z2OP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(ZH3P(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRTL(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRTD(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WSRTL(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(ROXYP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUNNHP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUNNOP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUPP2P(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUPP1P(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUNNBP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUNNXP(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUPP2B(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RUPP1B(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WFR(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(CPOOLR(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(ZPOOLR(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(PPOOLR(N,L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTDP1(N,NR,NZ,NY,NX)
     2,NR=1,NRT(NZ,NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTWT1(N,NR,NZ,NY,NX)
     2,NR=1,NRT(NZ,NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTWT1N(N,NR,NZ,NY,NX)
     2,NR=1,NRT(NZ,NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTWT1P(N,NR,NZ,NY,NX)
     2,NR=1,NRT(NZ,NY,NX))
      DO 9965 NR=1,NRT(NZ,NY,NX)
      WRITE(29,94)I,IDATA(3),NZ,(RTN2(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTLG1(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRT1(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRT1N(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRT1P(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRT2(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRT2N(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTRT2P(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(RTLG2(N,L,NR,NZ,NY,NX),L=1,NJ(NY,NX))
9965  CONTINUE
9970  CONTINUE
      WRITE(29,94)I,IDATA(3),NZ,(CPOOLN(L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(ZPOOLN(L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(PPOOLN(L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTNDL(L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTNDLN(L,NZ,NY,NX),L=1,NJ(NY,NX))
      WRITE(29,94)I,IDATA(3),NZ,(WTNDLP(L,NZ,NY,NX),L=1,NJ(NY,NX))
      ENDIF
9980  CONTINUE
      ENDIF
9985  CONTINUE
9990  CONTINUE
90    FORMAT(30I4)
91    FORMAT(3I4,4I8,30I4)
92    FORMAT(3I4,10E17.8E3)
93    FORMAT(3I4,15E17.8E3,/,15E17.8E3,/,15E17.8E3,/,15E17.8E3)
94    FORMAT(3I4,21E17.8E3)
95    FORMAT(3I4,10I6)
96    FORMAT(3I4,15E17.8E3,/,15E17.8E3)
97    FORMAT(2I4,15E17.8E3,/,15E17.8E3,/,15E17.8E3,/,15E17.8E3)
      RETURN
      END
