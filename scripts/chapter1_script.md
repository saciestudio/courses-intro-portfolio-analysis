# Video 1: Welcome to the course


Welcome! Welcome to this course on portfolio analysis in R. My name is Kris Boudt. I am a Professor of finance at the free university of Brussel and Amsterdam. Besides my teaching and research, I also advise investment companies about best practices in portfolio management. 

My princicpal advice is to take investment decisions seriously and be aware of the risks involved in investing. Whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. 

***
***
There are some simple tricks to reduce the risk of making large losses. 

The first one is to seek for portfolio risk diversification. This means that one should avoid investing in one single asset, because by choosing intelligent combinations of investments, it becomes possible to increase return and reduce the risk. 

***

Another golden  rule in investing is to always test the portfolio strategy on historical data. And, once you are trading the strategy, to constantly monitor its performance. For this reason Datacamp is one of the best ways to learn portfolio analysis: I will teach you the theory in short videos and provide you the R instructions to do the portfolio analysis in practice. 

***

The course proceeds in four chapters. 

In Chapter 1 I will show you how to compute portfolio returns in R. 

Chapter 2 is about your skills to evaluate the portfolio performance. 

Chapters 3 and 4 are about optimizing the portfolio decision. This requires a multivariate view. Chapter 3 shows how the portfolio variance is a function of the assets individual volatility and all the correlations between the returns of the different assets. Chapter 4 then provides the tools to optimize portfolio decisions and choose portfolios that are efficient. It is not possible to have a higher return with less risk, or a lower risk with higher return. 

***

All together, these four chapters learn you to analyse portfolio return in R, which is a crucial skill to make investment profits without taking excessive risks. 

 
# Video 2: The investment decision in a portfolio context


