Heart <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Heart.dat", header=TRUE)
Heart
library(dplyr)
Heart$x <- recode(Heart$snoring, never = 0, occasional = 2, nearly_every_night = 4, every_night = 5)
Heart
n <- Heart$yes + Heart$no
fit <- glm(yes/n ~ x, family=binomial(link=logit), weights=n, data=Heart)
# yes/n <= p-hta(y=1),family <= y에 대한 분포, weights=n <= n에 가중치
fit # 로지스틱 모형
summary(fit)
fitted(fit) # Logistic Fit
fit2 <- glm(yes/n ~ x, family=quasi(link=identity, variance="mu(1-mu)"),weights=n, data=Heart)
fit2 # Maximum Likelihood 모형
fitted(fit2) # Proportion Yes
