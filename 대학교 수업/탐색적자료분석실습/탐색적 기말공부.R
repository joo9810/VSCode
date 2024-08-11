# install.packages('graphics')
library(graphics)
str(sleep)
t.test(extra ~ group, data = sleep)
# H0: 그룹1과 그룹2의 평균 extra는 같다, H1: not H0
# 유의수준 0.05 하에서 귀무가설 채택

coag <- c(62,60,63,59,63,67,71,64,65,66,68,66,71,67,68,68,56,62,60,61,63,64,63,59)
diet <- factor(rep(LETTERS[1:4],c(4,6,6,8)))
coag.df <- data.frame(coag,diet)
aov.coag <- aov(coag ~ diet, data = coag.df)
summary(aov.coag)

lm.result <- lm(coag ~ diet, data = coag.df)
anova(lm.result)
# H0: diet별 혈액 응고시간에 차이가 없다, H1: not H0
# 유의수준 0.05 하에서 귀무가설 기각

setwd('J:/수업/2022학년도/탐색적자료분석실습')
world.temp <- read.table('worldTemperature_Mean.txt', header = T)
twoway.model <- medpolish(world.temp) # 중앙값 다듬기
str(twoway.model)
attach(twoway.model)
a <- matrix(row,ncol=1) # 행효과
b <- matrix(col,nrow=1) # 열효과
comparison <- a%*%b/overall # 비교값 = 행효과*열효과/공통값
plot(residuals ~ comparison) # 비교값과 잔차의 관계를 확인
# 비교값이 증가할 때 잔차가 감소하는 경향을 보이므로 가법적 모형이 적절하지 않다
# 또한 기울기가 1이 아니므로 승법적 모형도 적절하지 않다
# (가법적 모형이 되려면 어떠한 경향성을 보이면 안됨)
boxplot(residuals)
round(residuals[order(row),],1)

consumption <- read.table('household.txt', header = T)
twoway.out <- medpolish(consumption) # 중앙값 다듬기
twoway.out
# row Effects(연도별 효과) 확인 시 1998년에 급격한 감소가 있었다
# col Effects(소비부문별 효과) 확인 시 식료품, 기타소비, 교통통신, 교육 순으로 높다
# residuals(잔차) 확인 시 연도에 걸쳐 교육과 교통통신이 비교적 증가세를 보임

attach(twoway.out)
a <- matrix(row,ncol=1)
b <- matrix(col,nrow=1)
comparison <- a%*%b/overall
plot(residuals ~ comparison)
# 그래프의 기울기가 거의 1에 가까워 승법적 모형이 적절