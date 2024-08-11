data.set <- matrix(c(84,26,2,4), nrow = 2)
data.set
fisher.test(data.set)

library(epitools)
ormidp.test(84,2,26,4, or = 1)
or.midp(c(84,2,26,4), conf.level = 0.95)
#--------------------------------------------
data.set <- matrix(c(822,66,752,136), nrow = 2)
prop.test(c(822,66),c(1574,202), conf.level = 0.95, correct = F)
oddsratio.wald(data.set)
0.5222363 / 0.3267327
oddsratio.wald(data.set, conf.level = 0.99, correction = F)
#--------------------------------------------
library(dplyr)
x <- c(0,1,2,3,4)
y1 <- c(63,54,101,43,33)
y0 <- c(47,38,133,62,59)
data.set <- data.frame(x,y1,y0)
glm.result1 <- glm(y1/(y1+y0) ~ x, family = binomial, weights = (y1+y0), data = data.set)
glm.result1

glm.result2 <- glm(y1/(y1+y0) ~ x, family = quasi(variance = "mu(1-mu)"), weights = (y1+y0), data = data.set)
glm.result2
fitted(glm.result1)
fitted(glm.result2)
#---------------------------------------------
MF <- read.csv('Mine_Fracture.csv')
a <- glm(y ~ x1 + x2, family = poisson(link = log), data = MF)
b <- glm(y ~ 1, family = poisson(link = log), data = MF)
anova(b,a,test = 'F')

summary(a)

c <- glm(y ~ x1, family = poisson(link = log), data = MF)
summary(c)
1-pchisq(74.984, 43)
1-pchisq(48.620, 42)
#---------------------------------------------
df <- read.csv('dataset.csv', header = T)
glm.result <- glm(status ~ ., family = binomial, data = df)
glm.result
confint(glm.result, level = 0.9)
summary(glm.result)

a <- glm(status ~ extent + nodes, family = binomial, data = df)
b <- glm(status ~ nodes, family = binomial, data = df)
c <- glm(status ~ extent, family = binomial, data = df)
anova(b,a) ; anova(c,a)
predict(a, newdata = data.frame(nodes = 20, extent = 1), type = 'response')
#-------------------------------------------
library(MASS) ; library(dplyr) ; data('Pima.te')
Pima.te$type <- ifelse(Pima.te$type == 'Yes', 1, 0)
prop <- sum(Pima.te$type)/nrow(Pima.te) ; prop
glm.result <- glm(type ~ glu, family = binomial, data = Pima.te)
predicted <- as.numeric(fitted(glm.result) > prop)
table(observed = Pima.te$type, predicted)
72/(37+72) ; 170/(170+53) # 민감도와 특이도도

library(Epi) ; ROC(form = type ~ bp + bmi, data = Pima.te)
