x <- c(40,50,60,70,80,90)
plot(ecdf(x))

# 모수적 방법
a <- c(3,5,7,7,8,9,12,15)
mean(a)
sd(a)
qnorm(0.05,mean(a),sd(a))
qnorm(0.25,mean(a),sd(a))
qnorm(0.95,mean(a),sd(a))

qexp(0.05,1/mean(a))
qexp(0.25,1/mean(a))
qexp(0.95,1/mean(a))

# 비모수적 방법
quantile(a, probs = c(0.05,0.25,0.95))

# 2장 연습문제

#1번
b <- c(-2.3,2.1,1.3,1.4,0.3,-0.5,3.2,0.6,0.9)
plot(ecdf(b))

mean(b)
sd(b)

quantile(b, probs = c(0.05,0.25,0.86,0.95))
pnorm(2,mean(b),sd(b))

# 20명의 고객 중 A제품을 선호하는 고객이 7명
# A제품을 선호하는 고객의 비율을 95% 신뢰수준으로 추정
binom.test(7,20)

1-pbinom(6,20,0.154)
pbinom(7,20,0.5921)

n=20; y=7; p=y/n; a=0.05
p+c(-qnorm(1-a/2),qnorm(1-a/2))*sqrt((1/n)*p*(1-p))

# install.packages("epitools")
library(epitools)
binom.approx(y,n)
# t분포를 이용한 구간추정
data1 <- c(2.08,2.60,2.67,2.70,2.94,3.08,3.71,4.66,4.71,5.20)
mean <- mean(data1)
sd <- sd(data1)
n = length(data1)
error = qt(0.975,df=n-1)*sd/sqrt(n)
left <- mean - error
right <- mean + error
c(left, right)
# 정규분포를 이용한 구간추정
error1 = qnorm(0.975)*sd/sqrt(n)
left1 <- mean - error1
right1 <- mean + error1
c(left1, right1)
# 붓스트랩을 이용한 구간추정
# 비모수적 붓스트랩
data1 <- c(2.08,2.60,2.67,2.70,2.94,3.08,3.71,4.66,4.71,5.20)
sim <- 10000
stat <- array(0,sim)
for(b in 1:sim){
  stat[b]=mean(sample(data1,10,replace = T))
}
stat1 <- sort(stat)

print(c(stat1[sim*0.025],stat1[sim*0.975]))

# install.packages("epitools")
library(epitools)

binom.test(2,287)
binom.approx(2,287)

rep(c(0,1),c(285,2))

library(simpleboot)
one.boot()