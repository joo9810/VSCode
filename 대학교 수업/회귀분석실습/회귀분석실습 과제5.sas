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

proc reg data = data;
	model y = x;
run;

proc reg data = data;
	model y = x/noint;
run;