/* 1번 */
data survey123;
	infile '/home/u61036181/통계자료분석실습/survey123.csv' dlm = ',' firstobs = 2;
	input id gender residence age q11-q14 q21-q24 q31-q34;
run;

proc print data = survey123;
run;

proc format;
value f_a 1 = '20대' 2 = '30대' 3 = '40대';
value f_g 1 = '남' 2 = '여';
value f_rsd 1 = 'A지역' 2 = 'B지역' 3 = 'C지역' 4 = 'D지역';
run;

libname stat '/home/u61036181/통계자료분석실습';

data stat.survey123;
	set survey123;
	q1m = mean(of q11-q14);
	q2m = mean(of q21-q24);
	q3m = mean(of q31-q34);
	label q1m = '학습지도';
	label q2m = '학급경영';
	label q3m = '업무수행';
	label residence = '거주지';
	format gender f_g. residence f_rsd. age f_a.;
run;

proc print data = stat.survey123;
run;

proc gchart data = stat.survey123;
	hbar residence / discrete group = age;
run;

/* 3번 */
proc gplot data = stat.survey123;
	plot q2m*q1m = residence;
run;