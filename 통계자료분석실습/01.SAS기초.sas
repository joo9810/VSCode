/*
SAS의 기초: SAS코드 맛보기
SAS코드에 익숙해지기 위해
DATA 단계의 여러 예제를 살펴본다.
예제에서 다루어지는 내용은 앞으로 수업에서 더 자세히 다룰 것이다. 
*/

/*
SAS창 기본구성
코드 or 확장편집기: 코드작성, 실행 (실행하고자 하는 코드부분을 블록으로 잡아 달리기 모양 아이콘 클릭!)
로그: 코드실행처리과정 출력, 오류확인
결과: 처리결과 출력
*/


/*
SAS 코드의 기본구조

DATA 단계: 자료의 생성, 결합, 편집 등 분석할 자료를 만드는 단계
PROC 단계: 자료를 처리/분석하는 단계
*/

/*
DATA 단계의 예
1. DATA 단계는 DATA 명령어로 시작해 만들 자료의 이름을 제시,
2. INPUT 명령어로 시작해 입력받을 변수이름을 제시 (공백으로 구분!),
3. (선택사항) LABEL 명령으로 변수에 별칭을 줌 (공백으로 구분!),
4. CARDS문으로 INPUT명령에서 제시된 변수에 입력될 자료값을 제시
*/

DATA a1;
	INPUT x y;
	LABEL x='변수1' y='변수2';
	CARDS;
	2 4
	3 6
;

PROC PRINT data=a1;
	TITLE '예제프로그램';
RUN;

/*
주의점
1. SAS의 모든 명령문은 세미콜론(;)으로 끝을 표시
2. 명령어와 변수명에서 대소문자 구분하지 않음!
3. 문자열은 따옴표(')로 묶어 표시
4. CARDS;의 다음 행부터 자료를 제시, 자료의 마지막 다음 행에 세미콜론으로 입력할 자료의 끝을 표시!
*/


/*
변수의 기본연산

DATA 단계에서 기본적인 연산을 수행할 수 있다. 이를 통해 새로운 변수를 생성
*/

DATA a1;
	INPUT x y; * CARDS에서 자료값이 제시됨;
	*-----------------------------------------------------;
	* 입력될 x와 y로부터 연산을 통해 새로운 변수를 생성;
	x2   = x**2 + y;
	xlog = LOG(x);
	x3   = x > 2;
	*-----------------------------------------------------;
	CARDS;
	2 4
	3 6
	1 5
	5 3
	7 0
	2 9
	3 1
;

PROC PRINT;
	TITLE ‘예제 프로그램’;
	VAR x y x2 x3 xlog;
RUN;

/*
기존자료로부터 새로운 자료 만들기

기존자료에서 조건에 맞는 자료만 추출.
SET 명령을 통해 기존자료를 가져오고 IF문을 통해 조건을 제시한다!

주의점 '='의 쓰임
SAS에서 '='은 값의 저장과 조건식에서 모두 사용 (R에서와 다름)
할당문에서는 값의 저장을 의미, 예: x = 2 => 변수 x에 값2를 저장.
조건문에서는 같음을 의미, 예: x = 2 => 변수 x에 저장된 값이 2인가? 맞으면 참(TRUE) 아니면 거짓(FALSE)
*/
DATA b1;
	SET a1;
	IF x = 2; * x값이 2와 같으냐를 확인!;

DATA b2;
	SET a1;
	IF x = 3;

DATA b3;
	SET a1;
	IF x^=2 AND x^=3; * ^= : 다르다, not equal
run;

proc print data=b1;
	title 'b1';
run;

proc print data=b2;
	title 'b2';
run;

proc print data=b3;
	title 'b3';
run;

/*
위의 작업을 한번에 하기!

세번의 DATA 단계를 통해서 했던 작업을 한번의 DATA 단계로!
한 DATA 단계에서 여러 자료를 동시에 만들 수 있다.
*/

data b1 b2 b3; * 3개의 자료를 만들 것이며 이름을 각각 b1 b2 b3로 한다 (공백으로 구분);
	set a1;
/* ----------------------------------- 
자료의 행별로 수행
현재 행의 x값이 조건에 맞으면 then 다음의 명령을 실행
output 명령문은 현재 행을 해당 자료에 배당을 지시한다.
*/
	if x = 2 then
		output b1;
	else if x = 3 then
		output b2;
	else
		output b3;
*-----------------------------------;
run;

proc print data=b1;
	title 'b1';
run;

proc print data=b2;
	title 'b2';
run;

proc print data=b3;
	title 'b3';
run;

/* 
라이브러리(library)을 통한 자료의 관리
SAS의 라이브러리: 자료저장소

stat이라는 라이브러리를 만든다.
이 라이브러리의 자료는 '/home/u47469880/통계자료분석실습/Data'경로로 저장될 것이다.
*/
LIBNAME stat '/home/u47469880/통계자료분석실습/Data';

/* 라이브러리에 자료저장하기
 
기본문법
data [라이브러리이름].[자료이름] */

data stat.a1; *a1 자료를 stat 라이브러리에 만든다;
	input x y;
	x2   = x**2 + y;
	xlog = log(x);
	cards;
1 2
2 3
;

proc print data=stat.a1;
run;

/*
위의 DATA단계를 실행하면 해당 라이브러리 경로에 
자료파일(a1.sas7bat)이 생성되어있다.
이 파일은 프로그램 종료 후에서도 계속 보관된다.

라이브러리를 생략하면?
라이브러리가 지정되지 않으면 임시 라이브러리(WORK)에 저장되며
프로그램 종료 후에 자료는 자동으로 삭제된다.
*/

/*
firstobs의 사용: 첫행이 변수이름인 경우

파일을 통한 자료 입력에서 종종 첫행이 변수이름임.
이 경우에 firstobs를 통해 파일에서 자료값이 첫등장하는 행을 지정
*/
option firstobs = 2;
title '교사의 직무수행 능력';

data opt1;
	input id gender residence age q11-q14 q21-q24 q31-q34;
	cards;
id gender residence age q11-q14 q21-q24 q31-q34
201  1  2  1  4  3  2  3  2  4  2  4  2  2  1  3
203  1  2  1  4  5  2  1  1  3  4  3  4  2  1  3
205  1  2  2  4  3  3  4  3  5  4  4  3  3  1  3
207  1  2  2  4  2  4  4  3  4  2  4  2  3  2  3
;

proc print;
run;

*firstobs는 원래값(1)로 돌림;
option firstobs=1; 

/*
문자형변수

SAS에서 문자형자료값을 읽을 때 해당변수에 $를 붙혀 표시한다.
CARDS문에서 문자형자료값를 제시할 때 따옴표를 쓰지 않는다!
*/
options ls=72 nodate;
title;

data club1;
	input idno name $ team $ strtwght endwght;
	cards;
1023 David  red    189 165
1049 Amelia yellow 145 124
1219 Alan   red    210 192
1246 Ravi   yellow 194 177
1078 Ashley red    127 118
1221 Jim    yellow 220 .
;
* . : 결측;

proc print data=club1;
	title 'Weight Club Members';
run;