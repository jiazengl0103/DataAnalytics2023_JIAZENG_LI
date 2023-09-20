file_name <-"C://Users//19178//Desktop//2023Fall//Data_Analytics//R//lab1//2010EPI_data.csv"
file_name
EPI_data <-read.csv(file_name, header = T)

# Convert the first row
names(EPI_data) <- as.matrix(EPI_data[1, ])
EPI_data <- EPI_data[-1, ]
help(attach)
EPI_data[] <- lapply(EPI_data, function(x) type.convert(as.character(x)))
EPI_data
View(EPI_data)

attach(EPI_data)
fix(EPI_data)

# Print EPI (unfiltered version)
EPI_data$EPI
tf <-is.na(EPI_data$EPI)
E <- EPI_data$EPI[!tf]
E # Print filtered DALY

# Stats of EPI
summary(E)
fivenum(E, na.rm=TRUE)
stem(E)
hist(E)
hist(E, seq(30.,95.,1.0), prob=T)
lines(density(E,na.rm=TRUE,bw=1.))
rug(E)

# Plotting filtered EPI data
plot(ecdf(E), do.points=FALSE, verticals=TRUE) 
par(pty="s") 
qqnorm(E); qqline(E)
#x <- rt(250, df = 5)
#qqnorm(x); qqline(x)
#qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
#qqline(x)

# Stats of EPIland 
#EPILand<-E[!Landlock]
#Eland <- EPILand[!is.na(EPILand)]
#hist(Eland)
#hist(Eland, seq(30., 95., 1.0), prob=T)

# Fitting distributions
#plot(ecdf(Eland), do.points=FALSE, verticals=TRUE) 
#par(pty="s") 
#qqnorm(Eland); qqline(Eland)

# Exercise 1: DALY and WATER_H
# DALY
EPI_data$DALY
# Filtering DALY
tf <-is.na(EPI_data$DALY)
DALY <- EPI_data$DALY[!tf]
DALY # Filtered version of DALY

# Stats of DALY
summary(DALY)
fivenum(DALY, na.rm=TRUE)
stem(DALY)
hist(DALY)
hist(DALY, seq(0.,95.,1.0), prob=T)
lines(density(DALY,na.rm=TRUE,bw=1.))
rug(DALY)

# Fitting distributions
# ecdf
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE) 
par(pty="s") 
# qq-plot
qqnorm(DALY); qqline(DALY)
qqplot(E, DALY, xlab = "EPI")
# box-plot
boxplot(E, DALY)

# WATER_H
# Filtering
EPI_data$WATER_H
tf <- is.na(EPI_data$WATER_H)
WATER <- EPI_data$WATER_H[!tf]
WATER #Filtered WATER_H

# Stats of WATER_H
summary(WATER)
hist(WATER)
hist(WATER, seq(0.,100.,1.), prob=T)
lines(density(WATER,na.rm=TRUE,bw=1.))
rug(WATER)

# Fitting Distributions
# ecdf
plot(ecdf(WATER), do.points=FALSE, verticals=TRUE)
# qq-plot
qqnorm(WATER)
qqline(WATER)
qqplot(E, WATER, xlab="EPI")
boxplot(E, WATER)


# Part2 of Lab1
help(qplot)
qplot(E,DALY)
plot(E,DALY,type="l")
points(E,DALY)
ggplot(EPI_data, aes(x=EPI,y=DALY))+ geom_line() + geom_point()

# Creating bar graph
barplot(DALY, names.arg = E)
table(DALY)
barplot(table(DALY))
qplot(DALY)

# Creating histograms
ggplot(EPI_data, aes(x=EPI))+geom_histogram(binwidth=4)
ggplot(EPI_data, aes(x=DALY))+geom_histogram(binwidth=4)
