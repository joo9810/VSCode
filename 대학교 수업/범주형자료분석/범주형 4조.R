## 1. production 예제 ##
data.set <- read.csv("production.csv")
data.set

# production.csv를 불러들였을 때 y의 변수이름이 깨지는 경우
names(data.set)[1] <- "y"

# 설명변수 x1, x2를 모두 사용한 모형이 적합한가를 검정
# 절편항만 있는 모형 (y ~ 1)
fit <- glm(y ~ 1, family = poisson(link = log), data = data.set)
# 설명변수 x1, x2 둘 다 사용한 모형 (y ~ x1 + x2)
fit0 <- glm(y ~ x1 + x2, family = poisson(link = log), data = data.set)
anova(fit, fit0, test = "F") # 유의확률이 매우 작아 귀무가설 기각
# H_0: 모형이 적합하지 않다. H_0: 모형이 적합하다.
# 적합하지 않으면 뒤의 분석이 의미가 없기 때문에 적합해야 함

# 왈드 검정(Wald test)
# 설명변수 x1, x2 둘 다 사용한 모형
summary(fit0) # 모든 계수가 유의하다
# 따라서 적합값은 hat-mu = exp(2.256+0.041*x1+0.035*x2)

0.040928/0.001472 # x1에 대한 왈드 검정통계량
0.035328/0.007797 # x2에 대한 왈드 검정통계량

# 설명변수 x1만 사용한 모형
fit1 <- glm(y ~ x1, family = poisson(link = log), data = data.set)
summary(fit1) # 모든 계수가 유의하다
# 반응시간(x1)이 생산량(y)에 영향을 미친다고 할 수 있다

# 설명변수 x2만 사용한 모형
fit2 <- glm(y ~ x2, family = poisson(link = log), data = data.set)
summary(fit2) # 모든 계수가 유의하다
# 온도(x2)가 생산량(y)에 영향을 미친다고 할 수 있다

# 가능도비 검정
library(car)

# 설명변수 x1, x2 둘 다 사용한 모형
Anova(fit0) # 모든 계수가 유의하다
# 반응시간(x1)과 온도(x2)가 생산량(y)에 영향을 미친다고 할 수 있다

## 2. mtcars 예제 ##
cars <- mtcars
nrow(cars) #행의 수
ncol(cars) #열의 수
head(cars)

# 모형 적합성 검정
# 실리콘 수와 drat(후방차축 비율), mpg(연비)
# 설명 변수 drat, mpg 둘 다 사용한 모형
mt <- glm(cyl~mpg+drat,family=poisson(link=log), data=cars)
# 절편항만 있는 모형
mt_null <- glm(cyl~1,family=poisson(link=log),data=cars)
anova(mt,mt_null, test="F")

# 왈드 검정(wald test)
# 설명변수 mpg, drat 둘 다 사용한 모형
mt <- glm(cyl~mpg+drat,family=poisson(link=log), data=cars)
summary(mt) # drat은 y에 영향을 미친다고 할 수 없다

# 위 결과에서 drat(x2)이 유의하지 않다고 나와서 바로 결론을 내릴 수 있으나 수업시간
# 에 배운내용을 활용하기 위해 이탈도 통계량으로 검정해보기로 결정

# 완전모형의 가능도비 검정
library(car)
Anova(mt) # drat이 y에 영향을 미친다고 할 수 없다

# 설명변수 mpg만 사용한 모형
# 실리콘 수(y)와 mpg(x1)
mt3 <- glm(cyl~mpg,family=poisson(link=log), data=cars)
summary(mt3) # 절편항과 mpg는 y에 영향을 미친다고 할 수 있다

# mpg(x1)의 가능도비 검정
Anova(mt3)

# 설명변수 drat만 사용한 모형
# 실리콘 수(y)와 drat(x2)
mt2<- glm(cyl~drat,family=poisson(link=log), data=cars)
summary(mt2) # 모든 계수가 유의하다
# 절편항과 drat은 y에 영향을 미친다고 할 수 있다 

# drat(x2)의 가능도비 검정
Anova(mt2)

# 이탈도 통계량
# 완전모형
summary(mt)

##상수항만 가지는 귀무가설 하에서의 모형이탈도
pchisq(16.5743,31,lower.tail=FALSE)
# 귀무가설 채택 (모형이 자료를 잘 적합)

##적합된 모형의 이탈도
pchisq(3.8742,29,lower.tail=FALSE)
# 귀무가설 채택 (모형이 자료를 잘 적합)

#실리콘 수(y)와 mpg(x1) - 내포모형
summary(mt3)

##적합된 모형의 이탈도
pchisq(4.2822,30,lower.tail=FALSE)
# 귀무가설 채택 (모형이 자료를 잘 적합)

# 내포모형(설명변수 mpg만 사용)과 완전모형의 모형 비교
4.2822-3.8742 # 카이제곱통계량

pchisq(4.2822-3.8742,1,lower.tail=FALSE)
# 귀무가설 채택 (모형 간의 차이가 없다)

# 최종 모형 선택
# 완전모형(mpg, drat)과 내포모형(mpg) 두 모형 간의 차이가 없으므로 모수가 적은 모형이 더 좋은 모형이다.
# 즉, 최종 모형으로 mpg(x2)만 사용한 모형이 적합하다.

## 연습문제 ##

# 데이터 프레임 생성
MF <- read.csv("Mine_Fracture.csv")
head(MF)

# x1, x2 모두 사용한 모형
fit_MF <- glm(y ~ x1 + x2, family = poisson(link = log), data = MF)
# 절편항만 있는 모형
fit_MF_Null <- glm(y ~ 1, family = poisson(link = log), data = MF)
anova(fit_MF_Null, fit_MF, test = "F")
# H_0: 모형이 적합하지 않다, H_1: 모형이 적합하다
# 유의확률이 0.05보다 작으므로 모형이 적합하다

summary(fit_MF) # x2가 유의하지 않다
# x2는 y에 영향을 미친다고 할 수 없다

fit_MF1 <- glm(y ~ x1, family = poisson(link = log), data = MF)
summary(fit_MF1)
# H_0: 모형이 자료를 잘 적합한다, H_1: 잘 적합하지 않는다

pchisq(74.984, 43, lower.tail = FALSE)
# 모형이 자료를 잘 적합하지 못한다 (Null 모형)
pchisq(48.620, 42, lower.tail = FALSE)
# 모형이 자료를 잘 적합한다 (x1만 있는 모형)

summary(fit_MF1)
summary(fit_MF)

pchisq(1.033, 1, lower.tail = FALSE)
# H_0: 모형간의 차이가 없다, H_1: 차이가 있다
# 유의확률이 0.3094로 유의수준 0.05보다 크므로 귀무가설을 기각하지 못하여 두 모형간의 차이는 없다

# 두 모형간의 유의미한 차이가 없으므로 모수가 적은 모형이 더 좋은 모형 (fit_MF1)
# 최종모형: log(hat-mu) = -3.32859 + 0.05234*x1