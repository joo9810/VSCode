x <- c(5,2,4,7,1,8,2,5,7,1)
y <- c(78,31,62,110,15,125,25,66,98,12)

data.set <- data.frame(x = x, y = y)

# 1번
lm.result1 <- lm(formula = y ~ x, data = data.set) # 절편항이 있는 모형
lm.result2 <- lm(formula = y ~ 0 + x, data = data.set) # 절편항이 없는 모형

summary(lm.result1)$sigma
summary(lm.result2)$sigma
# 절편항이 없는 모형의 MSE가 더 작으므로 없는 모형을 선택하겠습니다.

# 2번
plot(lm.result2)
# 적합값이 커질 수록 분산이 커지는 경향이 보입니다.
# Q-Q plot 확인 시 정규성 가정은 어느 정도 만족하는 것으로 보입니다.
# 적합값이 커질 수록 분산이 커지는 경향이 보입니다.

# 따라서 모형의 등분산성이 의심됩니다.