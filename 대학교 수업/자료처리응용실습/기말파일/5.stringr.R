#install.packages('tidyverse')
library(tidyverse)
str1 <- '자세히 보아야 예쁘다'
str2 <- '오래 보아야 사랑스럽다'
str3 <- '너도 그렇다'

str_c(str1,str2,str3) # 벡터 형태로 출력
flower <- str_c(str1,str2,str3, sep = '. ')
flower
str(flower)
flower2 <- str_split(string = flower,pattern = ' ')
flower2 # flower의 공백을 기준으로 분리시켜 출력
str(flower2) # split으로 분리하면 list로 출력
flower3 <- str_split(string = flower,pattern = ' ') %>% unlist()
flower3
unlist(flower2)

str_c(flower3,collapse = ' ') # 문자열 통합

str_replace_all(string = flower,pattern = ' ',replacement = '*')
# flower의 공백을 *로 채워 넣음

str_extract_all(string = flower,pattern = '.')
str_extract_all(string = flower,pattern = '다')
str_count(string = flower,pattern = '다')
str_extract_all(string = flower,pattern = '보아야')
str_count(string = flower,pattern = '보아야')

str <- 'abc123가나/rn,._?'
nchar(str)
str_extract_all(string = str,pattern = '\\w') # \\w=문자
str_extract_all(string = str,pattern = '\\W') # \\W=문자가 아닌 것
str_extract_all(string = str,pattern = '\\d') # \\d=숫자
str_extract_all(string = str,pattern = '\\D') # \\D=숫자가 아닌 것
str_extract_all(string = str,pattern = '\\s') # \\s=공백
str_extract_all(string = str,pattern = '\\S') # \\S=공백이 아닌 것
str_extract_all(string = str,pattern = '\\t') # \\t=Tab
str_extract_all(string = str,pattern = '\\p{hangul}') # \\p{hangul}=한글
str_extract_all(string = str,pattern = '.') # .=모든 문자열
str_extract_all(string = str,pattern = '\\w{3}') # 같은 문자열이 3번 나온 것

str2 <- c('abc','bcd','cde','def')
str_extract(str2,'ab|cd') # ab이거나 cd인 텍스트를 출력
str_extract(str2,'[af]') # a와 f중에 하나라도 포함하면 출력
str_extract(str2,'a|f') # 위와 동일
str_extract(str2,'^b') # b로 시작하는 텍스트 출력
str_extract(str2,'e$') # e로 끝나는 텍스트 출력