options center nodate nonumber ls=75 formdlim='';

data prob6;
  input pct meanstrength @@;
datalines;
15 9.8  20 15.4  25 17.6  30 21.6 35 10.8
;

proc glmpower data=prob6;
  class pct;
  model meanstrength = pct;
  contrast 'Linear   ' pct -2 -1  0  1  2;
  contrast 'Quadratic' pct  2 -1 -2 -1  2;
  power
    stddev = 2.84
    alpha = 0.05
    ntotal = .
    power = 0.90;
title1 'Problem 5:';
title2 'Sample Sizes Needed to Linear and Quadratic';
title3 'Trends in Tensile Strength with Power 0.90';
run;
