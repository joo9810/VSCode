x <- 3
x
x <- c(1,2,3,4,5)
x
x <- c(1,2,c(6,7,8))
x
x <- c(1:5)
x
x <- seq(1,5) # sequence 값을 1씩 더한다.
x
x <- seq(1,100,10) # seq(start,end,step)
x
x <- seq(3,length.out=10)
x
x <- 1+1:10
x
x <- rep(1,5)
x
x <- rep(1:5,3)
x
#vector 생성
a <- c(1,2,3)
a
a1 <- 1:3 #첫번째에서 세번째 값까지 나타내라
a1
#반복
b <- rep(10,5) #10을 5번 반복하라
b
b1 <- rep(c(1,2,3),5)
b1
b2 <- rep(c(1,2),c(3,4))
b2
#수열
c <- seq(1,100,10) #1부터 100까지 10씩 증가해서 나타내어라
c
#vector 입력
subject_name <- c('John Doe','Jane Doe','Steve Graves')
temperature <- c(98.1,98.6,101.4)
flu_status <- c(FALSE,FALSE,TRUE)
#index
temperature[2] #temperature에서 2번째 값을 찾아줘
temperature[2:3]
#data 제외
temperature[-2] #2를 제외하고 보여줘
temperature[c(TRUE,TRUE,FALSE)] #TRUE는 보이고 FALSE는 보이지 말라
#data type
is.numeric(subject_name) #subject_name이 숫자냐?
is.character(subject_name) #subject_name이 문자냐?
is.numeric(temperature) #temperature가 숫자냐?

#boolean vector
1>2
c(10,20)>19
c(2,3)>c(1,2,-1,3)

1 %in% c(1,2,4) # %in%은 c함수 안에 객체가 있는지 없는지
c(1,4) %in% c(1,2,3)

#character vector
'hello ~ R!'
c('hello','R')
c('hello','R')==c('Hello','R') #논리 연산자는 ==2개
cat('Is "YOU" a korean name?')
cat("is \"YOU\" a korean name?")
x<- c(1,2,3,4,5)
y <- c('a','b','c','d','e')
cat(x,y) #cat함수는 벡터를 합쳐서 보여준다

#float vector
c(1+2i,2+3i)

vec <- 21:40
vec
#indexing (대괄호로 나타내며 구성요소를 찾아주는 것)
vec[3] #vec의 3번째 원소를 나타내라
vec[11] #vec의 11번째 원소를 나타내라
vec[20] #vec의 20번째 원소를 나타내라
vec[1:5] #vec의 1~5번까지의 원소를 나타내라
vec[7:17] #vec의 7~17번까지의 원소를 나타내라
vec[c(1,3,5,7,9)] #대괄호 안에 c는 c(1+2i,2+3i)가 아니라 vec <- 21:40을 의미.
vec[vec>25]
19%in%vec
vec[c(3,5)] #vec 안에 있는 3,5번째 원소를 나타내라.
a <- 11:30
a[5]
a[11]
a[c(3,5)]
a[c(3:5,8:9)]
c(1,2,3)+10
c(10,20,30)%%5
c(10,20,30)%/%5
#matrix 행렬 (2차원)
m <- matrix(1:16,nrow=4) #1~16까지 행이 4개인 행렬을 만들어라
m
m_col <- matrix(1:16,ncol=4) #1~16까지 열이 4개인 행렬을 만들어라
m_col


#array : dim=c(행,열,차원)
a1 <- array(1:9,dim=c(1,5,2))
a1
a2 <- array(1:9,dim=c(1,5,2),
                            dimnames=list(c('행1'),
                            c('열1','열2','열3','열4','열5'),
                            c('차원1','차원2')))
a2
a2[1,,]
a2[,1,]
a2[1,2:4,1:2]
a2
a2[1,1:5,1:2]
a2[1:1,1:5,1:2]
a2[,1:5,1:2]
a2
dim(a2) #a2의 행과 열과 차원은 얼마인가?
t(m) #전치행렬 (m의 전치행렬)
diag(1,nrow = 3) #대각행렬 (1을 행이 3개로 대각행렬로 만들어라)
diag(5,ncol = 6) #ncol은 열이 6개로 라는 말으로 행이 하나밖에 안생긴다)
#원래 대각행렬은 정방행렬인데 R에서는 굳이 아니여도 되는듯
diag(5,ncol = 6,nrow = 5)
#위와 같이 해도 5x6 행렬을 만들어 낸다
diag(1,2,ncol = 3) #1을 2번 사용한 열이 3개인 대각행렬
m2 <- matrix(1:16,nrow = 4,dimnames=list(c('r1','r2','r3','r4'),
                                         c('c1','c2','c3','c4')))
