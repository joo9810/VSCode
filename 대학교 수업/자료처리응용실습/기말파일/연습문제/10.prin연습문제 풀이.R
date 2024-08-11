#1
data(USArrests)
head(USArrests)
arrest <- USArrests # 간편하게 쓰기 위해

#2
pairs(arrest,panel = panel.smooth,main='USArrests data')
# panel.smooth는 추세선을 그려주는 것
# 직석에 가까울수록 상관관계 높으며 곡선일수록 낮음
plot(arrest,panel = panel.smooth,main='USArrests data')
# 이렇게 그려도 위랑 동일한 결과가 나옴

#3
a <- princomp(arrest,cor = T,scores = T)
# cor = F는 공분산 행렬로, cor = T는 상관행렬로 주성분 분석 수행
# scores 는 각 주성분의 점수를 계산해야 하는지의 여부를 나타냄
summary(a) # 주성분 분석한 것은 반드신 summary로 확인해야 기여율이 보임
# 2번째 주성분까지의 누적 기여도가 86퍼센트가 넘기 때문에 Comp.1 Comp.2를 설정

#4
plot(a)
plot(a,type='l')

#5
a$loadings
# Comp.1 Comp.2의 값들만 보기로 했기 때문에 이것들만 살펴보면 됨
# 1요인은 Assault 값과 제일 관련있다고 볼 수 있음
# 2요인은 Murder 값과 제일 관련있다고 볼 수 있음
# 제1주성분=0.536xMurder+0.583xAssault+0.278xUrbanPop+0.543xRape 으로 표현

#6
head(a$scores)

#7
biplot(a,scale = 0) # scale의 범위는 0~1이긴 한데 그냥 쉽게 0을 써라
# 확인해 보면 앞에서 구한 고유벡터의 값들과 같은 양상을 보인다.
# Loadings:
# Comp.1 Comp.2 Comp.3 Comp.4
# Murder    0.536  0.418  0.341  0.649
# Assault   0.583  0.188  0.268 -0.743
# UrbanPop  0.278 -0.873  0.378  0.134
# Rape      0.543 -0.167 -0.818

#8
data(iris)
head(iris)
str(iris)

#9
colSums(is.na(iris))

#10
summary(iris)

#11
boxplot(iris[,1:4])

prcomp(iris[1:4],center = T,scale. = T)

