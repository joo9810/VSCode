today <- Sys.Date()
today
Sys.Date()
class(today)
time <- Sys.time()
class(time)

unclass(today)
unclass(time)

as.POSIXct(unclass(time),origin = '1970-01-01')

time2 <- as.POSIXlt(Sys.time())
time2$year + 1900
time2$mon
time2$mday
time2$wday

class(Sys.time())
class(time2)

now <- Sys.time()
now
class(now)
a <- format(now,'%Y-%m-%d %H:%M:%S')
class(a)

Sys.Date()+100

a <- '2020-01-01'
a
class(a)
b <- as.Date(a,'%Y-%m-%d')
class(b)
b+365

c <- '2020-01-01'
d <- '1990-01-01'
class(c)
class(d)
e <- as.Date(c,'%Y-%m-%d')
f <- as.Date(d,'%Y-%m-%d')
e
f
class(e)
class(f)
e-f
as.numeric(e-f)

g <- '1990-01-01'
h <- as.Date(g,'%Y-%m-%d')
Sys.Date()-h

difftime('1990-01-01',Sys.Date())
