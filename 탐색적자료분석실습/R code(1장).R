## 1. Table 형태의 data 입력
### 1) read.table: 한 칸 이상의 공란으로 자료 구분
  geyser <- read.table("geyser299.txt", header=T)
  str(geyser)
#  read.table(stdin(), header=T) # keyboard 입력
 
### 2) read.csv: 콤마(,)로 자료 구분
  score <- read.csv("score1.csv", header=T)
  str(score)
#  read.csv(stdin(), header=T) # keyboard 입력

### 3) read.spss: SPSS 자료 입력
  library(foreign)
  spss.dat <- read.spss("EEstock2000.sav")
  str(spss.dat)

### 4) read.table을 이용한 엑셀 파일 입력
  # 4-1) myexcel.xlsx 파일을 열고 해당 부분을 복사
  #      read.table("clipboard", header=T, sep="\t")
  # 4-2) readxl package 사용
  #      library(readxl)
  #      read_excel("myexcel.xlsx")
          # tibble 형식이라 
          # as.data.frame(read_excel("myexcel.xlsx"))
          # 을 통해 data frame으로 만들 수 있음 
  # 4-3) rio package 사용
  #      library(rio)
  #      import("myexcel.xlsx")

## 2. 데이터 세트 병합
data1 <- read.table("mid.txt", header=T)
data1
data2 <- read.table("final.txt", header=T)
data2
data1.and.2 <- merge(x=data1,y=data2,by.x="id", by.y="id") # 둘 다 id가 있는 것만
data1.and.2
data1.or.2 <- merge(x=data1,y=data2,by.x="id", by.y="id", all=T) # id가 하나만 있으면 됨
data1.or.2

## 3. 유용한 명령어
ls()
search()
rm(data1,data2)
ls()
plot(geyser)
