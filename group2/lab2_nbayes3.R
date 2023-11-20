require(mlbench)
data(HouseVotes84)
install.packages('klaR')
library(klaR)
model <- naive_bayes(Class ~ ., data = HouseVotes84)
predict(model, HouseVotes84[1:10,-1])

pred <- predict(model, HouseVotes84[,-1])
pred
table(pred, HouseVotes84$Class)
