/* 1번 */
data dataset1;
	input y x1 x2 $;
	if x2 = '고졸' then z2 = 1;
	else z2 = 0;
	x1z2 = x1 * z2;
	cards;
40 2 고졸
50 2 고졸
62 2 고졸
68 4 고졸
86 4 대졸
102 2 고졸
116 6 대졸
124 5 고졸
;
run;

proc reg data = dataset1;
	model y = x1 z2 x1z2;
run;
/* 유의확률이 가장 큰 교호작용을 제거하기로 판단 */

proc reg data = dataset1;
	model y = x1 z2;
run;
/* 유의확률이 가장 큰 x2를 제거하기로 판단 */

proc reg data = dataset1;
	model y = x1;
run;
/* x1은 유의하지만 절편항이 유의하지 않아 절편항을 제거하기로 결정 */

proc reg data = dataset1;
	model y = x1/noint;
run;
/* 회귀계수가 유의수준 0.05 하에서 유의하며 최종모형으로 선택 */

/* 2번 */
data dataset2;
	input x y;
	if x = 40 then z1 = 1;
	else z1 = 0;
	x1 = x;
	if x1 = 60 then z2 = 1;
	else z2 = 0;
	cards;
20 86
20 80
20 77
40 78
40 84
40 75
60 33
60 38
60 43
;
run;

proc reg data = dataset2;
	model y = z1 z2;
run;

/* 3번 */
data dataset3;
	input x y;
	cards;
285 1
264 0
276 0
302 1
248 1
296 0
274 1
284 0
253 1
269 1
;
run;

data newdata;
	input x y;
	cards;
290 .
;
run;

data finaldata;
	set dataset3 newdata;
run;

proc logistic data = finaldata;
      model y(event='1') = x/ link = logit;
      output out = out p = prob;
run;

proc print data = out;
run;

/* 4번 */
data dataset4;
	input x n y;
	cards;
1 250 15
2 252 20
3 151 18
4 204 25
5 202 32
6 195 41
;
run;

proc logistic data = dataset4;
	model y/n = x / scale = none;
	
	output out = out p = prob; /* 예측확률 보는 것 */
run;

proc print data = out;
run;