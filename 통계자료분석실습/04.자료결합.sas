/* set 문을 통한 자료합치기: 자료행을 추가 */
data a1;
input x y;
cards;
56 165
45 156
;

data a2;
input x y;
cards;
55 160
89 180
;

data a1a2;
set a1 a2;

proc print data = a1a2;
run;

/* 변수가 일치하지 않으면
일치하는 않은 변수는 해당 자료행에서 결측으로 처리된다. */
data a1;
input x y;
cards;
56 165
45 156
;

data a2;
input x y z;
cards;
55 160 22
89 180 17
;

data a1a2;
set a1 a2;

proc print data = a1a2;
run;

/* 정렬 proc sort

기본문법
proc sort data = [자료이름] out = [출력자료이름];
by [정렬기준변수];
run;

out 옵션이 생략되면 정렬결과가 data에 의해 지정된 자료에 덮어쓴다.
정렬은 오름차순으로, 내림차순으로 정렬하고 싶다면
by descending [정렬기준변수];
으로 한다.
*/
data a8;
input id x1 x2;
cards;
1 56 65
2 45 56
2 22 44
1 36 67
2 11 34
;

proc print data = a8;
run;

proc sort data = a8 out = a8_sorted;
by id;
run;

proc print data = a8_sorted;
run;

/* 정렬하면서 set문으로 자료 합치기 */
data a1;
input id x y;
cards;
1 56 65
3 45 56
;

proc sort data = a1;
by id;
run;

data a2;
input id x y z;
cards;
3 22 44 5
1 36 67 6
2 11 34 4
;

proc sort data = a2;
by id;
run;

/* 정렬된 자료의 단순결합: 결합된 된 자료에서는 정렬이 되어 있지 않음 */
data a1a2_0;
set a1 a2;
run;

/* by 문으로 정렬하면서 결합 

by문이 작동되기 위해서는 반드시 자료 a1 a2는 사전에 정렬이 되어 있어야 함!! */
data a1a2_1;
set a1 a2;
by id;
run;

proc print data = a1a2_0;
title 'a1a2_0';
run;

proc print data = a1a2_1;
title 'a1a2_1';
run;

/* keep, drop 문

set문으로 기존자료를 불러올 때, 유지할 변수 (keep)
제거할 변수(drop)을 지정! */

data a1;
input x1-x3;
cards;
12 34 26
22 24 37
16 23 55
;

data a2;
set a1;
keep x1 x3;
run;

data a3;
set a1;
drop x2;
run;

proc print data = a2;
run;

proc print data = a3;
run;

/* merge문으로 자료 합치기: 병합으로 인한 변수추가

기본문법
data [자료이름];
merge [기존자료1] [기존자료2];
(by [병합기준변수];)
run;

by문으로 병합기준변수를 제시, 생략가능.
병합기준변수의 값이 같으면 병합되었을 때 같은 자료행으로 처리.
병합기준변수는 병합하고자 하는 자료 모두에 있어야 함!
특히, by문이므로 자료는 모두 정렬이 되어 있어야 함!
*/
data a1; 
input x y;
cards;
1 56
3 45
;

data a2;
input z @@;
cards;
22 44 36
;

proc print data = a1;
proc print data = a2;
run;

data a1a2;
merge a1 a2;

proc print data = a1a2;
run;

* 동일이름의 변수(하지만 의미는 다른)가 있는 경우;
data a1; 
input x y;
cards;
1 56
3 45
;

data a2;
input y z @@;
cards;
11 5 22 6 33 9
;
	
data a1a2;
merge a1 a2;

proc print data = a1;
proc print data = a2;
proc print data = a1a2; *y 변수가 덮어쓰여짐;
run;

/* rename문으로 이름 바꾸기: merge로 인한 변수중복방지;

기본문법
rename [기존변수이름] = [변경될 변수이름];
*/
data a1; 
set a1;
rename y = y1;

data a2; 
set a2;
rename y = y2;

data a12;
merge a1 a2;

proc print data = a12;
run;

/* 병합기준변수가 있는 경우 

by문으로 변수제시. 단, 병합하고자 하는 자료는 모두 기준변수로 기준으로
정렬이 되어 있어야 한다!! */
data a1;
input sex $ x y @@;
cards;
f 1 21 f 3 34 m 5 42 m 4 37
f 4 56
;
run;

data a2;
input sex $ z;
cards;
f 11
m 22
;

*sex를 기준으로 a1과 a2를 병합하기 위해서 sex를 기준으로 정렬되어 있어야 함!;
proc sort data = a1;
by sex;

*a2는 이미 sex를 기준으로 정렬되어 있으므로 정렬을 생략;

data a1a2;
merge a1 a2;
by sex; *병합기준변수;

proc print data = a1;
proc print data = a2;
proc print data = a1a2; *일대다대응: 성별에 따라 동일한 z값이 부여; 
run;

* 불완전 일대일대응, 빠진 값은 결측처리;
data a1;
input code1 x y @@;
cards;
11 1 21 21 3 34
51 5 42 41 4 37
;

data a2;
input code1 code2 $;
cards;
11 a1
21 b1
31 c1
61 f1
;

proc sort data = a1;
by code1;

data a1a2;
merge a1 a2;
by code1;

proc print data = a1;
proc print data = a2;
proc print data = a1a2;
run;