data df;
	input x1 x2 x3 y;
	cards;
10 8 5.5 79
8 6 2.5 200
12 9 8.0 163
7 16 3.0 200
12 17 2.9 178
8 15 3.0 146
12 8 8.0 31
5 10 9.0 292
8 4 4.0 160
5 16 6.5 339
11 7 5.5 160
12 12 5.0 86
6 6 6.0 237
10 4 5.0 107
10 4 3.5 155
;
run;

proc reg data = df;
	model y = x1 x2 x3 / selection = adjrsq cp mse;
run;

proc reg data = df;
	model y = x1 x2;
run;


proc reg data = df;
	model y = x1 x2 x3 / selection = forward;
run;

proc reg data = df;
	model y = x1 x2 x3 / selection = backward;
run;


proc reg data = df;
	model y = x1 x2 x3 / selection = stepwise;
run;

