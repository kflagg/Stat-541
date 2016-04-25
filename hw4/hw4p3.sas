options center nodate nonumber linesize=75 formdlim='*';
ods listing file='hw4p3.lis';

DATA in;
input nmole mean std;
datalines;
  0  3296   90
  1  2574  153
 10  1466  207
100   692  332
;

DATA yset;
  SET in;
  logstd = LOG(std);
  logmean = LOG(mean);

PROC GLM DATA=yset;
  ODS GRAPHICS / IMAGENAME='empirical' RESET=INDEX;
  MODEL logstd = logmean / SS3 solution;
TITLE 'ANOVA TO FIND EMPIRICAL SELECTION OF ALPHA';

run;quit;
