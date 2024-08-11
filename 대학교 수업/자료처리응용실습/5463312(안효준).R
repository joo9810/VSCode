install.packages('MASS')
library(MASS)
data('Cars93')
Cars93
#1~2번
str(Cars93)
#3번
fivenum(Cars93$Price)
#4번
mean(Cars93$Price)
median(Cars93$Price)
hist(Cars93$Price)
# 평균이 19.5인것에 반해 중앙값이 17.7으로 오른쪽으로 꼬리가 긴 왼쪽으로 치우쳐져있는 분포입니다.

#5번
price_cars <- boxplot(Cars93$Price)
price_cars
#6번
Q1 <- fivenum(Cars93$Price)[2]
Q1
Q3 <- fivenum(Cars93$Price)[4]
Q3
IQR <- Q3-Q1
which(Cars93$Price>Q3+1.5*IQR)

install.packages('dplyr')
library(dplyr)
#7번
Cars93 %>% filter(Manufacturer%in%c('Audi','BMW')) %>% select(EngineSize)
#8번
new_Cars93 <- Cars93 %>% filter(Type%in%c('Midsize','Small')) %>% select(Model,Type,Weight,Price)
new_Cars93
new_Cars93 %>% group_by(Type) %>% summarise(median(Weight))
a <- new_Cars93 %>% filter(Type=='Midsize')
new_a <- a %>% mutate(Weight_LH=ifelse(Weight<3472,'low','high'))
b <- new_Cars93 %>% filter(Type=='Small')
new_b <- b %>% mutate(Weight_LH=ifelse(Weight<2345,'low','high'))
bind_rows(new_a,new_b) %>% arrange(desc(Price))
#9번
RPM_Cars <- transform(Cars93,RPM_scale=scale(RPM))
RPM_Cars
RPM_Cars %>% filter(RPM_scale>=0.5)
#9.1
standard <- function(x){
  return((x-mean(x))/sd(x))
}
Cars2 <- transform(Cars93,RPM_scale=standard(RPM))
Cars2
Cars2 %>% filter(RPM_scale>=0.5)
#9.2
Cars3 <- Cars93 %>% mutate(RPM_scale=standard(RPM))
Cars3
Cars3 %>% filter(RPM_scale>=0.5)
#10
CarsEP <- Cars93 %>% select(EngineSize,Price)
cor(CarsEP)
pairs(CarsEP)

CarsER <- Cars93 %>% select(EngineSize,RPM)
cor(CarsER)
pairs(CarsER)
