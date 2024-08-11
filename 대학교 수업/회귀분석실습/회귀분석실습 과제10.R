x1 <- c(10,8,12,7,12,8,12,5,8,5,11,12,6,10,10)
x2 <- c(8,6,9,16,17,15,8,10,4,16,7,12,6,4,4)
x3 <- c(5.5,2.5,8,3,2.9,3.0,8,9,4,6.5,5.5,5,6,5,3.5)
y <- c(79,200,163,200,178,146,31,292,160,339,160,86,237,107,155)
data.set <- data.frame(x1 = x1, x2 = x2, x3 = x3, y = y)
data.set

library(leaps)
result <- regsubsets(y~., data = data.set)
summary.result <- summary(result) # all possible regression
summary.result$cp # 변수 2개를 사용했을 때가 적절
summary.result$adjr2 # 변수 2개를 사용했을 때가 적절
summary.result # x1, x2를 사용
best.model <- lm(y~x1+x2,data = data.set)
summary(best.model) # 최종 모형

lm.result <- lm(y~.,data = data.set)
fw <- step(lm.result, direction = 'forward') # forward selection
summary(fw)

bw <- step(lm.result, direction = 'backward') # backward elimination
summary(bw)

sw <- step(lm.result, direction = 'both') # stepwise regression
summary(sw)
