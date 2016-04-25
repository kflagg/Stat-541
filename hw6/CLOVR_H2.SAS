DM 'LOG; CLEAR; OUT; CLEAR;';
OPTIONS CENTER NONUMBER NODATE LS=75 PS=60 FORMDLIM='=';

ODS LISTING FILE='hw6p2glm.lst';
ODS GRAPHICS ON / IMAGENAME='clover' RESET=INDEX;

DATA in;
  DO nitrogen = 0 to 20 by 20;
    DO sulfur = 0 to 9 by 3;
      DO rep = 1 to 3;
        INPUT growth @@;
        OUTPUT;
      END;
    END;
  END;
DATALINES;
4.48  4.52  4.63
4.70  4.65  4.57
5.21  5.23  5.28
5.88  5.98  5.88
5.76  5.72  5.78
7.01  7.11  7.02
5.88  5.82  5.73
6.26  6.26  6.37
;

PROC GLM DATA=in PLOTS(UNPACK)=ALL;
  CLASS nitrogen sulfur;
  MODEL growth = nitrogen|sulfur / SS3;
  LSMEANS nitrogen|sulfur / ADJUST=BON;
  OUTPUT OUT=diag R=resid;
TITLE 'Factorial Design for Clover Growth';

RUN;
ODS LISTING CLOSE;
ODS LISTING FILE='hw6p2univ.lst';

PROC UNIVARIATE NORMAL DATA=diag;
  VAR resid;
ODS SELECT TestsForNormality;

RUN;
ODS GRAPHICS OFF;
ODS LISTING CLOSE;

QUIT;
