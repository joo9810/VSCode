subject_name <- c("John Doe","Jane Doe","Steve Graves")
temperature <- c(98.1,98.6,101.4)
flu_status <- c(FALSE,FALSE,TRUE)
gender <- factor(c('M','F','M'))
blood <- factor(c('O','AB','B'),
                levels=c('A','B','AB','O'))
symptoms <- factor(c('SEVERE','MILD','MODERATE'),
                   levels=c('MILD','MODERATE','SEVERE'),
                   ordered=TRUE)
# list : key = value (서로 다른 구조의 데이터가 다양하게 들어간다)
subject1 <- list(fullname=subject_name[1],
                 temper=temperature[1],
                 flu=flu_status[1],
                 gender=gender[1],
                 blood=blood[1],
                 symptoms=symptoms[1])
subject1
subject1[[2]]
subject1$temper

subject2 <- list(fullname=subject_name[2],
                 temper=temperature[2],
                 flu=flu_status[2],
                 gender=gender[2],
                 blood=blood[2],
                 symptoms=symptoms[2])
subject2
