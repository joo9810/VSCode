data data_set1;
	input x y;
	x2 = x * x;
	x3 = x * x * x;
	cards;
25 10.1
6 2.9
8 3.0
5 1.8
1 0.1
24 9.4
17 6.9
1 0.3
13 5.1
14 6.0
;
run;

proc reg data = data_set1;
	model y = x;
run;

proc reg data = data_set1;
	model y = x x2;
	test x2 = 0;
run;

proc reg data = data_set1;
	model y = x x2 x3;
	test x3 = 0;
run;

data data_set2;
	input y x1 x2;
	z1 = x1 * x1;
	z2 = x2 * x2;
	x12 = x1 * x2;
	cards;
6.92 31 22
2.98 30 21
7.08 31.5 21.5
2.62 31 21.5
2.98 30 21.5
2.6 31.5 20.5
2.42 31.5 20.5
16.5 30.5 24.5
17.32 30.5 24
16.21 31.5 24
;
run;

proc reg data = data_set2;
	model y = x1 x2 z1 z2 x12;
run;

proc reg data = data_set2;
	model y = x1 x2 z1 z2 x12;
	test x12 = 0;
run;

proc reg data = data_set2;
	model y = x1 x2 z1 x12;
run;

proc reg data = data_set2;
	model y = x1 x2 z1;
run;

proc reg data = data_set2;
	model y = x1 x2 z1/noint;
run;

