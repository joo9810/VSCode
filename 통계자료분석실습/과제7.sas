* 1번 ;
data a;
	input x @@;
	cards;
1.02 1.00 0.98 1.04 0.99 1.01 1.02 0.99
;
run;

proc print data = a;
run;

proc ttest data = a h0 = 1;
	var x;
run;


* 2번 ;
data b;
	input air @@;
	cards;
23 31 67 17 42 24 52 47 50 45 43 21 42 20
12 90 11 3 14 71 80 14 11 16 90 1 16 52
;
run;

data c;
	do group = 1, 2;
		do rep = 1 to 14;
			output;
		end;
	end;
drop rep;
run;

data d;
	merge b c;
run;

proc print data = d;
run;

proc ttest data = d;
	var air;
	class group;
run;

* 3번 ;
data e;
	input method1 method2 @@;
	cards;
3.8 3.9 3.4 3.9 3.2 4.3 4.0 3.7
3.8 4.5 4.1 4.9 2.9 4.3 5.0 5.1
;
run;
* 대응표본 t-검정은 group 변수를 만들지 않아도 됨 ;

proc print data = e;
run;

proc ttest data = e;
	paired method1*method2;
run;

* 4번 ;
LIBNAME stat '/home/u61036181/통계자료분석실습';

proc format;
value f_a   1 = '20대'  2 = '30대'  3 = '40대';
value f_g   1 = '남'    2 = '여';
value f_rsd 1 = 'A지역' 2 = 'B지역' 3 = 'C지역' 4 = 'D지역';

proc print data = stat.survey123 label;
run;

* 4-1번 ;
proc univariate data = stat.survey123;
	var q1m;
	output out = quantile_data1
	pctlpts = 33.33 66.66 /* 분위수 지정 */
	pctlpre = Q_; /* 접두사 지정 */
run;

proc print data = quantile_data1;
run;

data survey;
	set stat.survey123;
	if q1m <= 3.25 then q1m_f = '하';
	else if 3.25 < q1m <=3.75 then q1m_f = '중';
	else q1m_f = '상';
run;

proc print data = survey;
run;

proc freq data = survey;
	table gender*q1m_f / chisq;
run;


proc univariate data = stat.survey123;
	var q2m;
	output out = quantile_data2
	pctlpts = 33.33 66.66 /* 분위수 지정 */
	pctlpre = Q_; /* 접두사 지정 */
run;

proc print data = quantile_data2;
run;

data survey;
	set survey;
	if q2m <= 3 then q2m_f = '하';
	else if 3 < q2m <= 3.75 then q2m_f = '중';
	else q2m_f = '상';
run;

proc print data = survey;
run;

proc freq data = survey;
	table gender*q2m_f / chisq;
run;

* 4-2번 ;
proc freq data = survey;
	table age*q1m_f / chisq;
run;

proc freq data = survey;
	table age*q2m_f / chisq;
run;

