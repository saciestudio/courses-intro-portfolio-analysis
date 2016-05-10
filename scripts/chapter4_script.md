# Video 1: Modern portfolio theory of Harry Markowitz


A mean-variance efficient investor is thus an investor who ....

***

But how to find such a vector of mean-variance efficient portfolio weights in practice? 

***

Let us first write down the mathematical problem and then discuss the method used to solve that problem. 



***

# Video 2: In-sample versus out-of-sample evalution

Optimizing portfolios based on the estimated mean and covariance matrix is senstivitive to errors in estimation. The estimated mean and covariance matrix have estimation errors. Optimizing portfolio weights based on those noisy inputs leads to noisy portfolio weights, that may be suboptimal. Risk of error maximization. The insample estimated mean and variance of the optimized portfolios versus the out of sample.  Important to be aware of this by analyzing performance out of sample. Distinghuish estimation window from evaluation window;


***

# Video 3: Congratulations, you know how to analyze portfolio returns!

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
