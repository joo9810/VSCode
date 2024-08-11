* 적합결여검정;
data Example5_2;
	infile '회귀분석실습/Example5.2.csv' dlm = ',' firstobs = 2;
	input duration wage;
run;

proc reg data = Example5_2;
	model wage = duration / lackfit;
run;


* 변수변환;
data Exercise3_8;
	infile '회귀분석실습/Exercise3.8.csv' dlm = ',' firstobs = 2;
	input x y;
	z = log(y);
run;

proc gplot data = Exercise3_8;
plot y*x;
run;

proc gplot data = Exercise3_8;
plot z*x;
run;

proc reg data = Exercise3_8;
model y = x;
model z = x;
run;


* 절편항이 없는 회귀모형;
data Exercise6_2;
	infile '회귀분석실습/Exercise6.2.csv' dlm = ',' firstobs = 2;
	input x y;
run;

proc reg data = Exercise6_2;
	model y = x;
run;

proc reg data = Exercise6_2;
	model y = x/noint;
run;
