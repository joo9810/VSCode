#factor 는 범주 함수
gender <- factor(c('M','F','M'))
gender

blood <- factor(c('O','AB','B'),
                levels=c('A','B','AB','O'))
blood

a <- table(gender)#table에 들어가는 함수는 factor형이어야 한다
b <- table(blood) #table은 도수분포표
prop.table(a) #상대도수 함수는 table함수가 들어가야한다
prop.table(b)

symptoms <- factor(c('SEVERE','MILD','MODERATE'),
                   levels=c('MILD','MODERATE','SEVERE'),
                   ordered=TRUE)
symptoms #ordered는 순서를 나타내는 것
symptoms >= 'MODERATE'
