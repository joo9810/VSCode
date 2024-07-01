/*
자료생성: DATA 단계의 가장 기초적인 기능

1.코드창에서 자료입력: 입력자료가 간단할 때 사용. CARDS문을 통해 자료를 입력받음.
2.파일로 자료입력
*/

/*
자료생성을 위한 DATA 단계의 기본구조
1. DATA 명령어로 시작해 만들 자료의 이름을 제시,
2. INPUT으로 시작해 입력받을 변수이름을 제시 (공백으로 구분!), 문자형변수인 경우 $를 붙임!
3. (선택사항) LABEL 명령으로 변수에 별칭을 줌,
4. CARDS문으로 INPUT명령에서 제시된 변수에 입력될 자료값을 제시

data [자료이름];
input [변수이름1] [변수이름2] ...;
label [변수이름1] = '별칭1' ...;
cards;
...
;

*/

/* 
자유형식 (free format)

가장 기본적인 자료입력방법
1. 공백으로 변수의 자료값을 구분
2. 개행(행바꾸기)으로 자료행구분!

단점: 공백으로 자료값을 구분하므로 자료값에 공백이 있을 수 없다.
*/

DATA a1;
INPUT SEX $ WEIGHT HEIGHT;
CARDS;
f 56.3 167
m 45.6 156
f 76.3 180
;

proc print;
run;

/* 
열위치지정방식

변수의 값이 나올 열의 위치를 지정하는 방식
*/
DATA a2;
INPUT SEX $ 1 WEIGHT 3-6 HEIGHT 8-10;
/*
----+----1----+----2----+----3----+ */
CARDS;
f 56.3 167
m 45.6 156
f 76.3 180
;

proc print;
run;

/*----------------------------------------------------------------------*/
* 열위치지정을 통한 입력의 활용;

* 결측으로 인한 에러발생;
data a3;
input idno name $ team $ strtwght endwght;
cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 177
1078 Ashley red    127 118
1221 Jim    yellow 220
;

proc print;
run;

/* 오류 수정1: . 으로 지정 */
data a3;
input idno name $ team $ strtwght endwght;
cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 177
1078 Ashley red    127 118
1221 Jim    yellow 220 .
;

proc print;
run;

/* 오류 수정2: 열위치지정 */

data a3;
input idno 1-4 name $ 6-11 team $ 13-18 strtwght 20-22 endwght 24-26;
/*
----+----1----+----2----+----3----+ */
cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 177
1078 Ashley red    127 118
1221 Jim    yellow 220
run;

proc print;
run;

/* 
공백을 포함한 문자열 입력
이름이나 주소는 통상적으로 공백을 포함하는 문자열
*/
DATA a4;
INPUT ID $ 1-5 NAME $ 7-15 ADD $ 20-40;
/*
----+----1----+----2----+----3----+ */
CARDS;
A1001 BOJUNG        SEOUL
A2001 JUHEE         BUSAN
A1351 FARR,SUE      1623 N. AVON P1.
A161  COX,KEY B     15 GREEENWOOD ST.
212   MOORE,RON     442 GLENWOOD AVE.
2521  RUTH,G H      2491 BRADY STREET
;

proc print;
run;

* 일부만 입력, 순서변경;
data a5;
input team $ 13 name $ 6-11 strtwght 20-22 endwght 24-26;
/*
----+----1----+----2----+----3----+ */
cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 177
1078 Ashley red    127 118
1221 Jim    yellow 220
;

proc print;
run;

/*--------------------------------------------------------------------*/

/*
자료값 형식(format)
[자리수].       : 자리수 길이의 숫자값
$[자리수].      : 자리수 길이의 문자열
comma[자리수].  : 자리수 길이의 콤마가 포함된 숫자값 (자리수에 콤마도 포함!!)
dollar[자리수]. : 자리수 길이의 미화액수

Note: 마지막에 마침표가 붙음!
*/

/* :의 용법 */
* 공백을 무시하고 처음으로 값이 나오는 부분부터 읽는다!;

*자료값형식 사용에서 주의점에 관한 예제;
data a6;
input item $ amount comma5.;
cards;
trucks     1,382
jeeps      1,235
landrovers 2,391
;

proc print;
format amount dollar9.;
run;
/*
실행결과 확인: 처음 두 행의 amount 값이 정상적으로 출력되지 않음! 

why: cards문에서 item변수값과 amount 변수값 사이에 공백이 여러 개!
자료값형식으로 'comma5.'을 지정함으로 인해, item의 문자열을 읽고
한칸 공백 후 부분을 amount의 값으로 인식함으로 생기는 오류
*/

data a6_1;
input item $ amount comma5.;
cards;
trucks 1,382
jeeps 1,235
landrovers 2,391
run;

proc print;
format amount dollar9.;
run;
* 실행결과 확인: amount 변수값이 정상출력!;
* cards문에서 item변수값과 amount 변수값 사이에 공백이 하나만 있음!;

