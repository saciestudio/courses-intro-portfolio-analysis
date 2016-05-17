# Video 1:  The different dimensions of portfolio performance [word count: 623]

In this chapter, I will show you how to evaluate the performance of a portfolio. The evaluation is of course data-driven and will be done in R. We will be using statistical functions to analyze the past portfolio returns. This allows us to make sensible conclusions about the portfolio’s past performance and to make reliable predictions about future portfolio performance. 

***

To kick off an analysis of portfolio performance, we first need to specify the horizon over which we wish to describe the portfolio performance. It could be a short horizon such as one day or one month, or a longer period such as a year or the complete history for which a track record of past returns is available.

It is also important to understand that portfolio performance is a broad concept, which cannot be summarized by one number. Broadly speaking there are two dimensions, namely reward and risk. The rewards tells us the performance in terms of accumulating a maximum level of wealth, while risk has to do with the performance in terms of avoiding extreme losses. 


***

For doing data analysis on performance, we need to translate the concept of reward and risk into a formula. In this video, I’ll focus on the portfolio mean return as a measure of reward, and the portfolio volatility as a measure of risk. 

***

The formula’s I will show assume that we have a sample of T portfolio return observations: R1, R2, R3 up to RT. 

Then the portfolio mean return is estimated as the average value of those T returns. This is also called the arithmetic mean return. It indicates how the portfolio return is on average. The averaging is important: You win some, you lose some, but on average the portfolio return needs to be high enough to compensate for the investment risk. 

***

The investment risk originates from the fact the returns deviate from the average return. We will be calling the difference between the return and its mean value, the de-meaned return.

The sample variance is then the average of the squared demeaned returns. It will have large values when the return can deviate a lot from the average value. 

***

Most often, we do not use the portfolio variance itself, but its square root, called the portfolio standard deviation, or also, the portfolio volatility. The higher the volatility, the higher is the probability of a large positive or negative return on your portfolio. 

***

The volatility thus causes risk. It also causes a mismatch between the average return and the actual investment return. 

Suppose for example that the investor makes a 50% gain and a 50% loss. We thus have two returns: plus 50% and minus 50%. Then the mean return is zero, while, as you can see on the slide, the final value of the investment is only 75% of the initial value.   

For that reason, investors prefer using the geometric mean return to take into account that there is no linear compensation in the returns.  

As shown in the slide, the geometric mean return is obtained by first multiplying the total returns, and then raising that number to the power of one divided by the number of observations. If you then subtract one from that number, you obtain the geometric mean return.

As you can see, in the case of a +50% and -50% return, the end value is 75% of the initial value, and the geometric mean is -13.4%.   

***

Once we have the average return and volatility, we can start interpreting portfolio performance. In the next exercises, we will be doing this for the S&P 500 portfolio, which is invested in the 500 largest publicly listed US stocks and set weights proportional to the stocks' market capitalization. 
The S&P 500 portfolio is generally considered as the most important benchmark portfolio for investors in US stocks. 
 

# Video 2:  The (annualized) Sharpe ratio [word count: 606]

We have now seen how to compute the mean and standard deviation of the monthly returns on a risky portfolio. To interpret these numbers, we need a benchmark such as the investment in a risk-free asset. Because there is no risk, the volatility of its return is zero and the return itself is called the risk free rate.

***

I find it useful to consider this comparison between the risk-free asset and the risky portfolio in a scatter diagram, with, on the x axis, the volatility of the portfolio return, and, on the y-axis, the expected return. We thus have two points on the graph.
The first one is the risk free asset, for which the volatility is of course zero, and for which the expected return is called the risk free rate. The second point on the graph is the risky portfolio for which the expected return is higher, in compensation for the risk taken.
 
The vertical two-sided arrow indicates the difference between the expected return on the risky portfolio and the risk free rate. This difference is called the portfolio’s excess return. It tells you how much additional return you can expect on the risky portfolio compared to the risk-free rate. 

***

Let's now look at the line connecting the two points. This is called the capital allocation line. It connects the portfolio that is fully invested in the risk free asset with the risky portfolio. Each point in between those two portfolios is a portfolio that is invested in both the risk free asset and the risky portfolio. Going from left to right, the allocation to the risky portfolio increases. When we go beyond the risky portfolio, the investor takes leverage. She is borrowing money to invest more than she has in the risky portfolio.       

***

The slope of the line connecting the risk free rate and the risky portfolio is called the risky portfolio's Sharpe ratio: it is the excess portfolio mean return, divided by its volatility. 

The Sharpe ratio thus shows the reward per unit of risk taken. It summarizes the balance between the excess portfolio return and the risk taken. 

***

We thus have seen three statistics to compute performance on a sample of historical returns: the mean return, the volatility and the Sharpe ratio. 

As an illustration, suppose now that we have the sample of eight monthly portfolio returns listed on the slide.  

Straightforward calculations then lead to the following numbers.

The sample average is 1.5%. 
The geometric average value is 1.46%. 

Their standard deviation is 2.7%. 

If we assume a monthly risk free rate of 0.4%, then the monthly Sharpe ratio is approximately 0.4. 


