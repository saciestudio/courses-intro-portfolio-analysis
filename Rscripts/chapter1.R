# test scripts chapter 1

# Normal exercise 1

component_value <- c(4000,2000,2000)
component_weight <- component_value/sum(component_value)

#

# Define characteristics
characteristics <- seq(1,100)
# Compute the weights
weights <- characteristics/sum(characteristics)

summary(weights)


library(xts)
library(PerformanceAnalytics)


load("djia.rdata")