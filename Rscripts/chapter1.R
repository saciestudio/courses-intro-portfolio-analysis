# test scripts chapter 1

setwd("C:/datacamp/courses-intro-portfolio-analysis/Rscripts")

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


load("prices.rdata")

head(prices)
tail(prices)

# Calculate the returns for the montly prices
returns = CalculateReturns(prices, method="simple")
# Remove first row because it is NA
returns = returns[(-1),]

preturns.ew <- Return.portfolio( returns )
# Tabulate those returns as month x year  
table.CalendarReturns(preturns.ew)  
# Make the time series plot
plot.zoo(preturns.ew)



# Define the time series holding the cumulative.value
cumulative.value <- cumprod(1+preturns.ew)
# plot the wealth evoluation
plot.zoo(cumulative.value)
