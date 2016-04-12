# Video 1: The power of portfolio diversification


Welcome! Welcome to this course on portfolio analysis in R. My name is Kris Boudt. I am a Professor of finance at the free university of Brussel and Amsterdam. Besides my teaching and research, I also advise investment companies about best practices in portfolio management. 

My princicpal advice is to take investment decisions seriously and be aware of the risks involved in investing. Whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. 

***
There are some simple tricks to reduce the risk of making large losses. 

The first one is to seek for portfolio risk diversification. This means that one should avoid investing in one single asset, because by choosing intelligent combinations of investments, it becomes possible to increase return and reduce the risk. 

***

***


To kick off this course, I want to first convince you with a data example of the power of diversification. 

Indeed, whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. The value of the price change is uncertain, and, importantly, it depends on the asset. By optimizing the investments and by monitoring the returns, it becomes possible to reduce the uncertainty about future returns and increase the expected payoff. This is the essence of rational investing: you only take the risks that are worthwhile. 

***

To avoid excessive risks it is important not to concentrate all the investments in one single asset, but to spread your investment over a portfolio of multiple assets. This is called portfolio diversification. It aims at reducing the risk of making severe losses by investing in different assets.  

Let's now visualize these gains of diversification with a numeric example.  


***

Here you see the value evolution of a stock price index, a real estate index and a commodities index. They all show variability due to the risky nature of the asset returns and the performance is very different. If we had perfect foresight, the best investment would be to invest all your money in ... . In reality, future prices are uncertain. 

(Slides should show the price evolution of a winning, losing and at par position.)

***

In order to mitigate the individual risks of each of the assets, it may be wiser to invest in all three assets at the same time. It we invest the same amount in each of them (e.g. 1000 UUSD), then we have an equally weighted portfolio with weights one third. 

(Slide should show the formula: W_i = 1000/(1000+1000+1000) = 1/3)

***

The resulting price evolution for the equally weighted portfolio is shown with a purple line. Note that the line is more smooth and the performance is the average of the two extremes. This shows the limits and the gains of diversification. In order to avoid extreme losses, it is definitely not a good idea to put all your eggs in the same basket. At the same time, you may lose upside potential by spreading too much the portfolio weights. The key questions are thus: (i) Which investments to choose and (ii) How to monitor the portfolio performance to make sure it does what you expect it to do. In this course you will learns the tools to answer these challenging questions in R. 

***

In this chapter, we'll break the portfolio value calculation down into a three step process: First, computing portfolio weights. Second, computing portfolio returns. Third, compounding portfolio returns to obtain the portfolio value evolution.  

***

The proof is in the pudding. Let's start off with the definition of portfolio weights. Either we observe portfolio weights directly as the percentage value invested. Or we decide on portfolio weights. In this chapter, we will focus on the choice of equally weighting the assets in the portfolio. This means that if we have e.g. 10 assets, each asset receives a weight of 10%. When investing in stocks, another popular choice of weighting is to set the weights as a function of the total market value of the firm’s equity. This is called market capitalization weighting and sets the weight equal to the market capitalization of the firm, divided by the total market capitalization of all the assets in the portfolio. 

***

# Video 2: One-period portfolio returns are the weighted average of the individual returns

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

# Video 3: A realistic portfolio case: Investing in the 30 DJIA stocks over 25 years with monthly rebalancing

Let's now look at a realistic portfolio invested in the 30 Dow Jones Industrial Average stocks and track the portfolio performance over a period . Their symbols are summarized on this slide. 

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
