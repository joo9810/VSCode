data Exercise8_10;
	infile '회귀분석실습/Exercise8.10.csv' dlm = ',' firstobs = 2;
	input y x1 x2;
run;

proc reg data = Exercise8_10;
	model y = x1 x2 / lackfit;
run;



data Example8_8;
	infile '회귀분석실습/Example8.8.csv' dlm = ',' firstobs = 2;
	input y x1 x2;
run;

proc reg data = Example8_8;
	model y = x1 x2 / vif;
run;


data Example8_9;
	infile '회귀분석실습/Example8.9.csv' dlm = ',' firstobs = 2;
	input x y;
run;

proc reg data = Example8_9;
	model y = x / R influence;
run;