***

There is one shortcoming of the previous table. It shows the performance over one month, while in professional investment reports, the performance is often reported in terms of annualized numbers to match with the performance over a one-year investment horizon. 

***

For the simple average, the convention is to do this by multiplying with 12.

For the geometric average approach, we obtain the annualized return by raising the product of total returns to the power 12 divided by the number of observations. 

And for annualizing the volatility, the convention is to use the so-called square root of time rule. It consists of multiplying the monthly volatility with the square root of 12.

***

If we apply this to our sample of eight monthly returns, we then obtain a table in which not only the mean and volatility have increased, but also the Sharpe ratio. 

Since the mean is multiplied by 12, and the volatility by the square root of 12, the Sharpe ratio increases also with a factor equal to the square root of 12.  


***

And now, back to our long sample of S&P 500 returns, where you will be asked to compute the Sharpe ratio and annualized risk and return measures, using the functions in the package PerformanceAnalytics.
# Video 3:  Time-variation in portfolio performance [word count: 338]

We have up till now entertained a static view on portfolio performance. But, because of the business cycle, the occurrence of unexpected events, and swings in the market psychology, portfolio performance tends to be anything but constant over time. 

***
In terms of the market direction, there are the bull market regimes in which stock prices tend to increase, and there are the bear market regimes in which stock prices tend to fall. 

***
In terms of volatility, there are the calm market regime with persistently low volatility, and there are the more stressed regimes with big spikes in volatility.

***

Note that those regimes are persistent. Once the volatility is higher than average, it tends to stay above average for some time. The current performance is thus better estimated, when we give more weight to the more recent observations than to the distant observations. 

***

The standard approach of doing this is by the use of rolling estimation samples. Instead of estimating the performance measures on the full sample, we only take the K most recent observations. So, the performance estimate at time t is given by the performance computed on the returns t, t-1, t-2 up to t-K+1. 

The next one uses the observations t+1 through t-K. As such, we roll through time by adding the most recent observation and discarding the most distant one. 

.***

On each subsample, the performance measure can be computed. This works for any type of performance measure.

As an example, the graph shows the time line of annualized mean and volatility estimates obtained for the S&P 500 using rolling samples of three years.

***  

Why did I choose three years and not 1 year when making this plot? This is a question of taste.  We need to have a sufficiently large number of observations to reduce the effect of noise on the performance estimate. But, the longer the subperiod is, the more it smooths over the highs and lows in the data, and the more similar it will be to the performance measure obtained under the static view. 
In the next exercises, you will get a feeling for this trade-off.   


# Video 4:  The non-normality of the return distribution [word count: 604]

Up to now, we have been using the portfolio volatility as our risk measure. Loosely speaking, the underlying assumption is that the portfolio return is normally distributed and thus that its density function is bell-shaped. It is symmetric such that gains are equally likely as losses of the same magnitude. 

***

For many financial assets, this assumption of a normal distribution is wrong. Their distribution tends to be skewed to left with tails that are fatter than those of a normal distribution. As a consequence, when zooming in on the left tail of the histogram of the financial returns, we often find that there are more extreme negative returns happening than is possible under a normal distribution. 

***

When this happens, an investor is no longer satisfied with using only the standard deviation as the risk measure, but should be using also a downside risk measure that quantifies the risk of losing money by focusing on the left side of the distribution. 

A straightforward way to turn the standard deviation into a downside risk measure is to remove the higher than average returns. We then obtain the so-called semideviation. 

As can be seen on the slide, it is defined as the square root of the average variability of the lower than average returns around the mean.

***

Besides the semideviation, also the 5% portfolio value-at-risk and 5% expected shortfall are popular downside risk measures. They quantify the risk of the 5% most extreme losses. 

To understand their definition, take a look again at the return distribution plot. The 5% value-at-risk is the return that is so extremely negative that there is only a 5% chance of observing a return that is even more negative. 

The 5% expected shortfall complements the 5% value at risk by showing the average value of those 5% most negative returns.   

***

In terms of performance measures, we have thus seen the mean and standard deviation, as well as downside risk measures such as the semideviation and value at risk. 

Typically, investors also report the skewness and excess kurtosis of their portfolio returns to indicate two types of non-normality in the return distribution, namely asymmetry and fat tails.  

***

The skewness is designed such that it is approximately zero when the distribution is symmetric. When the skewness is negative, it indicates that large negative returns occur more often than large positive returns. A negative skewness thus corresponds to a distribution with a long left tail.

The opposite is true in case of a positive skewness. Then large positive returns are more likely than large negative returns. 

***

Besides skewness, also fat tails are a cause of non-normality. A distribution with fat tails is a distribution in which extremely large positive or negative returns occur more often than a normal distribution would predict. 

The excess kurtosis is a statistic indicating fat tails. Its value is zero for the normal distribution. The larger the excess kurtosis, the thicker the tails compared to the tails of a normal distribution.

***

Let’s now do the exercises to estimate the value of the skewness, excess kurtosis and downside risk for the S&P 500 portfolio. 
