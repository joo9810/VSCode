# 생활수준과 정당가입의 관계를 분할한 여론조사 결과
정치성향<-c("매우민주적","약간민주적","중도","약간보수적","매우보수적")
생활수준하<-c(44,47,118,23,32)
생활수준상<-c(18,28,86,39,48)
survey<-data.frame(정치성향,생활수준하,생활수준상)
survey

# Logit
library(dplyr)
survey$x<-recode(survey$정치성향,매우민주적=0,약간민주적=1,중도=2,약간보수적=3,매우보수적=4)
n<-survey$생활수준하+생활수준상
survey_fit1 <- glm(생활수준상/n ~ x, family=binomial(link=logit), weights=n, data=survey)
survey_fit1

anova(survey_fit1,test="F") # 유의함 (b0, b1가 모두 0은 아니다)
summary(survey_fit1) # 회귀계수가 유의함
fitted(survey_fit1)

survey_fit2 <- glm(생활수준상/n ~ x, family=quasi(link=identity,
                                             variance="mu(1-mu)"),weights=n, data=survey)
survey_fit2

anova(survey_fit2,test="F") # 유의함 (b0, b1가 모두 0은 아니다)
summary(survey_fit2, dispersion=1) # 회귀계수가 유의함
fitted(survey_fit2)


# 학력에 따른 당뇨병 발병 실태
학력<-c("고등학교미만","고등학교졸업","대학교재학","대학교졸업")
당뇨병있음<-c(33,25,20,17)
당뇨병없음<-c(218,389,393,178)
mellitus<-data.frame(학력,당뇨병있음,당뇨병없음)
mellitus

# Logit
mellitus$x<-recode(mellitus$학력,고등학교미만=0,고등학교졸업=1,대학교재학=2,대학교졸업=3)
n<-mellitus$당뇨병있음+당뇨병없음
mellitus_fit1 <- glm(당뇨병있음/n ~ x, family=binomial(link=logit), weights=n, data=mellitus)
mellitus_fit1

anova(mellitus_fit1,test="F")
summary(mellitus_fit1)
fitted(mellitus_fit1)

# GLM - ML방법
mellitus_fit2 <- glm(당뇨병있음/n ~ x, family=quasi(link=identity,
                                                   variance="mu(1-mu)"),weights=n, data=mellitus)
mellitus_fit2

anova(mellitus_fit2,test="F")
summary(mellitus_fit2, dispersion=1) # 정규분포로 적합하기 위해 dispersion=1
fitted(mellitus_fit2)

accident <- read.csv("accident.csv",header=TRUE )
accident$count <- 1:72
accident
plot(acci ~ count, data=accident)
fit <- glm(acci ~ count, family=poisson(link=log), data = accident)
anova(fit,test="F") # 모형이 유의하다
summary(fit) # 회귀계수가 모두 유의하다

library(gam)
gam.fit <- gam(acci ~ s(count), family=poisson,data=accident)
curve(predict(gam.fit, data.frame(count=x), type="resp"), add=TRUE)
# 한 단위 증가할 때 미치는 효과
exp(1.811e-03)

library(MASS)
fit1 <- data.frame(accident,pred=fit$fitted)
disp.est <- glm.nb(acci ~ count,data = accident, start = fit$coef,init.theta =
                       1,link = identity)
anova(disp.est,test="F") # 모형이 유의하다
summary(disp.est) # 회귀계수가 모두 유의하다

population1 <- read.csv("population1.csv",header=TRUE )
population1$count <- 1:39
population1
plot(POPULATION ~ count, data=population1)

fit2 <- glm(POPULATION ~ count, family=poisson(link=log),data = population1)
anova(fit2,test="F") # 모형이 유의하다
summary(fit2) # 회귀계수가 모두 유의하다

library(gam)
gam.fit1 <- gam(POPULATION ~ s(count), family=poisson,data = population1)
curve(predict(gam.fit1, data.frame(count=x), type="resp"), add=TRUE)
# 한 단위 증가할 때 미치는 효과
exp(0.0021955)

library(MASS)
fit3 <- data.frame(population1,pred=fit$fitted)
disp.est1 <- glm.nb(POPULATION ~ count,data = population1, start =
                        fit$coef,init.theta = 1,link = identity)
anova(disp.est1,test="F") # 모형이 유의하지 않다
summary(disp.est1) # count의 회귀계수가 유의하지 않다


library(dplyr)
만족도<-c("매우불만족","불만족","보통","만족","매우만족")
휴학함<-c(63,54,101,43,33)
휴학안함<-c(47,38,133,62,59)
rest<-data.frame(만족도,휴학함,휴학안함)
rest

# 1번
# Logit
rest$x<-recode(rest$만족도,매우만족=4,만족=3,보통=2,불만족=1,매우불만족=0)
n<-rest$휴학함+휴학안함
rest_fit1 <- glm(휴학함/n ~ x, family=binomial(link=logit), weights=n, data=rest)
rest_fit1 # hat-P(Y=1)=0.3364-0.2455x

# 3번
rest_fit2 <- glm(휴학함/n ~ x, family=quasi(link=identity,
                                           variance="mu(1-mu)"),weights=n, data=rest)
rest_fit2 # hat-P(Y=1)=0.58185-0.05968x
# 해석
# 학교생활에 만족할 때 휴학을 했었을 확률이
# 학교생활 만족도가 한 단위 증가할 때마다 0.0597씩 감소

# 4번
fitted(rest_fit1) # 로지스틱 회귀모형
fitted(rest_fit2) # 선형적합모형
