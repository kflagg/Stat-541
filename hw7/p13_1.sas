dm 'log; clear; out; clear;';
options center nonumber nodate;
ods trace on;

ods pdf file='hw7prob1a.pdf';
ods graphics on / imagename='hw7p1a' reset=index;

data prob1;
  do part = 1 to 10;
    do operator = 1 to 2;
      do rep = 1 to 3;
        input response @@;
        output;
      end;
    end;
  end;
datalines;
50 49 50  50 48 51
52 52 51  51 51 51
53 50 50  54 52 51
49 51 50  48 50 51
48 49 48  48 49 48
52 50 50  52 50 50
51 51 51  51 50 50
52 50 49  53 48 50
50 51 50  51 48 49
47 46 49  46 47 48
;

proc glm data=prob1 plots(unpack)=all;
  class operator part;
  model response = operator|part / SS3;
  random operator|part / test;
title 'Problem 13.1 Random Effects ANOVA';
ods pdf select RandomModelANOVA;

run;
ods graphics off;
ods pdf close;

ods pdf file='hw7prob1b.pdf';

proc varcomp data=prob1 method=REML;
  class operator part;
  model response = operator|part;
title 'Problem 13.1 Random Effect Variance Components';
ods select Estimates;

run;
ods pdf close;

ods pdf file='hw7prob3.pdf';

proc glm data=prob1 plots=none;
  class operator part;
  model response = operator|part / SS3;
  random part operator*part / test;
title 'Problem 13.1 Expected Mean Squares Assuming Operator is a Fixed Effect';
ods pdf select ExpectedMeanSquares;

run;
ods pdf close;

quit;
