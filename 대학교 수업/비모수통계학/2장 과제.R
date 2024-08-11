# 1번
# (1)
x <- c(-2.3, 2.1, 1.3, 1.4, 0.3, -0.5, 3.2, 0.6, 0.9)
plot(ecdf(x))
# (2)
# 누적분포함수에서의 확률
ecdf(x)(2)
# 모집단의 분포가 정규분포라고 가정했을 때
mean(x); sd(x)
pnorm(q = 2, mean = mean(x), sd = sd(x))
# (3)
quantile(x, probs = c(0.05,0.95))

mean(x)
sd(x)
pnorm(2,mean(x),sd(x))
