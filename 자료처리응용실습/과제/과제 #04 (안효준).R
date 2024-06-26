# 문제 1

# 1.
# 한 달에 4건이므로 1주에는 평균적으로 1건이라고 할 수 있습니다.
dpois(0,1) # 따라서 약 36.7%인걸 확인할 수 있습니다.

# 2.
# 누적분포함수를 이용하며 오른쪽 꼬리를 계산하므로 lower.tail = F로 둡니다.
ppois(2,1,lower.tail = F)
# 따라서 약 8%인걸 확인할 수 있습니다.

# 3.
# 확률질량함수는 dpois(0:10,1)로 나타낼 수 있으며 그래프는 다음과 같습니다.
plot(dpois(0:10,1))

# 문제 2
# 해당 정규분포에서 누적확률이 1%가 되는 지점을 찾으면 됩니다.
qnorm(0.01,48,5)
# 따라서 약 36.3개월 이하인 복사기들이 하위 1%에 해당하는 복사기들이며
# 이들만 교환해준다면 1%를 넘지 않으므로
# 보증 기간을 36.3개월 보다 짧으면서 제일 근접한 3년으로 잡으면 됩니다.

# 문제 3
# 해당 정규분포에서 누적확률이 90%가 되는 지점을 찾으면 됩니다.
qnorm(0.90,220,15)
# 따라서 정확히 239.2233점이 상위 10%에 해당하는 점수이므로
# 240점 이상 받는다면 상위 10%안에 들 수 있습니다.