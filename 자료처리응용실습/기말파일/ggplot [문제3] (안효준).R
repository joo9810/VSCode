#install.packages('ggplot2')
library(ggplot2)
data(mpg)
str(mpg)
#install.packages('dplyr')
library(dplyr)
# 1번 문제
mpg_cty <- mpg %>% filter(class%in%c('compact','subcompact','suv'))
mpg_cty
ggplot(mpg_cty,aes(x=class,y=cty))+
  geom_boxplot()
# 해석 : 세 class 중 suv가 전반적으로 cty가 낮다고 볼 수 있습니다.
# 각 class 들은 좌측부터 순서대로 3종류, 1종류, 2종류의 이상치를 가지고 있습니다.
# 2번 문제
ggplot(mpg,aes(x=cty,y=hwy))+
  geom_point()
# 해석 : 전반적으로 도시 연비가 높은 차가 고속도로 연비도 높은 경향을 보여줍니다.
# 따라서 cty와 hwy는 높은 양의 상관관계를 가지고 있습니다.

# 3번 문제
mean_suv <- mpg %>% filter(class==c('suv')) %>% group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% arrange(desc(mean_cty)) %>% head(5)
mean_suv
ggplot(mean_suv,aes(x=reorder(manufacturer,-mean_cty),y=mean_cty))+
  geom_col()
# 해석 : subaru > toyota > nissan > jeep > mercury 순이며
# 각각 18.8, 14.4, 13.8, 13.5, 13.2의 값을 가집니다.

# 4번 문제
ggplot(mpg,aes(x=class))+
  geom_bar()
table(mpg$class)
# 해석 : suv > compact > midsize > subcompact > pickup > minivan > 2seater 순이며
# 각각 62, 47, 41, 35, 33, 11, 5대씩 존재합니다.
