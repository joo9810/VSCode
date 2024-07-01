#숫자 타입
mode(40000/3) # 40000/3의 타입을 알려줘
as.integer(40000/3) # 40000/3를 정수형으로 만들어줘
as.numeric(40000/3) # 40000/3를 실수형으로 만들어줘

usedcars <- read.csv('usedcars.csv',stringsAsFactors = FALSE)
str(usedcars)

# $를 사용하는 이유는 year, price가 하나의 객체가 아니라 usedcars의 변수로 있기 때문
summary(usedcars$year) # year의 요약통계량
summary(usedcars[c('price','mileage')]) #2개의 변수의 요약통계량 볼때
#벡터 안에 character 값이 들어갈때는 ''를 넣어야 한다
fivenum(usedcars$year)
fivenum(usedcars$price)
fivenum(usedcars$mileage)
#중심위치 측도
mean(usedcars$price)
median(usedcars$price) # 오른쪽으로 치우친 분포겠구나
#산포의 측도
range(usedcars$price) # range는 최소 최댓값을 출력
diff(range(usedcars$price)) # 둘의 차를 통해 범위를 구할 수 있음
#사분위수
quantile(usedcars$price)
IQR(usedcars$price)
quantile(usedcars$price,probs = c(0.01,0.99)) # 1% 와 99%지점을 절단점으로 사용
quantile(usedcars$price,seq(from=0,to=1,by=0.2)) # 20% 씩 증가하는 지점을 절단
quantile(usedcars$price,seq(0,1,0.2)) # from to by 를 빼도 됨

var(usedcars$price) # 분산
sd(usedcars$price) # 표준편차
sqrt(9749892) # 제곱근
# main:제목 ylab:y축이름 slab:x축이름
price_box <- boxplot(usedcars$price, main='Boxplot of Used Car Prices',ylab='price ($)')
price_box
price_box$out
price_box['out']

fivenum(usedcars$price)
LowerQ <- fivenum(usedcars$price)[2]
LowerQ
UpperQ <- fivenum(usedcars$price)[4]
UpperQ
IQR <- IQR(usedcars$price,na.rm=TRUE)
IQR
#which는 실제 레코드 번호
UpperOutlier <- which(usedcars$price>UpperQ+1.5*IQR)
UpperOutlier
usedcars[UpperOutlier,'price']
LowerOutlier <- which(usedcars$price<LowerQ-1.5*IQR)
LowerOutlier
usedcars[LowerOutlier,'price']

boxplot(usedcars$mileage, main='Boxplot of Used Car Mileage',ylab='Odometer (mi.)')
Q3 <- fivenum(usedcars$mileage)[4]
Q1 <- fivenum(usedcars$mileage)[2]
IQRm <- IQR(usedcars$mileage)
UpperExtra <- which(usedcars$mileage>Q3+1.5*IQRm)
UpperExtra
LowerExtra <- which(usedcars$mileage<Q1-1.5*IQRm)
LowerExtra
usedcars[UpperExtra,'mileage']
