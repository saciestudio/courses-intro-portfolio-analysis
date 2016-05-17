# Video 1: Welcome to the course (word count: 538)

Hi! Do you think that successful traders and portfolio managers are just lucky? Do you believe that a portfolio of stocks selected by a blind-folded monkey is optimal?  Well, I don’t. And I hope that by doing this course you will find out how portfolio analysis in R can add value to your portfolio management. 

***

My name is Kris Boudt. I am a Professor of Finance at the Free University of Brussel and Amsterdam. I have more than a decade of experience in solving investment problems using the R language. Besides my teaching and research, I also advise investment companies about best practices in portfolio management. 

The advisory is about balancing risk and reward in their investments. My baseline recommendation is to take investment decisions seriously and to be aware of the risks involved in investing. Whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. It’s the expectation of gains that needs to be balanced against the risk of losses. 

***

There are two simple tricks to reduce the risk of suffering large losses. 

The first one is to seek portfolio risk diversification. This means that one should avoid investing in one single asset, but allocate the wealth across investments in different assets. Such a combination of investments is called a portfolio. 

When I review portfolios, I often find that by choosing more intelligent combinations of investments, it becomes possible to increase the portfolio’s expected return and reduce the risk. 

***
A second golden rule in investing is to always test the portfolio strategy on historical data. And, once you are trading the strategy, to constantly monitor its performance. For this reason, Datacamp is one of the best ways to learn portfolio analysis: I will teach you the theory in the videos and provide you the R instructions to do the portfolio analysis in practice. 
***
The course proceeds in four chapters. 
In Chapter 1 I will introduce the basic variables in portfolio analysis, namely the portfolio weights and the portfolio returns. The portfolio weights tell you the percentage of total value invested in each of the assets. The portfolio returns measure the relative increase in portfolio value over the period.  I will show you how the portfolio weights and returns are connected, and how to automate the calculation. 
In Chapter 2 you will learn how to evaluate the portfolio performance.  You will see that portfolio performance can be analyzed in different ways, depending on the type of risk and reward measure you wish to use.  
Chapter 3 is about the sources of portfolio performance. I will show you how the individual risk and rewards of the different investments in the portfolio interact with each other to determine the aggregate portfolio reward and risk. 
In Chapter 4, I’ll show you how optimize the portfolio weights in such a way that the obtained portfolio cannot be beaten by any other portfolio in terms of offering a higher expected return for the same of lower level of risk. 

***
All together, these four chapters teach you to analyze portfolio returns in R, which is a crucial skill to make investment profits without taking excessive risks. 

 

# Video 2: The portfolio weights (word count: 411)

In the previous example, I intentionally chose two companies selling a similar product. Still, the analysis showed that the value of the stocks can diverge over time. 
 
So how to decide between those two companies? Flip a coin? 

No! In most cases, the rational decision is not to invest in either one or the other, but to reduce our risk by holding a portfolio that is invested in both of them.  

***
Thus a crucial element in analyzing portfolios is to investigate how the investments are spread across the different assets. This is done by computing the portfolio weight of each asset, defined as the value in that asset, relatively to the total investment value. 

***
Suppose, for example, that there are N different investments, each with a value of Vi. The weights of each investment is given by its investment value, divided by the total investment value.

***
The corresponding R code is simple. Let values be the vector holding the values invested in the different assets. Then the corresponding weight vector is simply that vector, divided by its sum. Of course this vector sums to unity. 

***

In Chapter 4 we will see how to optimize the choice of portfolio weights. In the meantime, it is important to know that several approaches exist to set the portfolio weights. 

A first approach is to concentrate the investment bet in one risky asset. This approach is speculative and very likely to be inefficient. 

When all assets are similar in terms of risk and reward, a better approach is to aim for perfect diversification and invest the same amount in each risky asset. 

Another popular approach is to set weights relatively to the total market value of the risky assets. It implies overweighting stocks of big firms and underweighting stocks of small firms.

***
These are only examples of the large number of possible approaches to set portfolio weights. For us, the important conclusion to remember is that to avoid extreme losses, it is definitely not a good idea to put all your eggs in one basket. And, once you agree to invest in several assets, you will need to decide on the portfolio weights to determine how much of the total investment budget is allocated to each of the assets.  


***

# Video 3: The portfolio return (word count: 603)

Analyzing the portfolio weights reveals the investment bets. The larger the weight of an asset in the portfolio, the more influential it will be in determining the future value of the portfolio. When studying this impact, investors typically do not analyze the change in the investment value in absolute terms, but in relative terms. This leads them to compute simple returns, defined as the change in value over the period, relatively to the initial value. 

