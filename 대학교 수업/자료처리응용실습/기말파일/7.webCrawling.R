#install.packages('tidyverse')
library(tidyverse)
#install.packages('httr')
library(httr)
#install.packages('rvest')
library(rvest)
#install.packages('jsonlite')
library(jsonlite)
library(stringr)
library(dplyr)
# request -> extract -> save
today <- Sys.Date()
today

searchWord <- 'covid19'

ref <- 'https://section.blog.naver.com/BlogHome.nhn'
# 주소의 ? 앞까지 복사 붙혀넣기

# 헤더 부분의 리퀘스트 url의 ? 앞까지 붙혀넣기
res <- GET(url = 'https://section.blog.naver.com/ajax/SearchList.nhn',
           query = list(countPerPage=7,
                        currentPage=1,
                        startDate=today,
                        endDate=today,
                        keyword=searchWord),
           add_headers(referer = ref)) #참조 사이트를 ref로 해달라
res

json <- res %>% content(as='text') %>% fromJSON()
json <- res %>% content(as='text') %>% str_remove(pattern = "\\)\\]\\}\\',") %>% fromJSON()
json
str(json)
json$result$totalCount # 총 블로그 수

df <- json$result$searchList
df <- df %>% select(blogId,postUrl,noTagTitle,nickName,blogName,addDate,contents)
View(df) # data.frame으로 된 형식을 정리해서 보여줌
df$addDate <- as.POSIXct(df$addDate/1000,origin = '1970-01-01')
df$addDate # 일반적으로 1000으로 나누는 듯?.. 정확한 이유는 몰겠
colnames(df) <- c('bid','url','head','nickNm','blogNm','Date','contents')
View(df) # 이름이 다 바뀐 상태임

saveRDS(df, file = 'df.RDS') # df를 df.RDS로 저장
df_RDS <- readRDS('df.RDS')
df_RDS
str(df_RDS) # 최종적으로 비정형데이터를 R파일로 변환시켰기 때문에 이제 이걸로
# 불러와서 작업을 하면 된다는 뜻
