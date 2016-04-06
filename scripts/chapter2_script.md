# Video 1: The power of portfolio diversification

Hi, I'm Kris. I am a Professor of finance at the Solvay Business School in Brussels and an expert in portfolio analysis. I will be your instructor for this course on analyzing portfolio returns in R. Let's get started by a simple example of the power of portfolio diversification. 

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

Now we need to transform this into a time series of portfolio returns.

An important point is to have the portfolio weights available at each time. 

CHECK WHETHER I CAN HAVE MARKET CAP WEIGHTS: AVOID ROWMEANS...!!!

*** 

hat we assume the portfolio to be rebalanced every month. So, if we sketch the time line, we define the portfolio weight at the beginning of the investment horizon. This is also the weight needed to compute the portfolio return over the one month investment period starting on that date. 

***

As an example, suppose the portfolio is equally weighted. Then return in each month is the mean value of the returns of that month. 

The end-of month prices of those 30 stocks are available in your datacamp session as a xts object.  
Let us now consider a practical case of the 30 Dow Jones Industrial Average (DJIA) Constituents over the period xxxx. The corresponding monthly price data is available as a xts time series object. The corresponding multivariate return series can be easily computed using the function calculateReturns in PerformanceAnalytics. The first observation is NA, because there is no previous price available. We can remove the first row in returns using [(-1),].


***
