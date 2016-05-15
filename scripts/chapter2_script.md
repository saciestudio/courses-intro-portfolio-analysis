# Video 1:  The different dimensions of portfolio performance

This chapter is about studying the past portfolio returns to make sensible conclusions about the portfolio’s past performance and making reliable predictions about future portfolio performance. 

***

Such a study requires to define clearly what is meant by the term portfolio performance. 

***

The first dimension to specify is the horizon over which we need describe the portfolio performance : Is it the performance over a short horizon such as one day or one month? Or is it the performance over a longer horizon, such as one quarter or a year. 

Secondly, we need to distinguish the objective of the analysis: (i) Is it a backward looking investigation of past performance; (ii) or is it a forward looking prediction of future performance. 

In the first case, we will be treating all past returns as equally important and the analysis is descriptive. In the second case, the more recently observed returns are of higher importance, since they are more predictive about future performance than the distant past returns. 

A third important distinction that we need to make is the type of performance. Is it the performance in terms of accumulating a maximum level of wealth (reward). Or is it the performance in terms of avoiding extreme losses (risk). Or is it a combination of both: achieving a high expected return at a low level of risk? 

***

For the practical analysis in R we will need to define precise formulas to compute the type of performance we wish to describe. 

In terms of measuring reward and risk, the standard choice is to use the average return as a measure of reward and the standard deviation of the returns as the measure of risk.

More formally, suppose we have a sample of T portfolio return observations: R1, R2, R3 up to RT. 
Then the average value of those T returns indicates how large on average the portfolio return is. There is risk in investing when the returns deviate from this average return. We will be calling the difference between the return and its mean value, the de-meaned return.
The sample variance is then the average of the squared demeaned returns. It will have large values when the return can deviate a lot from the average value. 


Most often, we do not use the portfolio variance itself, but its square root, called the portfolio standard deviation. In finance, we often refer to the portfolio standard deviation as the portfolio volatility. .  

***

Once we have the average return and volatility, we can start interpreting portfolio performance. In the next exercises, we will be doing this for the S&P 500 portfolio, which is invested in the 500 largest publicly listed US stocks and set weights proportional to the stocks' market capitalization. 
The S&P 500 portfolio is generally considered as the most important benchmark portfolio for investors in US investors equities. 

# Video 2:  The (annualized) Sharpe ratio

We have now seen how to compute the mean and standard deviation of the monthly returns on a risky portfolio. To interpret these numbers, we need a benchmark such as the investment in a risk-free asset. Because there is no risk, the volatility of its return is zero and the return itself is called the risk free rate.

***

I find it useful to consider this comparison between the risk-free asset and the risky portfolio in a scatter diagram, with on the x axis-the volatility of the portfolio return, and on the y-axis the expected return. We thus have two points on the graph.
The first one is the risk free asset, for which volatility is of course zero, and the return is called the risk free rate. The second point on the graph is the risky portfolio for which the expected return is higher, in compensation for the risk taken.
 

The difference between the vertical dashed line show the excess return: the difference between the return on the risky portfolio and the risk free rate.  

***

Let's now look at the line connecting the two points. It is called the capital allocation line, as one can show that each point on this line corresponds to a portfolio invested in the risk free asset and the risky portfolio. 

The slope of the line is called the risky portfolio's Sharpe ratio: it is the excess portfolio mean return, divided by its volatility. The Sharpe ratio thus shows the reward per unit of risk taken. It summarizes the balance between the excess portfolio return and the risk taken. 

***

As an example, suppose we have the following sample of eight monthly portfolio returns: -0.02  0.00  0.00  0.06  0.02  0.03 -0.01  0.04

Their average value is 1.5%. And their standard deviation is 2.7%. 

Assume a monthly risk free rate of 0.4%. Then the monthly Sharpe ratio is 0.41. 


***

There is one shortcoming of the previous table. It shows the performance over one month, while in professional investment reports, the performance is often reported in terms of annualized numbers to match with the performance over a one-year investment horizon.  

***

For annualizing the volatility, the convention is to use the so-called square root of time rule. It consists of multiplying the monthly volatility with square root of 12.

***

For annualizing the average returns, there are two possibilities.

The first one is called the simple time aggregation approach and consists of multiplying the monthly average return with 12.

The second approach takes into account the effect of previous returns on subsequent returns. This is the geometric approach, which first computes the compound total return over the complete period of T months and then then scales it back to the monthly horizon by taking the power of 12 divided by the total number of observations.   

