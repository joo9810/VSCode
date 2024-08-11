/* 1번 */
data do;
	input x y @@;
do;
	z = x*y;
	output;
end;
	cards;
1 1 1 2 1 3 1 4 1 5 2 2 2 3
2 4 2 5 3 3 3 4 3 5 4 4 4 5
;
run;

proc print data = do;
run;

/* 2번 */
data xdata;
	infile '/home/u61036181/통계자료분석실습/xdata.csv'
	dlm = ',' firstobs = 2;
	input x1-x100;
run;

proc print data = xdata;
run;

data xdata0;
set xdata;
array x(*) x1-x100;
do i = 1 to 100;
	if x(i) = -1 then x(i) = .;
end;
run;

proc print data = xdata0;
run;