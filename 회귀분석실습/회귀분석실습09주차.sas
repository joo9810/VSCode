data Exercise7_5;
	infile '회귀분석실습/Exercise7.5.csv' dlm = ',' firstobs = 2;
	input y x1 x2;
run;

proc reg data = Exercise7_5;
	model y = x1 x2;
run;