m2
#기본적으로 matrix던 array던 이름을 지으려면 dimnames를 사용해야한다.
#하지만 matrix는 rownames와 colnames로 이름을 바꿀 수 있다.
m3 <- matrix(1:25,nrow = 5)
m3
rownames(m3) <- c('R1','R2','R3','R4','R5')
colnames(m3) <- c('C1','C2','C3','C4','C5')
m3
#행렬연산
m1+m1
m1-2*m1 #반드시 *를 붙혀야 한다 그냥 m1-2m1라고 하면 2m1이라는 함수를 찾는다
m1*m1
m1%*%m1 #행렬내적 (100퍼 시험출제) (m)x(n)행렬과 (p)x(q)행렬의 내적 계산에서
#n과p가 무조건 같아야 계산이 된다. 또한 계산되는 꼴은 (m)x(q)꼴로 나온다.
#계산방법은 해당 행과 해당 열의 모든 원소들을 곱한뒤 더한다.
m1
m1[1,2] #m1의 1행 2열의 원소를 추출해라
m1[2,3]
m1[1:2,2:3] # 1~2행과 2~3열의 원소를 추출해라
m1[1,] #1행을 출력하고 열은 다 출력해라
m1[,-2] #2열을 빼고 출력해라
m2
m2[c('r1','r3'),c('c2','c4')] #m2의 행r1 r3와 열c2 c4을 추출해라
m1[3:8] #m1의 3~8원소까지 벡터의 형태로 나타내어라

#factor 는 범주 함수
gender <- factor(c('M','F','M')) #level설정을 안하면 factor원소가 레벨이 됨
gender
blood <- factor(c('O','AB','B'), #level은 특성값을 뜻함
                levels = c('A','B','AB','O'))
blood
a <- table(gender) #table은 특성값들의 도수를 보여줌
a
b <- table(blood)
b
prop.table(a) #prop.table은 특성값들의 상대도수를 보여줌
prop.table(b)
symptom <- factor(c('찰과상','중상','경상'),
                  levels = c('찰과상','경상','중상'),
                  ordered = TRUE)
#ordered는 특성값들의 순위를 메겨줌, 젤 마지막 특성이 1등
symptom
symptom>'찰과상'

#list함수 (vector, matrix는 동일원소, list는 이질원소)
list_01 <- list(1,c(TRUE,FALSE),c('a','b','c'))
list_01
list_02 <- list(x=1,y=c(TRUE,FALSE),z=c('a','b','c'),name=c('John','James'))
list_02 #변수를 넣게 되면 달러로 표시된다.
list_02 $x
list_02 $name
#종합적용 (서로 다른 구조의 데이터가 다양하게 들어간다)
subject_name <- c('John Doe','Jane Doe','Steve Graves')
temperature <- c(98.1,98.6,101.4)
flu_status <- c(FALSE,FALSE,TRUE)
gender <- factor(c('M','F','M'))
blood <- factor(c('O','AB','B'),
                levels = c('A','B','AB','O'))
symptom <- factor(c('찰과상','중상','경상'),
                  levels = c('찰과상','경상','중상'),
                  ordered = TRUE)
subject1 <- list(fullname=subject_name[1],
                 temper=temperature[1],
                 flu=flu_status[1],
                 gender=gender[1],
                 blood=blood[1],
                 symptom=symptom[1])
subject1
subject1[2]
subject1[[2]] #1개던 2개던 별상관없어보임
subject1$temper # $달러 표시로 인덱스를 나타내는듯

subject2 <- list(fullname=subject_name[2],
                 temper=temperature[2],
                 flu=flu_status[2],
                 gender=gender[2],
                 blood=blood[2],
                 symptom=symptom[2])
subject2

#data.frame 데이터프레임 data.frame(열1,열2,열3,...)
df <- data.frame(subject_name,temperature,flu_status,gender,blood,
                 symptom,stringsAsFactors = FALSE)
