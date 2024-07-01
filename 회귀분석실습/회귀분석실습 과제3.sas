data data;
	input x y;
	cards;
5 78
2 31
4 62
7 110
1 15
8 125
2 25
5 66
7 98
1 12
;
run;

proc plot data = data;
	plot y*x;
run;

proc reg data = data;
	model y = x;
run;

proc reg data = data;
	model y = x/clb;
run;

data newdata;
	input x y;
	cards;
10 .
;
run;

data finaldata;
	set data newdata;
run;

proc reg data = finaldata;
	model y = x/P CLI;
	ID x;
run;

	


