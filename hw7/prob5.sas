dm 'log; clear; out; clear;';
options center nonumber nodate;
ods trace on;

ods pdf file='hw7prob5.pdf';

data prob5;
  do A = 1 to 3;
    do B = 1 to 3;
      do C = 1 to 5;
        do D = 1 to 5;
          do rep = 1 to 4;
            mu = A + B + C + D;
            y = mu + rannor(68632);
            output;
          end;
        end;
      end;
    end;
  end;

proc glm data=prob5;
  class A B C D;
  model y = A|B|C|D / SS3;
  random C D A*C A*D B*C B*D C*D A*B*C A*B*D A*C*D B*C*D A*B*C*D / test;
title 'Expected Mean Squares for Problem 5a';
run;

proc glm data=prob5;
  class A B C D;
  model y = A|B|C|D @3 / SS3;
  random C D A*C A*D B*C B*D C*D A*B*C A*B*D A*C*D B*C*D / test;
title 'Expected Mean Squares for Problem 5d';
run;

proc glm data=prob5;
  class A B C D;
  model y = A|B|C|D @2 / SS3;
  random C D A*C A*D B*C B*D C*D / test;
title 'Expected Mean Squares for Problem 5e';
run;

ods pdf close;

quit;
