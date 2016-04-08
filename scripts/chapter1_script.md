# Video 1: The power of portfolio diversification

Hi, my name is Kris Boudt. I am a Professor of finance and an expert in portfolio analysis. At datacamp you learn to analyze data. This in important skill for investors, since the analysis of prices and returns is crucial to make investment profits without taking excessive risks. 

***

Indeed, whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. The value of the price change is uncertain, and, importantly, it of course depends on the asset. By optimizing the investments and by monitoring the returns, it becomes possible to reduce the uncertainty about future returns and increase the expected payoff. This is the essence of rational investing: you only take the risks that are worthwile. 

***

To avoid excessive risks it is important not to concentrate all the investments in one single asset, but to spread your investment over a portfolio of multiple assets. This is called portfolio diversification. It aims at reducing the risk of making severe losses by investing in different assets.  

Let's now visualize these gains of diverisication with a numeric example.  


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

The proof is in the pudding. Let's start off with the definition of portfolio weights. Either we observe portfolio weights directly as the percentage value invested. Or we decide on portfolio weights. In the exercises, we will consider the choice of equally weighting the assets in the portfolio ("the 1/N portfolio") and characteristic based portfolio investing, such as a market capitalizatio weighted portfolio. 

***

# Video 2: Portfolio returns are the weighted average of the individual returns

A crucial part of investing is dealing with the almost constant changes in prices. Price changes are usually expressed in relative terms. Those relative price changes are called returns. 


***

But how to compute portfolio returns? First we need to agree on which type of returns we will use. There are two types of return definitions in finance: log-returns and simple returns. When the return is computed as the change in the natural logarithm of the value, it is called a log-return. If it is computed as the percentage price change, then it is called a simple return. Log-returns and simple returns are typically very similar. A change of 100 USD to 110 USD is a 10% change in terms of simple returns and a 9.5% change in log-returns. 

***

For portfolio analysis we will work with simple returns. 
The reason is twofold. First, simple returns are very intuitive. They are the percentage price change and also the type of returns used in daily life. Secondly, the calculation of portfolio returns using simple returns is...simple. It only requires to take the sum of the individidual returns, multiplied with their portfolio weights.

***

In formula notation, the portfolio return thus equals the weighted average of the individual returns. The corresponding code in R is simple. It just involves a summation of the element in the vector obtained by multiplying the vector of portfolio weights with the vector of returns ( show formula: portfolio return = sum w[i] r[i] = sum( weights*returns ). 

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

Now we need to transform this into a time series of portfolio returns. For this the function Return.portfolio is interesting. For us the first two arguments are relevant. R is the xts file containing
the multivariate return series. Weights is the optional argument containing the weights at the beginning of each month. 

Remember from the formula that weights are crucial to definie the portfolio returns, and that it is the weights at the beginning of the investment period, here beginning of the month.



*** 

By default and if we thus do not specify the weights, the function Return.portfolio assumes equal weighting.  


To understand what this means, consider the following sketch of the time line. Every tick denote the end of month, where the portfolio has a weight. By default, it is thus assumed that at the end of each month, the weights are reset to equal weights.  

***

The next exercises show how to compute those equally weighted portfolio returns. By compounding the total returns, defined as 1+returns, we obtain the portfolio value evolution. Plotting this wealth evolution will reveal the booms and busts of the stock market over the past 25 years. 
