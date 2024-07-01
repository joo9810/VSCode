# begin

# 적합결여검정
data.set <- read.csv( "Data/Exercise8.10.csv" )

data.set$z <- factor( c( 1 , 1 , 2 , 2 , 3 , 3 , 4 , 4 ) )

lm.result1 <- lm( y ~ x1 + x2 , data = data.set ) # 축소모형
lm.result2 <- lm( y ~ z , data = data.set )       # 완전모형

anova( lm.result1 , lm.result2 )

# VIF
data.set <- read.csv( "Data/Example8.8.csv" )
lm.result <- lm( y ~ x1 + x2 , data = data.set )

lm.result1 <- lm( x1 ~ x2 , data = data.set )
lm.result2 <- lm( x2 ~ x1 , data = data.set )
vif1 <- 1/(1-summary( lm.result1 )$r.squared)
vif2 <- 1/(1-summary( lm.result2 )$r.squared)

lm.result3 <- lm( y ~ x2 , data = data.set )

# 결정계수의 비교
summary( lm.result  )$r.square
summary( lm.result3 )$r.square

summary( lm.result  )$adj.r.square
summary( lm.result3 )$adj.r.square

# 영향점
data.set <- read.csv( "Data/Example8.9.csv" )
lm.result <- lm( y ~ x , data = data.set )
cooks.distance( lm.result ) 
critical <- qf( 0.5 , 2 , 19 ) 
which( cooks.distance( lm.result ) > critical )
plot( lm.result , cook.levels = critical )

with( data.set ,
      {
        plot( x , y )
        lm.result1 <- lm( y ~ x , subset = -18 )
        abline( lm.result )
        abline( lm.result1 , col = "red" )
      }
)



# end