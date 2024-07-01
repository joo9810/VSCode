#install.packages('ggplot2')
library(ggplot2)
usedcars <- read.csv('usedcars.csv')
str(usedcars)
#좌표평면
ggplot(usedcars,aes(x=mileage,y=price))+
  geom_point(color='red')+
  geom_line()

ggplot(usedcars,aes(x=mileage,y=price,color=model))+
  geom_point()

#범주형 자료는 y축이 필요 없다
ggplot(usedcars,aes(x=model))+
  geom_bar(color='blue',fill='green')

#빈도 막대도표 (범주형 자료가 와야 함) x하나만 존재하면 됨
ggplot(usedcars,aes(x=model,fill=color))+
  geom_bar()

#상자그림
ggplot(usedcars,aes(x=model,y=price,fill=color))+
  geom_boxplot()

ggplot(usedcars,aes(x=model,y=mileage,fill=color))+
  geom_boxplot()

ggplot(usedcars,aes(x=mileage,y=color))+
  geom_boxplot()

#install.packages('dplyr')
library(dplyr)

df <- usedcars %>% filter(model=='SEL') %>% group_by(color) %>% summarise(mean_price=mean(price)) %>% 
  arrange(desc(mean_price)) %>% head(5)
df

#평균막대도표 (x축만 있을 경우 bar, x와y 둘다 있을 경우 col)
ggplot(df,aes(x=reorder(color,-mean_price),y=mean_price))+
  geom_col()

ggplot(df,aes(x=reorder(color,mean_price),y=mean_price))+
  geom_col(color='red',fill='green')



