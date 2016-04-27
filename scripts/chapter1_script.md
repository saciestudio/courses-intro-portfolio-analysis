# Video 1: Welcome to the course
Hi! Do you think that succesful traders and portfolio managers are just lucky? Do you believe that investing is a monkey business? If yes, there is nothing I can teach you here. If not, then I am pleased to welcome you to my course on portfolio analysis in R. My name is Kris Boudt. I am a Professor of finance. This means that I have a lot of time to think about problemns, such as managing my investments and making statistical tools that do the job for me. My research has been published in the top journals of my field, such as the Journal of Portfolio Management and the Review of Finance. I am a contributor to several popular R packages such as PerformanceAnalytics, PortfolioAnalytics, and the Highfrequency package.   Besides my teaching and research, I also advise investment companies about best practices in portfolio management. 
My principal advice is to take investment decisions seriously and be aware of the risks involved in investing. Whenever you buy a stock or bond at some price, this price will change in the future. If it increases, you make a profit. If it decreases, you make a loss. 
***
There are some simple tricks to reduce the risk of making large losses. 
The first one is to seek for portfolio risk diversification. This means that one should avoid investing in one single asset, because by choosing intelligent combinations of investments, it becomes possible to increase return and reduce the risk. 
***
Another golden rule in investing is to always test the portfolio strategy on historical data. And, once you are trading the strategy, to constantly monitor its performance. For this reason Datacamp is one of the best ways to learn portfolio analysis: I will teach you the theory in short videos and provide you the R instructions to do the portfolio analysis in practice. 
***
The course proceeds in four chapters. 
In Chapter 1 I will show you how to compute portfolio returns in R. 
Chapter 2 is about your skills to evaluate the portfolio performance. 
Chapters 3 and 4 are about optimizing the portfolio decision. This requires a multivariate view. Chapter 3 shows how the portfolio variance is a function of the assets individual volatility and all the correlations between the returns of the different assets. Chapter 4 then provides the tools to optimize portfolio decisions and choose portfolios that are efficient.[UITLEGGEN] It is not possible to have a higher return with less risk, or a lower risk with higher return. 
***
All together, these four chapters learn you to analyze portfolio returns in R, which is a crucial skill to make investment profits without taking excessive risks. 

 
# Video 2: The investment decision in a portfolio context

The Coca Cola Company and PepsiCo, those are two companies selling a similar product. But, as we have just seen, the investment in their shares can result in substantial difference in investment performance. 
So how to decide between CocaCola and PepsiCo? Flip a coin? 
No! In decisions involving risk, we need to first quantify the risk and verify that the level of risk is acceptable for our investments.  
As Robert Engle already mentioned in  his 2003 Nobel prize lecture, it is impossible to completely avoid risk in real-life financial decision making. It would imply “no flying, no driving, no walking” or even taking a bath.  There are some risks we choose to take because the benefits from taking them exceed the possible costs. This is the central paradigm in finance:  we must take risks to achieve rewards but not all risks are equally rewarded.
***
In fact, some of the financial risks can be avoided by combining investments. This is the power of portfolio diversification: by choosing intelligent combinations of investments, it becomes possible to increase at the same time expected return and reduce the risk, compare to buy-and-hold investments in a single asset.  
***
A crucial element in portfolio diversification is thus the decision to spread your investment. Investors use the term portfolio weights to indicative the value invested in each asset, relatively to the total investment value. Suppose e.g. that there are N different investments, each with a value of Vi. The weights of each investment is given by its investment value, divided by the total investment value.

