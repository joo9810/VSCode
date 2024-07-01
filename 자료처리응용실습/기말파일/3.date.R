today <- Sys.Date() # 현재 날짜
today
class(today)
time <- Sys.time() # 현재 날짜에 시간까지 보여줌
time
class(time)

unclass(today) #1970년 1월 1일 부터 현재까지 경과한 날짜 수
unclass(time) #1970년 1월 1일 부터 현재까지 경과한 초 수

# POSIXct는 초 수와 시간대에 대한 정보를 저장
# POSIXlt는 연도, 월, 일, 시, 분, 초를 포함하는 9개의 정보를 리스트에 저장
as.POSIXct(unclass(time),origin = '1970-01-01')

#그냥 Sys.time()는 POSIXct 형식이라 $ 사용이 불가능 함
time2 <- as.POSIXlt(Sys.time()) # POSIXct로 할 경우 에러 발생
time2 # ct는 날짜와 시간을 나타내고 lt는 년도 월 일도 나타내기 때문
time2$year + 1900 # 현재 년도
time2$mon + 1 # 현재 월
time2$mday # 현재 일
time2$wday # 현재 요일 1:월요일, 2:화요일, 3:수요일, ..., 7:일요일

# date -> character
now <- Sys.time()
now
class(now)

a <- format(now,'%y-%m-%d %H:%M:%S')
class(a)

b <- as.Date('20210503',format='%Y%m%d')
class(b)

# date calculation

Sys.Date()+100

# 2020-01-01로 부터 365일이 지난 날짜를 구하고 싶을 때
as.Date('2020-01-01',format='%Y-%m-%d') + 365

days <- as.Date('1990-01-01')-as.Date('2025-01-01')
as.numeric(days)
difftime('1990-01-01',Sys.Date())
as.difftime('09:40:00')-as.difftime('18:30:00')
as.Date('1990-01-01',format='%Y-%m-%d')
