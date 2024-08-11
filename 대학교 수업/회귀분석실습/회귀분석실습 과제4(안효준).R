# 문제 1번
x <- c(20, 20, 20, 40, 40, 40, 60, 60, 60)
y <- c(86, 80, 77, 78, 84, 75, 33, 38, 43)

df <- data.frame(x = x, y = y)

df$z <- factor(df$x)
str(df)

full.lm <- lm(formula = y ~ z, data = df)
reduced.lm <- lm(formula = y ~ x, data = df)

anova(reduced.lm, full.model)

# 문제 2번 (1)
a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
b <- c(170, 106, 92, 80, 69, 47, 45, 30, 28, 18)

df1 <- data.frame(x = a, y = b)

summary(lm(formula = y ~ x, data = df1))$r.squared
summary(lm(formula = log(y) ~ x, data = df1))$r.squared
summary(lm(formula = y ~ log(x), data = df1))$r.squared
summary(lm(formula = log(y) ~ log(x), data = df1))$r.squared

# 문제 2번 (2)
# 최종적으로 y ~ log(x) 모형을 선택
lm.result <- lm(formula = y ~ log(x), data = df1)
lm.result

# 문제 2번 (3)
newdt <- data.frame(x = 11)
predict(lm.result, newdata = newdt, level = 0.95, interval = "prediction")