#stringAsFactors는 변수에 문자가 있을경우 자동으로 factor타입으로 변환되는걸
#변환되지 않게 해준다. (데이터프레임에서는 자동으로 factor 타입으로 변환됨)
str(df) #구조함수 factor 명목척도 ord.factor 서열척도 (중요)
df$subject_name # $는 특정 변수의 이름을 작성
df[,1] # 대괄호는 [행번호,열번호]로 구성
df[1,2] # 1행 2열의 특정 원소를 출력
df[1,] # 1행의 개체에 대한 모든 속성 출력

#df를 이용하여 문제 풀기
x=First <- c(10:1)
y=Second <- c(-4:5)
z=Sport <- c('하키','미식축구','야구','컬링','럭비','라크로스','농구'
             ,'테니스','크리켓','축구')
df <- data.frame(x,y,z)
str(df)
theDF <- df[c(3,5),c(2:3)]
theDF

#반복문 : for,while,repeat (이해 잘 안되니 반복해서 하자)

#for
for (i in 1:5){
  print(i^2)
} # 1:5에서 :는 정수값의 수열을 나타냄

#while
i <- 1
while (i <=5){
  print(i^2)
  i <-  i+1
}

#repeat
i <- 1
repeat{i <- i + 1
  print(i^2)
  if(i>=5) break
}

print(paste('The year is 2017'))
print(paste('The year is 2018'))
print(paste('The year is 2019'))
print(paste('The year is 2020'))
print(paste('The year is 2021'))

#for문을 활용하여 위의 5글 한번에 출력하기
for (i in 2017:2021) {
  print(paste('The year is', i))
}

#while문을 활용하여 위의 5글 한번에 출력하기
i <- 2017
while(i <= 2021){
  print(paste('The year is', i))
  i <- i + 1
}

#repeat문을 활용
i <- 2017
repeat{
  print(paste('The year is', i))
  i <- i + 1
  if (i >= 2022){
    break
  }
}

#i <- i + 1을 먼저 넣으면 i를 입력했을 때 i + 1 이 출력 되므로 한 수 적은걸 넣어야 한다.
i <- 2016
repeat{
  i <- i + 1
  print(paste('The year is', i))
  if (i >= 2021){
    break
  }
}

#더하기 함수
add <- function(x,y){
  return(x+y) #return은 계산결과를 반환하고 함수 종료.
}
add(3,5)
#빼기 함수
minus <- function(x,y){
  return(x-y)
}
minus(5,3)
#조건 함수
test <- function(x,y){
  if(x>y)
    return(x+y)
  else
    return(2*x-y)
}
test(5,2)
test(2,5)

add(c(3,2),4) #동적 타이핑
add(as.Date('2021-05-05'),3) #d가 아닌 D이고 5일에서 3일을 더해준다

#계산기 만들기
calc <- function(x,y,type){
  if(type=='add'){
    x + y
  } else if(type=='minus'){
    x - y
  } else if(type=='multifly'){
    x * y
  } else if(type=='divide'){
    x / y
  } else {
    stop('Unknown type of operation') #stop을 써도되고 print를 써도 되는 것 같다
  }
}
calc(9,2,'add')
calc(3,5,'minus')
calc(5,2,'aa')
calc(3,8,'multifly')
calc(7,4,'divide')
calc(c(2,5),5,'multifly')
calc(as.Date('2021-03-28'),5,'add') #날짜의 경우 덧셈은데 곱셈은 정의가 안되는듯

#if/else
x <- 2.5
if(x%%2==0){
  print(paste(x,'는 짝수입니다'))
} else if(x%%2==1){
  print(paste(x,'는 홀수입니다'))
} else{
  print(paste('정수를 입력하시오'))
}
#ifelse구문
x <- 12
ifelse(x%%2==0, print('짝수입니다'),
       ifelse(x%%2==1, print('홀수입니다')))

x <- 12 #ifelse구문은 따로 print함수를 쓰지 않고 바로 ,를 경계로 입력함
ifelse(x%%2==0, '짝수입니다',
       ifelse(x%%2==1, '홀수입니다'))

#결측치 NA, 정의 되지 않은 값 NULL
z <- c(1,2,NA,3,6,NA,9)
z # NA값이 출력 됨
is.na(z) # z에 결측치가 있는가?
length(z) # NA는 길이에 포함됨 데이터 정의가 됨

