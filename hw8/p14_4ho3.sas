DM 'LOG; CLEAR; OUT; CLEAR;';
OPTIONS CENTER NONUMBER NODATE;
ODS PDF FILE='hw8prob1.pdf';
ODS GRAPHICS ON / IMAGENAME='hw8p1' RESET=INDEX;

********************************************************;
*** PROBLEM 14-4, MONTGOMERY but with five operators ***;
*** This will assign unique operator numbers 1 to 30 ***;
*** to the Operators: 1-5 for Job 1, 6-10 for job 2, ***;
*** 11-15 for Job 3, and so on.                      ***;
********************************************************;

DATA in;
  RETAIN operator 0;
  DO job=1 TO 6;
    DO oper = 1 TO 5;
      operator=operator+1;
      DO rep=1 TO 2;
        INPUT time @@;
        OUTPUT;
      END;
    END;
  END;
DATALINES;
158.3 159.4  159.2 159.6  158.9 157.8  160.0 159.0  159.8 160.7
154.6 154.9  157.7 156.8  154.8 156.3  155.8 156.9  158.4 157.4
162.5 162.6  161.0 158.9  160.5 159.5  160.5 161.4  161.7 159.5
160.0 158.7  157.5 158.9  161.1 158.5  159.6 158.7  158.2 159.6
156.3 158.1  158.3 156.9  157.7 156.9  156.8 156.0  158.9 157.5
163.7 161.0  162.3 160.3  162.6 161.8  162.9 162.1  162.9 160.9
;

PROC GLM DATA=in PLOTS(UNPACK)=ALL;
  CLASS job operator;
  MODEL time = job operator(job) / SS3;
  RANDOM job operator(job) / TEST;
  MEANS operator(job);
TITLE 'Problem 14.4 ANOVA';

RUN;

PROC VARCOMP DATA=in METHOD=REML;
  CLASS job operator;
  MODEL time = job operator(job);
TITLE 'Problem 14.4 Variance Components Estimtes';

RUN;

ODS GRAPHICS OFF;
ODS PDF CLOSE;
QUIT;
