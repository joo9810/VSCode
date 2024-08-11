x <- c(1,2,3,4,5) ; y <- c(2,3,7,12,100) ; plot(x,y)
cor.test(x,y) ; cor.test(x,y,method = 'spearman')
#-------------------------------------------------
y1 <- c(72,68,33,47,65,67,60,90,98,55,61)
y2 <- c(82,66,80,94,88,75,66,84,95,50,68)
df <- data.frame(y1,y2) ; t.test(y1,y2,paired = T)

wilcox.test(y1,y2,paired = T)
#---------------------------------------------------
x <- c(rep(1,7),rep(2,4),rep(3,6))
y <- c(4.28,4.37,4.04,4.27,3.57,3.98,4.02,
       3.77,4.12,3.56,3.89,
       3.7,3.76,2.43,3.54,3.88,4.01)
anova(lm(y~factor(x)))

a <- c(4.28,4.37,4.04,4.27,3.57,3.98,4.02)
b <- c(3.77,4.12,3.56,3.89)
c <- c(3.7,3.76,2.43,3.54,3.88,4.01)
kruskal.test(list(a,b,c))

wilcox.test(a,b) ; wilcox.test(a,c) ; wilcox.test(b,c)

shapiro.test(a) ; shapiro.test(b) ; shapiro.test(c)
#------------------------------------------------
a <- matrix(c(20,5,15,5), nrow = 2)
chisq.test(a ,correct = F)
fisher.test(a)
#------------------------------------------
a <- c(0,1,2) ; b <- c(37,378,26) ; c <- c(146,438,25)
df <- data.frame(a,b,c)
fit <- glm(b/(b+c)~a,family = binomial,weights = (b+c),data = df)
summary(fit)
#-----------------------------------------
titanic <- read.csv('titanic.csv', header = T)
train <- titanic[1:600,] ; test <- titanic[601:889,]
model <- glm(Survived ~ Pclass + Sex + SibSp, 
             family = binomial, data = train)
summary(model)

fit <- predict(model,newdata = test, type = 'response')
fit <- ifelse(fit > 0.5, 1, 0)
actual <- factor(test$Survived)
pred <- factor(fit)
library(caret)
confusionMatrix(pred,actual,positive = '1')

library(Epi)
ROC(form = Survived ~ Pclass + Sex + SibSp, data = test)