***
Those weights are simple to compute in R. Suppose e.g. that we have a vector of investment values. Then the corresponding weight vector is simply that vector, divided by its sum. The numbers can be easily visualized using a barplot. 
***
It is important to realize that the portfolio weights are not a fact of life, but a decision variable for the investor.  Several approaches exist to decide on portfolio weights. 
A first approach is to concentrate the investment bet in one risky asset. This approach is speculative and very likely to be inefficient. 
When all risky assets are similar in terms of risk and reward, a better approach is to aim for perfect diversification and invest the same amount in each risky asset. 
The most often used approach is to set weights relatively to the total market value of the risky assets. It implies overweighting stocks of big firms and underweighting stocks with small firms.
But, some investors disagree and would prefer to invest in smaller firms, because they have more potential to grow. Others are seeking for a good buy in terms of value for money and seek to overweight stocks with a low price comparing to their book value and earnings. Recently the low risk approach to investing has also become very popular: it consists of investing in the least risky assets. 
***
These are only examples of the large number of possible approaches to set portfolio weights. For us, the important conclusion to remember is that to avoid extreme losses, it is definitely not a good idea to put all your eggs in the same basket. 
At the same time, you may lose upside potential by spreading too much the portfolio weights. The key questions are thus: (i) Which investments to choose and (ii) How to monitor the portfolio performance to make sure it does what you expect it to do. 

***

The answer to these question starts by understanding portfolio performance figures. In this chapter, we'll break the portfolio value calculation down into a three step process: First, computing portfolio weights. Second, computing portfolio returns. Third, compounding portfolio returns to obtain the portfolio value evolution.  

***

# Video 3: One-period portfolio returns are the weighted average of the individual returns

The investment decision involves defining the portfolio weights. But, what matters for the investor, are not the weights, but the change in the portfolio value over the investment period. The backward looking questions are: Did it increase enough, compared to the risk taken? If it lost value, could it have been avoided? The forward looking question is: Are the weights such that the reward is high enough for the risk taken? Isn’t possible to find weights with a higher reward for the same risk? 
***
When analyzing those questions, the investor typically does not analyze the change in the investment value in absolute terms, but in relative terms. The so-called simple return on an investment over a period in which the investment value changes from Vi to Vf is the difference between Vf and Vi, relatively to the value of Vi. As an example, suppose the initial value is 100, the final value is 120. Then the return on that investment equals 20%. Suppose the initial value was not 100 but 1000 and the gain is still 20. Then the return is 2%. Finally, … 
***
For portfolio analysis, it is important to quantifying the relative changes in the value of your portfolio. Like for any investment, the portfolio return is defined as the percentage change in portfolio value compared to the initial value of the portfolio. 
***
As can be seen in the table, the calculation of portfolio returns based on the values of the different investments is straightforward. It requires to add all the initial investment values to obtain the total initial value of the portfolio. The final portfolio value is the sum over the final values of the investments. The portfolio return is the percentage change of the final value compared to the initial value.
*** 
Disadvantage of this calculation method is that it does not clearly show how the portfolio weights determine the portfolio return. Next I show that the portfolio return can also be computed as the weighted average of the individual returns.
*** 
[explain further]
***
***
As an illustration of this result, consider now a portfolio of two assets and the invested value of those two assets at the beginning of the period is 200 and 300. The end value is 180 and 330. The total initial portfolio value is thus 500. The total end value is 510. Then the simple return on the portfolio is: (510-500)/500 =  2%.  (show with a table)
Note that the portfolio weights of assets 1 and 2 40% and 60%, and the individual returns are -10% and   +10%. Note that the sum over the weights multiplied by the returns gives the portfolio return of 2%: 40% times -10% is -4%. 60% times 10% is +6%. The sum is 2%. 
***
In formula notation, the portfolio return thus equals the weighted average of the individual returns. The corresponding code in R is simple. It just involves a summation of the element in the vector obtained by multiplying the vector of portfolio weights with the vector of returns ( show formula: portfolio return = sum w[i] r[i] = sum( weights*returns ). 
***

The next exercises put this theory in practice. First, we consider computing the portfolio return for one period, then I will introduce you to the wonderful package PerformanceAnalytics for analyzing  portfolio returns.  

# Video 4: Sneak preview of the fin and fun ahead

We have up to now considered toy examples of portfolio analysis: portfolio with less than 10 investments and a single period investment horizon. A well-diversified portfolio is typically invested in at least 20 risky assets and the investment period runs over several years, possibly with intermediate changes in the portfolio allocation. We have focussed mostly on performance and not discusses the risks of investments. In this video I will give you a sneak preview on the cool tables and figures that we will make.    
***
Yearxmonth
Table with the performance AND risk measures. 
***
The scatter plot of return and risk of the individual stocks
The efficient frontier. 
***
TO BE COMLETED.


