# 1번
a <- c(1.02, 1.00, 0.98, 1.04, 0.99, 1.01, 1.02, 0.99)

t.test(a, mu = 1, conf.level = 0.95)

# 2번
air1 <- c(23,31,67,17,42,24,52,47,50,45,43,21,42,20)
air2 <- c(12,90,11,3,14,71,80,14,11,16,90,1,16,52)

var.test(air1, air2) # 등분산 검정

t.test(air1, air2, var.equal = F, conf.level = 0.95)

# 3번
method1 <- c(3.8,3.4,3.2,4.0,3.8,4.1,2.9,5.0)
method2 <- c(3.9,3.9,4.3,3.7,4.5,4.9,4.3,5.1)

t.test(method1, method2, paired = T, conf.level = 0.95)
t.test(method2, method1, paired = T, conf.level = 0.95)

# 4-1번
load('survey123.Rdata')

b1 <- quantile(survey.data$학습지도, p = c(0, 1/3, 2/3, 1))
x1 <- cut(survey.data$학습지도, breaks = b1, labels = c('하','중','상'), include.lowest = T)

b2 <- quantile(survey.data$학급경영, p = c(0, 1/3, 2/3, 1))
x2 <- cut(survey.data$학급경영, breaks = b2, labels = c('하','중','상'), include.lowest = T)

survey.data$학습지도범주 <- x1
survey.data$학급경영범주 <- x2

survey.data

# 성별에 따라 학습지도의 능력에 차이가 있는지
table1 <- table(survey.data$gender, survey.data$학습지도범주)
chisq.test(table1)

# 성별에 따라 학급경영의 능력에 차이가 있는지
table2 <- table(survey.data$gender, survey.data$학급경영범주)
chisq.test(table2)

# 4-2번
# 연령대에 따라 학습지도의 능력에 차이가 있는지
table3 <- table(survey.data$age, survey.data$학습지도범주)
chisq.test(table3)

# 연령대에 따라 학급경영의 능력에 차이가 있는지
table4 <- table(survey.data$age, survey.data$학급경영범주)
chisq.test(table4)
