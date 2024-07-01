# begin
# Note: this code file is written with encoding type CP949!

data.set <- read.csv( "Data/Exercise3.8.csv" )

# scatter plot of y against x

plot( x = data.set$x , y = data.set$y , xlab = "연령(일)" , ylab = "체중(g)" )

# 단순회귀모형 y = b_0 + b_1 x + error
lm.result <- lm( formula = y ~ x , data = data.set )

plot( x = data.set$x , y = data.set$y , xlab = "연령(일)" , ylab = "체중(g)" )
abline( lm.result )

# 상관계수와 상관분석
cor( x = data.set$x , y = data.set$y )
cor.test( x = data.set$x , y = data.set$y )

# z변수 추가, z = log(y)
data.set$z <- log( data.set$y )

# 두개의 산점도를 나란히 그리기
op <- par( mfrow = c(1,2) ) # 그래픽 설정변경
# op: 설정바꾸기 전 그래픽 설정

plot( x = data.set$x , y = data.set$y , xlab = "연령(일)" , ylab = "체중(g)" )
plot( x = data.set$x , y = data.set$z , xlab = "연령(일)" , ylab = "log of 체중(g)" )

par( op ) # 원래 그래픽 설정으로 되돌림

# Note: 그래프에서 y축에 체중값의 로그값이 표시!

# 추천: y축을 log-scale로 그리는 방법

op <- par( mfrow = c(1,2) )

plot( x = data.set$x , y = data.set$y , xlab = "연령(일)" , ylab = "체중(g)" )
plot( x = data.set$x , y = data.set$y , xlab = "연령(일)" , ylab = "체중(g)" , log = "y" )

par( op )
# Note : 그래프에서 y축에 원래 체중값이 표시!

cor( x = data.set$x , y = data.set$y )
cor( x = data.set$x , y = data.set$z )

# end