library(ggplot2)
usedcars <- read.csv('usedcars.csv')
str(usedcars)

ggplot(usedcars,aes(x=mileage,y=price))+
  geom_point(color='darkgreen')+
  geom_line()

ggplot(usedcars,aes(x=transmission,fill=model))+
  geom_bar()

ggplot(usedcars,aes(x=color,fill=model))+
  geom_bar()

ggplot(usedcars,aes(x=model,fill=color))+
  geom_bar()

ggplot(usedcars,aes(x=model))+
  geom_bar(color='green',fill='yellow')

ggplot(usedcars,aes(x=model,y=price))+
  geom_boxplot()

ggplot(usedcars,aes(x=color,y=price))+
  geom_boxplot()

ggplot(usedcars,aes(x=price,y=color))+
  geom_boxplot()

df <- usedcars %>% filter(model=='SEL') %>% group_by(color) %>% 
  summarise(mean_price=mean(price)) %>% arrange(desc(mean_price))
df
ggplot(df,aes(x=color,weight=mean_price))+
  geom_bar()

ggplot(df,aes(x=reorder(color,-mean_price),y=mean_price))+
  geom_col()

df2 <- usedcars %>% group_by(color) %>% summarise(mean_price=mean(price)) %>% arrange(desc(mean_price))

ggplot(df2,aes(x=color,weight=mean_price))+
  geom_bar()

ggplot(df2,aes(x=reorder(color,-mean_price),y=mean_price))+
  geom_col()
