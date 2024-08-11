x <- c(5,2,4,7,1,8,2,5,7,1)
y <- c(78,31,62,110,15,125,25,66,98,12)

data.set <- data.frame(x = x, y = y)

# 1번 산점도
plot(data.set$x, data.set$y)

# 2번 회귀계수 추정
lm.result <- lm(formula = y ~ x, data = data.set)
lm.result

# 2번 오차항의 표준편차 추정
anova.table <- anova(lm.result)
MSE <- anova.table$`Mean Sq`[2]
sqrt(MSE)

# 3번 회귀계수 유의성 검정
summary(lm.result)

# 4번
beta0_hat <- lm.result$coefficients[2]
t <- qt(0.975,8)
sigma_hat <- sqrt(MSE)
Sxx <- sum((x-mean(x))^2)
c(beta0_hat - t*sigma_hat/sqrt(Sxx), beta0_hat + t*sigma_hat/sqrt(Sxx))
confint(lm.result) # confint 함수 이용

# 5번 x가 10일 때의 y에 대한 95% 예측구간
new.data   <- data.frame( x = 10 )
predict( lm.result , newdata = new.data , level = 0.95 , interval = "prediction" )