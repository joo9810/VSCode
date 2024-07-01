#install.packages('ggplot2')
library(dplyr)
library(tidyverse)
library(magrittr)
library(ggplot2)
data('mpg')
mpg
str(mpg)
# 1번 문제
a <- mpg %>% select(displ,hwy)
a
lowdispl <- a %>% filter(displ<=4)
highdispl <- a %>% filter(displ>=5)
lowdispl
highdispl
mean(lowdispl$hwy) # 4이하인 자동차 평균
mean(highdispl$hwy) # 5이상인 자동차 평균
# 따라서 배기량이 4이하인 자동차가 연비가 더 높습니다.

# 2번 문제
b <- mpg %>% filter(manufacturer%in%c('chevrolet','ford','honda')) %>% select(
  manufacturer,hwy
)
mean(b$hwy)
# 따라서 세 회사의 연비 평균은 22.50943입니다.


# 3번 문제
c <- mpg %>% select(class,cty)
c %>% head(10)
# 확인 결과 class와 cty 두 변수로만 구성되었습니다.

# 4번 문제
mpg %>% filter(manufacturer=='audi') %>% arrange(desc(hwy)) %>% head(5)

# 5번 문제
copy_mpg <- mpg
# 5-1번
copy_mpg1 <- copy_mpg %>% mutate(totalCH=cty+hwy)
copy_mpg1
# 5-2번
copy_mpg2 <- copy_mpg1 %>% mutate(meanCH=totalCH/2)
copy_mpg2
# 5-3번
copy_mpg2 %>% arrange(desc(meanCH)) %>% head(3)
# 5-4번
mpg %>% mutate(totalCH=cty+hwy) %>% 
  mutate(meanCH=totalCH/2) %>% arrange(desc(meanCH)) %>% head(3)

# 6번 문제
mpg %>% group_by(class) %>% summarise(mean_hwy=mean(hwy))
# 2seater,compact,midsize,minivan,pickup,subcompact,suv가 있음을 알 수 있습니다.
seater_cty <- mpg[,c(8,11)] %>% filter(class=='2seater')
mean(seater_cty$cty) # 15.4
compact_cty <- mpg[,c(8,11)] %>% filter(class=='compact')
mean(compact_cty$cty) # 20.12766
midsize_cty <- mpg[,c(8,11)] %>% filter(class=='midsize')
mean(midsize_cty$cty) # 18.7561
minivan_cty <- mpg[,c(8,11)] %>% filter(class=='minivan')
mean(minivan_cty$cty) # 15.81818
pickup_cty <- mpg[,c(8,11)] %>% filter(class=='pickup')
mean(pickup_cty$cty) # 13
subcompact_cty <- mpg[,c(8,11)] %>% filter(class=='subcompact')
mean(subcompact_cty$cty) # 20.37143
suv_cty <- mpg[,c(8,11)] %>% filter(class=='suv')
mean(suv_cty$cty) # 13.5
# cty의 평균은 subcompact가 가장 높습니다.
