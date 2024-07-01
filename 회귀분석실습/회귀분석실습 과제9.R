# 1번
y <- c(40,50,62,68,86,102,116,124)
x1 <- c(2,2,2,4,4,2,6,5)
x2 <- c('고졸','고졸','고졸','고졸','대졸','고졸','대졸','고졸')
data.set <- data.frame(y = y, x1 = x1, x2 = x2)
data.set$x2 <- factor(data.set$x2, levels = c('대졸','고졸'))
lm.result1 <- lm(formula = y ~ x1 + x2 + x1:x2 , data = data.set)
summary(lm.result1) # 교호작용의 유의확률이 가장 큼
lm.result2 <- lm(formula = y ~ x1 + x2, data = data.set)
summary(lm.result2) # x2의 유의확률이 가장 큼
lm.result3 <- lm(formula = y ~ x1, data = data.set)
summary(lm.result3) # 절편항이 유의하지 않음
lm.result4 <- lm(formula = y ~ 0 + x1, data = data.set)
summary(lm.result4) # 최종모형으로 선택

# 2번
x <- c(20,20,20,40,40,40,60,60,60)
y <- c(86,80,77,78,84,75,33,38,43)
data.set2 <- data.frame(x = x, y = y)
data.set2$z1 <- ifelse(data.set2$x == 40, 1, 0)
data.set2$z2 <- ifelse(data.set2$x == 60, 1, 0)
lm(formula = y ~ z1 + z2, data = data.set2)

# 3번
x <- c(285,264,276,302,248,296,274,284,253,269)
y <- c(1,0,0,1,1,0,1,0,1,1)
data.set3 <- data.frame(x = x, y = y)
glm.result <- glm(formula = y ~ x, family = binomial, data = data.set3)
newdata <- data.frame(x = 290)
predict(glm.result, newdata = newdata, type = 'response')

# 4번
x <- c(1,2,3,4,5,6)
n <- c(250,252,151,204,202,195)
y <- c(15,20,18,25,32,41)
data.set4 <- data.frame(x = x, n = n, y = y)
data.set4$z <- data.set4$n - data.set4$y
glm.result2 <- glm(formula = cbind(y,z) ~ x, family = binomial, data = data.set4)
summary(glm.result2)
newdata <- data.frame(x = c(1,2,3,4,5,6))
predict(glm.result2, newdata = newdata, type = 'response')