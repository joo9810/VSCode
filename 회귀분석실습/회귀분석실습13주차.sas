data Example10_1;
	infile '/home/u47469880/회귀분석실습/Example10.1.csv' dlm = ',' firstobs = 2;
	input y x1 x2 $;
	if x2 = 'A' then z2 = 1;
	else             z2 = 0;
	x1z2 = x1 * z2;
run;

proc reg data = Example10_1;
	model y = x1 z2;
run;

proc reg data = Example10_1;
	model y = x1 z2 x1z2;
	test z2 = x1z2 = 0;
run;


data Example10_4;
	infile '/home/u47469880/회귀분석실습/Example10.4.csv' dlm = ',' firstobs = 2;
	input x y;
run;

proc logistic data = Example10_4;
      model y(event='1') = x / link = logit;
run;

data Example10_5;
	infile '/home/u47469880/회귀분석실습/Example10.5.csv' dlm = ',' firstobs = 2;
	input x n y;
run;

proc logistic data = Example10_5;
      model y/n = x / scale = none;
run;