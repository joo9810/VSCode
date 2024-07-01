# begin

data.set <- read.csv( "Data/Example3.2.csv" )

# data 생성 설정

# 회귀계수와 오차항분산의 참값
beta0  <- 10
beta1  <- 2
sigma2 <- 10

n     <- nrow( data.set ) # 표본크기
x     <- data.set$x       # 설명변수

# data 생성
error <- rnorm( n , mean = 0 , sd = sqrt( sigma2 ) ) # 오차항
y     <- beta0 + beta1 * x + error                   # 반응변수

# 회귀계수추정
data.set  <- data.frame( x = x , y = y )
lm.result <- lm( y ~ x , data = data.set )
coef( lm.result ) # 참값과 다름!


# 반복

coef.est <- matrix( nrow = 1000 , ncol = 2 )

for( i in 1:1000 )
{
  # data 생성
  error <- rnorm( n , mean = 0 , sd = sqrt( sigma2 ) )
  y     <- beta0 + beta1 * x + error
  
  # 회귀계수추정
  data.set     <- data.frame( x = x , y = y )
  lm.result    <- lm( y ~ x , data = data.set )
  coef.est[i,] <- coef( lm.result )
}

# 추정량의 이론적 표준편차 계산
S_xx     <- sum( ( x - mean(x) )^2 )
sd.beta1 <- sqrt( sigma2 / S_xx )
sd.beta0 <- sqrt( sigma2 ) * (1/n + (mean(x))^2 / S_xx )

hist( coef.est[,2] , main = "LSE of beta_1" , prob = TRUE , xlab = "estimate" )
u <- seq( 1.8 , 2.2 , 0.001 )
v <- dnorm( u , mean = beta1 , sd = sd.beta1 )
lines( u , v , lty = 2 )


hist( coef.est[,1] , main = "LSE of beta_0" , prob = TRUE , xlab = "estimate" )
u <- seq( 0 , 20 , 0.01 )
v <- dnorm( u , mean = beta0 , sd = sd.beta0 )
lines( u , v , lty = 2 )



# 평균값 예측
x0 <- 55 # 예측을 수행하고자 하는 새로운 설명변수값

true.mean <- beta0 + beta1 * x0 # 평균의 참값

pred <- c()

for( i in 1:1000 )
{
  # data 생성
  error <- rnorm( n , mean = 0 , sd = sqrt( sigma2 ) )
  y     <- beta0 + beta1 * x + error
  
  # 평균값예측
  data.set     <- data.frame( x = x , y = y )
  lm.result    <- lm( y ~ x , data = data.set )
  coef.est     <- coef( lm.result )
  pred[i]      <- coef.est[1] + coef.est[2] * x0
}

# 추정량의 이론적 표준편차
sd.pred <- sqrt( sigma2 * (1/n + ( x0 - mean(x) )^2 / S_xx  ) )


hist( pred , main = "Prediction of mean at x = x0" , prob = TRUE , xlab = "estimate" )
u <- seq( true.mean - 3 * sd.pred , true.mean + 3 * sd.pred , length.out = 1000 )
v <- dnorm( u , mean = true.mean , sd = sd.pred )
lines( u , v , lty = 2 )

# end