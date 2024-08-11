x1 <- c(4,4,6,6,8,8)
x2 <- c(2,6,2,6,2,6)
y <- c(64,81,72,91,83,96)
data.set <- data.frame(x1 = x1, x2 = x2, y = y)

lm.result <- lm(formula = y ~ x1, data = data.set)
summary(lm.result)

lm.result2 <- lm(formula = y ~ x2, data = data.set)
summary(lm.result2)

lm.result3 <- lm(formula = y ~ x1 + x2, data = data.set)
summary(lm.result3)

lm.result4 <- lm(formula = x1 ~ x2, data = data.set)
summary(lm.result4)

data.set2 <- data.frame(z1 = residuals(lm.result2), z2 = residuals(lm.result4))
lm.result5 <- lm(formula = z1 ~ z2, data = data.set2)
lm.result5

lm.result6 <- lm(formula = x2 ~ x1, data = data.set)
data.set3 <- data.frame(z1 = residuals(lm.result), z2 = residuals(lm.result6))
lm.result7 <- lm(formula = z1 ~ z2, data = data.set3)
lm.result7
#-----------------------------------
Example8.6 <- read.csv('Example8.6.csv', header = T)
lm.result <- lm(formula = y ~ x1, data = Example8.6)
summary(lm.result)

lm.result2 <- lm(formula = y ~ x1 + x2 + x3, data = Example8.6)
summary(lm.result2)

cor(Example8.6$x1, Example8.6$x2)
cor(Example8.6$x1, Example8.6$x3)
cor(Example8.6$x2, Example8.6$x3)
#------------------------------------
x1 <- c(175,210,192,250,245,226,260,230,205,185)
x2 <- c(15,18,20,28,25,21,32,25,24,19)
y <- c(120.4,112.5,95.4,162.3,160.2,131.5,157.6,158.4,149.6,130.4)

data.set <- data.frame(x1 = x1, x2 = x2, y = y)
lm.result <- lm(formula = y ~ x1 + x2, data = data.set)
reduced.lm <- lm(formula = y ~ 1, data = data.set)
full.lm <- lm(formula = y ~ x1 + x2, data = data.set)
anova(reduced.lm, full.lm)

confint(full.lm, level = 0.95)

summary(lm.result)

newdata <- data.frame(x1 = 200, x2 = 20)
predict(lm.result, newdata = newdata, level = 0.95, interval = 'confidence')

data.set$z <- data.set$x1 + data.set$x2
reduced.lm2 <- lm(formula = y ~ z, data = data.set)
anova(reduced.lm2, full.lm)

newdata2 <- data.frame(x1 = 240, x2 = 30)
predict(lm.result, newdata = newdata2, level = 0.95, interval = 'prediction')
#-------------------------------------
x <- c(25,6,8,5,1,24,17,1,13,14)
y <- c(10.1,2.9,3.0,1.8,0.1,9.4,6.9,0.3,5.1,6.0)
data.set <- data.frame(x = x, y = y)
lm.result <- lm(formula = y ~ x, data = data.set)
anova(lm.result)
data.set$x2 <- data.set$x^2
lm.result2 <- lm(formula = y ~ x + x2, data = data.set)
anova(lm.result, lm.result2)

data.set$x3 <- data.set$x^3
lm.result3 <- lm(formula = y ~ x + x2 + x3, data = data.set)
anova(lm.result2, lm.result3)
#-------------------------------------
y <- c(6.92,2.98,7.08,2.62,2.98,2.6,2.42,16.50,17.32,16.21)
x1 <- c(31,30,31.5,31,30,31.5,31.5,30.5,30.5,31.5)
x2 <- c(22,21,21.5,21.5,21.5,20.5,20.5,24.5,24,24)
data.set <- data.frame(y = y, x1 = x1, x2 = x2)
data.set$z1 <- data.set$x1^2
data.set$z2 <- data.set$x2^2
lm.result <- lm(formula = y ~ x1 + x2 + z1 + z2 + x1:x2, data = data.set)
summary(lm.result)

lm.result1 <- lm(formula = y ~ x1 + x2 + z1 + z2, data = data.set)
anova(lm.result1, lm.result)
#--------------------------------------
y <- c(40,50,62,68,86,102,116,124)
x1 <- c(2,2,2,4,4,2,6,5)
x2 <- c('고졸','고졸','고졸','고졸','대졸','고졸','대졸','고졸')
data.set <- data.frame(y = y, x1 = x1, x2 = x2)
data.set$x2 <- factor(data.set$x2, levels = c('대졸','고졸'))
lm.result <- lm(formula = y ~ x1 + x2 + x1:x2, data = data.set)
summary(lm.result)
lm.result2 <- lm(formula = y ~ 0 + x1, data = data.set)
summary(lm.result2)
#---------------------------------------
x <- c(20,20,20,40,40,40,60,60,60)
y <- c(86,80,77,78,84,75,33,38,43)
data.set <- data.frame(x = x, y = y)
data.set$z1 <- ifelse(data.set$x == 40, 1, 0)
data.set$z2 <- ifelse(data.set$x == 60, 1, 0)
lm(formula = y ~ z1 + z2, data = data.set)

x <- c(285,264,276,302,248,296,274,284,253,269)
y <- c(1,0,0,1,1,0,1,0,1,1)
data.set2 <- data.frame(x = x, y = y)
glm.result <- glm(formula = y ~ x, family = binomial, data = data.set2)
newdata <- data.frame(x = 290)
predict(glm.result, newdata = newdata, type = 'response')
#----------------------------------------
x <- c(1,2,3,4,5,6)
n <- c(250,252,151,204,202,195)
y <- c(15,20,18,25,32,41)
data.set <- data.frame(x = x, n = n, y = y)
glm.result <- glm(formula = cbind(y,n-y) ~ x, family = binomial, data = data.set)
summary(glm.result)

newdata <- data.frame(x = c(1,2,3,4,5,6))
predict(glm.result, newdata = newdata, type = 'response')
#-----------------------------------
x1 <- c(10,8,12,7,12,8,12,5,8,5,11,12,6,10,10)
x2 <- c(8,6,9,16,17,15,8,10,4,16,7,12,6,4,4)
x3 <- c(5.5,2.5,8,3,2.9,3.0,8,9,4,6.5,5.5,5,6,5,3.5)
y <- c(79,200,163,200,178,146,31,292,160,339,160,86,237,107,155)
data.set <- data.frame(x1 = x1, x2 = x2, x3 = x3, y = y)
library(leaps)
result <- regsubsets(y ~ ., data = data.set)
summary.result <- summary(result)
summary.result$cp
summary.result$adjr2
best.model <- lm(formula = y ~ x1, data = data.set)
summary(best.model)

lm.result <- lm(formula = y ~ ., data = data.set)
fw <- step(lm.result, direction = 'forward')
summary(fw)

bw <- step(lm.result, direction = 'backward')
summary(bw)

sw <- step(lm.result, direction = 'both')
summary(sw)
