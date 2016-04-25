options center nodate nonumber linesize=80 formdlim='*';
ods listing file='hw3p3.lis';

TITLE 'BATCH VARIABILITY PROBLEM';

DATA in;
  DO batch = 1 TO 6;
    DO rep = 1 TO 6;
      INPUT calcium @@; OUTPUT;
    END;
  END;
DATALINES;
0.51 0.55 0.62 0.42 0.49 0.57  0.60 0.47 0.42 0.52 0.55 0.48
0.51 0.64 0.45 0.54 0.49 0.58  0.32 0.40 0.37 0.46 0.42 0.38
0.29 0.46 0.37 0.32 0.40 0.36  0.30 0.41 0.36 0.45 0.39 0.37
;

PROC GLM DATA=in;
  CLASS batch;
  MODEL calcium = batch / SS3;
  RANDOM batch / TEST;

PROC VARCOMP DATA=in METHOD=REML;
  CLASS batch;
  MODEL calcium = batch / FIXED=0;

RUN;
QUIT;
