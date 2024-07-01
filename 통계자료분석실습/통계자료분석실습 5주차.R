# begin

# if-else 조건문
# 
# 기본구조
# if( [조건1] )
# {
#   [실행1]  
# }
# else if( [조건2] )
# {
#   [실행2]
# }
# else
# {
#   [실행3]
# }

# 주의: 조건은 반드시 단순논리값이어야 함

# || , && : 단순논리합/논리곱으로 피연산자는 단순논리값이나 단순변수 (벡터라면 첫번째원소값),  if문의 조건문에서 사용!
# |  , &  : 벡터에 대한 논리합/논리곱

x <- c(T,T)
y <- c(F,T)

x |  y
x &  y

x || y
x && y

f <- function( x )
{
  if( x == 1 || x == 2 || x == 3 )
  {
    message <- "A"
  }
  else if( x >= 4 )
  {
    message <- "B"
  }
  else
  {
    message <- "C"
  }
  
  return( message )
}

f(1)
f(4)
f(0.5)

# f에서 인수 x는 단순변수값으로 암묵적으로 간주.
f( c( 1 , 4 , 0.5 ) ) # x로 벡터가 입력되어 오류발생!

# 반복문

# for문 기본구조
# for( [변수] in [벡터] )
# {
#     [실행문]
# }
# [변수]가 [벡터]에서 제시된 값이 차례로 되면서 실행문이 반복실행 

v <- 0
for( i in 1:10 )
{
  v <- v + i
}

print(v)

# while문: 조건이 충분되는 동안 반복 실행
# 지정된 반복회수가 없을 때 사용.
# 무한루프를 조심!
v <- 0
i <- 1
while( i <= 10 )
{
  v <- v + i
  i <- i + 1
}

print(v)

# 조건문,반복문 사용의 예
# 예1
M       <- matrix( data = 1:10 , nrow = 5 )
row.sum <- double(5)
col.sum <- double(2)
for( i in 1:5 )
{
  row.sum[i] <- sum( M[i,] ) 
}

for( i in 1:2 )
{
  col.sum[i] <- sum( M[,i] ) 
}

# 예2
even.sum <- 0
odd.sum  <- 0
for( i in 1:5 )
{
  if( M[i,1] %% 2 == 0 )
  {
    even.sum <- even.sum + M[i,2]
  }
  else
  {
    odd.sum <- odd.sum + M[i,2]
  }
}

# 예3
x <- c( 1 , 4 , 0.5 )

v <- character(3)
for( i in 1:3 )
{
  v[i] <- f( x[i] )
}

print(v)

# apply 함수

# R 프로그래밍에서는 되도록 반복문을 지양한다.
# 많은 경우 위의 반복문은 apply함수사용으로 대체될 수 있다.

# apply 기본문법
# apply( M , a , func )
# M    : 행렬 or 데이터프레임
# a = 1 or 2
# func : 벡터를 입력받는 연산함수 

# 예1
apply( M , 1 , sum ) # 행별로 연산
apply( M , 2 , sum ) # 열별로 연산

apply( M , 1 , mean )
apply( M , 2 , mean )

# tapply 기본문법
# tapply( x , grp , func )
# x    : 벡터
# grp  : 그룹을 나타낸는 벡터, x와 길이가 같아야 함! 
# func : 벡터를 입력받는 연산함수
# 그룹별로 func연산이 수행된다.

# 예2
tapply( M[,2] , M[,1] %% 2 , sum ) # 그룹별로 계산
# 연산결과를 벡터로 주어지고 벡터위치에 grp값으로 이름이 매겨져 있음

# sapply 기본문법
# sapply( x , func )
# x    : 벡터
# func : x의 각 원소값을 받아 계산을 수행할 함수

# 예3
sapply( c( 1 , 4 , 0.5 ) , f )

#---------------------------------------------------------------------

# 자료의 결합
# cbind, rbind, merge

# 행렬의 결합
M1 <- matrix( data = 1:10 , nrow = 5 )
M2 <- matrix( data = 11:20 , nrow = 5 )

cbind( M1 , M2 )
rbind( M1 , M2 )

# 두 데이터프레임의 결합
data.set1 <- data.frame( name = c( "Kim" , "Jung" , "Sung" ) , score1 = c(50,60,70) )
data.set2 <- data.frame( name = c( "Jung" , "Sung" , "Kim" ) , score2 = c(50,60,70) )

cbind( data.set1 , data.set2 )
merge( data.set1 , data.set2 , by = "name" )

data.set1 <- data.frame( name = c( "Kim" , "Jung" , "Sung" ) , score = c(50,60,70) )
data.set2 <- data.frame( name = c( "Jung" , "Sung" , "Kim" ) , score = c(50,60,70) )

rbind( data.set1 , data.set2 ) # 자료행 추가: 변수이름이 같아야 함
merge( data.set1 , data.set2 , by = "name" )
merge( data.set1 , data.set2 , by = "name" , suffixes = c( "1" , "2" ) ) #중복되는 변수명 처리

# 자료정렬
# sort : 벡터를 정렬함
# order: 벡터를 정렬하기 위한 순서값 계산

sort ( c("B","C","D","A") )
order( c("B","C","D","A") )

k <- order( c("B","C","D","A") )
c("B","C","D","A")[k]

# 내림차순정렬
sort ( c("B","C","D","A") , decreasing = TRUE )
order( c("B","C","D","A") , decreasing = TRUE )

k <- order( c("B","C","D","A") , decreasing = TRUE )
c("B","C","D","A")[k]

data.set <- data.frame( x = c(1,4,2,3,8,10) , y = 1:6 )
k        <- order( data.set$x )
data.set[k,]

# end