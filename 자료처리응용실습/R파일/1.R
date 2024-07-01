df <- data.frame(subject_name,temperature,flu_status,gender,blood,
                 symptoms,stringsAsFactors = FALSE)
str(df) #구조 함수 factor 명목척도 ord.factor 서열척도 (중요)
df$subject_name
df[1,2] #[행번호,열번호]

x=First <- c('10','9','8','7','6','5','4','3','2','1')
y=Second <- c('-4','-3','-2','-1','0','1','2','3','4','5')
q=Sport <- c('Hotkey','Football','Baseball','Curling','Rugby',
             'Lacrosse','Basketball','Tennis','Cricket','Soccer')
theDF <- data.frame(x,y,q)
str(theDF)
theDF[c(3,5),2:3]
