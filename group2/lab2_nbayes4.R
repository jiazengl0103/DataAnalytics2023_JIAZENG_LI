# Josh Walters
#install.packages('ElemStatLearn')  # ElemStatLearn is no longer available 
#library('ElemStatLearn')
library("klaR") # different from e1071 naivebayes - try it too!
install.packages('caret')
library("caret")
library(ggplot2)
data(spam, package="ElemStatLearn")

sub = sample(nrow(spam), floor(nrow(spam) * 0.9))
train = spam[sub,]
test = spam[-sub,]

xTrain = train[,-58]
yTrain = train$spam

xTest = test[,-58]
yTest = test$spam

model = train(xTrain,yTrain,'nb',trControl=trainControl(method='cv',number=10))

prop.table(table(predict(model$finalModel,xTest)$class,yTest))

# Alternate way to set up a training sample
train.ind <- sample(1:nrow(spam), ceiling(nrow(spam)*2/3), replace=FALSE)

# apply NB classifier
nb.res <- NaiveBayes(spam ~ ., data=spam[train.ind,])

# predict on holdout units
nb.pred <- predict(nb.res, spam[-train.ind,])

# but this also works on the training sample, i.e. without using a `newdata`
head(predict(nb.res))
