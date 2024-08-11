x1 <- c(-2.3,2.1,1.3,1.4,0.3,-0.5,3.2,0.6,0.9)
plot(ecdf(x1))

str(ecdf(x1))

CR <- ecdf(x1)
CR(2)

# 1.2 예제(1)
x1 <- c(40,50,60,70,80,90)
plot(ecdf(x1))

# 1.3 예제(2)
x2 <- c(3,5,7,7,8,9,12,15)

# 모수적 방법 (분포 추정)

mean(x2)
sd(x2)

# 정규분포 가정

qnorm(0.05, mean = mean(x2), sd = sd(x2)) # 5% 분위수
qnorm(0.25, mean = mean(x2), sd = sd(x2)) # 25% 분위수
qnorm(0.95, mean = mean(x2), sd = sd(x2)) # 95% 분위수

# 지수분포 가정 (지수분포의 평균은 1/λ, 분산은 1/λ^2)
qexp(0.05, rate = 1/mean(x2)) # rate는 λ를 뜻함 λ = 1/mean
qexp(0.25, rate = 1/mean(x2))
qexp(0.95, rate = 1/mean(x2))

# Data 기반 방법
quantile(x2, probs = c(0.05,0.25,0.95))
# x2데이터의 범위를 100등분 했을 때 각각 5, 25, 95번째의 값

# 장단점
# 모수적 방법: 적은 수의 표본이 있어도 모든 분위수 값을 추정 가능
# 하지만 분포가정이 잘못 됐을 경우 손실이 매우 심각하다.

# 비모수적 방법: 분포에 상관 없이 실제 분위수 값과 매우 비슷한
# 추정치를 구할 수 있다. 하지만 표본수가 적으면 양 끝단의
# 분위수 값은 추정하기 힘들다.

# 붓스트랩
x <- c(2.08,2.6,2.67,2.7,2.94,3.08,3.71,4.66,4.71,5.2)
m <- mean(x)
sd <- sd(x)

# 모수적 방법 (데이터가 정규분포를 따른다고 가정)
sim <- 10000
data.set <- rnorm(n = sim,mean = m,sd = sd)

c(mean(data.set), sd(data.set)) # 붓스트랩으로 추정한 평균, 분산
c(m, sd) # 원본 데이터의 평균, 분산

# 모수적 방법 (데이터가 로그정규분포를 따른다고 가정)
log_m <- log(mean(x))
log_sd <- var(x)/(mean(x)^2)
data.set1 <- rlnorm(n = sim, meanlog = log(log_m^2/sqrt(log_m^2+log_sd^2)),
                    sdlog = sqrt(log(1+log_sd^2/log_m^2)))
c(mean(data.set1), sd(data.set1))

# 모수적 방법에서는 분포를 정규분포, 로그정규분포로 가정하고 계산

# 비모수적 방법
stat <- array(0,sim)
for(i in 1:sim){
  stat[i] <- log(mean(sample(x,10,replace = T)))
}
c(mean(stat), sd(stat)) # 붓스트랩으로 추정한 로그 평균, 분산
c(log_m, log_sd) # 원본 데이터의 로그 평균, 분산

