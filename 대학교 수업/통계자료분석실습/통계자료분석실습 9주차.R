# begin

setwd("/userHome/moosupkim/DA")

raw.data <- read.csv( "survey123.csv" )

survey.data <- raw.data

survey.data[["학습지도"]] <- apply( survey.data[,c("q11","q12","q13","q14")] , 1 , mean )
survey.data[["학급경영"]] <- apply( survey.data[,c("q21","q22","q23","q24")] , 1 , mean )
survey.data[["업무수행"]] <- apply( survey.data[,c("q31","q32","q33","q34")] , 1 , mean )

f <- function(i)
{
  if( i == 1 ) 
  {
    return( "남" )
  }
  
  return( "여" )
}

survey.data$gender <- sapply( survey.data$gender , f )


f <- function(i)
{
  if( i == 1 ) 
  {
    return( "20대" )
  }
  else if( i == 2 )
  {
    return( "30대" )
  }
  return( "40대" )
}

survey.data$age <- sapply( survey.data$age , f )


f <- function(i)
{
  if( i == 1 ) 
  {
    return( "A지역" )
  }
  else if( i == 2 )
  {
    return( "B지역" )
  }
  else if( i == 3 )
  {
    return( "C지역" )
  }
  return( "D지역" )
}

survey.data[["거주지"]] <- sapply( survey.data$residence , f )

# 변수삭제
survey.data$residence <- NULL

# 변수유형확인
var.names <- names( survey.data )

for( i in var.names )
{
  print( mode( survey.data[[i]] ) )
}

# R 객체의 저장
save( survey.data , file = "survey123.RData" )

rm( list = ls() ) # 만들어진 모든 객체를 삭제

#-------------------------------------------------------------------------------

load( "survey123.RData" )

# table 함수: 도수분포표
freq <- table( survey.data[["거주지"]] ) # freqency
prop <- table( survey.data[["거주지"]] ) / nrow( survey.data ) * 100 # relative frequency.

# 막대그림, 원그림 barplot, pie

pie( x = freq , main = "거주지역 분포" )

barplot( height = prop , ylab = "percentage (%)" , ylim = c(0,35) , main = "거주지역 분포" )

# freq, prop: 위치에 이름이 매겨진 벡터
# 이름정보가 그림그릴 때 사용되었음

# 만약 이름이 매겨져 있지 않다면 원하는 이름을 인자를 통해 전달
pie( c(1,1,1,1) , labels = c( "A" , "B" , "C" , "D" ) )
barplot( height = c(1,1,1,1) , names.arg = c( "A" , "B" , "C" , "D" ) )

# 그림그리기 공통 인자
# xlab , ylab : x축, y축 설명
# xlim , ylim : x축, y축 범위지정
# main        : 그림제목

# par함수를 이용한 그림 화면 분할을 위한 그래픽 설정모수 조정
# par(): 그래픽모수 조정함수로 다양한 인자를 지니고 있음

op <- par( mfrow = c(1,2) )
# mfrow 인자: 화면분할 c(행분할수,열분할수)
# par 함수를 인자를 받아 그래픽모수를 조정하고 동시에 이전 그래픽모수상태를 반환한다.
# 이를 조정과 동시에 받아두고 후에 그래픽설정을 원래로 돌리고 싶을 때 사용.

barplot( prop , ylab = "percentage (%)" , ylim = c(0,35) ) 

pie( prop )

par( op ) # 원래 그래픽설정으로 돌아감

value <- tapply( survey.data[["학습지도"]] , survey.data$age , mean )
barplot( value , horiz = TRUE , xlim = c(0,5) , ylab = "연령대" , xlab = "학습지도" )

value <- sort( tapply( survey.data[["학습지도"]] , survey.data$age , mean ) , decreasing = TRUE )
barplot( value , horiz = TRUE , xlim = c(0,5) , ylab = "연령대" , xlab = "학습지도" )

# 히스토그램
hist( survey.data[["학습지도"]] , xlab = "학습지도" , main = "학습지도분포" )

# probability = TRUE : 확률밀도함수처럼 히스토그램의 전체면적이 1이 되도록
# 히스토그램과 확률밀도함수 간의 유사도를 볼 때 유용!
hist( survey.data[["학습지도"]] , xlab = "학습지도" , main = "학습지도분포" , probability = TRUE )
x <- seq(0,5,0.01)
y <- dnorm( x , mean = mean( survey.data[["학습지도"]] ) , sd = sd( survey.data[["학습지도"]] ) )
lines( x = x , y = y )


# 이변량 막대그림

# 교차표 작성
M <- table( survey.data[["거주지"]] , survey.data$gender )
# M: 행과 열에 이름이 매겨진 행렬

barplot( M    , beside = TRUE , legend.text = rownames( M ) )
barplot( t(M) , beside = TRUE , legend.text = colnames( M ) )


M <- table( survey.data[["거주지"]] , survey.data$age )
barplot( M    , legend.text = rownames( M ) , args.legend = list( x = "topleft" ) )
barplot( t(M) , legend.text = colnames( M ) )


#-------------------------------------------------------------------------------

# plot

plot( x = survey.data$학습지도 , y = survey.data$학급경영 , xlim = c(1,5) , ylim = c(1,5) , pch = 1 , xlab = "학습지도" , ylab = "학습경영" )

# 상자그림
boxplot( formula = 학급경영 ~ age , data = survey.data )

col <- character( nrow( survey.data ) )
col[survey.data$age =="20대"] <- "blue"
col[survey.data$age =="30대"] <- "red"
col[survey.data$age =="40대"] <- "green"

plot( x = survey.data$학습지도 , y = survey.data$학급경영 , col = col ,
      xlab = "학습지도" , ylab = "학급경영" )
legend( "topleft" , legend = c( "20대" , "30대" , "40대" ) ,
        col = c("blue","red","green") , pch = 1 )

plot( x = survey.data$학습지도 , y = survey.data$학급경영 ,
      xlab = "학습지도" , ylab = "학급경영/업무수행" , pch = "1" , ylim = c(1,5) , xlim = c(1,5) )
points( x = survey.data$학습지도 , y = survey.data$업무수행 , pch = "2" )
abline( v = 3.5 , h = 3 )

with( survey.data ,
  {
    plot( x = 학습지도 , y = 학급경영 , col = col , xlab = "학습지도" , ylab = "학급경영" )
    legend( "topleft" , legend = c( "20대" , "30대" , "40대" ) , col = c("blue","red","green") , pch = 1 )
    
    plot( x = 학습지도 , y = 학급경영 , pch = "1" , xlab = "학습지도" , ylab = "학급경영/업무수행" , ylim = c(1,5) , xlim = c(1,5) )
    points( x = 학습지도 , y = 업무수행 , pch = "2" )
    abline( v = 3.5 , h = 3 )
    
  }
)


# end