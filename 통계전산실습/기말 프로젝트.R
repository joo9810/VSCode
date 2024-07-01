# 2001년 1월부터 2002년 8월까지의 자료
# 고객에게 전달된 웹사이트의 수에 가장 큰 영향을 미치는 변수가 어떤 것인지 관심
setwd('I:/수업/2022학년도/2학기/통계전산실습')
data.set <- read.table('Web_Developer.txt')
str(data.set) # 73행 8열
# V1: 식별 번호 1~73
# V2: 전달된 웹사이트: 그 분기 동안 완성되어 고객에게 전달된 웹사이트의 수
# V3: 주문잔고: 그 분기 마지막에 잔고로 남은 웹사이트 주문 개수
# V4: 팀 번호 1~13
# V5: 팀 경험기간: 팀이 함께 일한 개월 수
# V6: 절차 변경: 2002년 2사분기 동안 발생한 웹사이트 개발 절차의 변경
# (2002년 2 또는 3분기이면 1, 아니면 0)
# V7: 연도: 2001년 또는 2002년
# V8: 분기: 1, 2, 3, 4


# 결측치 확인
colSums(is.na(data.set)) # 결측치 0개

colnames(data.set) <- c('id', 'website', 'balance', 'team', 'exper', 'change', 'year', 'semester')

df <- data.set

# 정규성 검정
# shapiro wilk test: 표본 수가 2000 미만인 데이터셋에 적합한 정규성 검정
# kolmogorove smirnov test: 표본 수가 2000 이상인 데이터셋에 적합한 정규성 검정


# H0: 데이터가 정규분포를 따른다, H1: 데이터가 정규분포를 따르지 않는다
shapiro.test(data.set$website) # 정규분포를 따르지 않음
library(nortest)
ad.test(data.set$website) # 정규분포를 따르지 않음


shapiro.test(data.set$exper) # 정규분포를 따르지 않음
ad.test(data.set$exper) # 정규분포를 따르지 않음


# 수치형 변수(V2, V3, V5)의 상자그림
boxplot(data.set$website ~ data.set$team, xlab = '팀',
        ylab = '전달된 웹사이트', main = '팀별 전달된 웹사이트의 상자그림') # V2, V3에서 이상치 존재

#----------------이상치를 제거할 경우------------------------------------------

# 이상치가 포함된 행 확인
Q3_website <- as.numeric(summary(data.set$website)[5]) ; Q3_website # V2의 3사분위 수
Q1_balance <- as.numeric(summary(data.set$balance)[2]) ; Q1_balance # V3의 1사분위 수
# 상자그림에서 V2는 위쪽에, V3는 아래쪽에 이상치가 존재했으므로
# V2의 1사분위수와 V3의 3사분위수는 구하지 않는다

upper_website <- Q3_website + 1.5*IQR(data.set$website) ; upper_website # V2의 위쪽 바깥 울타리
lower_balance <- Q1_balance - 1.5*IQR(data.set$balance) ; lower_balance # V3의 아래쪽 바깥 울타리

outV2_index <- which(data.set$website > upper_website) ; outV2_index # 50번 인덱스
outV3_index <- which(data.set$balance < lower_balance) ; outV3_index # 65번 인덱스

data.set[50,] # V2값이 30으로 위쪽 바깥 울타리인 28보다 큼 (이상치)
data.set[65,] # V3값이 3으로 아래쪽 바깥 울타리인 6.5보다 작음 (이상치)

df <- data.set[-c(50,64),]

#----------------이상치를 제거하지 않을 경우-----------------------------------

df <- data.set

#------------------------------------------------------------------------------

# 문제1: 절차 변경을 했을 때와 안했을 때의 전달된 웹사이트 수에 차이가 있는지
# 개발 절차를 변경하고 나서 고객에게 전달된 웹사이트의 수가 더 많을 것으로 추측
after <- df$website[df$change == 1] # 절차를 변경한 그룹
before <- df$website[df$change == 0] # 절차를 변경하지 않은 그룹

wilcox.test(after, before, alternative = 'greater')
t.test(after, before, alternative = 'greater')
# H0 : median1 = median2, H1: median1 > median2
# 유의수준 0.05 하에서 귀무가설 기각 (즉 절차를 변경하고 더 전달이 많이 됨)
# 실제로 표본평균을 확인해보면 x1 = 15.53, x2 = 5.44로 상당히 차이가 남

#------------------------------------------------------------------------------

# 문제2: 2001년과 2002년의 전달된 웹사이트 수에 차이가 있는지
# 2002년 2분기와 3분기에 개발 절차가 변경되었기 때문에 2001년보다 2002년도에
# 고객에게 전달된 웹사이트의 수가 더 많을 것으로 추측
y_2001 <- df$website[df$year == 2001] # 2001년인 그룹
y_2002 <- df$website[df$year == 2002] # 2002년인 그룹

