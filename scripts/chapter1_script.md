# Video 1: Welcome to the course

Hi! Do you think that successful traders and portfolio managers are just lucky? Do you believe that investing is monkey business? Well, I don’t. And I hope that by doing this course you will find out how portfolio analysis in R can add value to your portfolio management. 

***

My name is Kris Boudt. I am a Professor of Finance at the Free University of Brussel and Amsterdam. I have more than a decade of experience in solving investment problems using the R language. I published my innovations in the top journals of my field, like the Journal of Portfolio Management and the Review of Finance. Importantly, many of the contributions are also available in R package, like the PortfolioAnalytics package, the highfrequency package, and, the PerformanceAnalytics package. That package is the go to package for analyzing portfolio returns in R and will be used in almost all exercises of this course. 

***

Besides my teaching and research, I also advise investment companies about best practices in portfolio management. The advisory is about balancing risk and reward in their investments. My baseline recommendation is to take investment decisions seriously and be aware of the risks involved in investing. Whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. It’s the expectation of gains that needs to be balanced against the risk of losses. 

***

There are two simple tricks to reduce the risk of suffering large losses. 

The first one is to seek portfolio risk diversification. This means that one should avoid investing in one single asset, but allocate the wealth across investments in different assets. Such a combination of investments is called a portfolio. 

When I review portfolios, I often find that by choosing more intelligent combinations of investments, it becomes possible to increase the portfolio’s expected return and reduce the risk. 

***
A second golden rule in investing is to always test the portfolio strategy on historical data. And, once you are trading the strategy, to constantly monitor its performance. For this reason, Datacamp is one of the best ways to learn portfolio analysis: I will teach you the theory in the videos and provide you the R instructions to do the portfolio analysis in practice. 
***
The course proceeds in four chapters. 
In Chapter 1 I introduce the basics variable in portfolio analysis, namely the portfolio weights and the portfolio returns. The portfolio weights tell you the percentage of total value invested in each of the assets. The portfolio returns measure the relative increase in portfolio value over the period.  I will show you how the portfolio weights and returns are connected, and how to automate the calculation. 
In Chapter 2 you will learn how to evaluate the portfolio performance.  You will see that portfolio performance can be analyzed in different ways, depending on the type of risk and reward measure you wish to use.  
Chapter 3 is about the sources of portfolio performance. I will show you how the individual risk and rewards of the different investments in the portfolio interact with each other to determine the aggregate portfolio reward and risk. 
In Chapter 4, I’ll show you how optimize the portfolio weights in such a way that the obtained portfolio cannot be beaten by any other portfolio in terms of offering a higher expected return for the same of lower level of risk. 

***
All together, these four chapters teach you to analyze portfolio returns in R, which is a crucial skill to make investment profits without taking excessive risks. 

 

# Video 2: The portfolio weights

In the previous example, I chose on purpose two companies selling a similar product. Still, the analysis showed that the value of the stocks can diverge over time. 
 
So how to decide between those two companies? Flip a coin? 

No! In most cases, the rational decision is not to invest in either one or the other, but to hold a portfolio that is invested in both of them. The rationale for this is that, by combining the investment, we can reduce substantially the investment risk, compared to the decision to concentrate all the investments in buying the shares of only one company. 

***
Thus a crucial element in analyzing portfolios is to investigate how the investments are spread across the different assets. This is done by computing the portfolio weight of each asset, defined as the value  in that asset, relatively to the total investment value. 

***
Suppose, for example, that there are N different investments, each with a value of Vi. The weights of each investment is given by its investment value, divided by the total investment value.

***
The corresponding R code is simple. Let values be the vector holding the values invested in the different assets. Then the corresponding weight vector is simply that vector, divided by its sum. Of course this vector sums to unity. 

***

In Chapter 4 we will see how to optimize the choice of portfolio weights. In the meantime, it is important to know that there exist several approaches to set the portfolio weights. 

A first approach is to concentrate the investment bet in one risky asset. This approach is speculative and very likely to be inefficient. 

When all assets are similar in terms of risk and reward, a better approach is to aim for perfect diversification and invest the same amount in each risky asset. 

Another popular approach is to set weights relatively to the total market value of the risky assets. It implies overweighting stocks of big firms and underweighting stocks of small firms.

***
These are only examples of the large number of possible approaches to set portfolio weights. For us, the important conclusion to remember is that to avoid extreme losses, it is definitely not a good idea to put all your eggs in one basket. And, once you agree to invest in several assets, you will need to decide on the portfolio weights to determine how much of the total investment budget is allocated to each of the assets.  


***

# Video 3: The portfolio return 

Analyzing the portfolio weights reveals the investment bets. The larger the weight of an asset in the portfolio, the more influential it will be in determining the future value of the portfolio. When studying this impact, investors typically do not analyze the change in the investment value in absolute terms, but in relative terms. This leads them to compute simple returns, defined as the change in value over the period, relatively to the initial value. 

***
The simple returns is thus the final value minus the initial value, divided by the initial value. 

As an example, suppose the initial value is 100 USD, the final value is 120 USD. Then the return on that investment equals 20%. 

Of course, in the case where the gain is still 20 USD, but the initial value is 1000 USD instead of 100 USD, then the return will be smaller, namely: 20 divided by 1000, which is 2%. 

***

The same definition applies for computing portfolio returns.  Like for any investment, the portfolio return over an investment period is defined as the change in portfolio value over that period, relatively to the initial value of the portfolio. 