x <- c(1,2,NULL,3,6,NULL,9)
x # NULL값이 출력 안됨
is.na(x)
length(x) # NULL은 길이에 포함이 안됨 데이터 정의가 안됨

mean(z) # NA값은 정의 된 값이므로 평균을 구할 수 없음
mean(z,na.rm = TRUE) # na.rm은 결측치를 지워달라는 뜻
sum(z)
sum(z,na.rm = TRUE)
mean(x) # NULL값은 정의가 안됐으므로 평균이 구해짐

#apply함수 (중요한 개념!!)
a <- matrix(1:12,nrow=4)
a
# 그냥 apply는 행렬(matrix)에 국한되서 적용된다
apply(a,1,max) # a의 행들의 max값을 보여라 (1은 행을 나타냄)
apply(a,2,max) # (2는 열을 나타냄)
#iris 자료로 apply함수 적용하기
data(iris)
str(iris)
dim(iris)
head(iris) # 앞 6개를 보여줌
tail(iris) # 뒷 6개를 보여줌
is.na(iris)
sum(is.na(iris)) # 결측치의 갯수를 더하라

iris
b <- iris[,1:4] # 5행인 꽃의 종류는 명목형이라 계산에 필요 없다
b
str(b)
apply(b,2,mean) # b의 열방향의 평균을 계산해라

#lapply함수 (결과를 리스트로 변환하는 함수)
lapply(b,mean) # b의 변수들의 평균을 리스트 형태로 보여라
c <- lapply(b,mean) # b의 열들의 구조적인 특성을 알려줌 (리스트 형태로)
c
lapply(b,class) #b의 변수들의 개체 형식이 무엇인가?
unlist(c) # 리스트 를 벡터의 형태로 (리스트 해제)

#sapply함수 (simple이라는 뜻) 간결하게
#matrix나 array에 적합하면 matrix나 array로
#list에 적당하면 list로 바꿔주는 똑똑한 함수
sapply(b,class) # b의 변수들의 구조적인 특성을 알려줌 (벡터 형태로)
class(sapply(b,class)) # sapply(b,class)의 특성 자체는 문자이다
sapply(iris,summary) # summary는 요약 통계량을 보여줌
# 최솟값, 제 1사분위수, 중앙값, 제 3사분위수, 최댓값

#vapply함수 (출력 결과 형태(이름같은거)를 사용자가 직접 지정 가능)
vapply_test <- c(1:100)
fivenum(vapply_test) # 최솟값, Q1, Q2, Q3, 최댓값 (상자그림 형태)
vapply_test <- list(vapply_test)
vapply_test
vapply_test2 <- vapply(vapply_test,fivenum,c('Min'=0,'Q1'=0,'Q2'=0,'Q3'=0,'Max'=0))
vapply_test2 # vapply(개체,함수,함수의 출력값 수만큼 이름을 지정하고 =0은 숫자형태 출력이라는 뜻)
# 0 대신 1이나 2를 넣어도 되는 것 같음. 숫자로 출력한다는 걸 표현한듯?
# 아마 fivenum의 fun.value가 5개라서 5개의 value값을 벡터의 형태로 지정해줘야
# 하는 것 같음.
vapply_test3 <- vapply(b,mean,c('Mean'=0))
vapply_test3 # mean의 fun.value는 1개라 한개만 설정해주면 되는듯

#mapply함수 (여러 개의 벡터에 함수를 적용) mapply(fun,list(vec),list(vec))
mapply(rep,c(1:4),c(4:1)) # 리스트의 형태로 1111과 222은 다른 리스트로 나옴
#위의 방법을 사용하지 않으면 아래와 같이 4번 입력해야 한다
rep(1,4)
rep(2,3)
rep(3,2)
rep(4,1)
mapply(sum,c(3,7,5,1,9),c(2:6))

#종합 연습
iris1 <- iris[,-5]
iris1
head(iris1)
apply(head(iris1),2,fivenum)
lapply(head(iris1),fivenum)
sapply(head(iris1),fivenum)
vapply(head(iris1),fivenum,c('1'=0,'2'=0,'3'=0,'4'=0,'5'=0))
mapply(fivenum,head(iris1))


install.packages('magrittr')
library(magrittr) #magrittr 불러오기

#파이프 연산자 %>% (Ctrl + Shift + M)
x <- c(1,2,3)
mean(x)
x %>% mean # mean(x)와 x %>%  mean 은 똑같은 말이다
