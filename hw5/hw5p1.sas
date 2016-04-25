options center nodate nonumber ls=75 ps=60 formdlim='';

data prob1;
  do level=1 to 5;
    input effect @@;
    output;
  end;
datalines;
10 0 0
;

ods listing file='hw5p1.lst';
proc glmpower data=prob1;
  class level;
  model effect = level;
  power
    stddev = 2 3
    alpha = 0.05
    ntotal = .
    power = 0.90;
title1 'Problem 1:';
title2 'Sample Sizes Needed to Detect Battery Life';
title3 'Difference of 10 with Power 0.90';
run;

ods listing file='hw5p2.lst';
proc glmpower data=prob1;
  class level;
  model effect = level;
  power
    stddev = 2 3
    alpha = 0.05
    ntotal = .
    power = 0.95;
title1 'Problem 2:';
title2 'Sample Sizes Needed to Detect Battery Life';
title3 'Difference of 10 with Power 0.95';
run;