wilcox.test(y_2001, y_2002, alternative = 'less')
t.test(y_2001, y_2002, alternative = 'less')
# H0 : median1 = median2, H1: median1 < median2
# 유의수준 0.05 하에서 귀무가설 기각 (즉 2002년도에 더 전달이 많이 됨)
# 실제로 표본평균을 확인해보면 x1 = 5, x2 = 12.05로 상당히 차이가 남

#------------------------------------------------------------------------------

# 문제3: 분기에 따라 전달된 웹사이트 수에 차이가 있는지
# H0: median1 = median2 = median3 = median4, H1: 중앙값이 다른게 적어도 하나 이상 있다
result <- kruskal.test(website ~ factor(semester), data = df) ; result
# 유의수준 0.05 하에서 귀무가설 기각

result <- aov(website ~ factor(semester), data = df) ; result

# 사후분석
library(dunn.test)
dunn.test(df$website, factor(df$semester), method = 'bonferroni')
# (1분기, 2분기), (1분기, 3분기), (3분기, 4분기)에서 유의한 차이가 존재


#------------------------------------------------------------------------------

# 문제4: 팀 번호에 따라 전달된 웹사이트 수에 차이가 있는지
# H0: median1 = median2 = ... = median13, H1: 중앙값이 다른게 적어도 하나 이상 있다
result2 <- kruskal.test(website ~ factor(team), data = df) ; result2
# 유의수준 0.05 하에서 귀무가설 채택

# 결과가 유의하지 않았기 때문에 사후분석은 진행하지 않는다

#------------------------------------------------------------------------------

# 문제5: exper와 website 사이에 관계가 있는지

plot(df$exper, df$website, xlab = '팀 경험기간',
     ylab = '전달된 웹사이트', main = '팀 경험기간과 전달된 웹사이트의 산점도')
# 모든 변수 사이에 어느정도 양의 상관관계를 보임


# 상관분석
# H0: 상관관계가 없다, H1: 상관관계가 있다

cor.test(df$website, df$exper, method = 'spearman')
# 유의수준 0.05 하에서 귀무가설 기각


# 따라서 모든 수치형 변수 사이에 상관관계가 존재한다

#------------------------------------------------------------------------------

# 최종문제: 고객에게 전달된 웹사이트의 수에 가장 큰 영향을 미치는 변수가
# 어떤 것인지 회귀분석 실시

# 종속변수: website
# 독립변수: balance, exper, change, year, semester

# 수치형 독립변수: balance, exper
# 범주형 독립변수: change, year, semester

# 독립변수로 team을 사용하지 않은 이유는 앞선 team에 따른 website의
# kruskal.test 결과 유의하지 않은 결과가 나왔기 때문이다

# 정규성을 만족하는지 확인
hist(df$website) # 왼쪽으로 치우친 분포
shapiro.test(df$website) # 정규분포를 따르지 않음 (p-value = 3.467e-05)
# 값에 0이 포함되어 있어 box-cox를 진행할 수 없음
# 왼쪽으로 치우쳐져 있으므로 log변환 또는 제곱근 변환을 고려할 수 있으며
# log변환은 값에 0이 있기 때문에 불가능하므로 제곱근 변환 시도
hist(sqrt(df$website)) # 제곱근 변환
shapiro.test(sqrt(df$website)) # 정규분포를 따름 (p-value = 0.1834)

df$website <- sqrt(df$website)


hist(df$balance)
shapiro.test(df$balance) # 정규분포를 따름

hist(df$exper)
shapiro.test(df$exper) # 정규분포를 따르지 않음 (p-value = 0.004695)
summary(powerTransform(df$exper))
# H0: lambda = 0, lambda != 0 (유의확률이 0.0044399로 귀무가설 기각)
# H0: 변환이 필요하지 않다, H1: 변환이 필요하다 (유의확률이 0.0343로 귀무가설 기각)

lam <- powerTransform(df$exper)$lambda # 람다값 0.5581837

df$exper <- (df$exper^lam - 1) / lam

hist(df$exper)
shapiro.test(df$exper) # 비록 유의수준 0.05 하에서는 정규성을 띄지 않지만
# box-cox 이전보다는 더 정규성을 띄게 됨 (해당 변환값을 사용하기로 결정)


# 수치형 변수 표준화

# 1. min-max 스케일링
df$website <- (df$website - min(df$website)) / (max(df$website) - min(df$website))
df$balance <- (df$balance - min(df$balance)) / (max(df$balance) - min(df$balance))
df$exper <- (df$exper - min(df$exper)) / (max(df$exper) - min(df$exper))

# 2. Standard 스케일링
# df$website <- (df$website - mean(df$website)) / sd(df$website)
# df$balance <- (df$balance - mean(df$balance)) / sd(df$balance)
# df$exper <- (df$exper - mean(df$exper)) / sd(df$exper)

# 범주형 변수 factor화
df$change1 <- ifelse(df$change == 1, 1, 0)
df$year2002 <- ifelse(df$year == 2002, 1, 0)
df$semester2 <- ifelse(df$semester == 2, 1, 0)
df$semester3 <- ifelse(df$semester == 3, 1, 0)
df$semester4 <- ifelse(df$semester == 4, 1, 0)

