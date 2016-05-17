# Video 1: Welcome to the course  

Hi! Do you think that successful traders and portfolio managers are just lucky? Do you believe that a portfolio of stocks selected by a blind-folded monkey is optimal?  Well, I don’t. And I hope that by doing this course you will find out how portfolio analysis in R can add value to your portfolio management. 

***

My name is Kris Boudt. I am a Professor of Finance at the Free University of Brussel and Amsterdam. I have more than a decade of experience in solving investment problems using the R language. Besides my teaching and research, I also advise investment companies about best practices in portfolio management. 

The advisory is about balancing risk and reward in their investments. My baseline recommendation is to take investment decisions seriously and to be aware of the risks involved in investing. Whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. It’s the expectation of gains that needs to be balanced against the risk of losses. 

***

There are two simple tricks to reduce the risk of suffering large losses. 

The first one is to seek portfolio risk diversification. This means that one should avoid investing in one single asset, but instead invest in many different assets. Such a combination of investments is called a portfolio. 

When I review portfolios, I often find that by choosing more intelligent combinations of investments, it becomes possible to increase the portfolio’s expected return and reduce the risk. 

***
A second golden rule in investing is to always test the portfolio strategy on historical data. And, once you are trading the strategy, to constantly monitor its performance. For this reason, Datacamp is one of the best ways to learn portfolio analysis: I will teach you the theory in the videos and provide you the R instructions to do the portfolio analysis in practice. 
***
The course proceeds in four chapters. 
In Chapter 1 I will introduce the basic variables in portfolio analysis, namely the portfolio weights and the portfolio returns. The portfolio weights tell you the percentage of total value invested in each of the assets. The portfolio returns measure the relative increase in portfolio value over the period.  I will show you how the portfolio weights and returns are connected, and how to do the calculation. 
In Chapter 2 you will learn how to use measures of reward and risk to evaluate the portfolio performance.  We will be using average returns, volatility, Sharpe ratio and even downside risk measures, such as the portfolio value-at-risk and expected shortfall. 
Chapter 3 is about the drivers of portfolio performance. I will show you how the individual risk and rewards of the different investments in the portfolio interact with each other to determine the total portfolio return and risk. 
Finally, in Chapter 4, I’ll show you how to optimize the portfolio weights in such a way that the obtained portfolio cannot be beaten by any other portfolio in terms of offering a higher expected return for the same or lower level of risk. 

***
All together, these four chapters teach you to analyze portfolio returns in R, which is a crucial skill to make investment profits without taking excessive risks. 

 

# Video 2: The portfolio weights 

In the previous example, I intentionally chose two companies selling a similar product. Still, the analysis showed that the value of the stocks can diverge over time. 
 
So how to decide between those two companies? Flip a coin? 

No! In most cases, the rational decision is not to invest in either one or the other, but to reduce our risk by holding a portfolio that is invested in both of them.  This is called diversifying your risks. 

***
So how good is your portfolio diversification? To answer this question you need to investigate how the portfolio investments are spread across the different assets. This is done by computing the portfolio weight of each asset. This means that we compute the ratio between the value of one investment, relatively to the total value of all the investments in the portfolio. 

***
Suppose, for example, that there are N different investments, each with their own value Vi. Then the weight of investment i equals Vi divided by the sum of the value of all the investments in the portfolio.  

***
The corresponding R code is simple. Suppose that values is the vector holding the values invested in the different assets. Then the corresponding weight vector is simply that vector of values, divided by its sum. Of course this vector sums to unity. 

***

In Chapter 4 we will see how to optimize the choice of portfolio weights. In the meantime, it is important to know that several approaches exist to set the portfolio weights. 

A first approach is to concentrate the investment bet in one risky asset. This approach is speculative and very likely to be inefficient. 

When all assets are similar in terms of risk and reward, a better approach is to aim for perfect diversification and to invest the same amount in each risky asset. This the so-called equal weighting approach. 

Another popular approach is to set weights proportional to the market value of the asset. It implies overweighting stocks of big firms and underweighting stocks of small firms.

***
These are only a few examples of the large number of possible approaches to define  portfolio weights. 

For us, the important conclusion to remember is that, to avoid extreme losses, it is definitely not a good idea to put all your eggs in one basket. 

***

# Video 3: The portfolio return 

Analyzing the portfolio weights reveals the investment bets. The larger the weight of an asset in the portfolio, the more influential it will be in determining the future value of the portfolio. When studying this impact, investors typically do not analyze the change in the investment value in absolute terms, but in relative terms. This leads them to compute simple returns, defined as the change in value over the period, relatively to the initial value. 

