# Video 1:  The different dimensions of portfolio performance [word count: 623]

How well did a portfolio perform in the past and how good to we expect its performance to be in the future? This question can be answered in a data driven way by using statistical functions in R to analyze portfolio returns. This allows us to make sensible conclusions about the portfolio’s past performance and to make reliable predictions about future portfolio performance. 

***

It is important to understand that portfolio performance is a general concept, which cannot be summarized by one number. Broadly speaking there are two dimensions, namely: reward and risk. 
The rewards tells us the success in terms of reaching high levels of portfolio value, while risk has to do with the performance in terms of avoiding extreme losses. 


***

For doing a data-driven performance analysis in R, we thus need to first translate the concept of reward and risk into a formula. In this video, I will focus on the portfolio mean return as the measure of reward, and the portfolio volatility as the measure of risk. 

***

The formula’s I will show assume that we have a sample of T portfolio return observations: R1, R2, R3 up to RT. 

Then the portfolio mean return can be estimated as the average value of those T return observations. This is also called the arithmetic mean return. It indicates how large the portfolio return is on average. The averaging is important: You win some, you lose some, but on average the portfolio return needs to be high enough to compensate for the investment risk. 

***

That risk originates from the fact the returns can deviate from the average return. I will use the name “de-meaned return” to refer to the difference between the return and its mean value. If the demeaned return is positive, then the return is higher than average. 

If we take the average of the squared demeaned portfolio returns, then we obtain the portfolio variance. The variance has large values when the portfolio return can deviate a lot from its mean value. 

***

Most often, we do not use the portfolio variance itself, but its square root, called the portfolio standard deviation, or also, the portfolio volatility. The higher the volatility, the higher is the probability of a large positive or negative return on your portfolio. 

***

The volatility thus causes risk. It also causes a mismatch between the average return and the actual investment return. 

Suppose for example that the investor makes a 50% gain and a 50% loss. Then the arithmetic mean value of those returns is thus the average of plus 50% and minus 50%, which is zero. The zero mean return is in contrast with the actual outcome for the investor, since, as you can see on the slide, the final value of the investment is only 75% of the initial value.   

Because of this mismatch between average return and the actual investment return,  investors prefer using the geometric mean return to take into account that there is no linear compensation in the returns.  

The geometric mean return is obtained by first multiplying the total returns, and then raising that number to the power of one divided by the number of observations. If you then subtract one from that number, you obtain the geometric mean return.

In our example of a plus 50% return and a minus 50% return, the geometric mean return is minus 13.4% and this matches, by definition, with the average effective investment return.    

***

Once we have the average return and volatility, we can start interpreting portfolio performance. In the next exercises, we do this for the S&P 500 portfolio, which is invested in the 500 largest publicly listed US stocks, with weights that are proportional to the stocks' market capitalization.  The S&P 500 portfolio is generally considered as the most important benchmark portfolio for investors in US stocks. 
 

# Video 2:  The (annualized) Sharpe ratio [word count: 606]
We have now seen how to compute the mean and standard deviation of the monthly returns on a risky portfolio. To interpret these numbers, we need a benchmark to compare with. The standard choice of benchmark is the investment in a risk free asset, such as a Treasury Bill issued by the US government.   Because there is no risk, the volatility of its return is zero and the return itself is called the risk free rate.

***

I find it useful to consider this comparison between the risk-free asset and the risky portfolio in a scatter plot, with, on the x axis, the volatility of the portfolio return, and, on the y-axis, the mean return. We thus have two points on the graph.
The first one is the risk free asset, for which the volatility is of course zero, and for which the expected return is called the risk free rate. 
The second point on the graph is the risky portfolio for which the expected return is higher, in compensation for the risk taken.
 The vertical two-sided arrow indicates the difference between the mean return on the risky portfolio and the risk free rate. 
This difference is called the portfolio’s excess return. It tells you how much additional return you can expect on the risky portfolio compared to the risk-free rate. 

***

Let's now look at the line connecting the two points. This is called the capital allocation line. 
It connects the portfolio that is fully invested in the risk free asset with the risky portfolio. Each point in between those two portfolios is another portfolio that is invested in both the risk free asset and the risky portfolio. 
Going from left to right, the allocation to the risky portfolio increases. 
When we go beyond the risky portfolio, the investor takes leverage. She is borrowing money to invest more than she has in the risky portfolio.       

***
The capital allocation line is also important because of its slope.  As you can see, the slope equals the mean excess return of the risky portfolio, divided by the portfolio volatility. The slope is thus a measure for the risk adjusted return of the portfolio:  It shows the reward per unit of risk taken. 

Investors call this the portfolio Sharpe ratio and thus compute it as the excess portfolio mean return, divided by the portfolio volatility.   

***

Altogether, we have seen three statistics to describe the portfolio performance based on a sample of historical returns, namely the mean return (both arithmetic and geometric), the volatility and the Sharpe ratio. 

As an illustration, suppose now that we have the sample of eight monthly portfolio returns, as listed on the slide.  

Straightforward calculations then lead to the following numbers.

The arithmetic mean is 1.5%. 
The geometric mean is 1.46%. 

Their standard deviation is 2.7%. 

If we assume a risk free rate of 0.4%, then the Sharpe ratio is approximately 0.4. 


***

