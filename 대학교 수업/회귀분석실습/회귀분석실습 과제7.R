x1 <- c(175,210,192,250,245,226,260,230,205,185)
x2 <- c(15,18,20,28,25,21,32,25,24,19)
y <- c(120.4,112.5,95.4,162.3,160.2,131.5,157.6,158.4,149.6,130.4)

tens <- data.frame(x1 = x1, x2 = x2, y = y)

reduced.lm <- lm(formula = y ~ 1, data = tens)
full.lm <- lm(formula = y ~ x1 + x2, data = tens)
anova(reduced.lm, full.lm)

confint(full.lm)

summary(full.lm)

newdata <- data.frame(x1 = 200, x2 = 20)
predict(full.lm, newdata = newdata, level = 0.95, interval = 'confidence')

tens$z <- tens$x1 + tens$x2

reduced.lm1 <- lm(formula = y ~ z, data = tens)
full.lm1 <- lm(formula =  y ~ x1 + x2, data = tens)
anova(reduced.lm1, full.lm1)

newdata1 <- data.frame(x1 = 240, x2 = 30)
predict(full.lm, newdata = newdata1, level = 0.95, interval = 'prediction')
