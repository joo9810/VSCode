# begin

# 행렬(matrix)

# 행렬만들기
matrix( data = 1:9 , nrow = 3 , ncol = 3 )
# 원소값이 채워지는 순서: data의 벡터값이 첫번째 열, 두번째 열,...차례로 채워짐.

matrix( data = 1:9 , nrow = 3 , ncol = 3 , byrow = TRUE )
# 원소값이 채워지는 순서: data의 벡터값이 첫번째 행, 두번째 행,...차례로 채워짐.

matrix( data = 1:9 , nrow = 3 )

matrix( nrow = 3 , ncol = 3 )

# 행렬원소 보기
M <- matrix( data = 1:36 , nrow = 4 , byrow = TRUE )

M[1,2]

M[1,]

M[,2]

M[1:2,]

M[,1:2]

M[,-1]

M[-2,]

M[c(-1,-2),]

M[1:2,1:3]

# 위의 결과는 그 자체가 또한 벡터이거나 행렬임!

# 행렬의 연산
M1 <- matrix( data = 1:12  , nrow = 4 )
M2 <- matrix( data = 10:21 , nrow = 4 )
M3 <- matrix( data = 1:12  , nrow = 3 )

# 덧셈 뺄셈은 두 행렬의 차수가 같아야 한다!
M1 + M2
M1 - M2

# 행렬의 곱셈 (%*%): M1의 열수와 M3의 행수가 같아야 한다!
M1 %*% M3

# 주의: 곱셈 *도 적용이 되기는 하지만 
M1 * M3 # 에러발생
M1 * M2 # 대응되는 원소끼리 곱함!!

# 행렬에 관한 함수
M <- matrix( data = c(1,2,3,1,1,2,5,6,2) , nrow = 3 )

t(M)           # 전치
diag(M)        # 대각원소
sum( diag(M) ) # 대각합
det(M)         # 행렬식
eigen(M)       # 고유값/고유벡터
solve( M )     # 역행렬

# 문자열로 이루어진 행렬
matrix( data = letters[1:9] , nrow = 3 )

# 행렬을 이루는 원소의 자료형은 모두 동일해야 함!!

# 행렬의 행과 열에 이름주기, 이름을 통한 원소확인
M <- matrix( data = 1:9  , nrow = 3 )
rownames( M ) <- c( "A" , "B" , "C" )
colnames( M ) <- c( "J" , "K" , "Q" )
M["A",]
M[,"Q"]

#--------------------------------------------------------------------------------------
# 리스트(list): 다양한 성격의 객체로 이루어진 집합체

list( 1:9 , 2:10 ) # 두 벡터의 리스트

x <- list( a = 1:9 , b = 2:10 ) # 원소에 이름이 매겨짐

x <- list( a = 1:9 , b = c("A","B") , c = matrix( data = 1:4 , nrow = 2 ) )
# 수치형 벡터, 문자열 벡터, 행렬로 이루어진 리스트

# 리스트의 원소 보기
x <- list( a = 1:9 , b = c("A","B") , c = matrix( data = 1:4 , nrow = 2 ) )

x$a
x$b
x$c

x[["a"]]
x[["b"]]
x[["c"]]

x[[1]]
x[[2]]
x[[3]]

x$c[1,2]  # 리스트 x의 원소 c는 행렬.
x[["c"]][1,2]
x[[3]][1,2]

# 리스트의 쓰임: 계산의 결과가 여러가지인 경우, 각 결과를 리스트로 묶음으로써 효과적으로 다룰 수 있다.
x      <- 1:10
result <- list( mean = mean(x) , sd = sd(x) , range = range(x) , M = matrix( data = x , ncol = 2 ) )

# 후에 자료분석에 쓰이는 다양한 함수들이 그 분석결과를 리스트로 반환하는 것을 보게 될 것이다!!

# 리스트를 이용한 행렬의 행과 열의 이름주기
M <- matrix( data = 1:9  , nrow = 3 , dimnames = list( c( "A" , "B" , "C" ) , c( "J" , "K" , "Q" ) ) )
# or
M <- matrix( data = 1:9 , nrow = 3 )
dimnames( M ) <- list( c( "A" , "B" , "C" ) , c( "J" , "K" , "Q" ) )


#-----------------------------------------------------------------------------------
# 데이터프레임(data frame)
# (규모가 있는) 자료를 저장하는 객체형식

# 데이터 프레임 직접 만들기
data.set <- data.frame( x = 1:3 , y = 4:6 , z = c("A","B","C") )
# x, y, z는 변수이름
# 각 변수에 같은 길이의 벡터로 자료값이 할당됨
# x,y는 수치형, z는 문자형 변수!!

# 데이터프레임과 행렬의 비교
# 일반적으로 자료는 여러 변수가 있고
# 그 변수들이 반복적으로 측정되면서 얻어진다. 
# 그래서 자연스레 형태가 직사각형이 된다.
# 만약 변수 모두가 수치이거나 또는 문자열이라면 행렬로 저장가능하겠지만
# 변수가 다양한 성격을 지니는 것이 보통이고 이런 경우에는 행렬로 저장될 수 없다.
# 자료에서 열은 변수에 해당되며 데이터프레임에서는 열마다 다른 성격을 지닐 수 있다.

# 데이터프레임의 변수 보기
data.set$x
data.set$y
data.set$z

