# vextor 생성
a <- c(1,2,3)
a
a1 <- 1:3 #첫번째에서 세번째 값까지 나타내라
a1

# 반복
b <- rep(10,5) #10을 5번 반복해라
b
b1 <- rep(c(1,2,3),3)
b1
b2 <- rep(c(1,2),c(2,3))
b2

# 수열
c <- seq(1,100,10) #1부터 100까지 수 중에 10씩 증가
c

#vector 입력
subject_name <- c("John Doe","Jane Doe","Steve Graves")
temperature <- c(98.1,98.6,101.4)
flu_status <- c(FALSE,FALSE,TRUE)

#index
temperature[2] #2번째 값을 찾아줘 (반드시 대괄호)
temperature[2:3] #2번째에서 3번째 값을 찾아줘

#data 제외
temperature[-2] #2번째 값을 지워줘

#logical vector
temperature[c(TRUE,TRUE,FALSE)] #TRUE인 값은 보이고 FALSE인 값은 안 보인다

#data type
is.numeric(subject_name) #subject_name이 숫자냐?
is.character(subject_name) #subject_name이 문자냐?
is.numeric(temperature) #temperature이 숫자냐?
