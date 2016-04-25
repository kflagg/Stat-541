dm 'log; clear; out; clear;';
options center nonumber nodate;
ods trace on;

ods pdf file='hw7prob4.pdf';

data prob4;
  do material = 1 to 3;
    do temperature = 15 to 125 by 55;
      input meanest @@;
      output;
    end;
  end;
datalines;
134.75  57.25  57.50
155.75 119.75  49.50
144.00 145.75  85.50
;

proc glmpower data=prob4;
  class material temperature;
  model meanest = material|temperature;
  power
    stddev =  25.9848
    alpha = 0.05
    ntotal = . 
    power = 0.90;
title 'Sample Size Determination for Example 5.1';
run;
ods pdf close;

quit;
