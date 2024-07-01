/*
외부파일 읽기: 대용량의 자료를 읽을 때 사용하는 방식
여기서는 파일이 csv (쉼표로 분리)형식으로 저장되어 있다고 전제한다.
*/

/* infile 명령을 통한 파일자료 읽기 
input 명령문에 지정된 변수에 저장될 변수값을 CARDS문 대신 파일로부터 얻는다.

기본문법
infile [파일이름] dlm = ',' firstobs = 2;

dlm      = ',' : csv파일은 자료값들이 쉼표','로 구분됨.
firstobs = 2   : 자료를 파일로 저장할 때 통상적으로 첫행에 변수이름을 쓴다.
이 경우 자료값은 두번째 행부터 등장하므로 firstobs를 2로 둔다.
만약 변수이름을 두지 않고 첫행부터 바로 자료값이 나온다면 firstobs = 1로 하거나
firstobs 옵션을 생략해야 할 것이다. */

data fileData;
	infile '/home/u47469880/통계자료분석실습/Data/test.data2.csv' dlm = ',' firstobs = 2;
	input x y z $ w $;
	v = x + y;
run;

proc print data = fileData;
run;

/* infile 명령문은 DATA 단계의 일부로 다른 DATA 단계의 명령과 병행이 가능하다. */

*proc import를 이용한 파일읽기;
proc import
	datafile = '/home/u47469880/통계자료분석실습/Data/test.data2-out.csv'
	out      = fileData2
	dbms     = csv;
	getnames = Yes;
run;
/*
datafile : 자료파일
out      : 자료이름
dbms     : Data Base Manangement System, 자료파일형식
getnames : 첫행이 변수이름이면 Yes, 아니면 No.

참고: datafile, out, dbms 는 proc import의 옵션이라서 세미콜론이 붙지 않는다.*/

proc print data = fileData2;
run;


*csv파일 쓰기;

/* proc export의 옵션
data     : 자료이름
file     : 파일이름
dbms     : 자료파일형식 
replace  : 동일한 이름의 파일이 있다면 새 것으로 교체 */

proc export 
	data = fileData
	file = '/home/u47469880/통계자료분석실습/Data/test.data2-out.csv'
	dbms = csv
	replace;
run;

*-----------------------------------------------------------------------------;
*SAS 자료파일 (sas7bdat 확장자) 저장하기/가져오기;

*라이브러리(자료저장소) 지정;
LIBNAME stat '/home/u47469880/통계자료분석실습/Data';

/* 지정된 라이브러리에 fileData2 자료를 자료파일로 저장하기

기본문법
data [라이브러리이름].[자료이름] */

data stat.fileData;  *stat 라이브러리에 자료를 저장;
	set fileData2;   *기존자료 fileData2를 불러옴;

*set 명령문을 통해 라이브러리에 저장된 자료파일을 가져오기;
data fileData3;
	set stat.fileData;

proc print data = fileData3;
run;
