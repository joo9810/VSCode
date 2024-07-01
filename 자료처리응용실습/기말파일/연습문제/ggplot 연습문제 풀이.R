library(ggplot2)
library(dplyr)
usedcars <- read.csv('usedcars.csv')
usedcars
str(usedcars)
#1
ggplot(usedcars,aes(x=mileage,y=price))+
  geom_point()
#2
ggplot(usedcars,aes(x=mileage,y=price))+
  geom_point(color='red')
#3
ggplot(usedcars,aes(x=mileage,y=price,color=model))+
  geom_point()
#4
ggplot(usedcars,aes(x=model))+
  geom_bar()
#5
ggplot(usedcars,aes(x=model))+
  geom_bar(color='red')
#6
ggplot(usedcars,aes(x=model,fill=color))+
  geom_bar(color='red')

ggplot(usedcars,aes(x=model,fill=transmission))+
  geom_bar(color='red')
#7
ggplot(usedcars,aes(x=model,y=price))+
  geom_boxplot()
#8
ggplot(usedcars,aes(x=model,y=price,fill=color))+
  geom_boxplot()
#또는 아래도 됨
ggplot(usedcars,aes(x=model,y=price,color=color))+
  geom_boxplot()
#9
ggplot(usedcars,aes(x=color,y=mileage))+
  geom_boxplot()
#10
a <- usedcars %>% filter(model=='SEL') %>% group_by(color) %>% 
  summarise(mean_price=mean(price)) %>% arrange(desc(mean_price))

ggplot(a,aes(x=reorder(color,-mean_price),y=mean_price))+
  geom_col()
#11
ggplot(a,aes(x=reorder(color,mean_price),y=mean_price))+
  geom_col()