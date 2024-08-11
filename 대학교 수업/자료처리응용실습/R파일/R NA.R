z <- c(1,2,NA,3,6,NA,9)
z
is.na(z)
length(z)

x <- c(1,NULL,3) #데이터 자체가 정의 안됨, 출력도 안됨
x
length(x) #따라서 길이도 없다

mean(z, na.rm=TRUE) #평균을 구하는 함수 na.rm은 결측치를 지워달라는 뜻
z
(1+2+3+6+9)/5
sum(z, na.rm=TRUE)
