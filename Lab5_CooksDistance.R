# Lab 5 - Cook's Distance

# loading necessary libraries
library(ISLR)
library(pillar)
library(magrittr)
library(dplyr)

# Looking through hitter dataset
head(Hitters)
dim(Hitters)
is.na(Hitters)

# Remove missing values
Data <- na.omit(Hitters)
dim(Data)
glimpse(Data)
head(Data)

# Predicting baseball player's salary
SalaryPredict <- lm(Salary ~., data = Data)
summary(SalaryPredict)

# Cook's Distance calculation
cooks <- cooks.distance(SalaryPredict)
influential <- cooks[(cooks > (3 * mean(cooks, na.rm = T)))]
influential

# identify and exclude outliers
infNames <- names(influential)
infNames
outliers <- Data[infNames,]
filtered_data <- Data %>% anti_join(outliers)

# predicting salary again with filtered data
SalaryPredict2 <- lm(Salary ~., data = filtered_data)
summary(SalaryPredict2)
