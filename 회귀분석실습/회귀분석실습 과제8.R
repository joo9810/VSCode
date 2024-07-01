x <- c(25,6,8,5,1,24,17,1,13,14)
y <- c(10.1,2.9,3.0,1.8,0.1,9.4,6.9,0.3,5.1,6.0)
data.set <- data.frame(x = x, y = y)
lm.result1 <- lm(formula = y ~ x, data = data.set)
anova(lm.result1)

data.set$x2 <- data.set$x^2
lm.result2 <- lm(formula = y ~ x + x2, data = data.set)
anova(lm.result1, lm.result2)

data.set$x3 <- data.set$x^3
lm.result3 <- lm(formula = y ~ x + x2 + x3, data = data.set)
anova(lm.result2, lm.result3)

y <- c(6.92,2.98,7.08,2.62,2.98,2.6,2.42,16.50,17.32,16.21)
x1 <- c(31,30,31.5,31,30,31.5,31.5,30.5,30.5,31.5)
x2 <- c(22,21,21.5,21.5,21.5,20.5,20.5,24.5,24,24)
data.set <- data.frame(y = y, x1 = x1, x2 = x2)
data.set$z1 <- data.set$x1^2
data.set$z2 <- data.set$x2^2
data.set$x12 <- data.set$x1 * data.set$x2
lm(formula = y ~ x1 + x2 + z1 + z2 + x12, data = data.set)

lm.result1 <- lm(formula = y ~ x1 + x2 + z1 + z2, data = data.set)
lm.result2 <- lm(formula = y ~ x1 + x2 + z1 + z2 + x12, data = data.set)
anova(lm.result1,lm.result2)
summary(lm.result2)$coefficients

lm.result3 <- lm(formula = y ~ x1 + x2 + z1 + x12, data = data.set)
summary(lm.result3)$coefficients

lm.result4 <- lm(formula = y ~ x1 + x2 + z1, data = data.set)
summary(lm.result4)$coefficients

lm.result5 <- lm(formula = y ~ 0 + x1 + x2 + z1, data = data.set)
summary(lm.result5)$coefficients

summary(lm.result5)$adj.r.squared
summary(lm.result4)$adj.r.squared
summary(lm.result3)$adj.r.squared
summary(lm.result2)$adj.r.squared
summary(lm.result1)$adj.r.squared

lm.result5
