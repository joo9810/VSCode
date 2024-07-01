# begin

data.set <- read.csv( "D:/R/Example7.1.csv" )

lm.result <- lm( formula = y ~ x1 + x2 , data = data.set )

confint( lm.result , level = 0.95 )

summary( lm.result )

# anova 함수를 이용한 분산분석
lm.result0 <- lm( y ~ 1 , data = data.set )
anova( lm.result0 , lm.result )

# 예측
new.data <- data.frame( x1 = 90 , x2 = 32 )

predict( lm.result , newdata = new.data )
predict( lm.result , newdata = new.data , interval = "confidence" )
predict( lm.result , newdata = new.data , interval = "prediction" )


# Example 8.4

# testing null hypothesis : beta_1 = beta_2

data.set$z <- data.set$x1 + data.set$x2

lm.result1 <- lm( formula = y ~ z , data = data.set )
lm.result2 <- lm( formula = y ~ x1 + x2 , data = data.set )

anova( lm.result1 , lm.result2 )
# 유의확률이 0.01351으로 귀무가설 기각
# 즉 beta_1과 beta_2는 같지 않다

# Example 8.6

data.set <- read.csv( "D:/R/Example8.6.csv" )

# testing null hypothesis : beta_2 = beta_3 = 0

lm.result1 <- lm( y ~ x1 , data = data.set )
lm.result2 <- lm( y ~ x1 + x2 + x3 , data = data.set )

anova( lm.result1 , lm.result2 )

# testsing null hypothesis : beta_2 = beta_3

data.set$z <- data.set$x2 + data.set$x3

lm.result1 <- lm( formula = y ~ x1 + z , data = data.set )
lm.result2 <- lm( formula = y ~ x1 + x2 + x3 , data = data.set )

anova( lm.result1 , lm.result2 )
# 유의확률이 0.1977으로 귀무가설 채택
# 즉 beta_2와 beta_3는 같다

# end