file_name <-"C://Users//19178//Desktop//2023Fall//Data_Analytics//R//lab1//2010EPI_data.csv"
file_name
EPI_data <-read.csv(file_name, header = T)

names(EPI_data) <- as.matrix(EPI_data[1, ])
EPI_data <- EPI_data[-1, ]
EPI_data[] <- lapply(EPI_data, function(x) type.convert(as.character(x)))
EPI_data
View(EPI_data)

attach(EPI_data)
fix(EPI_data)

# Print DALY (unfiltered version)
EPI_data$EPI
tf <-is.na(EPI)
E <- EPI[!tf]
E # Print filtered DALY

#stats of DALY
summary(E)
fivenum(E, na.rm=TRUE)
stem(E)
hist(E)
hist(E, seq(30.,95.,1.0), prob=T)
lines(density(E,na.rm=TRUE,bw=1.))
rug(E)

plot(ecdf(E), do.points=FALSE, verticals=TRUE) 
par(pty="s") 
qqnorm(E); qqline(E)
x <- rt(250, df = 5)
qqnorm(x); qqline(x)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

EPILand<-E[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=T)

plot(ecdf(Eland), do.points=FALSE, verticals=TRUE) 
par(pty="s") 
qqnorm(Eland); qqline(Eland)
y <- rt(250, df = 5)
qqnorm(y); qqline(y)
qqplot(qt(ppoints(250), df = 5), y, xlab = "Q-Q plot for t dsn")
qqline(y)

