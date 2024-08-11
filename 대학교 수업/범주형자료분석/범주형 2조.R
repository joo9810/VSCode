# 예제1 고지혈증의 유무에 따른 뇌졸중 발생
prop.test(c(175,3099),c(421,17270),conf.level = 0.95, correct = F)
0.4156770/0.1794441

library(PropCIs)
# 비율의 차이에 따른 신뢰구간
diffscoreci(175, 421, 3099, 17270, conf.level = 0.95)
# RR에 대한 신뢰구간
riskscoreci(175, 421, 3099, 17270, conf.level = 0.95)

# 예제2 배우자의 무관심이나 애정결핍에 따른 산후우울증 유무
prop.test(c(6, 7), c(28, 88), conf.level = 0.95, correct = F)
0.21428571/0.07954545

prop.test(c(6, 22), c(13, 103), conf.level = 0.95, correct = F)
0.4615385/0.2135922

library(PropCIs)
diffscoreci(6, 22, 7, 81, conf.level = 0.95)
riskscoreci(6, 22, 7, 81, conf.level = 0.95)

library(epitools)
oddsratio(c(175, 246, 3099, 14171),method='wald', conf=0.95, correct=FALSE)

library(PropCIs)
orscoreci(175, 421, 3099, 17270, conf.level=0.95)

library(epitools)
oddsratio(c(6, 22, 7, 81), method='wald', conf=0.95, correct=FALSE)
orscoreci(6,28,7,88,conf.level = 0.95)

library(PropCIs)
orscoreci(6, 28, 7, 88, conf.level=0.95)

prop.test(c(822,66),c(1574,202),conf.level = 0.95,correct = F)

oddsratio(c(822,752,66,136),method = 'wald',conf.level = 0.99,correction = F)
