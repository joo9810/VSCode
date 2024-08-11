version
#install.packages('magrittr')
#install.packages('dplyr')
#install.packages('tidyverse')
library(magrittr) #라이브러리는 매번 적어줘야 함
library(dplyr)
library(tidyverse)

# dplyr 패키지 사용법 (반드시 출제)
exam <- read.csv('test_score(1).csv')
str(exam)
head(exam)
tail(exam)

#music 점수가 50점보다 큰 행을 추출하여라
a <- exam %>% filter(music>50)
a
#class=1이고(and &) language>50 출력
b <- exam %>% filter(class==1&language>50)
b
#music>=90이거나(or |) language>=90 출력
c <- exam %>% filter(music>=90|language>=90)
c
#class가 1,2,3인 행 출력 (방법1)
d <- exam %>% filter(class==1|class==2|class==3)
d
# (방법2)
e <- exam %>% filter(class<=3)
e
# (방법3)
f <- exam %>% filter(class%in%c(1,2,3))
f
summary(exam$statistics) #변수기호 넣을때는 달러($)
min(exam$statistics)
median(exam$statistics)
mean(exam$statistics)
max(exam$statistics)

# select함수 (dplyr패키지)
exam %>% select(music) #music열을 출력
exam %>% select(class,music,language)
exam %>% select(-language) #language행을 삭제

#클래스가 1인 행을 추출 후 언어 열을 추출
exam %>% filter(class==1) %>% select(language)

#id와 music의 앞 6개의 행을 보고싶다
exam %>% select(id,music) %>% head

# $는 변수 앞에 붙는 문자, int 정수형

#arrange() 오름차순 정렬, arrange(desc()) 내림차순 정렬
exam %>% arrange(music)
exam %>% arrange(desc(music))
#반으로 오름차순 시킨다음 반 내에서 music을 내림차순
exam %>% arrange(class,music)
#반으로 오름차순 시킨다음 반 내에서 music을 오름차순
exam %>% arrange(class,desc(music))
#mutate 새로운 변수를 추가할 때 사용하는 함수
exam %>% mutate(total=music+language+statistics) %>% head(10)
#total을 기준으로 내림차순
exam %>% mutate(total=music+language+statistics) %>% arrange(total) %>%  head(10)
#total을 기준으로 오름차순
exam %>% mutate(total=music+language+statistics) %>% arrange(desc(total)) %>%  head(10)
#조건문 (무조건 알아놓기!!) 
exam %>% mutate(test=ifelse(statistics>=60,'pass','fail')) %>% head
#class별로 그룹을 나눠줘
exam %>% group_by(class)
#summarise 요약 통계량
exam %>% summarise(mean_music=mean(music))
exam %>% summarise(max_music=max(music))
abstract <- exam %>% group_by(class) %>% summarise(mean_music=mean(music),
                                                   max_music=max(music),
                                                   median_music=median(music),
                                                   n=n())
abstract
# is는 확인 as는 변환 (table구조의 abstract를 dataframe으로 바꿔줘)
a <- as.data.frame(abstract)
str(abstract)
str(a)

# left_join
test1 <- data.frame(id=c(1,2,3,4,5),
                    mid=c(60,70,80,90,100))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,80,65,90,96))
total <- left_join(test1,test2,by='id')
total # id가 같기 때문에 right_join을 해도 동일하게 나온다

name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c('kim','lee','park','choi','jang'))
name
#데이터 병합
exam_new <- left_join(exam,name,by='class')
exam_new

# bind_rows (세로로 병합)
test3 <- bind_rows(test1,test2)
test3

test4 <- as.data.frame(test3)
test4
test4[-1]
sum(is.na(test4))

#dplyr이 없을때 r에서 베이스로 제공하는 함수 rbind, cbind, merge
#데이터 결합 : rbind, cbind
#rbind : 벡터,행렬,데이터프레임의 행을 서로 결합
#결합하고자 하는 데이터의 열 이름과 개수가 동일해야 한다.
test10 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,70,80,90,100))
test20 <- data.frame(id=c(6,7,8,9,10),
                    midterm=c(60,70,90,67,90))
test10
test20
id_score <- rbind(test10,test20)
id_score #row방향으로 차곡차곡 쌓아서 병합
#cbind : 의 열을 서로 결합, 결합하고자 하는 데이터의 row개수가 동일해야 한다
test30 <- data.frame(final=c(94,92,80,100,78,69,75,85,90,60),
                    last_name=c('lee','kim','choi','park','lee','bae','lim','choi','park','kim'))
test40 <- cbind(id_score,test30)
test40
#rbind는 열의 갯수와 이름 둘다 같아야하지만 (세로방향 결합)
#cbind는 행의 갯수만 동일하면 된다 (가로방향 결합)

#merge : 기준변수를 기준으로 병합
#transform(test4에서 mean을 추가) dplyr의 mutate와 유사
test50 <- transform(test40, mean=(midterm+final)/2)
test50
test60 <- data.frame(id=c(1,2,3,4,5,6,7,8,9,10),
                    pass=c('p','p','p','p','p','f','p','p','p','p'))
test70 <- merge(test50,test60,by='id')
test70
test80 <- cbind(test50,test60)
test80
#cbind와 merge의 차이는 cbind는 기준변수가 없기 때문에 id가 두번 나타난다
#하지만 merge는 id를 기준으로 병합했기 때문에 한번만 나타난다