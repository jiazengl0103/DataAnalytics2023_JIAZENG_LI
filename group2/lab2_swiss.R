data(swiss)
sclass <- kmeans(swiss[2:6], 3) 
table(sclass$cluster, swiss[,2])    
# 
library(e1071)
m <- naiveBayes(swiss[2:6], swiss[,2])  
help(predict)
pred <- predict(m, swiss[2:6])
table(pred)

