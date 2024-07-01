x1 <- c(4,4,6,6,8,8)
x2 <- c(2,6,2,6,2,6)
y <- c(64,81,72,91,83,96)

data <- data.frame(x1 = x1, x2 = x2, y = y)

lm.result1 <- lm(formula = y ~ x1, data = data)
lm.result1
lm.result2 <- lm(formula = y ~ x2, data = data)
lm.result2
lm.result3 <- lm(formula = y ~ x1 + x2, data = data)
lm.result3

lm.result4 <- lm(formula = x1 ~ x2, data = data)
lm.result5 <- lm(formula = x2 ~ x1, data = data)

data1 <- data.frame(z1 = residuals(lm.result2), z2 = residuals(lm.result4))

lm.result6 <- lm(formula = z1 ~ z2, data = data1)

lm.result3$coefficients
lm.result6$coefficients

data2 <- data.frame(z1 = residuals(lm.result1), z2 = residuals(lm.result5))

lm.result7 <- lm(formula = z1 ~ z2, data = data2)

lm.result7$coefficients
lm.result$coefficients

Example8.6 <- read.csv("Example8.6.csv", header = T)

lm(formula = y ~ x1, data = Example8.6)
lm(formula = y ~ x1 + x2 + x3, data = Example8.6)
cor(Example8.6$x1,Example8.6$x2)
cor(Example8.6$x1,Example8.6$x3)
cor(Example8.6$x2,Example8.6$x3)

Example8.6
full.md <- lm(formula = y ~ z, data = Example8.6)
reduced.md <- lm(formula = y ~ x1, data = Example8.6)
anova(reduced.md, full.md)
