set.seed(10)
data1 <- rnorm(50)

set.seed(30)
data2 <- rnorm(50)

# checking normality of data1
shapiro.test(data1)
hist(data1, col='coral')
# reject null hypothesis (p-value = 0.3625)

# checking normality of data2
shapiro.test(data2)
hist(data2, col='steelblue')
# fail to reject null hypothesis (p-value = 0.9143)

set.seed(0)
data <- rnorm(100)

# Checking normality again for data
shapiro.test(data)
# fail to reject null hypothesis (p-value = 0.6303)

# creating values from poisson distribution
set.seed(0)
data <- rpois(n=100, lambda = 3)

# Checking normality with shapiro test
shapiro.test(data)
hist(data, col = 'cyan3')
# reject null hypothesis (p-value = 0.00033)

install.packages('nortest')
library(nortest)

set.seed(1)
x <- rnorm(100, 0, 1)
ad.test(x)
# fail to reject null hypothesis (p-value = 0.9471)
# indicates normal distribution of x

# creating values from uniformly distributed
set.seed(1)
x <- runif(100, 0, 1)

ad.test(x)
# reject null hypothesis (p-value = 0.005)
# indicates x does not follow normal distribution