str(df)




# 풀 모델
full.model <- lm(website ~ balance + exper + change1 + year2002 + semester2 +
                   semester3 + semester4 + balance:exper + balance:change1 + 
                   balance:year2002 + balance:semester2 + balance:semester3 +
                   balance:semester4 + exper:change1 + exper:year2002 +
                   exper:semester2 + exper:semester3 + exper:semester4, data = df)

summary(full.model) # adjr2 = 0.5164, RMSE = 0.6954
# 유의하지 않은 변수가 많이 보임

vif(full.model, type="marginal") # vif값이 매우 큼

forw <- lm(website ~ 1, data = df) # 상수항만 활용
back <- full.model # 모든 변수 활용


# 전진선택법
# 절편만 있는 상수모형으로부터 시작해 중요하다고 생각되는
# 설명변수부터 차례로 모형에 추가
# 장점: 이해하기 쉽고 변수의 개수가 많은 경우에도 사용 가능
# 단점: 변수값의 작은 변동에도 결과가 크게 달라져 안정성이 부족함
fw <- step(forw, direction = 'forward', scope = list(lower = forw, upper = back))
# website ~ change1 + semester3 + balance + semester3:balance
summary(fw)


# 후진소거법
# 모든 독립변수를 포함한 모형에서 출발해 가장 적은 영향을 주는 변수부터
# 하나씩 제거하면서 더 이상 제거할 변수가 없을 때까지 진행
# 장점: 전체 변수들의 정보를 이용할 수 있음
# 단점: 변수의 개수가 많으면 사용하기 어려움
bw <- step(back, direction = 'backward')
# website ~ balance + exper + change1 + semester2 + semester3 + 
# semester4 + balance:exper + balance:semester2 + balance:semester3 + 
# balance:semester4
summary(bw)

# 단계선택법
# 전진선택법에 의해 변수를 추가하면서 새롭게 추가된 변수에 기반하여,
# 기존 변수의 중요도가 약화되면 해당 변수를 제거하며,
# 단계별로 추가 또는 제거되는 변수의 여부를 검토하여
# 더 이상 변경사항이 없을 때까지 진행
sw <- step(forw, direction = 'both', scope = list(upper = back))
# website ~ change1 + semester3 + balance + semester3:balance
summary(sw)

# 참고: step함수의 AIC는 extractAIC값임
# extractAIC: 값은 다르지만, AIC 와 같은 역할을 함.


# 변수선택의 판정기준
# adjr2, MSE, cp(변수개수 + 상수개수에 가까울수록 좋음), AIC 등등

# AIC 는 예측능력이 높은 모형을 좋은 모형으로 선정
# BIC 는 자료 설명력이 높은 모형을 좋은 모형으로 선정
# BIC 는 AIC 에 비하여 단순한 모형을 좋은 모형으로 선정함

# 다중공선성을 안전하게 무시할 수 있는 세 가지 상황
# 1. vif가 높은 변수가 통제 변수이고 관심변수는 높은 vif를 가지지 않을 때
# 2. 높은 vif가 다른 변수의 거듭제곱 또는 곱을 포함하는 교호작용 항일 때
# 3. vif가 높은 변수가 범주가 3개 이상인 범주형 변수를 나타내는 factor형 변수일 때

library(olsrr)
summary(fw) # adjr2 = 0.5287, RMSE = 0.1509
AIC(fw) # -62.12077
BIC(fw) # -48.37802
ols_mallows_cp(fw, full.model) # 4.046173 (4에 가까울수록 좋음) <= 차이 0.046173
vif(fw, type = 'marginal') # semester3:balance의 vif가 크긴 하지만
# 교호작용 항이므로 다중공선성을 안전하게 무시할 수 있다


summary(bw) # adjr2 = 0.5718, RMSE = 0.1438
AIC(bw) # -63.86723
BIC(bw) # -36.38172
ols_mallows_cp(bw, full.model) # 4.538355 (7에 가까울수록 좋음) <= 차이 2.461645
vif(bw, type = 'marginal') # 교호작용 항들의 vif가 크긴 하지만
# 교호작용 항이므로 다중공선성을 안전하게 무시할 수 있다

summary(sw) # adjr2 = 0.5287, RMSE = 0.1509
AIC(sw) # -62.12077
BIC(sw) # -48.37802
ols_mallows_cp(sw, full.model) # 4.046173 (4에 가까울수록 좋음) <= 차이 0.046173
vif(sw, type = 'marginal') # semester3:balance의 vif가 크긴 하지만
# 교호작용 항이므로 다중공선성을 안전하게 무시할 수 있다

# adjr2가 가장 좋은 모델: bw
# RMSE가 가장 좋은 모델: bw
# AIC가 가장 좋은 모델: bw
# BIC가 가장 좋은 모델: fw 또는 sw
# Cp가 가장 좋은 모델: fw 또는 sw

# 따라서 bw를 최종모델로 선정