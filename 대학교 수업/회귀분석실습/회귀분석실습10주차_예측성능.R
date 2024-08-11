# begin

# 왜 축소모형을 추구하는가?

set.seed(0)

# 설명변수 생성
n <- 50 # 자료개수

z1 <- round( rnorm( n ) , 2 )
z2 <- round( rnorm( n ) , 2 )
z3 <- round( rnorm( n ) , 2 )
z4 <- round( rnorm( n ) , 2 )

M       <- matrix( data = 0.5 , nrow = 4 , ncol = 4 )
diag(M) <- 1

X <- cbind( z1 , z2 , z3 , z4 ) %*% M 

x1 <- X[,1]
x2 <- X[,2]
x3 <- X[,3]
x4 <- X[,4]

cor( X ) # 변수간의 상관관계가 있다.

# 모형식과 반응변수 생성
beta0 <- 1
beta1 <- 2
sigma <- 0.5 # 오차항의 표준편차

y <- beta0 + beta1 * x1 + rnorm( n , sd = sigma )
# x1만 실제 설명변수!

cor( y , X ) # 반응변수와 모든 변수와 유의한 상관관계가 있음!

# 회귀모형적합
fit1 <- lm( y ~ x1 )
fit2 <- lm( y ~ x1 + x2 + x3 + x4 )

# 예측
newdata   <- data.frame( x1 = 2 , x2 = 1 , x3 = 1 , x4 = 2 )

true.mean <- beta0 + beta1 * newdata$x1

predict( fit1 , newdata )
predict( fit2 , newdata )


# 모의실험을 통한 예측성능측정
newdata   <- data.frame( x1 = 2 , x2 = 1 , x3 = 1 , x4 = 2 )
true.mean <- beta0 + beta1 * newdata$x1

error1 <- c()
error2 <- c()
for( i in 1:1000 )
{
  y <- 1 + 2 * x1 + rnorm( n , sd = sigma )
  
  fit1 <- lm( y ~ x1 )
  fit2 <- lm( y ~ x1 + x2 + x3 + x4 )

  error1[i] <- predict( fit1 , newdata ) - true.mean
  error2[i] <- predict( fit2 , newdata ) - true.mean
}

# root MSE 계산
sqrt( mean( error1^2 ) )
sqrt( mean( error2^2 ) )

# 성능비교: 1보다 작으면 fit1에 의한 예측이 더 좋음을 의미
sqrt( mean( error1^2 ) / mean( error2^2 ) )


# end