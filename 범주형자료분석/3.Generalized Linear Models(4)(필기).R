Evo <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Evolution.dat", header=TRUE)
Evo
n <- Evo$true + Evo$false
fit <- glm(true/n ~ ideology, family=binomial, weights=n, data=Evo)
# true/n : hat-pi, 종속변수: 이분형
summary(fit)
confint(fit)

install.packages('car')
library(car)
Anova(fit)

install.packages('statmod')
library(statmod)
fit0 <- glm(true/n ~ 1, family=binomial, weights=n, data=Evo)
glm.scoretest(fit0, Evo$ideology)^2
fit1 <- glm(true/n ~ 0, family=binomial, weights=n, data=Evo)
fit0; fit1
