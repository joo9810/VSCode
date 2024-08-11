# begin

# 자료읽기

# step 1: 작업폴더 지정
getwd()
#setwd( "/userHome/moosupkim/RA" )

# step 2: read.csv, 단 엑셀파일은 CSV 파일 형식으로 저장되어 있어야 함.
data.set <- read.csv( "Data/test.data.csv" )

# 자료값 접근

# X와 Y는 수치형, Z는 문자형
data.set$X
data.set$Y
data.set$Z

data.set$X[1]

# 벡터만들기
x <- c(1,2,3)
x[1]
x[2]
x[3]

# 행렬만들기
x <- c(1,2,3,4)
x.mat <- matrix( data = x , nrow = 2 , ncol = 2 )
x.mat # 입력순서 확인

# 행렬원소에 접근
x.mat[1,2]
x.mat[1,]
x.mat[,2]


# 데이터프레임(data.frame)만들기
# read.csv 를 통해 읽어 들인 자료의 형식이 data.frame!

x <- c(1,2,3)
y <- 2*x+3
z <- c( "A" , "B" ,  "C" )

data.set2 <- data.frame( x = x , y = y , z = z )

# 데이터 프레임과 행렬의 차이: 데이터 프레임은 다른 형식의 자료값이 입력가능,
# 행렬은 같은 형식이여야 함.
# 데이터 프레임은 행렬연산적용 제한

# TRUE/FALSE값을 이용한 자료접근
data.set[ data.set$Z == "AB", ]


# 함수

plot( x = data.set$X , y = data.set$Y )

# 함수의 구성
# 함수이름, 인수, 몸체, 반환 (반환은 없을 수도 있음)

f <- function( a , b )
{
    v <- a+b
    return( v )
}


f( a = 2 , b = 3 )

# end