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
# rnorm: 정규분포를 따르는 난수를 생성
error <- rnorm( n , mean = 0 , sd = sqrt( sigma2 ) ) # 오차항
y     <- beta0 + beta1 * x + error                   # 반응변수

# 회귀계수추정
data.set  <- data.frame( x = x , y = y )
lm.result <- lm( y ~ x , data = data.set )

new.data   <- data.frame( x = 55 )
true.mean  <- beta0 + beta1 * new.data$x                              # beta0 + beta1 * x
true.value <- true.mean + rnorm( 1 , mean = 0 , sd = sqrt( sigma2 ) ) # beta0 + beta1 * x + error

# new.data에서 주어진 x값에 대한 y평균의 95%수준 예측구간
predict( lm.result , newdata = new.data , level = 0.95 , interval = "confidence" )
# true.mean을 포함하는가?


# new.data에서 주어진 x값에 대한 y의 95%수준 예측구간
predict( lm.result , newdata = new.data , level = 0.95 , interval = "prediction" )
# true.value를 포함하는가?


# 반복

# y평균의 예측
conf.int <- matrix( nrow = 1000 , ncol = 2 )

for( i in 1:1000 )
{
  # data 생성
  # rnorm: 정규분포를 따르는 난수를 생성
  error <- rnorm( n , mean = 0 , sd = sqrt( sigma2 ) ) # 오차항
  y     <- beta0 + beta1 * x + error                   # 반응변수
  
  # 회귀계수추정
  data.set  <- data.frame( x = x , y = y )
  lm.result <- lm( y ~ x , data = data.set )
  
  new.data   <- data.frame( x = 55 )
  true.mean  <- beta0 + beta1 * new.data$x  # beta0 + beta1 * x

  # new.data에서 주어진 x값에 대한 y평균의 95%수준 예측구간
  pred.result <- predict( lm.result , newdata = new.data , level = 0.95 , interval = "confidence" )
  conf.int[i,1] <- pred.result[2]
  conf.int[i,2] <- pred.result[3]
}

mean( conf.int[,1] <= true.mean & true.mean <= conf.int[,2] )


# y값 예측
pred.int   <- matrix( nrow = 1000 , ncol = 2 )
true.value <- double( 1000 )

for( i in 1:1000 )
{
  # data 생성
  # rnorm: 정규분포를 따르는 난수를 생성
  error <- rnorm( n , mean = 0 , sd = sqrt( sigma2 ) ) # 오차항
  y     <- beta0 + beta1 * x + error                   # 반응변수
  
  # 회귀계수추정
  data.set  <- data.frame( x = x , y = y )
  lm.result <- lm( y ~ x , data = data.set )
  
  new.data   <- data.frame( x = 55 )
  true.value[i]  <- beta0 + beta1 * new.data$x + rnorm( 1 , mean = 0 , sd = sqrt(sigma2) )  # beta0 + beta1 * x + error
  
  # new.data에서 주어진 x값에 대한 y평균의 95%수준 예측구간
  pred.result <- predict( lm.result , newdata = new.data , level = 0.95 , interval = "prediction" )
  pred.int[i,1] <- pred.result[2]
  pred.int[i,2] <- pred.result[3]
}

mean( pred.int[,1] <= true.value & true.value <= pred.int[,2] )



# end