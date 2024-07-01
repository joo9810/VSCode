/* 1번 */
data b1 b2 b3;
	set a1;
	
	if x = 1 then
		output b1;
	else if x = 2 then
		output b2;
	else
		output b3;
run;

/* 2번 */
data dt;
	input x y @@;
	cards;
1 3 5 7 4 6 8 10
;
run;

proc print data = dt;
run;

proc export
	data = dt
	outfile = '/home/u61036181/통계자료분석실습/test.csv'
	dbms = csv
	replace;
run;

/* 3-1번 */
data d1;
	input idno 1-4 name $ 6-12 team $ 13-18 start 20-23 end 24-26;
	cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 117
1078 Ashley red    127 118
;
run;

proc print data = d1;
run;

data d2;
	set d1;
	
	if team = 'red' then
		output d2;
run;

proc print data = d2;
run;

/* 3-2번 */
data d2;
	input team $ 13-18 @;
	if team = 'red';
	input idno 1-4 name $ 6-12 start 20-23 end 24-26;
	cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 117
1078 Ashley red    127 118 
;
run;

proc print data = d2;
run;

/* 4번 */
data e1;
input #2 team $ 1-6 #1 name $ 6-19 idno 1-4 / / strwght 1-3 endwght 5-7;
cards;
1023 David Shaw
red
189 165
1049 Amelia Serrano
yellow
145 124
;
run;

proc print data = e1;
run;