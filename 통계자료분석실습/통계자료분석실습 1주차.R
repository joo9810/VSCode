# begin

# 1장 기본자료형

# 단순변수, vector, matrix, list, data frame

# vector
x0 <- 1 # 단순변수
x  <- c( 10.4 , 5.6 , 3.1 , 6.4 , 21.7 ) # 벡터
# 단순변수 = 길이가 1인 벡터

# <- : 저장명령기호, 왼쪽방향 화살표를 의미
# '='으로 대체가능

# c : connection, concatenation, 잇다.
# 여러 값이나 벡터를 이어 벡터를 만든다.

print(x) # x의 출력

str(x) # x의 구조(structure): 보다 복잡한 객체의 구조에 파악할 때 주로 쓰임

# 벡터원소 보기
x  <- c( 10.4 , 5.6 , 3.1 , 6.4 , 21.7 )

x[1] # 첫번째 원소
x[2] # 두번째 원소

# cf. 다른 언어(예로 python)에서는 x[0]이 첫번째, 
# x[1] 두번째,... 인 경우도 있으니 주의당부!

# 원소값 변경
print(x)

x[2] <- 2

print(x)



# 사칙연산
1 + 2
1 - 2
1 * 2
1 / 2

# 벡터의 사칙연산: 원소별로 계산이 된다!!
y <- c(1,2,3,4,5)

v <- 2*x + y + 1 # component-wise calculation!

print(v)


# 기본연산 및 함수

# 거듭제곱
2^10
2**10

# 지수함수/로그함수
exp(2) # = e^2 , e = 2.718281...

log(2) # 자연로그, 밑이 e

log10(10) # 상용로그, 밑이 10

sin(pi/4)
cos(pi/4)
tan(pi/4)
# pi = 3.141592... 원주율

# 벡터의 연산: 원소별로 계산된다!!
y <- c(1,2,3,4,5)

exp(y)
log(y)
sin(y)


# 기초통계량 계산
x <- c(3,1,2,5,6)

mean(x)
var(x)
sd(x)
max(x)
min(x)
range(x)

# 그 결과가 하나 또는 몇가지 값으로 출력

# 패턴을 지닌 벡터만들기
# seq: sequence 열
seq(1,10,1)
1:10

seq( -1 , 5 , by = 2 )

10:1
seq( 10 , 1 , by = -1 )

# rep: repeat 반복
rep( c(1,2,3) , times = 5 )
rep( c(1,2,3) , each  = 5 )
# 출력해서 결과를 비교해 보시오!

# logical vector : TRUE/FALSE 값으로 지니는 벡터

tmp <- c(1,2,3) > 1

# TRUE는 수치값으로 1로, FALSE는 0으로 취급된다!!

1 == TRUE

0 == FALSE

sum( tmp ) # tmp 벡터에서 1를 초과하는 원소의 개수를 의미!!!

# 논리연산
tmp2 <- c(1,2,3) == 2

print( tmp2 )

# 논리곱, 원소별로 계산
tmp & tmp2

# 논리합, 원소별로 계산
tmp | tmp2


# 결측값(missing value) 처리

x <- c( 1:3 , NA ) # NA: Non-Available
is.na(x)

0/0 # NaN: Not a Number

x <- c( 1:3 , NA , NaN )
is.na(x)

sum( is.na(x) ) # 벡터 x에 결측값이 몇 개인가?


# 색인벡터 (index vector)
# 조건을 만족하는 원소를 선택하기 위한 논리벡터
x <- c(1:10,NA)

x[ !is.na(x) ]

x[ !is.na(x) & x > 1 ]

# 정수벡터로 원소확인
x[1:5] # 여러개의 원소를 동시에 확인

x[-length(x)] # 음수이면 해당위치의 원소를 제외하고 나머지를 보여준다.

x[-11:-9]


# 문자열(character, string), 문자열 벡터
x <- "Introduction to R"
print(x)

x <- c( "John" , "Tom" , "Ace" )

# 벡터위치에 이름붙이기(naming)
x <- 1:3
names(x) 

names(x) <- c( "orange" , "apple" , "banana" )

x <- c( orange = 1 , apple = 2 , banna = 3 )

print(x)

x["orange"]

x[c("orange","banana")]

# end