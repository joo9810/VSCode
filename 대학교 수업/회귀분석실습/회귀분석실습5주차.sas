data Exercise3_1;
	infile '회귀분석실습/Exercise3.1.csv' dlm = ',' firstobs = 2;
	input x y;
run;


proc reg data = Exercise3_1;
	model y = x;
run;


data newData;
	input x y;
cards;
50 .
;
run;

data new_Exercise3_1;
	set Exercise3_1 newData;
run;

proc reg data = new_Exercise3_1;
	model y = x/P CLM CLI;
	ID x;
run;
