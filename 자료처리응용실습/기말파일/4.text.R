str <- 'abc123가나/rn,._?'
nchar(str) # 텍스트의 길이

x <- 'DATA'
y <- paste(str,x) # 텍스트 결합 (텍스트 사이는 공백으로 처리)
y
nchar(y) # 15개(str) + 1개(공백) + 4개(y) = 20개
paste(str,x,sep = '-') # 공백 공간을 어떤 것으로 채울 것인지

substr(str,1,3) # str의 시작번호1, 끝나는번호3 사이의 문자를 출력
substr(str,4,6)
substr(y,17,20)

strsplit(str,'/') # /를 기준으로 분리
strsplit(str,'3')
strsplit(y,' ') # 공백을 기준으로 분리
strsplit(y,split = '\\s') # 위와 같음 (공백을 기준으로)

sub('r','R',str) # str에서 r을 R로 바꿈
sub('a','*',str) # str에서 a를 *로 바꿈
gsub('A','a',y) # y에서 모든 A를 a로 바꿈
z <- gsub('A','a',y)
z
z1 <- gsub('a','z',z)
z1

grep('abc',str) # abc라는 문자열을 str에서 찾음
grep('abc',str,value = T) # (value값이 없으면 인덱스 값으로 출력)
grep('123',str) # 123라는 문자열을 str에서 찾음
grep('DATA',y)
grep('[ab]',str,value = T) # [ab]는 a 또는 b가 들어있는 문자열을 출력
grep('[[:blank:]]',str) # str에서 공백이 있는지
grep('[[:blank:]]',str,value = T)
grep('[[:blank:]]',y)
grep('[[:blank:]]',y,value = T)
grep('\\t',y) # \\t=Tab키는 공백을 4칸 포함하고 있기 때문에 y에서 없는 걸로 나옴

sample <- c('Map','map','MAP','CAP','cap','Cap','TAP','tab','Tab')
grep('cap',sample)
grep('cap',sample,value = T)
grep('CAP',sample)
grep('CAP',sample,value = T)
grep('^t+',sample) # t로 시작하면서 t뒤에 다른글자가 있는 문자열을 출력
grep('^t+',sample,value = T)
grep('ap$',sample) # ap로 끝나는 문자열을 출력
grep('ap$',sample,value = T)
grep('[AP]',sample) # A 또는 B가 포함된 문자열을 출력
grep('[AP]',sample,value = T)
grep('[[:upper:]]',sample) # [[:upper:]]=대문자가 포함된 문자열을 출력
grep('[[:upper:]]',sample,value = T)
grep('[[:lower:]]',sample) # [[:lower:]]=소문자가 포함된 문자열을 출력
grep('[[:lower:]]',sample,value = T) 
grep('[[:digit:]]',sample) # [[:digit:]]=숫자가 포함된 문자열을 출력
grep('[[:digit:]]',sample,value = T)
grep('\\d',sample) # \\d=[[:digit:]]=숫자

fruits <- readLines('fruits.txt')
fruits
str(fruits)
grep('\\d',fruits)
grep('\\d',fruits,value = T)
grep('[0-9]',fruits)
grep('[0-9]',fruits,value = T)
grep('^\\w+:\\s\\d+$',fruits)
grep('^\\w+:\\s\\d+$',fruits,value = T)
grep('^\\w+:\\s\\d$',fruits)
grep('^\\w+:\\s\\d$',fruits,value = T)
# 마지막에 +를 뺀 경우에는 \\d이 나오고 바로 끝나야 하기 때문에
# 수박만 숫자가 1자리이기 때문에 수박만 나옴
grep('^\\w+:+\\s+\\D+$',fruits,value = T)