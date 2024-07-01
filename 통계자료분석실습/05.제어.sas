/* 조건문 */

data a2;
input sex $ weight time;
cards;
F 56.1 165
F 45.6 156
M 76.2 176
M 64.6 187
F 48.2 162
;
run;

/* 단순조건문 : set문으로 불러진 자료에서 조건을 만족하는 자료행을 추출한다. */
data a3;
set a2;
if sex = 'F';

proc print data = a3;
run;

/* if-then 구문 
: 조건을 충족하면 then 다음을 명령문을 실행한다.*/
data a3;
set a2;
if sex = 'M' then delete; *해당 자료행 제거;

proc print data = a3;
run;

/* if-else 구문 : if 조건문을 충족하면 then 다음의 명령을,
그렇지 않으면 else if 조건을 확인하여 충족되면 따라오는 then 다음의 명령을 실행 
... 계속해서 조건이 충족되지 않으면 최종적인 else의 명령문을 실행 */
data a3;
set a2;
if weight < 50 then group = 1;
else                group = 2;

proc print data = a3;
run;

data a3;
set a2;
if      weight < 50 then group = 1;
else if weight < 70 then group = 2;
else                     group = 3;

proc print data = a3;
run;

* do 구문;

/* 단순 do문
if-then 구문에 따른 여러 명령문을 실행해야 할 경우

기본문법
do;
	[명령문];
	...
	[명령문];
end;
*/
data do1;
input id gender q1-q4;
if gender = 1 then
do;
	q1o = q1 + q3;
	q2e = q2 + q4;
end;
cards;
1 2 3 2 1 4
2 1 2 1 2 2
3 2 2 2 1 2
4 1 2 3 1 1
;

proc print data = do1;
run;

/* 반복 do 문: 지정된 변수가 지정된 범위에서 움직이는 동안 
do 구문에 묶인 명령들을 반복해서 실행 

기본문법

do [변수] = [변수값 범위];
	[명령문];
	...
	[명령문];
end;
*/

data do2;
do x = 1,3,4,5,8,9;
	x2 = x*x;
	output; * 변수 x와 x2의 현재값을 자료 do2에 저장;
end; 

proc print data = do2;
run;
/* output 명령을 지우고 실행해 보시오. */

data do3;
do x = 1 to 9; * = 1,2,3,4,5,6,7,8,9;
	x2 = x*x;
	output;
end; 

proc print data = do3;
run;

data do4;
do x = 1 to 15 by 3; *= 1,4,7,10,13;
	x3 = x**3;
	output;
end;

proc print data = do4;
run;

*중첩 do문;
data do5;
do x = 3,6,9;
	do y = 2 to 6 by 2;
		xy = x*y;
		output;
	end;
end;

proc print data = do5;
run;

/* 
do while 구문 : 조건을 충족하는 동안 계속 반복 
do until 구문 : 조건을 충족할 때까지 계속 반복 

기본문법
do while( [조건] );
	[명령문];
	...
	[명령문];
end;

do until( [조건] );
	[명령문];
	...
	[명령문];
end;

주의: 무한루프를 조심
*/
data do7;
x = 1;
do while ( x <= 10 );
	x2 = x*x;
	output;
	x = x+2;
end;

proc print data = do7;
run;

data do8;
x = 1;
do until ( x > 10 );
	x2 = x*x;
	output;
	x = x+2;
end;

proc print data = do8;
run;


/* 배열 array : 변수만 바뀌는 동일한 패턴의 명령문을 실행시킬 때 유용 */
data do1;
input id gender q1-q4;
if gender = 1 then
do;
	q1o = q1+q3;
	q2e = q2+q4;
end;
cards;
1 2 3 2 1 4
2 1 2 1 2 2
3 2 2 2 1 2
4 1 2 3 1 1
;

proc print data = do1;
run;

/* 배열지정: 변수1, 변수2, ... , 변수n 을 배열로 지정하는 법

array [배열이름]( n ) 변수1 ... 변수n;

n 대신에 * 쓰면 뒤에 따르는 변수의 수에 따라 배열길이가 정해짐.
*/
data array1;
set do1;
array a(2) q1 q3;
array b(2) q2 q4;
array c(*) c1 c2;
total = 0;
do i = 1 to 2;
	c(i) = 0;
	if a(i) = b(i) then c(i) = 1;
	total = total + c(i);
end;
/*
i = 1일 때, a(i) -> q1, b(i) -> q2, c(i) -> c1
i = 2일 때, a(i) -> q3, b(i) -> q4, c(i) -> c2
*/


/* data array1에서 배열을 쓰지 않고 프로그래밍하는 경우 */
data array2;
set do1;
total = 0;
* part 1-----------------;
c1 = 0;
if q1 = q2 then c1 = 1;
total = total + c1;
* part 2-----------------;
c2 = 0;
if q3 = q4 then c2 = 1;
total = total + c2;

/* part 1과 part 2가 변수만 바뀌고 패턴이 동일 */

proc print data = array1;
run;

proc print data = array2;
run;


