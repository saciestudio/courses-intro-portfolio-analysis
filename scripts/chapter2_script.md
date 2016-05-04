# Video 1:  The different dimensions of portfolio performance


This chapter is about studying the past returns to make sensible conclusions about past portfolio performance and making reliable predictions about future portfolio performance. 

***

Such a study requires to define clearly what is meant in terms of portfolio performance. 

***

The first dimension to specify is to horizon over which we need describe the portfolio performance : Is it the performance over a short horizion such as one day or one month? Or is it the performance over a longer horizon, such as one quarter or a year. 


Secondly, we need to distinguish the objective of the analysis: (i) Is it a backward looking investigation of past performance; (ii) or is it a forward looking prediction of future performance. 

In the first case, we will be treating all past returns as equally important and the analysis is descriptive. In the second case, the more recently observed returns are of higher importance, since they are more predictive about future performance than the distant past returns. 

A third important distinction that we need to make is the type of performance. Is it the performance in terms of accumulating a maximum level of wealth (reward). Or is it the performance in terms of avoiding extreme losses (risk). Or is it a combination of both: achieving a high expected return at a low level of risk? 

***

The standard choice is to use the average return as a measure of reward and the standard deviation of the returns as a measure of risk.

More formally, suppose we T observations: R1, R2,...,RT. 
Then the sample mean is the average of those returns (show formula on slide). 
The sample variance is the average squared difference between the return and the sample mean (show formula on slide). 

Most often, we do not use the sample variance itself, but its square root, called the sample standard deviation, which in finance, is also called the portfolio volatility.  

***

Once we have the average return and volatility, we can start interpreting portfolio performance. In the next exercises, I will first test your understanding of how the mean and volatility are linked to the portfolio return distribution. Then, we will move on the evaluating in practice the performance of the S&P 500 portfolio, which is  generally considered as the most important benchmark portfolio for investors in US investors equities. This portfolio is invested in the 500 largest publicly listed US stocks  and set weights proportional to the stocks' market capitalization. 

*******************


# Video 2:  Time-variation in portfolio performance


The probabilistic interpretation of portfolio returns is thus that each return is one possible outcome of a corresponding random variable. The ordered series of those random variables is called the portfolio return time series process. 

The features of this process are likely to change over time. They are driven by the business cycle, by unexpected events, news report and, also, the market psychology. 

In terms of the market direction, there are the bull market regimes in which stock prices tend to increase, and there are the bear market regimes in which stock prices tend to fall. 

In terms of volatility, there are the calm market regime with persistently low volatility, and there are the more stressed regime with big spikes in volatility.

***

As, an investor, should we care about this time-variation? Well, for both returns and volatility, there tends to be mean-reversion, meaning that episodes of exceptionally extremely large positive or negative returns tend to be followed by more moderately sized returns. 

In that sense, two types of analysis are relevant:
(i) The analysis of long-run, average performance
(ii) The conditional analysis of the performance at a given point in time. 

***

The long run analysis is what we have done until now. By computing the sample average and the standard deviation of the past returns, we obtained a picture of how the return and volatility have been on average in the past. It averages out periods of booms and busts in the asset prices, as well as periods of high and low volatility. 

***

When investing today or for the evaluation of the current investment risk, the investor cares about the risk and  return at current date. It requires to do a conditional analysis and give more weight to the more recent observations than the distant observations.

***

The practioner approach of doing so is by the use of rolling estimation samples. Instead of estimating the performance measures on the full sample, we only take the $K$ most recent observations. So, the performance estimate at time $t$, is given by the performance computed on the returns $t$, $t-1$,...,$t-K+1$. The next one uses the observations $t+1$ till $t-K$. As such, we roll through time by adding the most recent observation and discarding the most distant one. 

***

Rolling window estimation works for any type of performance measure. For the mean return, it requires to compute moving averages of the returns for the mean, while for the variance, it corresponds to calculating moving averages of the squared centered returns (show formula's). 

***

A practical important question is the choice of window length. We need to have a sufficiently large number of observations to reduce the effect of noise on the performance estimate. But, the longer the subperiod, the more it smooths over peaks and troughs, and the more similar it will be to the static view. 

***

The optimal choice of window is thus a trade-off between recensy and estimation precision. In the next exercises, you will get a feeling for this trade-off.  

 

***

# Video 3: The non-normality of the return distribution 


Don't forget: the return that we observed is only one of the possible outcomes. We could have had a higher of lower return, just by chance. This is also the reason why sellers of investment products always put the warning that "past performance is not a predictor of future results". 

***

Statistically speaking, the uncertainty comes from the fact that the portfolio return is a random variable. Each time we observe the portfolio return it is a draw from a random variable. What we care about is to learn from the past what the portfolio return distribution will be. This requires some of "startionarity", meaning that the distribution that generated the past returns will also generate the returns of the future. 

***

But what is the portfolio return distribution? There is no perfect answer for this question. We need to guess it, partly by making assumptions and partly by estimating. 

Until now, we have been working with the mean and volatility only. This is correct if the portfolio return distribution is normal.  In practice, as can be seen also in the histogram, most financial return distributions are not-normal. They are asymmetric and have so-called heavy tails. This means that the tails are fatter than the ones of a normal distribution. The asymmetry is measured by skewness, which is the average value of the third power of the return deviations from their average, standardized by their volatility. If it is negative,.... Kurtosis; fourth power ... Excess kurtosis. When returns are non-normal, the volatility is not sufficient as a risk measure. A downside risk measure needs to be used, focusing on the probability of large losses. 5% value at risk; quantile ...  . Drawdowns.



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

hat we assume the portfolio to be rebalanced every month. So, if we sketch the time line, we define the portfolio weight at the beginning of the investment horizon. This is also the weight needed to compute the portfolio return over the one month investment period starting on that date. 

***

As an example, suppose the portfolio is equally weighted. Then return in each month is the mean value of the returns of that month. 

The end-of month prices of those 30 stocks are available in your datacamp session as a xts object.  
Let us now consider a practical case of the 30 Dow Jones Industrial Average (DJIA) Constituents over the period xxxx. The corresponding monthly price data is available as a xts time series object. The corresponding multivariate return series can be easily computed using the function calculateReturns in PerformanceAnalytics. The first observation is NA, because there is no previous price available. We can remove the first row in returns using [(-1),].


***
