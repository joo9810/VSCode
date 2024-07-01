data Example11_1;
	infile '/home/u47469880/회귀분석실습/Example11.1.csv' dlm = ',' firstobs = 2;
	input y x1 x2 x3 x4;
run;

proc reg data = Example11_1;
	model y = x1 x2 x3 x4 /	selection = rsquare adjrsq cp sse mse;
run;


proc reg data = Example11_1;
	model y = x1 x2 x3 x4 /	selection = forward slentry = 0.05;
run;

proc reg data = Example11_1;
	model y = x1 x2 x3 x4 /	selection = backward slstay = 0.05;
run;


proc reg data = Example11_1;
	model y = x1 x2 x3 x4 /	selection = stepwise slentry = 0.05 slstay = 0.05;
run;