In our example of 8 returns, we thus first compute the end-value of the investment over the eight months: (1+0.02)*(1+0%)*(1+O%)*(1+6%)*(1+2%)*(1+3%)*(1-1%)*(1+4%) yields 1.1237. Taking this to the power of 8 divided by 12 and subtracting 1 leads to an annualized geometric return of 19%.

Using the simple aggregation method, we would have obtained 1.5% times 12 = 18%.   

The annualized volatility in this example is around 9%

In the next exercises, we will be using PerformanceAnalytics to compute the Sharpe ratio and annualized risk and return measures. 

# Video 3:  Time-variation in portfolio performance

We have up till now entertained a static view on portfolio performance. But, because of the business cycle, the occurrence of unexpected events, and swings in the market psychology, portfolio performance tends to be anything but constant over time. . 

***
In terms of the market direction, there are the bull market regimes in which stock prices tend to increase, and there are the bear market regimes in which stock prices tend to fall. 

***
In terms of volatility, there are the calm market regime with persistently low volatility, and there are the more stressed regime with big spikes in volatility.

***

In order to capture those dynamics in portfolio performance,  we need to conduct a conditional analysis and more weight must be given to the more recent observations than the distant observations.

***

The standard approach of doing this is by the use of rolling estimation samples. Instead of estimating the performance measures on the full sample, we only take the $K$ most recent observations. So, the performance estimate at time $t$, is given by the performance computed on the returns $t$, $t-1$,...,$t-K+1$. The next one uses the observations $t+1$ through $t-K$. As such, we roll through time by adding the most recent observation and discarding the most distant one. 

***

Rolling window estimation works for any type of performance measure. 

***

An important practical question is the choice of window length. We need to have a sufficiently large number of observations to reduce the effect of noise on the performance estimate. But, the longer the subperiod is, the more it smooths over peaks and troughs, and the more similar it will be to the performance measure obtained under the static view. 

***

The optimal choice of window is thus a trade-off between timeliness in capturing the changes in performance and robustness to noise. In the next exercises, you will get a feeling for this trade-off.   


# Video 4:  The non-normality of the return distribution

Up to now, we have been using the portfolio volatility as our risk measure. The underlying assumption that is often made is that the portfolio return is normally distributed. This means that its density function is bell-shaped. It is symmetric such that gains are equally likely as losses of the same magnitude. 

***

For many financial assets, this assumption of a normal distribution is however wrong. Their distribution is often skewed to left, such that large negative returns are more likely to occur than large positive returns of the same magnitude.

***

Moreover, the tail of the distribution is fatter than that of a normal distribution, as can be seen in this plot comparing the histogram of the S&P 500 return data with the density obtained under a normal distribution. Zooming in on the tails, it becomes clear that there are more extreme returns happening than is possible under a normal distribution. 

***

There are various degrees of non-normality. One way to measure this is to use the portfolio skewness and excess kurtosis. They are computed in two steps.

First, the returns are standardized by subtracting the mean return, and dividing the de-meaned returns by the return standard deviation. 

Then, the skewness is computing as the average of the third power of those standardized returns. When the distribution is  symmetric, the skewness should be close to 0. If it is skewed to the left, then the large negative returns, lead to a negative value for the skewness. And vice versa in case of positive skewness. 

***
The kurtosis is obtained by taking the fourth moment of the standardized returns. Under a normal distribution, the estimated kurtosis is close to 3. When higher than 3, there are more extremes in the tails than under the normal distribution and thus the distribution is fat-tailed. 


Often people use the excess kurtosis, which is equal to the kurtosis minus 3, in order to compare it to a normal distribution. When the excess kurtosis is significantly positive, it indicates the presence of fat tails.l equal to the kurtosis in excess of the normal kurtosis. 

***

What is the consequencey of the non-normality for performance evaluation? It implies that if the distribution is heavy-tailed and negatively skewed, there is large probability of extreme negative returns, which is not visible in the standard deviation. We should thus use risk measures that focus only on the risk of losing money, called the downside risk.

In this plot, I show three such risk measures:
(i) semideviation ....
(ii) value at risk
(iii) expected shortfall...

***

Conclusion: non-normality is a typical feature of the return distribution and should be taken into account in the performance analysis. This will be illustrated in the following exercises.  
