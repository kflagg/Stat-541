options center nodate nonumber linesize=80 formdlim='*';
ods listing file='hw1.lis';

data catalysts;
  input catalyst concentration @@;
datalines;
1 58.2 1 57.2 1 58.4 1 55.8 1 54.9
2 56.3 2 54.5 2 57.0 2 55.3
3 50.1 3 54.2 3 55.4
4 52.9 4 49.9 4 50.0 4 51.7
;

proc glm data = catalysts;
  class catalyst;
  model concentration = catalyst;

run;
quit;
