OPTIONS CENTER NODATE NONUMBER LINESIZE=75 FORMDLIM='*';
ODS LISTING FILE='hw4p1.lis';

DATA in;
INPUT pCig n @@;
DO i = 1 to n;
  INPUT countsec @@;
  sqrtcnt = sqrt(countsec);
  OUTPUT;
END;
DATALINES;
 0 10 .004 .007 .004 .009 .009 .006 .004 .006 .002 .005
 5  5 .030 .025 .037 .039 .033
10  5 .069 .068 .048 .059 .051 
15  5 .082 .107 .062 .073 .091
20  5 .135 .104 .088 .127 .116
;


/********************************************
 *** ANOVA on the untransformed responses ***
 ********************************************/

PROC GLM DATA=in PLOTS(UNPACK)=ALL;
  ODS GRAPHICS / IMAGENAME='orig' RESET=INDEX;
  CLASS pCig;
  MODEL countsec = pCig / SS3;
  MEANS pCig / HOVTEST=LEVENE(TYPE=ABS);
  ESTIMATE 'Linear   ' pCig -2 -1  0  1  2;
  ESTIMATE 'Quadratic' pCig  2 -1 -2 -1  2;
  ESTIMATE 'Cubic    ' pCig -1  2  0 -2  1;
  ESTIMATE 'Quartic  ' pCig  1 -4  6 -4  1;
TITLE 'ANOVA RESULTS: No Transformation';


/************************************************
 *** Use a default square root transformation ***
 ************************************************/

PROC GLM DATA=in PLOTS(UNPACK)=ALL;
  ODS GRAPHICS / IMAGENAME='sqrt' RESET=INDEX;
  CLASS pCig;
  MODEL sqrtcnt = pCig / SS3;
  MEANS pCig / HOVTEST=LEVENE(TYPE=ABS);
  ESTIMATE 'Linear   ' pCig -2 -1  0  1  2;
  ESTIMATE 'Quadratic' pCig  2 -1 -2 -1  2;
  ESTIMATE 'Cubic    ' pCig -1  2  0 -2  1;
  ESTIMATE 'Quartic  ' pCig  1 -4  6 -4  1;
TITLE 'ANOVA RESULTS: Square Root Transformation';


/********************************************************
 *** Find the transformation using the Box-Cox method ***
 ********************************************************/

PROC TRANSREG DATA=in;
  ODS GRAPHICS / IMAGENAME='boxcox' RESET=INDEX;
  MODEL BOXCOX(countsec / LAMBDA=-1.5 to 1.5 by .01) = CLASS(pCig);
TITLE 'Find the Box-Cox Transformation using PROC TRANSREG';

run;
quit;
