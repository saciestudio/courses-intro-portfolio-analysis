# Video 1:  The different dimensions of portfolio performance


This chapter is about studying the past returns to make sensible conclusions about past portfolio performance and making reliable predictions about future portfolio performance. 

***

Such a study requires to define clearly what is meant in terms of portfolio performance. 

***

The first dimension to specify is the horizon over which we need describe the portfolio performance : Is it the performance over a short horizon such as one day or one month? Or is it the performance over a longer horizon, such as one quarter or a year. 


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


# Video 2:  The (annualized) Sharpe ratio

***

We have now seen how to compute the mean and standard deviation of the monthly returns on a risky portfolio. In practice, investors often do not consider the mean return, but the mean return in excess of the risk free rate. They further combine this mean excess return and volatility into a single number, called the Sharpe ratio. Finally, while the mean, volatility and Sharpe ratio is very often computed on monthly returns, those numbers are annualized to match with the performance over a one-year investment horizon.  

***

First, the practice of reporting excess returns. The problem it solves is the following. Average returns in itself are difficult to interpret. Is an average of 5% a high return? It depends on the alternatives. Suppose e.g. that there is a risk free investment offerening 4%. Then, by taking risks, the investor only has a 1 percentage point higher average return. The solution is to consider returns in excess of the risk-free investment. Those are called the excess returns.

***

We can thus consider portfolio performance as the average excess return. An investor will only invest in a risky portfolio if she expects the excess return to be positive. If not, she will avoid taking the risk and choose the risk-free investment. 

I find it useful to consider this comparison between the risk-free asset and the risky portfolio in a scatter diagram, with on the x axis-the volatility of the portfolio return, and on the y-axis the expected return. We have two points on the graph.
The first one is the risk free asset, for which volatility is of course zero, and the return is called the risk free rate. The second point on the graph is the risky portfolio for which the expected return is higher, in compensation for the risk taken.

The difference between the vertical dashed line show the excess return: the difference between the return on the risky portfolio and the risk free rate. 

***

Let's now look at the line connecting the two points. It is called the capital allocation line, as one can show that each point on this line corresponds to a portfolio invested in the risk free asset and the risky portfolio. 

The slope of the line is called the risky portfolio's sharpe ratio: it is the excess portfolio mean return, divided by its volatility. The Sharpe ratio thus shows the reward per unit of risk taken. It summarizes the balance between the excess portfolio return and the risk taken. 

***

This table illustrates the calculation. [to be completed]

***

There is one shortcoming of the previous table. It shows the performance over one month, while investors typically think in terms of yearly performance. The numbers thus need to be extrapolated from a monthly horizon to a yearly horizon. 
The convention is to do so by multiplying the monthly average return with 12 and the monthly volatility with square root of 12. Then the Sharpe ratio is also multiplied with square root of 12.

In our example, this leads to the following table. [show previous table ==> annualized table]



# Video 3:  Time-variation in portfolio performance

In the previous exercises, you have seen that ... [to be completed]

The probabilistic interpretation of portfolio returns is thus that each return is one possible outcome of a corresponding random variable. The ordered series of those random variables is called the portfolio return time series process. 

The features of this process are likely to change over time. They are driven by the business cycle, by unexpected events, news report and, also, the market psychology. 

In terms of the market direction, there are the bull market regimes in which stock prices tend to increase, and there are the bear market regimes in which stock prices tend to fall. 

In terms of volatility, there are the calm market regime with persistently low volatility, and there are the more stressed regime with big spikes in volatility.

***

As an investor  should we care about this time-variation? Well, for both returns and volatility, there tends to be mean-reversion, meaning that episodes of exceptionally extremely large positive or negative returns tend to be followed by more moderately sized returns. 

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


Financial returns are typically non-normally distributed. They tend to be asymmetric and fat tailed. This can be seen in the histogram of the S&P 500 daily returns.

***

We first of all see that the distribution plot is not symmetric. For most investments, the distribution tends to be skewed to the left: this means large negative returns are more likely than large positive returns of the same magnitude. 

***

If we zoom in on the tails and compare them with tails under the normal distribution, we further see that the financial return distribution tend to be heavy tailed: there are more extreme returns happening than is possible under a normal distribution. 

(to be improved)

***

The non-normality of the return distribution can be diagnosed using statistics, such as skewness and kurtosis. Those statistics are computed on the standardized returns, obained by subtracting the mean return, and dividing by the return standard deviation. (show formula)
Note that, by construction, the standardized return have mean zero and standard deviation equal to one. More interesting is their third and fourth moment.

The skewness is the average of the third power of the standardized returns and indicates the asymmetry of the return distribution. In fact, if the distribution is symmetric, then the skewness is zero. This is because every positive return is compensated by a negative return of the same magnitude, as can be seen on the slide. However, if the distribution is left skewed, meaning that there are large negative returns, then the skewness is dominated by those large negative returns and the skewness will be negative. 

In the opposite case, where the distribution is right-skewed, the skewness will be positive. 

***

The fourth centered moment is called the kurtosis. It treats positive and negative returns equally, but, because of taking the fourth moment, it is even more dominated by the extreme returns. For the normal distribution, it can be shown that the kurtosis is equal to three. We say that whenever the kurtosis is higher than three, that the distribution is fat tailed. Often people use the excess kurtosis equal to the kurtosis in excess of the normal kurtosis. 

***

For a normal distribution, the thrue skewness and excess kurtosis are both 0. But, because of the estimation uncertainty, the estimated skewness and excess kurtosis will be different from 0, but still very close to 0. 

This has inspired two french researchers, .. Jarque and ... Bera, to develop a test of normality based on the observed skewness and kurtosis. Their test statistic is given by the scaled sum of the squared skewness and excess kurtosis and should be chi-squared distributed with two degrees of freedom when the returns come frome a normal distribution.

If the p-value of this test is less than 5% we reject this hypothesis at the 5% significance level and conclude that the distribution is normal.  

***

What is the consequency of the non-normality for performance evaluation? It implies that if the distribution is heavy-tailed and negatively skewed, there is large probability of extreme negative returns, which is not visible in the standard deviation. We should thus use risk measures that focus only on the risk of losing money, called the downside risk.

In this plot, I show three such risk measures:
(i) semideviation ....
(ii) value at risk
(iii) expected shortfall...

***

Conclusion: non-normality is a typical feature of the return distribution and should be taken into account in the performance analysis. This will be illustrated in the following exercises. 


