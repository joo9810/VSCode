data Example7_1;
	infile '회귀분석실습/Example7.1.csv' dlm = ',' firstobs = 2;
	input x1 x2 y;
run;

proc reg data = Example7_1;
	model y = x1 x2 / clb;
run;


data newData;
	input x1 x2 y;
cards;
90 32  .
;
run;

data Example7_1;
	set Example7_1 newData;
run;

proc reg data = Example7_1;
	model y = x1 x2 /P CLM CLI;
run;


proc reg data = Example7_1;
	model y = x1 x2;
	test x1 = x2;
run;


data Example8_6;
	infile '회귀분석실습/Example8.6.csv' dlm = ',' firstobs = 2;
	input y x1 x2 x3;
run;

proc reg data = Example8_6;
	model y = x1 x2 x3;
	test x2 = x3 = 0;
	test x2 = x3;
run;
