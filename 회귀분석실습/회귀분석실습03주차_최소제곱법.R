# begin

# lm 함수없이 최소제곱법으로 계수추정하기  

data.set <- read.csv( "Data/Example3.2.csv" )


# 예시: 다른 값으로 바꿔서도 시험 해볼것
b0 <- 7
b1 <- 1.5

# 주어진 b0, b1에 따른 회귀모형의 예측값
pred <- b0 + b1 * data.set$x

# 예측값과 관측값이 비교
cbind( pred , obs = data.set$y )

# 예측성능평가: sum of square 
# 이 값이 낮을수록 예측성능이 높음을 의미
sum( ( data.set$y - pred )^2 ) 


# 목적함수: 주어진 b0, b1에 따른 예측값과 관측값의 차이를 측정
# = 주어진 b0, b1에 따른 회귀모형의 예측성능 측정
# 성능기준: sum of square
objective <- function( b , x , y )
{
  # b: the main argument
  # x, y: data, secondary arguments
  
  b0   <- b[1]
  b1   <- b[2]
  pred <- b0 + b1 * x
  
  sum.of.square <- sum( ( y - pred )^2 )
  
  return( sum.of.square )
}


# 예측성능이 가장 좋은 회귀모형찾기
# = 목적함수의 함수값이 가장 작아지는 b0, b1 찾기

optim( par = c(1,1) , fn = objective , method = "BFGS"  , x = data.set$x , y = data.set$y )
# optim : 최적화를 수행
# par = 초기값
# fn  = 목적함수, 목적함수의 첫 parameter에 대해 최적화 수행


# 목적함수의 그래프
b0  <- seq( 6 , 14 , length.out = 1000 )
b1  <- seq( 1.9 ,  2.1 , length.out = 1000 )
val <- matrix( nrow = 1000 , ncol = 1000 )

for( i in 1:1000 )
{
  for( j in 1:1000 )
  {
    val[i,j] <- objective( c( b0[i] , b1[j] ) , x = data.set$x , y = data.set$y )
  }
}

image( b0 , b1 , val , breaks = round( quantile( val , seq(0,1,length.out=13)^4 ) ) , col = topo.colors(12) ,
       xlab = expression( b[0] ) , ylab = expression( b[1] ) , main = expression( Q(b[0] , b[1] )) )
contour( b0 , b1 , val , levels = round( quantile( val , seq(0,1,length.out=13)^4 ) ) , 
         xlab = expression( b[0] ) , ylab = expression( b[1] ) , col = "red" , add = T )
points( x = 10 , y = 2 , pch = 19 )


# lm 함수결과와 비교
lm( formula = y ~ x , data = data.set )


# 정규방정식
n       <- nrow( data.set )
mean.x  <- mean( data.set$x )
S.xx    <- sum( data.set$x^2 )
mean.y  <- mean( data.set$y )
S.xy    <- sum( data.set$x * data.set$y )

H <- matrix( data = c( n , n * mean.x , n * mean.x , S.xx ) , nrow = 2 )
v <- c( n * mean.y , S.xy )
solve( H , v ) # lm 결과와 일치!

# end