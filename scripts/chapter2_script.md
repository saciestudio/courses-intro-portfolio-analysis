# Video 1:  Evaluating portfolio performance is an estimation problem


Don't forget: the return that we observed is only one of the possible outcomes. We could have had a higher of lower return, just by chance. This is also the reason why sellers of investment products always put the warning that "past performance is not a predictor of future results". 

***

Statistically speaking, the uncertainty comes from the fact that the portfolio return is a random variable. Each time we observe the portfolio return it is a draw from a random variable. What we care about is to learn from the past what the portfolio return distribution will be. This requires some of "startionarity", meaning that the distribution that generated the past returns will also generate the returns of the future. 

***

But what is the portfolio return distribution? There is no perfect answer for this question. We need to guess it, partly by making assumptions and partly by estimating. For now, let us assume the portfolio return distribution is normal with a mean parameter that I denote as mu and a standard deviation that I denote as sigma. 

Under this assumption, we know that there is 95% probability that the return will be between mu +- 2*sigma. The larger is the standard deviation, the more spread the possible outcomes can be. In finance, the standard deviation is also called volatility. The square of the volatility is the variance.  

***

The mean and variance are parameters. They are unknown, but once we have  a sample of past returns, it becomes possible to estimate them. Suppose e.g. that we have T observations: R1, R2,...,RT. Then the sample mean is the average of those returns (show formula on slide). The sample variance is the average squared difference between the return and the sample mean (show formula on slide). The sample standard deviation or volatility is the square root of this number. 

***

Average returns in itself are difficult to interpret. Is an average of 5% a high return? It depends on the alternatives. Suppose e.g. that there is a risk free investment offerening 4%. Then, by taking risks, the investor only has a 1 percentage point higher average return. 

The Sharpe ratio summarizes this balance. It is the ratio obtained by taking the average difference between the portfolio return and the return the investor would have from a risk free investment and dividing this number with the portfolio standard deviation.

The Sharpe ratio thus shows the reward per unit of risk taken.  


***

Let's consider an example. Suppose we have the returns for the past 12 months, together with their risk free rate. Computing the average excess returns gives us..., the standard deviation is ... . Hence the portfolio Sharpe ratio over those 12 months is ...

***
These are thus the average, standard deviation and Sharpe ratio for the returns over a one-month investment horizon. We could do something similar using daily returns and obtain then average, standard deviation and Sharpe ratio for the returns over a one-month investment horizon. In practice, these performance measures computed on daily or weekly returns are presented 
in annualized terms. 

In case of monthly returns, the annualized mean return is obtained by multiplying with 22, which is the average number of trading days in a month. The annualized standard deviation is obtained by multiplying with the square root of 22. This is the so called "square-root-of-time rule". For daily returns, the factor used for annualizing the mean is 252, corresponding to the average number of trading days in a year. 


# Video 2:  Time-variation in portfolio performance






*************************************************************************************

***

Let me start with the graphical approach and consider here the histogram of the past portfolio returns on the equally weighted portfolio invested in the 30 Dow Jones Industrial Average stocks. The histogram shows for the range of past returns how likely each return was to occur. The higher the bar, the more likely the return. In this case, we see that the most likely return is slightly higher than zero. This positive return is to be traded-off against the risk that the return will be different from that expected return. 

Looking at the minimum and maximum values in the histogram we see that all returns were between .... and .... 

***

In addition to the graphical analysis, investors routinely discuss performance statistics. The most used ones are the portfolio mean return and the return standard deviation. See the slides for their precise definition in case of a sample of  $T$ returns, $R_1$,...,$R_t$.

The mean return indicates the average portfolio performance, while the standard deviation measures the spread of the returns across the mean. The higher the standard deviation, the more risk of large losses.

Usually, a higher average return comes at the price of a higher risk. The sample variance corresponding to the average squared deviations of the return with respect to the average return is the risk measure used in modern portfolio theory by Harry Markowitz. The square root of the variance, called standard deviation or volatility, is more easy to interpret because it is in the same units as the returns.

***

The essence of investment is to balance risk and reward. Both can be measure in one statistic, namely the sharpe ratio correspoding to the average return (in excess of the risk free rate) per unit of portfolio volatility...


***

Annualizing 


***

# Video 2: Downside risk; skewness, kurtosis and value-at-risk

The mean and volatility fully describe the return distribution, when the return distribution is normal. In practice, as can be seen also in the histogram, most financial return distributions are not-normal. They are asymmetric and have so-called heavy tails. This means that the tails are fatter than the ones of a normal distribution. The asymmetry is measured by skewness, which is the average value of the third power of the return deviations from their average, standardized by their volatility. If it is negative,.... Kurtosis; fourth power ... Excess kurtosis. When returns are non-normal, the volatility is not sufficient as a risk measure. A downside risk measure needs to be used, focusing on the probability of large losses. 5% value at risk; quantile ...  . Drawdowns.


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
