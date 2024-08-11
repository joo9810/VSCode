# 1번
mid <- read.csv('midterm_exam.csv', header = T)
final <- read.csv('final_exam.csv', header = T)

# 2번
mid$total <- apply(mid[,-1],1,sum)
final$total <- apply(final[,-1],1,sum)

# 3번
apply(mid[,-1],2,mean)
apply(final[,-1],2,mean)

# 4번
mid$score <- mid$total * (100/70)
final$score <- final$total * (100/80)

# 5번
merge_data <- merge(mid, final, by = 'idno', suffixes = c('midterm','final'))

# 6번
merge_data$finalScore <- apply(merge_data[,c(10,20)], 1, mean)
merge_data

# 7번
index <- order(merge_data$finalScore, decreasing = T)
eval_data <- merge_data[index,]

# 8번
write.csv(eval_data, file = 'eval.csv')
