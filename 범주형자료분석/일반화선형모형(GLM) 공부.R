Heart <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Heart.dat", header=TRUE)
Heart # 반응변수가 이항성분으로 범주형이기 때문에 로지스틱 회귀분석 진행

library(dplyr)
Heart$x <- recode(Heart$snoring, never = 0, occasional = 2,
                  nearly_every_night = 4, every_night = 5)
Heart$n <- Heart$yes + Heart$no

# Logit
fit <- glm(yes/n ~ x, family = binomial(link = logit), weights = n, data = Heart)
# yes/n은 성공확률 P(Y=1), binomial(link = logit)은 로지스틱 회귀분석이
# 이항랜덤성분과 로짓연결함수를 갖는 일반화선형모형(GLM)이기 때문
fit # logit[hat-P(Y=1)] = -3.8662 + 0.3973x (로지스틱 모형)
# 따라서 hat-beta = 0.3973 > 0 이므로 증가함수
summary(fit) # 회귀계수가 모두 유의하다
fitted(fit) # 로지스틱 모형에서 hat-P(Y=1)의 x값에 따른 적합값

# GLM - ML 방법
fit2 <- glm(yes/n ~ x, family = quasi(link = identity, variance = "mu(1-mu)"),
            weights = n, data = Heart)
fit2 # hat-P(Y=1) = 0.01725 + 0.01978x (선형확률 모형)
summary(fit2, dispersion = 1)
# dispersion = 1은 분산 매개변수를 1로 해주기 위해서
# 응답분포가 확실하지 않을 때 유사가능도 모형인 경우 quasi를 사용