data.set[["x"]]
data.set[["y"]]
data.set[["z"]]

data.set$x[2] # data.set$x는 벡터

data.set[,c("y","z")] # 여러 변수 보기

# 데이터프레임의 행에 접근
data.set[1,] 
data.set[1:2,]
data.set[c(1,3),]
data.set[-1,]

data.set[2:3,c("y","z")]

i <- data.set$x + data.set$y >= 6
data.set[i,] # 색인벡터를 이용한 접근

#---------------------------------------------------------------------
# 자료파일 읽기/쓰기

# 코드작성에 앞서,
# 현재 설정된 작업폴더경로를 확인하고
# 읽고자 하는 파일의 경로와 이름을 확인한다.
# 자료파일은 csv형식으로 저장되어 있고
# 첫행은 변수명, 두번째 행부터 자료값이 따라 나온다고 전제한다!

getwd() # 작업경로 확인 (wd: working directory, 작업디렉토리, 작업폴더)

setwd( "/userHome/moosupkim/DA" ) # 작업폴더 지정
# 후에 파일쓰기도 지정된 작업폴더에서 수행됨!

dir() # 현재 작업경로에 있는 모든 파일을 보여준다. 자료파일이 있는지 확인한다!

data.set <- read.csv( "test.data.csv" ) # 파일읽기

class( data.set ) # 자료는 데이터프레임으로 저장!

i <- data.set$Z == "AB"
data.set[i,] # 색인벡터를 이용해 자료일부선택

write.csv( data.set[i,] , file = "output.csv" , row.names = FALSE ) # 파일쓰기: 앞서 지정된 작업폴더에...


# 파일읽기/쓰기의 예외적 경우

# 1. 숫자로 이루어진 문자열 처리

setwd( "/userHome/moosupkim/DA" )

data.set <- read.csv( "test.data2.csv" )
# 변수 W는 숫자들로 이루어진 문자열!
# 하지만 숫자들로 이루어진 탓에 read.csv는 수치형으로 인식하고 읽음!

# 이러한 오류를 막고자 colClasses로 각 변수의 형식을 지정함
data.set <- read.csv( "test.data2.csv" , colClasses = c( "numeric" , "numeric" , "character" , "character" ) )

i <- data.set$Z == "AB"
data.set[i,]


# 2. 문자열의 따옴표 처리
# R에서는 문자열을 따옴표로 묶음으로써 표현하고
# 이러한 규칙은 파일쓰기에도 적용된다.
# 그런데 종종 파일쓰기에서는 다른 프로그램과 호환문제로 따옴표를 생략하고 싶은 경우가 있음

write.csv( data.set[i,] , file = "test.data2-output.csv" , row.names = FALSE )

write.csv( data.set[i,] , file = "test.data2-output-forSAS.csv" , row.names = FALSE , quote = FALSE )



#------------------------------------------------------------------------------------------
# 함수

# 함수만들기
subtract <- function( x , y )
{
    return( x - y )
}

# 함수호출
subtract( x = 1 , y = 2 )
subtract( y = 2 , x = 1 )
subtract( 1 , 2 )
subtract( 2 , 1 )

operation <- function( x , y )
{
  x1 <- x+y
  x2 <- x-y
  x3 <- x*y
  x4 <- x/y
  
  # 리스트를 이용해 계산결과를 반환
  return( list( add = x1 , subtract = x2 , multiply = x3 , divide = x4 ) )
}

f <- function( x , y )
{
  v <- c(x,y)
  l <- length(v)
  
  return( list( vec = v , len = l ) )
}

g <- function(x,y)
{
  return( x/y + 1 )
}

h <- function(x)
{
  i <- x > 3
  return( sum( x[i] ) )
}

f1 <- function( x , y )
{
  v  <- x/y
  i1 <- is.na(v) # missing or not
  i2 <- is.infinite(v) # infinite or not
  
  i <- i1 | i2
  
  n <- sum(i)
  
  m <- mean( v[!i] )
  
  return( list( n = n , mean = m ) )
}

f2 <- function( x , y )
{
  v  <- x/y
  i1 <- is.na(v) # missing or not
  i2 <- is.infinite(v) # infinite or not
  
  i <- i1 | i2
  
  return( v[!i] )
}

#-----------------------------------------------------------------------------------
# 문자열처리함수

x <- "2022-Aug"

# 문자열의 일부보기
substr( x , 1 , 4 )
substr( x , 6 , 8 )

substr( c( "2022-Aug" , "2022-Jul" , "2022-Jan" ) , 1 , 4 )
substr( c( "2022-Aug" , "2022-Jul" , "2022-Jan" ) , 6 , 8 )

# 문자열 나누기
s1 <- strsplit( x , split = "-" ) # 리스트로 반환
s1[[1]]

s2 <- strsplit( c( "2022-Aug" , "2022-Jul" , "2022-Jan" ) , split = "-" )
s2[[1]]
s2[[2]]
s2[[3]]

# 문자열 붙이기
paste( "2022" , "Jul" , sep = "-" )

get.month <- function( x )
{
  result <- strsplit( x , split = "-" )
  month  <- result[[1]][2]
  
  return( month )
}

get.month( "2022-Aug" )
get.month( "2022-Jul" )
get.month( "2022-Jan" )

# end