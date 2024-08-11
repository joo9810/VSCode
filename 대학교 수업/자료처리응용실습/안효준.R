#1
Sys.time()
#2
c(rep(2:3, times=2), rep(8:9, each=2))
sum(c(rep(2:3, times=2), rep(8:9, each=2))>3)
#3
library(reshape2)
data('tips')
str(tips)
a <- melt(tips,id.vars = c('sex','smoker','day','time'),na.rm = TRUE)
a
table(a$variable)
#4
b <- dcast(a,time~variable,fun.aggregate = mean)
b
#5
test <- read.csv('test.csv')
str(test)
as.factor(test$Research)
cor(test)
#6
min <- apply(test,2,min)
max <- apply(test,2,max)
test_new <- scale(test,center = min,scale = (max-min))
head(test_new)
test.prin <- princomp(test_new,cor = T,scores = T)
summary(test.prin) # Comp.3까지 누적 기여율 86퍼센트. 주성분 3개까지 설정
plot(test.prin,type='l')
test.prin$loadings
head(test.prin$scores)
biplot(test.prin,scale = 0)
# 그래프상으로 CGPA가 가장 평행하므로 영향을 가장 많이 끼친다고 할 수 있습니다.
factanal(test_new,factors = 3)
# 요인분석 진행시 8개의 데이터를 3개의 factor로 설명하니 전체의 76%를 설명
#7
text <- readLines('text.txt',file)
str(text)
substr(text,2,11)
#8
library(tm)
text
text.corpus <- VCorpus(VectorSource(text))
text.corpus
text.txt <- tm_map(text.corpus,removeNumbers)
text.txt2 <- tm_map(text.txt,removePunctuation)
text.txt3 <- tm_map(text.txt2,stripWhitespace)
text.txt3[[1]]$content
#9
str(text.txt3)
DTM.text <- DocumentTermMatrix(text.txt3)
# 왜 안되는지 모르겠습니다 ㅠㅠ
#10
set.seed(2021)
x <- rnorm(10000,0,1)
x1 <- as.data.frame(x)
idx <- sample(1:nrow(x1),size = nrow(x1)*0.7,replace = F)
training <- x1[idx,]
test <- x1[-idx,]
str(training)
str(test)
hist(training)
hist(test)