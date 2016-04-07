# Each package should be loaded before usage
library("PerformanceAnalytics")
library("tseries")
library("xts")

# Specify the tickers of the stocks for which we want to download #the data
tickers = c("AA","AAPL", "AXP", "BA", "BAC", "CSCO" , "CAT", "CVX",  "DD",  "DIS" ,"GE", "GS" , 
             "HD","HPQ","INTC", "IBM", "JNJ", "JPM",  "KO",
            "MCD", "MMM", "MRK", "MSFT", "NKE","PFE", "PG", "TRV", "UNH","UTX", "VZ", "WMT" , "XOM" , "T" )



# Set the dates for which we want to compare the returns
date.start = as.Date("1988-12-20")
date.end   = as.Date("2015-12-31")	

# Save SP500 daily closing prices as benchmark
sp500.daily = get.hist.quote(
  instrument = "^GSPC",
  quote= "AdjClose",
  start = date.start, 
  end = date.end)

# We want monthly closing prices (fourth column)
monthly.prices = to.monthly(sp500.daily)[,4]
TT = length(monthly.prices)

# Save the loaded tickers
tickers.loaded = "sp500"

# For each stock in our selection
for (stock in tickers) {
  # Download the stock price data
  stockprice = try(get.hist.quote(
    instrument = stock, 
    quote      = "AdjClose",
    start      = date.start, 
    end        = date.end))
  
  # Check for errors
  if (class(stockprice) == "try-error") {
    print(c("No data for ", stock))
    next
  }
  
  # Save monthly closing price
  close = to.monthly(stockprice)[,4]
  
  # Require stocks that have no missing monthly observations
  if(length(close) != TT) {
    print(c("Incorrect length for ", stock));
    next
  }
  
  # Save monthly prices & current ticker
  monthly.prices = cbind(monthly.prices, as.numeric(close)) 
  tickers.loaded = c(tickers.loaded, stock)
}

# Use the loaded tickers as column names
colnames(monthly.prices) = tickers.loaded

###########################
# AVOID LANGUAGE DEPENDENCE IN THE CODE:
# replace the month year time dates with YYYY-MM-DD
newdates = seq(as.Date(time(monthly.prices))[2], length=nrow(monthly.prices), by="1 month") - 1
monthly.prices = xts( monthly.prices , order.by = newdates )

head(monthly.prices)

djia_prices = monthly.prices
djia = window(djia_prices[,(-1)],start=as.Date("1990-12-31"),end=as.Date("2015-12-31"))
head(djia)
save(djia,file="djia.Rdata")
prices = djia
save(prices,file="prices.Rdata")

saveRDS(prices,file="prices.rds")

# rm(prices); prices <- readRDS("prices.rds")