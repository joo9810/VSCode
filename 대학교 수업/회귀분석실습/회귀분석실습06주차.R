# begin

# 적합결여검정

data.set <- read.csv( "J:/수업/2022학년도/회귀분석실습/Example5.2.csv" )

data.set$dur.level <- factor( data.set$duration )

is.factor( data.set$duration )
is.factor( data.set$dur.level )

full.lm    <- lm( formula = wage ~ dur.level , data = data.set )
reduced.lm <- lm( formula = wage ~ duration  , data = data.set )

full.lm
reduced.lm

plot( x = data.set$duration , y = data.set$wage , xlab = "교육기간(주)" , ylab = "초임 임금" )
abline( reduced.lm )
points( x = data.set$duration , y = full.lm$fitted.values , pch = 19 )

anova( reduced.lm , full.lm )


# 변수변환

data.set <- read.csv( "Data/Exercise3.8.csv" )

op <- par( mfrow = c(1,2) )

plot( x = data.set$x , y = data.set$y , xlab = "연령(day)" , ylab = "체중(g)" )
plot( x = data.set$x , y = data.set$y , log = "y" , xlab = "연령(day)" , ylab = "체중(g)" )

par( op )

data.set$z <- log( data.set$y )

lm.result1 <- lm( formula = y ~ x , data = data.set )
lm.result2 <- lm( formula = z ~ x , data = data.set )

summary( lm.result1 )
summary( lm.result2 )

summary( lm.result1 )$r.squared
summary( lm.result2 )$r.squared

# 잔차그림
plot( lm.result1 )
plot( lm.result2 )


# 절편항이 없는 회귀모형
data.set <- read.csv( "Data/Exercise6.2.csv" )

lm.result <- lm( formula = y ~ x - 1 , data = data.set )

summary( lm.result )

plot( lm.result )

# end