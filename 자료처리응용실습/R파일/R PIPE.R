install.packages('magrittr')
library(magrittr) #magrittr불러오기

#파이프 연산자 %>% (Ctrl + Shift + M)
x <- c(1,2,3)
mean(x)
x %>% mean #mean(x)과 x %>% mean는 똑같은 말이다.