There is one shortcoming of the previous table. It shows the performance over one month, while in professional investment reports, the performance is often reported in terms of annualized numbers to match with the performance over a one-year investment horizon. 

***

We thus need to annualize the performance measures.

For the simple average, the convention is to do this by multiplying with 12.

For the geometric mean approach, we obtain the annualized return by raising the product of total returns to the power 12 divided by the number of observations. 

And for annualizing the volatility, the convention is to use the square root of time rule. It consists of multiplying the monthly volatility with the square root of 12.

***

If we apply this to our sample of eight monthly returns, we then obtain a table in which not only the mean and volatility have increased, but also the Sharpe ratio. 

This is easy to understand, since we annualized the mean by multiplying it with 12, while we annualized the volatility by multiplying it with the square root of 12. The Sharpe ratio, being the ratio of both, thus increases with a factor equal to the square root of 12.  


***

That’s it for now. Let’s go back to our sample of S&P 500 returns to put the theory into practice.

# Video 3:  Time-variation in portfolio performance [word count: 338]


Until now we have taken a static view on portfolio performance. But, due to the business cycle, the occurrence of unexpected events, and swings in the market psychology, portfolio performance tends to be anything but constant over time. 

***
It is dynamic. In terms of market direction, there are the bull markets in which stock prices tend to increase, and there are the bear markets in which stock prices tend to fall. 

***
Then, in terms of market stress, we have periods in which markets are calm with persistently low volatility, and there are the more stressed regimes with big spikes in volatility.

***

Note that those regimes are persistent. Once the volatility is higher than average, it tends to stay above average for some time. It follows that the current performance is better estimated, when we give more weight to the more recent observations than to the distant observations. 

***

The standard approach of doing this is by the use of rolling estimation samples. Instead of estimating the performance measures on the full sample, we only take the K most recent observations. This implies that the performance estimate at time t is given by the performance statistic computed on the sample of returns at time t,  t-1 ,  t-2  up to   t-K+1.  

If we then move one observation further, and estimate the performance for the next date t+1, then we will be using the observations from t+1 till t-K+2. 
As such, we roll through time by adding the most recent observation and discarding the most distant one. 

***

On each subsample, any type of performance measure can be computed. 

As an example, you can see here the time series plot of annualized mean and volatility estimates obtained for the monthly S&P 500 returns using rolling samples of three years.

***  

Why did I choose three years and not 1 year when making this plot? This is a question of taste.  We need to have a sufficiently large number of observations to reduce the effect of noise on the performance estimate. But, the longer the subperiod is, the more it smooths over the highs and lows in the data, and the less informative it becomes about the most recently observed performance. 
In the next exercises, you will get a feeling for this trade-off.   


# Video 4:  The non-normality of the return distribution [word count: 604]

Up to now, we have been using the portfolio volatility as our measure of risk. Loosely speaking, the underlying assumption is that the portfolio return has a normal distribution and thus that its density function is bell-shaped. It is symmetric such that gains are equally likely as losses of the same magnitude. 

***

For many financial assets, this assumption of a normal distribution is wrong. Their distribution tends to be skewed to left with tails that are fatter than those of a normal distribution. 
As a consequence, when zooming in on the left tail of the histogram of financial returns, we often find that there are more extreme negative returns happening than is possible under a normal distribution. 

***

When this happens, an investor is no longer satisfied with using only the standard deviation as the risk measure, but should be using also a downside risk measure that quantifies the risk of losing money. Such a downside risk measure focuses on the left side of the return distribution, instead of considering the complete distribution.

A straightforward way to turn the standard deviation into a downside risk measure is to remove the higher than average returns. We then obtain the so-called portfolio semideviation. 

As can be seen on the slide, it is defined as the square root of the average variability of the lower than average returns around the mean.

***

Besides the semideviation, also the 5% portfolio value-at-risk and 5% expected shortfall are popular downside risk measures. They quantify the risk of the 5% most extreme losses. 

To understand their definition, take a look again at the return distribution plot, where I indicate their value. 
The 5% value-at-risk is the return that is so extremely negative that there is only a 5% chance of observing a return that is even more negative. 

But how severe are those 5% most extreme losses? This question is answered by computing the average value of the 5% most negative returns. This number is called the 5% expected shortfall.

***

In terms of performance measures, we have thus seen the mean and volatility, as well as downside risk measures such as the semideviation and value at risk. 

Typically, investors also report the skewness and excess kurtosis of their portfolio returns to indicate two types of non-normality in the return distribution, namely asymmetry and fat tails.  

***

The skewness is designed such that it is approximately zero when the distribution is symmetric. 

When the skewness is negative, it indicates that large negative returns occur more often than large positive returns. 
A negative skewness thus corresponds to a distribution with a long left tail.

The opposite is true in case of a positive skewness. Then large positive returns are more likely than large negative returns, and the distribution has a long tail to the right. 

***

Besides skewness, also fat tails are a cause of non-normality. A distribution with fat tails is a distribution in which extremely large positive or negative returns occur more often than a normal distribution would predict. 

A useful statistic to detect fat tails is the excess kurtosis. Its value is zero for the normal distribution. The larger the excess kurtosis, the fatter the tails are compared to the tails of a normal distribution.

***

Let’s do some exercises to get more insights about the non-normality of the S&P 500 portfolio returns. 

