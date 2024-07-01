library(rvest)

page1 <- read_html('https://finance.yahoo.com/quote/MSFT?p=MSFT')
page1
# 특정 요소 추출, quote-header-info는 id, id는 앞에 #
page1 %>% html_node('#quote-header-info div:nth-child(1) h1') %>% 
  html_text()

page2 <- read_html('https://finance.yahoo.com/quote/MSFT?p=MSFT')
page2 %>% html_node('#quote-header-info div:nth-child(2) span') %>% 
  html_text()

page3 <- read_html('https://finance.yahoo.com/quote/MSFT?p=MSFT')
page3 %>% html_node('#quote-header-info div:nth-child(3) span') %>% 
  html_text() %>% as.numeric # 숫자형으로 안바꿔주면 문자형으로 인식

page4 <- read_html('https://cran.rstudio.com/web/packages/available_packages_by_name.html')
pkg_table <- page4 %>% html_node('table') %>% html_table(fill = T)
head(pkg_table)
pkg_table <- pkg_table[complete.cases(pkg_table),] # 결측치 제거
pkg_table
colnames(pkg_table) <- c('pkg_name','title')
head(pkg_table)

pkg_df <- as.data.frame(pkg_table)
str(pkg_df)
write.csv(pkg_df,file = 'pkg_R.csv')

page5 <- read_html('http://it.chosun.com/site/data/html_dir/2017/09/27/2017092785016.html')
page5 %>% html_node('h1#news_title_text_id') %>% html_text()

page5 %>% html_node('div.par') %>% html_text()

page4 %>% html_node('h1') %>% html_text()

page6 <- read_html('https://finance.yahoo.com/quote/MSFT?p=MSFT')
page6 %>% html_node('h1') %>% html_text()