The previous exercise has shown how different the performance can be across stocks. This is true for all types of investments, whether it is a stock, a real estate property or a bond, its future value is uncertain. This does not mean that the uncertainty should be ignored! Instead of randomly choosing investments, like a monkey trader would do (show cartoon), a responsible portfolio manager does the efforts of data analysis. By analyzing past returns, it becomes possible to characterize the uncertainty in terms of future gains and losses. This step of estimating the investment risk and return is essential for rational investing: you only take the risks that are worthwhile. (slide should show quote from Robert Engle's Nobel prize)  

***

A key factor in avoiding unnecessary risks is to exploit the gains of portfolio diversification. This means that one should avoid investing in one single asset, because by choosing intelligent combinations of investments, it becomes possible to increase at the same time expected return and reduce the risk, compare to buy-and-hold investments in a single asset.  


Let's now visualize these gains of diversification with a numeric example.  


***

Here you see the value evolution of the four stocks considered already (KO, PEP, MSFT en AAPL). They all show variability due to the risky nature of the asset returns and the performance is very different. If we had perfect foresight, the best investment would be to invest all your money in ... . In reality, future prices are uncertain. 

(Slides should show the price evolution of a winning, losing and at par position.)

***

In order to mitigate the individual risks of each of the assets, it may be wiser to invest in all three assets at the same time. It we invest the same amount in each of them (e.g. 1000 UUSD), then we have an equally weighted portfolio with weights one fourth. 

(Slide should show the formula: W_i = 1000/(1000+1000+1000+1000) = 1/4)

***

The resulting price evolution for the equally weighted portfolio is shown with a purple line. Note that the line is more smooth and the performance is the average of the two extremes. 

***

An alternative approach to portfolio weighting is to mimick the economy's endowment and set the personal portfolio weights equal to the relative value of the asset with respect to the total value of all traded assets in the economy. This leads to the approach of setting weights proportional to the asset's market capitalization, measured by the number of shares outstanding multiplied by their price. In our example, this could lead to the line ... 

*** 

Our final plot shows the limits and the gains of diversification. In order to avoid extreme losses, it is definitely not a good idea to put all your eggs in the same basket. At the same time, you may lose upside potential by spreading too much the portfolio weights. The key questions are thus: (i) Which investments to choose and (ii) How to monitor the portfolio performance to make sure it does what you expect it to do. 

***

The answer to these question start by understand portfolio performance figures. In this chapter, we'll break the portfolio value calculation down into a three step process: First, computing portfolio weights. Second, computing portfolio returns. Third, compounding portfolio returns to obtain the portfolio value evolution.  


***

# Video 3: One-period portfolio returns are the weighted average of the individual returns

Welcome to the second video of this chapter. This video will be about quantifying the relative changes in the value of your portfolios. We will use simple returns as the measure of the relative price changes and show that portfolio returns can be easily computed as the weighted average of the individual returns.  
***
In order to compute portfolio returns, we thus first need the returns on the single assets in the portfolio. Those returns are defined as the percentage price change. The slide shows the formula, when the initial price is P at time t, the next price is P at time t+1. Then the return over the period t to t+1, is the difference between P at time t+1 and P at time t, divided by the price at time t.  As an example, suppose the price increases from 100 USD to 110 USD, then the simple return equals 10%.  
***
Similarly, suppose we have a portfolio of two assets and the invested value of those three assets at the beginning of the period is 200 and 300. The end value is 180 and 330. The total initial portfolio value is thus 500. The total end value is 510. Then the simple return on the portfolio is: (510-500)/500 =  2%.  (show with a table)
Note that the portfolio weights of assets 1 and 2 40% and 60%, and the individual returns are -10% and   +10%. Note that the sum over the weights multiplied by the returns gives the portfolio return of 2%: 40% times -10% is -4%. 60% times 10% is +6%. The sum is 2%. 
***
In formula notation, the portfolio return thus equals the weighted average of the individual returns. The corresponding code in R is simple. It just involves a summation of the element in the vector obtained by multiplying the vector of portfolio weights with the vector of returns ( show formula: portfolio return = sum w[i] r[i] = sum( weights*returns ). 

***
Once we know the portfolio return over one period (e.g. a month), we could also be interested in the returns over multiple periods (e.g. one year). To compute this reason, we need to compound the individual returns over the multiple periods. Suppose there are k period. The price at time t+k equals the price at time t, reinvested at the single-period returns: that is price at t times 1+the return at t+1, 1+the return at t+2, etc. It follows that computing the multiperiod return involves taking the product of 1+the one-period returns and subtracting one from that value.  (show on slide) 

***

To put the theory in practice, there are now three exercises on computing portfolio returns.  


***

# Video 4: A realistic portfolio case: Investing in the 30 DJIA stocks over 25 years with monthly rebalancing

Let's now look at a realistic portfolio invested in the 30 Dow Jones Industrial Average stocks and track the portfolio performance over a period. Their symbols are summarized on this slide. 

***

It is important to understand the structure of the data. As you can see on the slide, each row correspond to the ending day of the month, each column to a stock. 

***

We now thus need to convert this table of prices into a table of returns. This can be done using the function calculateReturns in the function PerformanceAnalytics. This leads to a table with the first row consisting of NA because there is no previous price available to compute the returns. In R, this first row can be easily removed by indexing that row with a minus 1 sign.

***

The resulting multivariate return series looks as follows.

***

Now we need to transform this into a time series of portfolio returns. For this the function Return.portfolio is interesting. (show syntax) For us the first two arguments are relevant. R is the xts file containing the multivariate return series. Weights is the optional argument containing the weights at the beginning of each month. 

Remember from the formula that weights are crucial to define the portfolio returns, and that it is the weights at the beginning of the investment period, here beginning of the month.



*** 

By default and if we thus do not specify the weights, the function Return.portfolio assumes equal weighting.  


To understand what this means, consider the following sketch of the time line. Every tick denote the end of month, where the portfolio has a weight. By default, it is thus assumed that at the end of each month, the weights are reset to equal weights.  

***

The next exercises show how to compute those equally weighted portfolio returns. By compounding the total returns, defined as 1+returns, we obtain the portfolio value evolution. Plotting this wealth evolution will reveal the booms and busts of the stock market over the past 25 years.
