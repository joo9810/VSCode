data data_set;
	input x1 x2 y;
	cards;
175 15 120.4
210 18 112.5
192 20 95.4
250 28 162.3
245 25 160.2
226 21 131.5
260 32 157.6
230 25 158.4
205 24 149.6
185 19 130.4
;
run;

proc reg data = data_set;
	model y = x1 x2;
	test x1 = x2 = 0;
run;

proc reg data = data_set;
	model y = x1 x2/clb;
run;
	
proc reg data = data_set;
	model y = x1 x2;
run;
	
data newdata;
	input x1 x2 y;
	cards;
200 20 .
;
run;

data finaldata;
	set data_set newdata;
run;

proc reg data = finaldata;
	model y = x1 x2/P CLM;
	ID x1 x2;
run;

proc reg data = data_set;
	model y = x1 x2;
	test x1 = x2;
run;

data newdata;
	input x1 x2 y;
	cards;
240 30 .
;
run;

data finaldata;
	set data_set newdata;
run;

proc reg data = finaldata;
	model y = x1 x2/P CLI;
	ID x1 x2;
run;