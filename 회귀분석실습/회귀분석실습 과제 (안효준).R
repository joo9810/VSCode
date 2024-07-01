setwd("D:/R")
ton <- read.csv("ton.csv",header = T)
# 산점도
plot(x=ton$X,y=ton$Y, xlab = "평균온도",ylab = "석탄소비량(ton)")

x <- ton$X
y <- ton$Y
# 회귀계수 추정
ton_lm <- lm(formula = y~x, data = ton)
ton_lm
# 추정된 회귀 직선 그림
abline(ton_lm)

df <- data.frame(x=50)
# y의 평균에 대한 95% 예측구간
predict(ton_lm, newdata = df, level = 0.95, interval = "confidence")
# y의 값에 대한 95% 예측구간
predict(ton_lm, newdata = df, level = 0.95, interval = "prediction")
