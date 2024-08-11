/* 1번 */
libname exam '/home/u61036181/통계자료분석실습';

data exam.midterm;
	infile '/home/u61036181/통계자료분석실습/midterm_exam.csv' dlm = ',' firstobs = 2;
	input idno $ Q1-Q7;
run;

proc print data = exam.midterm;
run;

data exam.final;
	infile '/home/u61036181/통계자료분석실습/final_exam.csv' dlm = ',' firstobs = 2;
	input idno $ Q1-Q8;
run;

proc print data = exam.final;
run;

/* 2번 */
data exam.midterm;
	set exam.midterm;
	total = Q1+Q2+Q3+Q4+Q5+Q6+Q7;
run;

proc print data = exam.midterm;
run;

data exam.final;
	set exam.final;
	total = Q1+Q2+Q3+Q4+Q5+Q6+Q7+Q8;
run;

proc print data = exam.final;
run;

/* 3번 */
data exam.midterm;
	set exam.midterm;
	score = total*(100/70);
run;

proc print data = exam.midterm;
run;

data exam.final;
	set exam.final;
	score = total*(100/80);
run;

proc print data = exam.final;
run;

/* 4번 */
data exam.midterm;
	set exam.midterm;
	rename Q1 = Q1_midterm Q2 = Q2_midterm Q3 = Q3_midterm Q4 = Q4_midterm Q5 = Q5_midterm
	Q6 = Q6_midterm Q7 = Q7_midterm total = total_midterm score = score_midterm;
run;

proc print data = exam.midterm;
run;

data exam.final;
	set exam.final;
	rename Q1 = Q1_final Q2 = Q2_final Q3 = Q3_final Q4 = Q4_final Q5 = Q5_final
	Q6 = Q6_final Q7 = Q7_final Q8 = Q8_final total = total_final score = score_final;
run;

proc print data = exam.final;
run;

data exam.test;
	merge exam.midterm exam.final;
run;

proc print data = exam.test;
run;

/* 5번 */
data exam.test;
	set exam.test;
	finalScore = (score_midterm+score_final)/2;
run;

proc print data = exam.test;
run;

/* 6번 */
proc sort data = exam.test;
	by descending finalScore;
run;

proc print data = exam.test;
run;

/* 7번 */
proc export
	data = exam.test
	file = '/home/u61036181/통계자료분석실습/eval.csv'
	dbms = csv
	replace;
run;

