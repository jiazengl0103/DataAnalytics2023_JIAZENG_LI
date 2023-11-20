library(mlbench)
require(mlbench)
install.packages('naivebayes')
library(naivebayes)
data(HouseVotes84)
model <- naive_bayes(Class ~ ., data = HouseVotes84)
predict(model, HouseVotes84[1:10,-1])
predict(model, HouseVotes84[1:10,-1], type = "raw")

pred <- predict(model, HouseVotes84[,-1])
table(pred, HouseVotes84$Class)

## Example of using a contingency table:
data(Titanic)
m <- naive_bayes(Survived ~ ., data = Titanic)
m
predict(m, as.data.frame(Titanic)[,1:3])

## Example with metric predictors:
data(iris)
m <- naive_bayes(Species ~ ., data = iris)
## alternatively:
m <- naive_bayes(iris[,-5], iris[,5])
m
table(predict(m, iris[,-5]), iris[,5])
