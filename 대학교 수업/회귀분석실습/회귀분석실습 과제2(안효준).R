getwd() # 워킹디렉토리 확인
data.set <- read.csv("Exercise3.1.csv",header = T)
data.set
objective <- function( b , x , y )
{
  b0   <- b[1]
  b1   <- b[2]
  pred <- b0 + b1 * x
  
  sum.of.square <- sum( ( y - pred )^2 )
  
  return( sum.of.square )
}

optim( par = c(1,1) , fn = objective , method = "BFGS" ,
       x = data.set$airTemp , y = data.set$fuel )

# 최적화 방법으로 추정회귀직선을 추정 시
# y-hat = 115.784690 - 7.031548x 의 형태입니다.

lm(data.set$fuel ~ data.set$airTemp)

# lm 함수 이용 시 추정회귀직선은
# y-hat = 115.785 - 7.032x 의 형태입니다.