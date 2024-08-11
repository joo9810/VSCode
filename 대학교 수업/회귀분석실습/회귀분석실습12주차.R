# begin

# 설명변수 1개 다항회귀
data.set <- read.csv( "Data/Example9.1.csv" )
data.set$x2 <- (data.set$x)^2

lm.result1 <- lm( formula = y ~ x , data = data.set )
anova( lm.result1 )

lm.result2 <- lm( formula = y ~ x + x2 , data = data.set )
anova( lm.result1 , lm.result2 )


# 설명변수 2개 다항회귀
data.set <- read.csv( "Data/Example9.2.csv" )

data.set$z1 <- ( data.set$x1 )^2
data.set$z2 <- ( data.set$x2 )^2
data.set$z12 <- data.set$x1 * data.set$x2

lm.result1 <- lm( formula = y ~ x1 + x2 + z1 + z2 , data = data.set )
lm.result2 <- lm( formula = y ~ x1 + x2 + z1 + z2 + z12 , data = data.set )

# 교차항의 유의성
# 아래 두 검정은 사실상 같다!
summary( lm.result2 )
anova( lm.result1 , lm.result2 )


# 제곱항의 유의성
summary( lm.result1 )

lm.result3 <- lm( formula = y ~ x1 + x2 + z1 , data = data.set )


# optional
# 반응표면그리기

# 3D plot
# install.packages("rgl") # not need if already installed.
library(rgl)

x1 <- seq( 19 , 56 , length.out = 500 )
x2 <- seq( 1  , 10 , length.out = 500 )

x1 <- rep( x1 , each = 500 )
x2 <- rep( x2 )
y  <- -49.6181 + 1.3444 * x1 + 3.6941 * x2 + 0.0459 * ( x1 )^2

plot3d( x = x1 , y = x2 , z = y , 
        xlab = "x1" , ylab = "x2" , zlab = "y" )




# end