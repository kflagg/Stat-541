options center nodate nonumber ls=75 formdlim=' ';

******************************************;
*** A RANDOMIZED COMPLETE BLOCK DESIGN ***;
******************************************;

data in;
  input drug $ exprment cell_cnt @@;
datalines;
control 1 1147  _drug1 1 1169 _drug2 1 1009
control 2 1273  _drug1 2 1323 _drug2 2 1260
control 3 1216  _drug1 3 1276 _drug2 3 1143
control 4 1046  _drug1 4 1240 _drug2 4 1099
control 5 1138  _drug1 5 1432 _drug2 5 1355
control 6 1265  _drug1 6 1532 _drug2 6 1194
;

ods listing file='hw5p5c.lst';
ods graphics on / imagename='hw5p5c' reset=index;
proc glm data=in plots(unpack)=all;
  class drug exprment;
  model cell_cnt = exprment drug / ss3 solution;
title1 'Problem 5(c):';
title2 'RCBD ANOVA';
run;

ods listing file='hw5p5f.lst';
ods graphics on / imagename='hw5p5f' reset=index;
proc glm data=in;
  class drug;
  model cell_cnt = drug / ss3 solution;
title1 'Problem 5(f):';
title2 'ANOVA Ignoring Blocks';
run;
