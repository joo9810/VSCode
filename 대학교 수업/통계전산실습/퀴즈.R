# 1번

# 막대그래프의 특징
# 막대그래프는 하나의 범주형 변수의 빈도를 나타낼 때 사용하며
# 누적 막대그래프는 두개의 범주형 변수의 빈도를 나타낼 때 사용합니다.

# 막대그래프의 장단점
# 모자이크 플랏과 다르게 누적 막대그래프는 빈도를 나타내기 때문에
# 각 x축 변수의 빈도를 비교할 수 있습니다.
# 하지만 두 변수의 비율을 비교할 때는 적합하지 않습니다.

# 모자이크 플랏의 특징
# 모자이크 플랏은 두 범주형 변수의 비율을 나타낼 때 사용합니다.
# 모자이크 플랏은 누적 막대그래프와 동일한 정보를 제공하며
# 누적 막대그래프의 각 세로축은 가로축 변수의 빈도를 나타내지만
# 모자이크 플랏은 모든 가로축 변수의 높이가 동일하며 100%를 나타냅니다.

# 모자이크 플랏의 장단점
# 모자이크 플랏은 두 변수의 비율을 비교할 때는 적합하지만
# 각각의 x축 변수의 도수를 비교할 때는 적합하지 않습니다.

# 2번
x <- c(7,7,8,3,2,4,4,6,6,7,5,3,3,5,8)
y <- c(1,1,1,2,2,2,2,2,2,3,3,3,6,7,8)

plot(y~x) # 산점도

library(car)
summary(powerTransform(x)) # 변환 필요 X

powerTransform(x)$lambda # 람다값

summary(powerTransform(y)) # 변환 필요 O

powerTransform(y)$lambda # 람다값


plot(log(y)~x)

plot(log(y)~log(x))

plot(y~log(x))



# 3번
x1 <- x
x2 <- y

# H0: x1의 평균과 x2의 평균은 같다
# H1: x1의 평균과 x2의 평균은 같지 않다

paired_ttest <- function(x1, x2, alternative){
  n <- length(x1)
  diff <- x1 - x2
  se <- sd(diff) / sqrt(n)
  t <- mean(diff) / se
  df <- n - 1
  if(alternative == 'two.sided'){
    p_value <- 2 * pt(-abs(t), df)
    lower <- mean(diff) - qt(0.975, df) * se
    upper <- mean(diff) + qt(0.975, df) * se
  } else if(alternative == 'greater'){
    p_value <- 1 - pt(t, df)
    lower <- mean(diff) - qt(0.95, df) * se
    upper <- +Inf
  } else if(alternative == 'less'){
    p_value <- pt(t, df)
    lower <- -Inf
    upper <- mean(diff) + qt(0.95, df) * se
  }
  return(c(t = t, df = df, p_value = p_value, lower = lower, upper = upper, difference = mean(diff)))
}

t.test(x1-x2, alternative = 'two.sided', conf.level = 0.95)
paired_ttest(x1,x2,'two.sided')

# 유의확률이 0.05보다 작으므로 귀무가설 기각
