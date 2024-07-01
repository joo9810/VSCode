x <- 3
x
x <- c(1,2,3,4,5)
x
x <- c(1,2,c(6,7,8))
x
x <- c(1:5)
x
x <- seq(1,5) # sequence 
x
x <- seq(1,100,10) #seq(start, end, step)
x
x <- seq(3, length.out=10)
x
x <- 1+1:10
x
x <- rep(1,5)
x
x <- rep(1:5,3)
x
x <- c(1,3,5,7,9)
x <- c(1:5)
x
# boolean vector
1>2
c(10,20)>19
c(2,3)>c(1,2,-1,3)

1 %in% c(1,2,4) # %in%은 c함수 안에 객체가 있는지 아닌지
c(1,4) %in% c(1,2,3)

# character vector
"hello ~ R!"
c("hello", "R")
c("hello", "R") == c("Hello", "R") #논리 연산자에서 ==2개
cat('Is "YOU" a Korean name?')
cat("Is \"YOU\" a Korean name?")

# float vector
c(1+2i, 2+3i)

vec <- 1:20
vec
vec[3]
vec[11]
vec[20]
vec[1:5]
vec[7:17]
vec[c(1,3,5,7,9)]
vec[vec>15]
19 %in% vec

c(1,2,3) + 10
c(10,20,30) - c(5,5,5)
c(10,20,30) ^ 2
c(10,20,30) %% 5 # %% 연산자는 나머지를 보여줌
c(10,20,30) %/% 5 # %/% 연산자는 몫을 보여줌

#연산자를 모아놓은게 함수, 함수를 모아놓은게 패키지
