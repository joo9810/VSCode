# 2번
survey123 <- read.csv('survey123.csv', header = T)
str(survey123)

f1 <- function(x){
  if(x == 1){
    return('남')
  } else{
    return('여')
  }
}

survey123$gender <- sapply(survey123$gender, f1)

f2 <- function(x){
  if(x == 1){
    return('A지역')
  } else if(x == 2){
    return('B지역')
  } else if(x == 3){
    return('C지역')
  } else{
    return('D지역')
  }
}

survey123$거주지 <- sapply(survey123$residence, f2)

f3 <- function(x){
  if(x == 1){
    return('20대')
  } else if(x == 2){
    return('30대')
  } else{
    return('40대')
  }
}

survey123$age <- sapply(survey123$age, f3)

survey123$학습지도 <- apply(survey123[,c('q11','q12','q13','q14')],1,mean)
survey123$학급경영 <- apply(survey123[,c('q21','q22','q23','q24')],1,mean)
survey123$업무수행 <- apply(survey123[,c('q31','q32','q33','q34')],1,mean)

freq <- table(survey123$거주지, survey123$age)
barplot(freq[c(4:1), c(3:1)], beside = T, horiz = T, xlab = '빈도', ylab = 'age',
        legend.text = row.names(freq[c(4:1), c(3:1)]))

# 4번
color <- character(nrow(survey123))
color[survey123$거주지 == 'A지역'] <- 'blue'
color[survey123$거주지 == 'B지역'] <- 'red'
color[survey123$거주지 == 'C지역'] <- 'green'
color[survey123$거주지 == 'D지역'] <- 'purple'

plot(survey123$학습지도, survey123$학급경영, xlab = '학습지도', ylab = '학급경영',
     col = color, xlim = c(1,5), ylim = c(1,5), pch = 3)
legend('topleft', legend = c('A지역','B지역','C지역','D지역'),
       col = c('blue','red','green','purple'), pch = 3)

# 5번
freq2 <- table(survey123$거주지, survey123$age)
freq2[,'20대'] <- freq2[,'20대'] / sum(freq2[,'20대']) * 100
freq2[,'30대'] <- freq2[,'30대'] / sum(freq2[,'30대']) * 100
freq2[,'40대'] <- freq2[,'40대'] / sum(freq2[,'40대']) * 100
barplot(freq2, legend.text = rownames(freq2), args.legend = list(x = 'topleft'),
        ylab = '비율(%)')