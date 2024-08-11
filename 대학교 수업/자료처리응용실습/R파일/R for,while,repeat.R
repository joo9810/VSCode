#반복문 : for,while,repeat 반복문은 중괄호를 넣는다

for(i in 1:5){
  print(i^2)
}

#while
i <- 1 #초기값
while(i<=5){
  print(i^2)
  i <- i+1
}

#repeat
i <- 0
repeat{i <- i+1
    print(i^2)
    if(i>4){
      break
    }
}    

print(paste('The year is', 2017))
print(paste('The year is', 2018))
print(paste('The year is', 2019))
print(paste('The year is', 2020))
print(paste('The year is', 2021))

#for

for(i in 2017:2021){
  print(paste('The year is', i))
}

#while

i <- 2017 #초기값
while(i<=2021){
  print(paste('The year is', i))
  i <- i+1
}

# 더하기 함수
add <- function(x,y){
  return(x+y)
}
add(3,4)
#빼기 함수
minus <- function(x,y){
  return(x-y)
}
minus(2,10)

#조건 함수
test <- function(x,y){
  if(x>y)
    return(x+y)
  else
    return(2*x-y)
}
test(10,2)
test(2,10)

add(c(2,3),4) #동적 타이핑
add(as.Date('2021-5-5'),2) #date가 아닌 Date를 해야한다

#계산기 만들기
calc <- function(x,y,type){
  if(type=='add'){
    x+y
  } else if(type=='minus'){
    x-y
    }else if(type=='multiply'){
    x*y
    }else if(type=='dvide'){
    x/y
    }else {
      stop("Unknown type of operation")
    }
    }

calc(2,3,'add')    
calc(2,3,'minus')
calc(2,3,'multiply')
calc(2,3,'dvide')
calc(c(2,3),c(3,6),'add')
calc(as.Date('2021-5-5'),2,'add')
calc(2,3, '??')
