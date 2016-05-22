library(lubridate)
library(plyr)
library(dplyr)
library(fitbitScraper)
eml<-"voelker.charles@gmail.com"
pwd<-readline("Password:")
cookie<-
  fitbitScraper::login(
    eml,pwd,rememberMe=TRUE
  )
hr_data = list(time = c(), hrate = c())

cookie = login(eml, pwd, rememberMe = TRUE)
startdate = as.Date('2016-01-01', format = "%Y-%m-%d")
enddate = today()
s = seq(startdate, enddate, by="days")

for (i in 1:length(s)) {
  df = get_intraday_data(cookie, "heart-rate", date=sprintf("%s",s[i]))
  names(df) = c("time","hrate")
  hr_data = rbind(hr_data, df)
  rm(df)}


