data('USArrests')
head(USArrests)
str(USArrests)
# 산점도를 통해 변수 간의 상관관계 파악
pairs(USArrests)
pairs(USArrests, panel = panel.smooth,main='USArrests data')
# 직선을 그어줌 곡선형태로 나타나면 상관관계가 낮다고 판정

# 주성분 분석
#(서로 상관성이 높은 변수들이 있는 데이터의 차원을 축소하는 기법)
US.prin <- princomp(USArrests,cor = T,scores = T)
summary(US.prin)
# Proportion of Variance 주성분 기여율
# Cumulative Proportion 누적 기여율
# Comp.1이 약 62퍼센트의 기여율을 보인다는 뜻
# Comp.2까지 누적 기여율이 약 86퍼센트 이기 때문에 주성분을 2개까지 설정한다

# screen plot
plot(US.prin)
# Comp.1 Comp.2이후 부터 급격히 감소함
plot(US.prin, type='l')
# Comp.1 Comp.2까지 분산이 1이므로 그 이상의 주성분을 선택해도 분산이 커질거라 기대할 수 없음

# 고유벡터
US.prin$loadings
# Comp.1 Comp.2의 값들만 보기로 했기 때문에 이것들만 살펴보면 됨
# Assault   0.583의 값이 제일 큼
# 제1주성분=0.536xMurder+0.583xAssault+0.278xUrbanPop+0.543xRape 으로 표현

# 주성분 점수
head(US.prin$scores)

# 제 1~2 주성분에 의한 행렬도
biplot(US.prin,scale = 0)

data(iris)
head(iris)
str(iris)
sum(is.na(iris))
colSums(is.na(iris))
summary(iris)
boxplot(iris[,1:4])

#PCA
iris.pca <- prcomp(iris[1:4],center = T,scale. = T) # scale.은 표준화라 T
iris.pca2 <- princomp(iris[1:4],cor = T)
summary(iris.pca)
summary(iris.pca2)

# PCA 고유벡터
iris.pca$rotation # prcomp를 사용했을 때의 고유벡터
iris.pca2$loadings # princomp를 사용했을 때의 고유벡터

# PCA 값
head(iris.pca$x) # prcomp를 사용했을 때의 PCA 값
head(iris.pca2$scores) # princomp를 사용했을 때의 PCA 값

# scree plot
plot(iris.pca, type='l', main = 'Scree plot')

head(iris.pca$x[,1:2])

#install.packages('ggfortify')
library(ggfortify)
autoplot(iris.pca,data = iris,colour='Species')
