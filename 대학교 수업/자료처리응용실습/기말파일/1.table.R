usedcars <- read.csv('usedcars.csv')
library(tidyverse)
library(magrittr)
library(dplyr)
str(usedcars)
#도수분포표
table(usedcars$year)
table(usedcars$model)
table(usedcars$color)
table(usedcars$transmission)

#상대도수분포표
prop.table(table(usedcars$model)) #인수로써 반드시 table함수가 와야 함
addmargins(prop.table(table(usedcars$model))) #addmargins은 주변합 sum값을 출력
round(prop.table(table(usedcars$model))*100, digits = 2)
#round는 반올림 함수, digits = 2는 소숫점 이하 2자리 round랑 digits이랑 짝꿍
round(prop.table(table(usedcars$color))*100) # 그냥 라운드를 하면 정수로 반올림
addmargins(round(prop.table(table(usedcars$model))*100, digits = 2))

#이변량 자료의 관계 분석(두 범주형 변수의 관계를 나타내는 표)
#install.packages('gmodels')
library(gmodels)
usedcars$conservative <- usedcars$color %in% c('Black','Gray','Silver','White')
usedcars
table(usedcars$conservative)
CrossTable(x=usedcars$model,y=usedcars$conservative,chisq = FALSE, expected = FALSE,
           prop.r = TRUE, prop.c = TRUE, prop.t = TRUE)
# chisq는 카이제곱 expected는 기댓값 prop.r 행에대한 비율 prop.c 열에 대한 비율 prop.t 토탈 비율
# Cell Contents
#  |-------------------------|
#  |                       N | #빈도수
#  |              Expected N | #기댓값
#  | Chi-square contribution | #카이제곱 기여도
#  |           N / Row Total |
#  |           N / Col Total |
#  |         N / Table Total |
#  |-------------------------|
  
#  Chi^2 =  0.1539564     d.f. =  2(자유도)     p =  0.92591 (유의확률)

#카이제곱 검정
chisq.test(table(usedcars$model,usedcars$conservative))
#귀무가설:model과conservative는 연관이 없다(독립이다)
#대립가설:model과conservative는 연관이 있다(독립이 아니다)
#p가 0.92591로 95%를 넘지 못했기 때문에 귀무가설을 기각할 수 없으므로
#귀무가설을 채택해야 한다. 따라서 model과conservative는 독립이다
#95%를 넘어야 대립가설을 채택 가능하다.

#install.packages('reshape2')
library(reshape2)
head(usedcars)
a <- melt(usedcars, id.vars = c('year','model','color','transmission','conservative'),na.rm = TRUE)
a
#id.vars는 기준 잡을 변수를 설정하는 것. 기준을 안잡은 변수들은 전부 값들로 들어감
head(a)
b <- dcast(a,year+model+color~variable, fun.aggregate = mean)
head(b)

data('airquality')
str(airquality)

air_melt <- melt(airquality,id.vars = c('Month','Day'),na.rm = T)
head(air_melt)
air_dcast <- dcast(air_melt,Month+Day~variable)
head(air_dcast)
air_dcast_mean <- dcast(air_melt,Month+Day~variable,fun.aggregate = mean)
dcast(air_melt,Month+Day~variable) # 이렇게 해도 되는듯.. 더 깔끔하고...
head(air_dcast_mean)

install.packages('openxlsx')
library(openxlsx)

data(iris)
#csv_file write.csv(객체명,file = '파일명.csv')
iris_csv <- write.csv(iris,file = 'iris.csv')
#xlsx_file write.xlsx(객체명, sheetName='문서명',file = '파일명.xlsx')
#xlsx는 엑셀 파일 형식인듯 sheetName은 설정 해줘도 되고 안해줘도 됨
iris_xlsx <- write.xlsx(iris, sheetName='iris',file = 'iris2.xlsx')

usedcars <- read.csv('usedcars.csv')
usedcars_xlsx <- write.xlsx(usedcars, sheetName='usedcars',file = 'usedcars.xlsx')
