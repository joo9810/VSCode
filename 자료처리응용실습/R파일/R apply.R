#apply함수 (중요한 개념!!)
a <- matrix(1:12, nrow=4, ncol=3)
a
apply(a,1,max) #개체 a의 행방향에 대해서 최댓값을 구해줘
apply(a,2,max) #개체 a의 열방향에 대해서 최댓값을 구해줘
#iris 자료로 apply함수 적용하기
data(iris)
str(iris) #항상 자료를 불러오면 먼저 구조를 파악해야한다
dim(iris) #차원의 파악도 중요. 나오는 순서는 행 열
head(iris) #앞 6개를 보여줌
tail(iris) #뒷 6개를 보여줌
is.na(iris) #결측치 파악도 중요
sum(is.na(iris)) #또한 sum을 이용해서 결측치의 갯수를 파악할 수 있다

iris
b <- iris[,1:4] #꽃의 종류는 명목형이라 수량 계산에 필요없어 뺀다
b
apply(b,2,mean) #열방향(변수들)의 평균을 계산 (벡터형식)

#lapply함수 (결과를 리스트로 변환하는 함수)
c <- lapply(b,mean) #b의 평균을 리스트의 형태로 보여줘 (리스트형식)
c #리스트로 출력하기 때문에 행인지 열인지 나타낼 필요가 없다
unlist(c) #리스트의 형태를 벡터의 형태로 변환 (리스트 해제)

#sapply함수
sapply(b, class) #iris의 논리적인 구조를 벡터의 형태로 보여줌
class(sapply(b, class)) #sapply(iris, class)자체의 클래스는 문자
sapply(b, mean) #iris의 평균을 벡터의 형태로 보여줌
class(sapply(b, mean)) #sapply(b, mean)자체의 클래스는 숫자
sapply(iris, summary) #summary는 요약 통계량을 보여줌
#나오는 값으론 최솟값,제1사분위수,중앙값,평균,제3사분위수,최댓값

#vapply함수 (출력 결과 형태를 사용자가 직접 지정 가능)
vapply_test <- c(1:100)
fivenum(vapply_test) #fivenum은 최솟값 Q1, Q2, Q3, 최댓값 (상자그림의 형태)
vapply_test <- list(vapply_test)
vapply_test2 <- vapply(vapply_test,fivenum,c('Min'=0, 'Q1'=0, 'Q2'=0, 'Q3'=0, 'Max'=0))
vapply_test2
vapply_test3 <- vapply(vapply_test,fivenum,c('Min'=1, 'Q1'=0, 'Q2'=0, 'Q3'=0, 'Max'=0))
vapply_test3 #'Min'=0, 'Q1'=0,...는 숫자형식으로 출력시켜달라는 뜻

#mapply함수 (여러 개의 인자를 필요로 하는
#함수를 여러 데이터에 적용해야 할 경우에
#다수의 요소를 한번에 적용이 가능)
mapply(rep,c(1:4),c(4:1)) #1이 4번 반복 ~ 4가 1번 반복 순서로
#위의 mapply를 사용하지 않으면 아래처럼 rep을 4번 써야한다
rep(1,4)
rep(2,3)
rep(3,2)
rep(4,1)