***
The simple return is thus the final value minus the initial value, divided by the initial value. 

As an example, suppose the initial value is 100 USD, the final value is 120 USD. Then the return on that investment equals 20%. 

***

In the slide you see how we can apply this definition for computing portfolio returns.  This involves thus three steps. First, for the initial date, we need to compute the total value invested as the sum of the values of the different investments. Second, for the final date, we need to sum the end-of period values of the investments to obtain the final portfolio value. Then, as the third step, we can compute the portfolio return as the percentage change of the final value compared to the initial value.

***

As an example, we consider here a 2-asset portfolio that invests 200 USD in asset 1 and 300 USD in asset 2. The end value is 180 and 330 USD. 

We thus find that the total initial portfolio value is 500 USD, while the total end value is 510 USD. Then the simple return on the portfolio is the 10 USD change in value, divided by the initial 500USD invested, yield a return of 2%.   

*** 
A disadvantage of this calculation method using total initial and final portfolio values is that it does not show how the portfolio weights determine the portfolio return. 

Let us therefore consider a different formula, in which the portfolio return is computed as the weighted average of the returns of the underlying assets. Its calculation proceeds also in three steps.  First, the initial weights of the positions are computed. Secondly, the return on each of the individual positions is determined. Then, in the third step, the portfolio return is computed as the sum over the products between the initial weights and the corresponding returns. 

***

Let us now apply this formula to our example portfolio with two assets.

We thus first compute the portfolio weights at the beginning of the period. Since the first asset’s value is 200 USD and the total value invested is 500USD, the initial weight of asset 1 is 40%. The weight of asset 2 is 60%. 

Then, in a second step, we need to compute the returns for each of the assets. For asset 1, we obtain that the individual return -10%, while for asset 2, the returns is  +10%. 

Combining those results, we can compute the portfolio return by summing over the weights multiplied by their respective returns. The first term is 40% times -10%, and thus -4%.  The second term is 60% times 10% and thus +6%. 

The sum of both terms is the portfolio return of 2%, which is exactly the same number as obtained before, using the formula for the percentage change in portfolio value.  

***
In formula notation, the portfolio return thus equals the weighted average of the individual returns. The corresponding code in R is simple. It just involves a summation of the element in the vector obtained by multiplying the vector of portfolio weights with the vector of returns.

***

The next interactive exercises put this theory in practice. 

# Video 4: The PerformanceAnalytics package (word count: 403)

***

At this point you know the ins and outs of computing a portfolio return over a single period running from a starting date to an ending date. 

In practice, we will need to compute the returns over many periods. In fact, the longer the history of returns, the more information we have about the underlying portfolio performance. 

***

Real-life analysis of portfolio returns thus requires a loop over the different dates. In this video, I will show you how to do this in a computationally convenient way using the R package PerformanceAnalytics. This is the go-to package for analyzing portfolio return in R and has been written by two quants from the city of Chicago: Peter Carl and Brian Peterson.   

***

Alright. Our problem to solve is thus to compute the portfolio returns over different periods. To obtain this time series of portfolio returns, we will be using two functions in R, namely: the function Return.calculate and the function Return.portfolio. 

***

The input data for the function Return.calculate is the time series of end-of-period prices of the different investments. This should come as an object of the xts-time series class, meaning that the rows are ordered in time, with dates that are preferably indicated as YEAR YEAR YEAR YEAR dash MONTH MONTH dash DAY DAY. 

The function Return.calculate transforms the time series of prices into a time series of returns. Each observation is the percentage change in value over that period. The first row consists of NA’s.  The returs are thus not available for the first date, because they cannot be computed, since there is no previous price available to compare with the current price. This first row can thus be removed, as shown on the slide. 

***

To compute the time series of portfolio returns, we also need to set the portfolio weights.  There are several options. The default option is to set only the initial weights for the first date and then have the subsequent weights be defined by the price dynamics. The alternative is to pursue a dynamic approach to portfolio allocation. The action of buying and selling assets to actively change the portfolio weights is called rebalancing.  

***

Given the returns and the weights, we can then compute the time series of portfolio returns using the function Return.portfolio. This is a powerful function, with at least three arguments that we need to specify: the return data argument, the weights argument and the rebalancing argument defining whether and how frequent the portfolio needs to be rebalanced. 

In the exercises, we will see more details about each of these arguments. 
