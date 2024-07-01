#if/else

x <- 10
if(x%%2==0){
  print(paste(x,"는 짝수입니다."))
}else if(x%%2!=0){
  print(paste(x,"는 홀수입니다."))
}else{
  print(paste(x,"정수를 입력하세요"))
  }

#ifelse 구문

x <- 11
ifelse(x %% 2 == 0, "짝수입니다.",
       ifelse(x %% 2 == 1,"홀수입니다.","정수를 입력하세요"))

