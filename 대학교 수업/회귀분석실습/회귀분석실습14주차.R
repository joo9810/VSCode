# begin

# 설명변수 중에 지시변수가 있는 경우
data.set <- read.csv( "Data/Example11.1.csv" )

install.packages( "leaps")

library(leaps)

# all possible regression
result         <- regsubsets( y ~ x1 + x2 + x3 + x4 , data = data.set )
summary.result <- summary( result )

summary.result$cp

summary.result$adjr2

best.model <- lm( y ~ x1 + x3 + x4 , data = data.set )


# backward, forward, stepwise

lm.result <- lm( y ~ . , data = data.set )
fw <- step( lm.result , direction = "forward" )
bw <- step( lm.result , direction = "backward" )
sw <- step( lm.result , direction = "both" )

summary(fw)
summary(bw)
summary(sw)

# end