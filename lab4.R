# first 30 rows of cars dataset
cars1 <- cars[1:30,]

head(cars1)

outliers <- data.frame(speed = c(19,19,20,20,20), dist=c(190,186,210,220,218))

head(outliers)

cars2 <- rbind(cars1, outliers)

par(mfrow = c(1,2))

#plot the data with outliers
plot(cars2$speed, cars2$dist, xlim=c(0,28), ylim=c(0,230), 
     main="with outliers", xlab="speed", ylab="dist", pch="*", col="coral", cex=2)
model1 <- lm(dist~speed, data=cars2)
abline(model1, col="cyan3", lwd=3, lty=2)

plot(cars1$speed, cars1$dist, xlim=c(0,28), ylim=c(0,230), 
     main="without outliers", xlab="speed", ylab="dist", pch="*", col="coral", cex=2)
model2 <- lm(dist~speed, data=cars1)
abline(model2, col="cyan3", lwd=3, lty=2)

# KMeans example
library(ISLR)
library(ggplot2)

head(iris)
str(iris)
plot(iris$Petal.Length, iris$Petal.Width, col)
