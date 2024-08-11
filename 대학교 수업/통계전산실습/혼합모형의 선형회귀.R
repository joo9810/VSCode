#create data frame
df <- data.frame(points=c(7, 7, 9, 10, 13, 14, 12, 10, 16, 19, 22, 18),
                 hours=c(1, 2, 2, 3, 2, 6, 4, 3, 4, 5, 8, 6),
                 program=c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3))

#view data frame
df

# points = beta0 + beta1*hours + beta2*program
# hours는 연속형 변수, program은 범주형 변수

#convert 'program' to factor
df$program <- as.factor(df$program)

#fit linear regression model
fit <- lm(points ~ hours + program, data = df)

#view model summary
summary(fit)

# points = 6.3013 + 0.9744*hours + 2.2949*program2 + 6.8462*program3

# 해석
# program을 일정하게 유지한다고 가정할 때 hours가 한 단위 증가할 때마다
# points가 평균적으로 0.9744씩 증가한다. (p_value = 0.015)
# hours를 일정하게 유지한다고 가정할 때 program2를 사용한 선수는
# program1을 사용한 선수보다 평균 2.2949점 더 득점한다 (p_value = 0.078234)
# hours를 일정하게 유지한다고 가정할 때 program3를 사용한 선수는
# program1을 사용한 선수보다 평균 6.8462점 더 득점한다 (p_value = 0.002235)