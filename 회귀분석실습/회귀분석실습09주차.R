# begin

data.set <- read.csv( "Data/Exercise7.5.csv" )

lm.result <- lm( formula = y ~ x1 + x2 , data = data.set )


# interpretation of multiple regression coefficients

lm.result  <- lm( y ~ x1 + x2 , data = data.set )
lm.result1 <- lm( y ~ x1 , data = data.set )
lm.result2 <- lm( y ~ x2 , data = data.set )

lm.result$coefficients
lm.result1$coefficients
lm.result2$coefficients
# 중회귀모형에서 회귀계수가 단순회귀모형에서 회귀계수와 전혀 일치하지 않음!

with( data.set ,
      {
         plot( x1 , y )
         plot( x2 , y )
         plot( x1 , x2 ) # 설명변수끼리 관계가 있다.
      }
)
# 설명변수끼리의 관계에 의해서 회귀계수 해석이 간단하지 않음.
   
# x2를 설명변수로 하는 회귀모형 
lm.result1 <- lm( y  ~ x2 , data = data.set )
lm.result2 <- lm( x1 ~ x2 , data = data.set )

# 잔차: y와 x1의 총변동에서 x2에 의해 회귀모형으로 설명되고 남은 부분
z.data <- data.frame( z1 = residuals( lm.result1 ) , z2 = residuals( lm.result2 ) )

# y의 잔차를 x1의 잔차를 설명변수로 한 회귀모형
lm.result3 <- lm( z1 ~ z2 , data = z.data )
coefficients( lm.result3 )
# 절편항은 0! (why?)

# 중회귀모형의 회귀계수와 일치!!
lm.result3$coefficients[2]
lm.result$coefficients[2]



#------------------------------------------------------------------------------------------------------------
# illustration for partial correlation

set.seed(0)
x2 <- rep( 1:3 , each = 10 )
x1 <- rnorm(30,x2,1)
y  <- x1 + 3 * x2 + rnorm( 30 , 0.2 )


plot( x1 , y )

plot3d( x = x1 , y = x2 , z = y , xlab = "x1" , ylab = "x2" , zlab = "y" )

plot( x1 , y , col = rep( 1:3 , each = 10 ) , pch = 19 )

op <- par( mfrow = c(2,2) )
plot( x1 , y , col = rep( 1:3 , each = 10 ) , pch = 19 , main = "Overall" )
plot( x1[ x2 == 1 ] , y[ x2 == 1 ] , pch = 19 , col = 1 , xlab = "x1" , ylab = "y" , main = "x2 = 1" )
plot( x1[ x2 == 2 ] , y[ x2 == 2 ] , pch = 19 , col = 2 , xlab = "x1" , ylab = "y" , main = "x2 = 2" )
plot( x1[ x2 == 3 ] , y[ x2 == 3 ] , pch = 19 , col = 3 , xlab = "x1" , ylab = "y" , main = "x2 = 3" )
par( op )

lm.result1 <- lm( y ~ x2 )
lm.result2 <- lm( x1 ~ x2 )

op <- par( mfrow = c(1,2) )
plot( x2 , y )
abline( lm.result1 )
plot( x2 , x1 )
abline( lm.result2 )
par(op)


op <- par( mfrow = c(2,2))
plot( x2 , y , col = rep( 1:3 , each = 10 ) , pch = 20 , xlim = c(1,3.1) )
text( x = x2 , y = y , labels = 1:30 , pos = 4 )
abline( lm.result1 )
plot( x2 , x1 , col = rep( 1:3 , each = 10 ) , pch = 20 , xlim = c(1,3.1) )
abline( lm.result2 )
text( x = x2 , y = x1 , labels = 1:30 , pos = 4 )

plot( x2 , lm.result1$residuals , col = rep( 1:3 , each = 10 ) , pch = 20 , xlim = c(1,3.1) ,
      xlab = "x2" , ylab = "y adjusted by x2" )
abline( h = 0 , lty = 2 )
text( x = x2 , y = lm.result1$residuals , labels = 1:30 , pos = 4 )

plot( x2 , lm.result2$residuals , col = rep( 1:3 , each = 10 ) , pch = 20 , xlim = c(1,3.1) ,
      xlab = "x2" , ylab = "x1 adjusted by x2" )
abline( h = 0 , lty = 2 )
text( x = x2 , y = lm.result2$residuals , labels = 1:30 , pos = 4 )

par( op )

op <- par( no.readonly = T )
layout( matrix( data = c(1,3,2,3) , nrow = 2 ) )

plot( x2 , lm.result1$residuals , col = rep( 1:3 , each = 10 ) , pch = 20 , xlim = c(1,3.1) ,
      xlab = "x2" , ylab = "y adjusted by x2" )
abline( h = 0 , lty = 2 )
text( x = x2 , y = lm.result1$residuals , labels = 1:30 , pos = 4 )

plot( x2 , lm.result2$residuals , col = rep( 1:3 , each = 10 ) , pch = 20 , xlim = c(1,3.1) ,
      xlab = "x2" , ylab = "x1 adjusted by x2" )
abline( h = 0 , lty = 2 )
text( x = x2 , y = lm.result2$residuals , labels = 1:30 , pos = 4 )

plot( lm.result2$residuals , lm.result1$residuals , xlab = "x1 adjusted by x2" , ylab = "y adjusted by x2" ,
      col = rep( 1:3 , each = 10 ) , pch = NA )
abline( h = 0 , v = 0 , col = "grey" , lty = 2 )
text( lm.result2$residuals , lm.result1$residuals , labels = 1:30 , col = rep( 1:3 , each = 10 ) )
par( op )

op <- par( mfrow = c(1,2))
plot( x1 , y , col = rep( 1:3 , each = 10 ) , pch = 19 )
plot( lm.result2$residuals , lm.result1$residuals , xlab = "x1 adjusted by x2" , ylab = "y adjusted by x2" ,
      col = rep( 1:3 , each = 10 ) , pch = 19 )
par(op)

#---------------------------------------------------------------------------------------------------------------



# end