***
The simple return is thus the final value minus the initial value, divided by the initial value. 

As an example, suppose the initial value is 100 USD, the final value is 120 USD. Then the return on that investment equals 20%, obtained by taking the difference between 120 and 100 USD and dividing it by 100.  

***

In the slide I show you how we can apply this definition for computing portfolio returns.  This involves three steps. First, for the initial date, we need to compute the total value invested as the sum of the values of the different investments. Second, for the final date, we have to sum the final values of the individual investments to obtain the final portfolio value. Then, we can compute the portfolio return as the percentage change of the final value compared to the initial value.

***

As an example, let us consider a 2-asset portfolio that invests 200 USD in asset 1 and 300 USD in asset 2. The end value is 180 and 330 USD. 

If we sum the values, we find that the total initial value of the portfolio is 500 USD, while the total final value is 510 USD.  It follows that the simple return on the portfolio is the 10 USD change in value, divided by the initial 500USD invested, which gives us a return of 2%.   

*** 

A disadvantage of this calculation method is that it does not show how the portfolio weights determine the portfolio return. 

Let us therefore consider a different formula, in which the portfolio return is computed as the weighted average of the returns of the underlying assets. 

Its calculation proceeds also in three steps.  First, the initial weights of the positions are computed. Secondly, the return on each of the individual positions is determined. Then, in the third step, the portfolio return is computed as the sum over the products between the initial weights and the corresponding returns. 

***

In the slide you see how to apply this formula to compute the return for our example portfolio with two assets.

We  first compute the initial portfolio weights. Since the initial value of the first asset is 200 USD and the total value invested is 500USD, the initial weight of asset 1 is 40%. The remainder of 60% is the weight of asset 2. 

Then, in a second step, we need to compute the returns for each of the assets. For asset 1, we obtain that the individual return is -10%, while for asset 2, the return  is  +10%. 

Finally, we can combine those results and compute the portfolio return by summing over the weights multiplied by their respective returns. The first term is the weight of 40% times the returns of -10%, which gives us  -4%.  The second term is the weight of asset 2, 60% times its return of 10%, which gives us +6%. 

Adding -4% and  +6% gives us the portfolio return of 2%, which is exactly the same number as obtained before.  

***
The next interactive exercises put this theory in practice. 

***


# Video 4: The PerformanceAnalytics package (word count: 403)

***

At this point you know the ins and outs of computing a portfolio return over a single period running from a start date to an end date. 

In practice, we will need to compute the returns for many periods. In fact, the longer the history of returns, the more information we have about the underlying portfolio performance. 

***

Real-life analysis of portfolio returns thus requires a loop over the different dates. In this video, I will show you how to do this using the R package PerformanceAnalytics. This is the go-to package for analyzing portfolio returns in R and has been written by two quants from the city of Chicago: Peter Carl and Brian Peterson.   

***

So, how to compute the time series of portfolio returns in R. Well, this is made easy by using two functions in R, namely: the function Return.calculate and the function Return.portfolio. 

***

The main argument for the function Return.calculate is the time series of end-of-period prices of the different investments. This should come as an object of the xts-time series class, meaning that the rows are ordered in time. The corresponding dates are preferably indicated as YEAR YEAR YEAR YEAR dash MONTH MONTH dash DAY DAY. 

By default, the function Return.calculate transforms the time series of prices into a time series of returns, where each observation is the percentage change in value over that period. 

Note that the first row of the obtained return data consists of NA’s. This means that for the first date the returns are not available. This is normal, since for the first date, there is no previous price available to compare with the current price. This first row can thus be removed, as shown on the slide. 

***

As such we have the time series of returns on the individual investments. To compute the time series of portfolio returns, we also need to define the time series of initial portfolio weights.  There are several possibilities. The default choice is to set only the initial weights for the first date and then have the subsequent weights be automatically determined by the price dynamics. 

The alternative is to pursue a dynamic approach to portfolio allocation, in which the action of buying and selling assets to actively change the portfolio weights is called rebalancing.  

***

Given the returns and portfolio weights, we can then finally compute the time series of portfolio returns using the function Return.portfolio. This is a powerful function, with at least three arguments that need to be specified: the return data argument, the weights argument and the rebalancing argument defining whether and how frequent the portfolio needs to be rebalanced. 

Without going in the details, let’s go to the exercises and learn by doing about these arguments. 
