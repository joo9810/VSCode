# vector, matrix array : 동일 원소
# list : 이질 원소

list_01 <- list(1,c(TRUE,FALSE),c('a','b','c'))
list_01 #대괄호가 2개 붙은게 list
list_02 <- list(x=1,y=c(TRUE,FALSE),z=c('a','b','c'))
list_02 #변수를 입력하면 대괄호 대신 달러가 붙는다

list_02$x
list_02[[1]]
