titanic <- read.csv('titanic.csv',header = T) # 타이타닉 생존자 데이터
str(titanic)

## 모델 적합하기 (Model Fitting) ##
train <- titanic[1:600,] # 훈련 데이터 (800개)
test <- titanic[601:889,] # 시험 데이터 (89개)

# Survived를 설명변수, 나머지를 반응변수로하는 모델 적합
# Survived는 0과 1로 이루어진 이항변수이므로 로지스틱 회귀모형으로 적합
model <- glm(Survived ~ ., family = binomial(link = 'logit'), data = train)
summary(model)
# 유의수준 0.05하에서 Pclass, Sex, Age, SibSp만 유의하다
model <- glm(Survived ~ Pclass + Sex + SibSp, family = binomial(link = 'logit'), data = train)
## 로지스틱 회귀분석 결과 분석하기 ##
library(car)
Anova(model) # Null deviance와 Residual deviance 사이의 차이가 얼마나 큰지

# null deviance : 상수항만 가지는 귀무가설 하에서의 모형이탈도 (1개의 모수를 사용)
# Residual deviance : 적합된 모형의 이탈도 (2개의 모수를 사용)

# H_0 : 모형이 자료를 잘 적합한다, H_1 : 모형이 자료를 잘 적합하지 않는다
# Pclass, Sex는 유의수준 0.05하에서 생존(Survived)을 잘 설명

## 모델의 예측 성능 평가하기 ##
fitted.results <- predict(model, newdata = test, type = 'response')
# 적합된 로지스틱 회귀모형에서 시험 데이터인 test가 들어갔을 때의 생존(Survived)확률을 추정
fitted.results # 각각의 시험 데이터에서의 생존 예측 확률을 출력 (총 89개)

fitted.results <- ifelse(fitted.results > 0.5, 1, 0) # cut-off 0.5로 설정
# Survived는 생존, 사망의 두 가지 상황만 있으므로 생존(1), 사망(0)으로
# 나타내기 위해 생존 예측 확률이 50%를 초과하면 1, 이하면 0을 부여

data.set <- data.frame(predicted = fitted.results, observed = test$Survived)
confusion_matrix <- table(data.set) ; confusion_matrix # 오차행렬
TP <- confusion_matrix[2,2] # 예측값과 참값이 모두 생존(1)일 때
TN <- confusion_matrix[1,1] # 예측값과 참값이 모두 사망(0)일 때
FP <- confusion_matrix[2,1] # 예측값은 생존(1) 참값은 사망(0)일 때
FN <- confusion_matrix[1,2] # 예측값은 사망(0) 참값은 생존(1)일 때

# (1) 정확도(accuracy) : 전체 개수에서 옳게 예측된 비율
accuracy <- (TP + TN)/(TP + TN + FP + FN) ; accuracy # 약 78.54%

# (2) 정밀도(precision) : 생존(1)으로 예측된것 중 실제로도 생존(1)인 비율
precision <- TP/(TP + FP) ; precision # 약 74.41%

# (3) 민감도(sensitivity) : 실제로 생존(1)인 것 중 예측도 생존(1)인 비율
# 민감도(sensitivity)는 재현율(recall) 또는 True Positive Rate라고도 부름
sensitivity <- TP/(TP + FN) ; sensitivity # 약 72.73%

# (4) 특이도(specificity) : 실제로 사망(0)인 것 중 예측도 사망(0)인 비율
specificity <- TN/(TN + FP) ; specificity # 약 61.53%

# (5) F1-score : 정밀도와 민감도의 조화평균 (조화평균 : 역수의 산술평균의 역수)
F1.score <- 2 * (1 / ( (1/precision) + (1/sensitivity) ) ) ; F1.score # 약 67.36%
# F1점수는 시스템의 성능을 하나의 수치로 표현하기 위해 사용하는 점수로
# 0~1 사이의 값을 가지며 정밀도와 재현율 중 한쪽만 클 때보다
# 두 값이 골고루 클 때 큰 값을 가진다. (1에 가까울수록 좋음)

# (6) 카파 통계량(Kappa) : 예측값과 참값이 얼마나 일치하는지 평가하는 값
# 0~1 사이의 값을 가지며 1에 가까울수록 좋음
# 1. 수식으로 계산
N <- sum(confusion_matrix) ; N # 총 개수
Pr_e <- ((TP + FP) * (TP + FN) + (FN + TN) * (FP + TN)) / (N^2)
# Pr_e : 예측값과 참값이 우연히 같은 평가를 내릴 확률
# (증명)
# 예측이 생존(1)을 줄 확률 : (TP + FP) / N
# 참값이 생존(1)을 줄 확률 : (TP + FN) / N
# 예측과 참값이 모두 생존(1)을 줄 확률은 위의 두 확률의 곱 ... (A)
# 예측이 사망(0)을 줄 확률 : (FN + TN) / N
# 참값이 사망(0)을 줄 확률 : (FP + TN) / N
# 예측과 참값이 모두 사망(0)을 줄 확률은 위의 두 확률의 곱 ... (B)
# 따라서 예측값과 참값이 우연히 같은 평가를 내릴 확률은 A와 B의 합
kappa <- (accuracy - Pr_e) / (1 - Pr_e) ; kappa # 0.654273
# 2. 라이브러리를 통해 계산
library(vcd)
Kappa(confusion_matrix) # 0.6543

# (7) ROC 곡선
library(Epi)
ROC(form = Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
    data = titanic)

# (8) AUC : ROC 곡선 아래 영역의 면적
# 앞선 그래프를 통해 AUC = 0.860임을 알 수 있다
# (1에 가까울 수록 모형의 성능이 좋음)

actual <- factor(test$Survived)
pred <- factor(fitted.results)

library(caret)
confusionMatrix(pred, actual, mode = 'everything', positive = '1')
confusionMatrix(pred, actual, positive = '1')
