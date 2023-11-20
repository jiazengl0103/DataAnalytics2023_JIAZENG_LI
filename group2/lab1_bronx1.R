library(gdata) 
install.packages("xlsx")
library(xlsx)
#faster xls reader but requires perl!
#bronx1<-read.xls(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheet=1,perl="<SOMEWHERE>/perl/bin/perl.exe") 
#bronx1<-bronx1[which(bronx1$GROSS.SQUARE.FEET!="0" & bronx1$LAND.SQUARE.FEET!="0" & bronx1$SALE.PRICE!="$0"),]

#alternate
library("xlsx", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
bronx1<-read.xlsx("C:/Users/19178/Desktop/2023Fall/Data_Analytics/R/group2/NYhousing/rollingsales_bronx.xls",pattern="BOROUGH",stringsAsFactors=FALSE,sheetIndex=1,startRow=5,header=TRUE)

attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression
bronx1$SALE.PRICE<-sub("\\$","",bronx1$SALE.PRICE) 
bronx1$SALE.PRICE<-as.numeric(gsub(",","", bronx1$SALE.PRICE)) 
bronx1 <- bronx1[bronx1$SALE.PRICE > 0, ]
bronx1$GROSS.SQUARE.FEET<-as.numeric(gsub(",","", bronx1$GROSS.SQUARE.FEET)) 
bronx1 <- bronx1[bronx1$GROSS.SQUARE.FEET > 0, ]
bronx1$LAND.SQUARE.FEET<-as.numeric(gsub(",","", bronx1$LAND.SQUARE.FEET)) 
bronx1 <- bronx1[bronx1$LAND.SQUARE.FEET > 0, ]
plot(log(bronx1$GROSS.SQUARE.FEET), log(bronx1$SALE.PRICE)) 
m1<-lm(log(bronx1$SALE.PRICE)~log(bronx1$GROSS.SQUARE.FEET))
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

# Model 2

factor(bronx1$NEIGHBORHOOD)
log(bronx1$LAND.SQUARE.FEET)

m2<-lm(log(bronx1$SALE.PRICE)~log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD))
summary(m2)
plot(resid(m2))
# Suppress intercept - using "0+ ..."
m2a<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD))
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)+factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(log(bronx1$SALE.PRICE)~0+log(bronx1$GROSS.SQUARE.FEET)+log(bronx1$LAND.SQUARE.FEET)+factor(bronx1$NEIGHBORHOOD)*factor(bronx1$BUILDING.CLASS.CATEGORY))
summary(m4)
plot(resid(m4))
#
