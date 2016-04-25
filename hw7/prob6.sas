dm 'log; clear; out; clear;';
options center nonumber nodate;
ods trace on;

ods pdf file='hw7prob6.pdf';

data prob6;
  do tau = 1 to 2;
    do beta = 1 to 3;
      do gamma = 1 to 5;
        mu = tau + beta + gamma;
        y = mu + rannor(7635);
        output;
      end;
    end;
  end;

proc glm data=prob6;
  class tau beta gamma;
  model y = tau beta gamma tau*gamma beta*gamma / SS3;
  random tau beta gamma tau*gamma beta*gamma / test;
title 'Expected Mean Squares for Problem 6';
run;

ods pdf close;

quit;
