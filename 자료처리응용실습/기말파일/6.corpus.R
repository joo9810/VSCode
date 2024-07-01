#install.packages('tm')
library(tm)
#install.packages('wordcloud')
library(wordcloud)
#install.packages('tidyverse')
library(tidyverse)

data("crude")
crude # 아직 list 형식임
summary(crude)[1:6,]
inspect(crude[1]) # inspect 문서의 정보를 보여주는 함수
crude[[1]]$content # crude의 첫번째 문서의 콘텐츠를 보여줘
first <- crude[[1]]$content %>% str_extract_all(pattern = '[A-Za-z]+') %>% unlist()
first <- toupper(first) # 대문자로 변환
first
first <- tolower(first) # 소문자로 변환환
first

# corpus
crude.corpus <- VCorpus(VectorSource(crude)) # tm함수를 쓰기 위해 corpus 형태로 변환해야함
crude.corpus
crude.corpus[[1]]$content
crude_txt <- tm_map(crude.corpus,removeNumbers) # 숫자 제거
crude_txt[[1]]$content
crude_txt <- tm_map(crude_txt,removePunctuation) # 문장부호 제거
crude_txt[[1]]$content
crude_txt <- tm_map(crude_txt,stripWhitespace) # 공백 제거
crude_txt[[1]]$content

# function (사용자 정의 함수) 숙지 해 놓기 (잘 생각하면 어렵지 x)

a <- function(x){
  x <- tm_map(x, removeNumbers)
  x <- tm_map(x, removePunctuation)
  x <- tm_map(x, stripWhitespace)
  x <- tm_map(x, removeWords, stopwords()) # 불용어 제거 (of a in is 등)
  return(x)
}

crude_txt2 <- a(crude.corpus)
crude_txt2[[1]]$content # 숫자와 문장부호와 공백과 불용어가 다 제거된 상태

# TDM
crude.new <- VCorpus(VectorSource(crude_txt2)) # 텍스트를 corpus로 변환하는 함수
crude.new
# 숫자 문장부호 공백 불용어가 모두 제외되고 용어만 남겨야
# wordcloud를 만들 수 있기 때문
TDM.crude <- TermDocumentMatrix(crude.new) # TDM(용어문서행렬)으로 변환
dim(TDM.crude) # 용어가 962개있고 문서가 20개 있다는 뜻
inspect(TDM.crude) # inspect 문서의 정보를 보여주는 함수

# wordcloud (방법1)
TDM.crude2 <- as.matrix(TDM.crude)
TDM.crude2
TDM.crude3 <- rowSums(TDM.crude2)
TDM.crude4 <- TDM.crude3[order(TDM.crude3,decreasing = T)] # decreasing = T 내림차순
TDM.crude4[1:10] # 빈도표 (1~10위) [1:10]말고 head(10)으로 써도 됨
wordcloud(words = names(TDM.crude4),freq = TDM.crude4,
          min.freq = 5,random.order = F,colors = brewer.pal(8,'Dark2'))

# wordcloud (방법2)
TDM.crude2 <- as.matrix(TDM.crude)
crude.freq <- sort(rowSums(TDM.crude2),decreasing = T) # TDM.crude2의 행의 합을 구해 내림차순
head(crude.freq,10)
wordcloud(words = names(crude.freq),freq = crude.freq,min.freq = 5,random.order = F,
          colors = brewer.pal(8,'Dark2'))
# 최소 빈도값 5, 랜덤 배열 FALSE (TRUE로 하면 무작위 배열)