* ':'의 용법 : 공백을 무시하고 처음으로 값이 나오는 부분부터 읽는다!;
* input 문에서 amount 뒤에 ':'을 붙임!;
data a7;
input item $ amount : comma5.;
cards;
trucks     1,382
jeeps      1,235
landrovers 2,391
run;

proc print;
format amount dollar9.;
run;


/* & 의 용법 */
* 한 칸 공백은 문자열의 연장으로 인식한다!;
* 자료값 구분을 위해서는 두 개 이상의 공백이 있어야 한다!;
data a8;
input idno name & $ team $ strtwght endwght;
cards;
1023 David Shaw       red    189 165
1049 Amelia Serrano   yellow 145 124
1219 Alan Nance       red    210 192
1246 Ravi Sinha       yellow 194 177
1078 Ashley McKnight  red    127 118
1221 Jim Brown        yellow 220 .
;

proc print;
run;
/* name의 문자열이 끊겨서 출력됨! 
기본적으로 문자열은 8자리까지만 읽음! */

/* $[자리수]. 
읽을 문자열 자리수 지정, 마지막에 마침표(.)가 있음에 주의! */
data a10;
input idno name & $18. team $ strtwght endwght;
cards;
1023 David Shaw       red    189 165
1049 Amelia Serrano   yellow 145 124
1219 Alan Nance       red    210 192
1246 Ravi Sinha       yellow 194 177
1078 Ashley McKnight  red    127 118
1221 Jim Brown        yellow 220 .
;

proc print;
run;

/*--------------------------------------------------------------------*/
/* 포인터를 이용한 자료읽기 */

/* @ 의 용법 : 포인터를 다음 input 명령이 나올 때까지 기다리게 한다. */
data a9;
input team $ 13-18 @; *포인터가 다음 행으로 넘아가지 않고 현재 행에서 대기;
if team = 'red';
input idno 1-4 strtwght 20-23 endwght 24-26;
cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 177
1078 Ashley red    127 118
1221 Jim    yellow 220 .
;

proc print;
run;
* 문제: @를 지우고 실행해 보고 결과를 설명해 보시오.;

/* +[자리수]: 자리수만큼포인터 오른쪽으로 이동  */
data a11_1;
input team $6. +5 points 2.;
/*
----+----1----+----2 */
cards;
red        18
Yellow     14
red        21
yellow     19
red        12
yellow     22
; 

proc print;
run;
/* 문제: 포인터 이동을 하지 않았을 때 결과를 예상해보고 실행을 통해 확인하시오. */


/*
@@의 용법

행이 끝날 때 까지 자료값을 계속 읽어 변수에 입력
(Tip: 활용도가 높은 포인터 사용법이므로 잘 알아두세요!)
*/
data a12;
input score @@;
cards;
68 75 46 95
run;
proc print; 
run;

data a13;
input name $ score @@;
cards;
KIM 68 LEE 75
PARK 46 CHOI 95
run;
proc print;
run;


/* @[열위치]: 지정된 열로 포인터 이동해 그 위치부터 자료값을 읽는다! */
data a16;
input idno 4. @8 strtwght 3. @14 endwght 3.;
/*
----+----1----+----2----+----3----+----4----+ */
cards;
1023   189   165
1049   145   124
1219   210   192
1246   194   177
1078   127   118
;
proc print;
run;

*포인터의 행이동: 한 자료행이 여러 행에 걸쳐 제시되는 경우;

/* 
'/'를 이용한 행이동

다음 행으로 이동해 자료값을 읽음.
자료의 한 행이 실제 여러 행에 걸쳐 있을 때 사용.
*/
data a15;
input idno 1-4 / / strwght 1-3 endwght 5-7;
cards;
1023 David Shaw
red
189 165
run;
proc print;
run;

/*
'#'를 이용한 행이동 

이동할 행을 지정.
'/'는 다음 행으로 이동만 가능하기에 행을 위로 옮기지는 못함.
*/
data a16;
input #2 team $ 1-6 #1 name $ 6-23 idno 1-4 #3 strwght 1-3 endwght 5-7;
cards;
1023 David Shaw
red
189 165
1049 Amelia Serrano
yellow
145 124
run;
proc print; run;

*--------------------------------------------------------------------;
*기타;

/* 자료값 형식(format)의 반복표기 */
data a17;
input (x1-x3)(2*5. 3.); 
/* input x1 5. x2 5. x3 3.; 과 같다 */
cards;
1023  189 165
1049  145 124
1219  210 192
1246  194 177
1078  127 118
;

proc print;
run;

/* 생략된 소수점 부여 */
data a18;
input sex $ 1 weight 3-6 time 8-10 .1;
cards;
F 56.1 165
F 45.6 156
M 76.2 176
M 64.6 187
F 48.2 162
;

proc print;
run;