This involves thus three steps. First, for the initial date, we need to compute the total value invested as the sum of the values of the different investments. Second, for the final date, we need to sum the end-of period values of the investments to obtain the final portfolio value. Then, finally, as the third step, we can compute the portfolio return as the percentage change of the final value compared to the initial value.

***

As an example, we consider here a portfolio of two assets in which the invested value of those two assets at the beginning of the period is 200 and 300 USD. The end value is 180 and 330 USD. 

We thus find that the total initial portfolio value is 500 USD, while the total end value is 510 USD. Then the simple return on the portfolio is the 10 USD change in value, divided by the initial 500USD invested, yield a return of 2%.   


*** 
A disadvantage of this calculation method using total initial and final portfolio values is that it does show how the portfolio weights determine the portfolio return. 

We therefore use in practice also a different formula, in which the portfolio return is also computed in three steps. First, the initial weights of the positions are computed. Secondly, the return on each of the individual positions is determined. Then, it turns out that the portfolio return equals the sum over the products between the initial weights and the corresponding returns. 

In more laymen’s terms, this means the portfolio return can also be computed as the weighted average of the individual returns.

***
As an illustration of this result, consider our portfolio of two assets in which the invested value of those two assets at the beginning of the period is 200 and 300 USD. The end value is 180 and 330 USD. 
Using the first definition of portfolio returns as percentage changes in portfolio value, we already showed that the return on this portfolio is: 2%. 
Let us now verify that we obtain the same result by computing the portfolio return as the weighted average return. 

First, we compute the portfolio weights at the beginning of the period. Since the first asset’s value is 200 USD and the total value invested is 500USD, the initial weight of asset 1 is 40%. The weight of asset 2 is 60%. 
Then, in a second step, we compute the returns for each of the assets. For asset 1, we obtain  that the individual return is -20 USD divided by 200 USD, which gives us -10%. For asset 2, the returns is  +10%. 
Now that we have the initial weights and the individual returns, we can thus compute the portfolio return by summing over the weights multiplied by their respective returns. The first erm is 40% times -10%, and thus -4%.  The second terms is 60% times 10% and thus +6%. The sum of both terms is the portfolio return of 2%, which is exactly the same number as obtained using the formula for the percentage change in portfolio value.  .

***
In formula notation, the portfolio return thus equals the weighted average of the individual returns. The corresponding code in R is simple. It just involves a summation of the element in the vector obtained by multiplying the vector of portfolio weights with the vector of returns ( show formula: portfolio return = sum w[i] r[i] = sum( weights*returns ). 
***

The next interactive exercises put this theory in practice. First, we consider computing the portfolio return for one period.  Then I will give you examples of computing portfolio returns over multiple periods.  

# Video 4: The PerformanceAnalytics package

***

At this point you know the ins and outs of computing a portfolio return over a single period running from a starting date to an ending date. 

In practice, when analyzing portfolio returns, we do not need to compute the returns over one period, but over many periods. In fact, the longer the history of returns, the more information we have about the underlying portfolio performance. 

***

Real-life analysis of portfolio returns thus requires a loop over the different dates. Fortunately for us, the code to do so in a computationally convenient way is already available in the R package PerformanceAnalytics. 

This the go-to package for analyzing portfolio return in R. 
This package has been written by Peter Carl and Brian Peterson. They are two smart quants from the city of Chicago and belong to the leading people in the R and Finance community. In my career, I have had the chance to work with them on several occasion and also assist in writing the code for the PerformanceAnalytics package. 


***

OK, so we need to compute the portfolio returns over different periods. To obtain this time series of portfolio returns, we will be using two functions in R, namely: the function Return.calculate and the function Return.Portfolio. 

***

The input data for the function Return.calculate is the time series of end-of-period values of the different investments. This should come as an object of the xts-time series class, meaning that the rows are ordered in time, with dates that are preferably indicated as YYYY-MM-DD. Each  column of the xts object corresponds to the time series of end-of-period values of an investment. . 

***

The function Return.calculate transforms the time series of investment values into a time series of returns, again of the xts time series class. Each observation is the percentage change in value over that period. The first row is filled with NA’s because there is no previous value available to compare with. This first row can thus be removed, using the instructions on the slide. 

***

To compute the time series of portfolio returns, we also need to set the portfolio weights.  There are several options. Either we choose to set only the initial weights and then have the subsequent weights be defined by the price dynamics. Or we choose to define ourselves the weights at regular times. This changing of the weights to set them to target weights is called rebalancing.  

***

Once the returns are defined and the investment policy in terms of setting the weights, we can compute the time series of portfolio returns using the function Return.portfolio. This is a powerful function, with at least three arguments that we need to specify: the return data argument R, the portfolio allocation argument weights and the argument rebalance_on defining whether and how frequent the portfolio needs to be rebalanced.  Let me discuss these arguments in more detail.


***
First, the return data file R. This is the xts-variable holding the single-period return table. It consists of as many columns as there are assets and each column is the time series of returns on the corresponding asset. 

***

The second argument is the variable weights. It should specify, for each period, the portfolio weights to be used. Alternatively, when the target weights are the same for each period or when the portfolio weights do not have to be rebalanced, it can be a vector. This vector needs, of course, to have the same length as the number of columns in the return data file. 

***

The third argument relevant for us is the argument rebalance_on. It defines whether and at which frequency the portfolio weights are reset to the portfolio weights. 

The default is that the portfolio does not rebalance, which corresponds to the buy and hold strategy, in which the winning stocks receive relatively higher weights. When the rebalancing argument is set to "years", "quarters", "months" or "days", the portfolio weights are reset to the target weight at the chosen frequency. In between two rebalancing dates, the portfolio weights can of course deviate from the target weights.
