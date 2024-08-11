# begin


# 설명변수 중에 범주형변수가 있는 경우
data.set <- read.csv( "Example10.1.csv" )

# 범주형 변수에 대한 지시변수 생성을 통한 방법
data.set$z2 <- ifelse( data.set$x2 == "A" , 1 , 0 )
# x2 == "B"가 baseline이 된다!

lm.result1 <- lm( y ~ x1 + z2 , data = data.set )
summary( lm.result1 )

# 교호작용
data.set$x1z2 <- data.set$x1 * data.set$z2

lm.result2 <- lm( y ~ x1 + z2 + x1z2 , data = data.set )
summary( lm.result2 ) # 교호작용의 유의성

# 방법에 따른 회귀모형의 차이가 있는가?
lm.result3 <- lm( y ~ x1 , data = data.set )
anova( lm.result3 , lm.result2 ) 


# 범주형변수의 요인화를 통한 방법
data.set$x2 <- factor( data.set$x2 , levels = c("B","A") )
# levels를 c("B","A")로 특정함으로써 x2 == "B"가 baseline이 된다.
# 참고: lm 함수에서 문자형 변수는 설명변수로 지정되면 자동으로 요인화가 됨

lm.result01 <- lm( y ~ x1 + x2 , data = data.set )
summary( lm.result01 )

# 교호작용
# 모형식 x1:x2가 교호작용을 나타냄
lm.result02 <- lm( y ~ x1 + x2 + x1:x2 , data = data.set )
summary( lm.result02 ) # 교호작용의 유의성

# 방법에 따른 회귀모형의 차이가 있는가?
lm.result3 <- lm( y ~ x1 , data = data.set )
anova( lm.result3 , lm.result02 ) 


#---------------------------------------------------------------------------------

# 반응변수가 지시변수인 경우: 로지스틱 회귀
data.set <- read.csv( "Example10.4.csv" )
data.set$y <- factor( data.set$y , levels = c( "1" , "0" ) )

glm.result <- glm( formula = y ~ x , family = binomial , data = data.set )
summary( glm.result )

new.data <- data.frame(x = c(18,35,53))
predict( glm.result , newdata = new.data , type = "response" )


data.set <- read.csv( "Example10.5.csv" )
data.set$z <- data.set$n - data.set$y 

glm.result <- glm( formula = cbind( y , z ) ~ x , family = binomial , data = data.set  )

new.data <- data.frame( x = 35 )
predict( glm.result , newdata = new.data , type = "response" )



# end