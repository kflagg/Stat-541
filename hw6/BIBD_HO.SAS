DM 'LOG; CLEAR; OUT; CLEAR;';
OPTIONS CENTER NONUMBER NODATE LS=75 PS=60 FORMDLIM='=';

ODS LISTING FILE='hw6p1.lst';
ODS GRAPHICS ON / IMAGENAME='bibd' RESET=INDEX;

DATA bibd;
  INPUT batch process $ clean @@;
DATALINES;
 1 A 18.1   1 B 18.3   1 C 17.5
 2 A 19.5   2 B 17.8   2 D 17.2
 3 A 21.1   3 C 17.1   3 D 19.2
 4 B 25.2   4 C 22.5   4 D 20.5
 5 A 17.8   5 B 19.8   5 C 15.2
 6 A 20.8   6 B 18.7   6 D 17.8
 7 A 14.9   7 C 16.3   7 D 15.0
 8 B 23.3   8 C 22.2   8 D 21.8
 9 A 18.7   9 B 20.8   9 C 16.4
10 A 19.9  10 B 17.6  10 D 16.8
11 A 18.9  11 C 17.3  11 D 16.0
12 B 24.0  12 C 22.9  12 D 22.6
13 A 18.4  13 B 20.3  13 C 15.9
14 A 21.5  14 B 19.5  14 D 18.3
15 A 15.3  15 C 16.8  15 D 15.7
16 B 23.1  16 C 21.9  16 D 21.7
;

PROC GLM DATA=bibd PLOTS(UNPACK)=ALL;
  CLASS batch process;
  MODEL clean = batch process / SS3;
  MEANS process / BON;
  LSMEANS process / ADJUST=BON;
  ESTIMATE 'Agent A effect' process  3 -1 -1 -1 / DIVISOR=4;
  ESTIMATE 'Agent B effect' process -1  3 -1 -1 / DIVISOR=4;
  ESTIMATE 'Agent C effect' process -1 -1  3 -1 / DIVISOR=4;
  ESTIMATE 'Agent D effect' process -1 -1 -1  3 / DIVISOR=4;
TITLE 'Problem 1: BIBD for Wool Cleaning';

RUN;
ODS GRAPHICS OFF;
ODS LISTING CLOSE;

QUIT;
