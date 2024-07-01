data Example9_1;
	infile '회귀분석실습/Example9.1.csv' dlm = ',' firstobs = 2;
	input y x;
	x2 = x * x;
run;

proc reg data = Example9_1;
	model y = x;
run;

proc reg data = Example9_1;
	model y = x x2;
	test x2 = 0;
run;


data Example9_2;
	infile '회귀분석실습/Example9.2.csv' dlm = ',' firstobs = 2;
	input x1 x2 y;
	x1sq = x1 * x1;
	x2sq = x2 * x2;
	x1x2 = x1 * x2;
run;

proc reg data = Example9_2;
	model y = x1 x2 x1sq x2sq x1x2;
run;

proc reg data = Example9_2;
	model y = x1 x2 x1sq x2sq;
run;

proc reg data = example9_2;
	model y = x1 x2 x1sq;
run;

ods graphics on;
proc rsreg data = Example9_2 plots = surface(3d);
	model y = x1 x2;
run;
