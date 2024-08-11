# 단순랜덤추출법
# 복원추출

sample(1:100,replace = T)
no1 <- sample(1:100,size = 20,replace = T)
# size는 표본 크기, replace는 T(복원) F(비복원) 추출
no1
unique(no1) # 중복된 개체를 삭제해준다

# 비복원추출

set.seed(2021) # 값을 기준으로 설정하는 것 (숫자는암거나 와도 되는듯)
sample(1:100,replace = F)
no2 <- sample(1:100,size = 20,replace = F)
no2
unique(no2) # 비복원이라 중복된 개체가 없어 그대로 출력됨

# 가중치 부여
set.seed(2021)
sample(1:100,size = 5,replace = T)
sample(1:100, 5, replace = T,prob = 1:100)
# 뒤로 갈 수록 가중치가 커지게 설정 (prob = 1:100)
# 따라서 뒷 숫자들이 비교적 많이 나옴

no3 <- sample(1:100,size = 50,replace = T)
no3
unique(no3)

# 층화임의추출법
#install.packages('sampling')
library(sampling)
data(iris)
str(iris)
# Species는 범주형, 각각 층으로 20,15,15로 뽑음 srswor비복원으로 추출
iris_sample <- strata(data = iris,c('Species'),size = c(20,15,15),method = 'srswor')
head(iris_sample)
iris_sample2 <- getdata(iris,iris_sample) # 원본 데이터와 같이 보기
# getdata는 층화추출에만 사용되는 듯
head(iris_sample2)
table(iris_sample2$Species)
barplot(table(iris_sample2$Species))
# 복원추출
iris_sample3 <- strata(data = iris,c('Species'),size = c(20,15,15),method = 'srswr')
head(iris_sample3)
b <- getdata(iris,iris_sample3)
tail(b)

# iris data : training dataset(70%), test dataset(30%)
data(iris)
str(iris)
# sample만 쓰면 해당 열의 인덱스 값만 보여 줌
idx <- sample(1:nrow(iris),size = nrow(iris)*0.7,replace = F) # nrow는 iris데이터의 행의 갯수를 나타내 줌
dim(iris)

# training dataset
training <- iris[idx,1:4]
training
dim(training)

# test dataset
test <- iris[-idx,1:4]
test
dim(test)

#install.packages('caret',dependencies = T)
library(caret)
data('iris')
# 70%에 해당하는 훈련 데이터 생성
iris_part <- createDataPartition(iris$Species,times = 1,p = 0.7) # 분할점
iris_part2 <- as.vector(iris_part$Resample1)
training2 <- iris[iris_part2,]
head(training2)
test2 <- iris[-iris_part2,]
head(test2)
nrow(training2)
nrow(test2)
