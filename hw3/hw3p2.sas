options center nodate nonumber linesize=80 formdlim='*';
ods listing file='hw3p2.lis';

TITLE 'PORTLAND CEMENT PROBLEM';

DATA in;
  DO technique = 1 TO 4;
    DO rep = 1 TO 4;
      INPUT strength @@;
      OUTPUT;
    END;
  END;
DATALINES;
3129 3000 2865 2890  3200 3300 2975 3150
2800 2900 2985 3050  2600 2700 2600 2765
;

PROC GLM DATA=in;
  CLASS technique;
  MODEL strength = technique / SS3;
  MEANS technique / LSD;

RUN;
QUIT;
