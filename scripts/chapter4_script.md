# Video 1: Modern portfolio theory of Harry Markowitz [word count: 380]


The final objective of this course, is to teach you the skill to determine the portfolio weights that are optimal in the sense that there is no other portfolio with a higher expected return for the same or lower level of volatility. 

***

Optimizing the portfolio weights requires us to first specify exactly the objective to be optimized and the constraints the optimal portfolio weights should satisfy.

There are many possible objective functions, such as maximizing the expected return, minimizing the variance, or maximizing the portfolio’s Sharpe ratio.

In terms of constraints, there are almost always constraints on the weights. 
Examples of weight constraints include imposing that the portfolio weights are positive and that all the weights sum to one, such that the portfolio is fully invested. 

Another popular constraint is to impose that the portfolio expected return is equal to a target value. 
 
***
Of all possible combinations, we will focus on the objectives and constraints recommended by Nobel prize winner Harry Markowitz. In his modern portfolio theory, he recommends to find optimal portfolios by minimizing the portfolio variance, under the constraint of full investment and that the expected return should be equal to a pre-specified return target.

***

The approach of minimizing the portfolio variance under a return target constraint leads to an optimized portfolio that is mean-variance efficient. 
This means that there is no other portfolio with a higher expected return at the same or lower level of portfolio volatility. This is equivalent to saying that there is no other portfolio with a lower volatility, at the same or higher expected return.

***

Practice makes the master. Let’s find out how easy it is to find mean-variance efficient portfolios in R. 

 

# Video 2: The efficient frontier [Word count: 488]


Let’s visualize what you have been doing in a plot showing on the x-axis the portfolio volatility and on the y-axis the expected return. By fixing the return target, you searched along the horizontal dashed line for the portfolio that has the minimum variance.

***

We can of course do this for other return targets. If we take a higher return target, the corresponding optimal portfolio will have a higher volatility. If we take a lower return target, the optimal portfolio will have a lower volatility. 
This corresponds to the classical risk/reward trade-off in finance: if you desire a higher expected return, you must accept taking greater risk.

***

If we do the optimization for all possible return targets, we obtain the so-called efficient frontier: it is the curve connecting the expected return/volatility couples of the mean-variance efficient portfolios. 

There are no portfolios possible above the frontier, and all portfolios below the frontier are dominated by the portfolios on the frontier: for the same level of volatility, they offer the highest possible expected return.

***

Note that the efficient frontier starts at an expected return which is higher than the risk free rate.  This is required, since investing in a risky portfolio makes only sense if the increase in expected return compared to the risk free rate is sufficiently high compared to the risk taken.

The portfolio at which the efficient frontier starts is called the minimum variance portfolio. It is the portfolio that solves the problem of minimizing the variance, without any constraint on expected returns. 

All other portfolios on the efficient frontier have a higher volatility and a higher expected return.  

***

For each portfolio on the efficient frontier, we can evaluate the risk return trade-off by computing the portfolio’s Sharpe ratio. 
It is the portfolio expected return in excess of the risk free rate, divided by the portfolio volatility.
 Graphically, it corresponds to the slope of the line connecting the risk free asset and the risky portfolio 

If we draw this line for each of the efficient portfolios, we obtain as a special case the portfolio on the frontier for which the line is tangent to the efficient frontier. This is called the tangency portfolio. 

Note, that, it is impossible to find a portfolio with a higher Sharpe ratio. This tangency portfolio is thus the maximum Sharpe ratio portfolio. It offers the highest possible reward in terms of excess return, per unit of portfolio volatility.

***

In the exercises, you will learn how to construct the efficient frontier by running a for-loop over the set of possible return targets.  

***

# Video 3: In-sample versus out-of-sample evaluation

I’ve got some good news and some bad news for you. 

The bad news is that the efficient frontier you just obtained is too good to be true. It is based on optimizing the estimated variance under a constraint on the estimated expected return.

Ideally, it should however be based on the true portfolio variance and the true portfolio expected return. Because of the errors in the estimation of the mean and variance, there is also an estimation error in terms of the optimized weights. Depending on the magnitude of the errors, the optimized portfolio weights could thus be far from being optimal.  

***

The good news is that this makes portfolio management challenging and by doing the right data analysis you can beat the other more naive investors who are ignoring the estimation error. 

In this last video I will teach you to use split-sample analysis to evaluate in an objective way what the future performance of the optimized portfolio could be. 

***

As you probably can guess, the split-sample analysis consists of splitting the sample of historical returns in two parts. The first part is called the estimation sample and will be used to estimate the mean returns and the covariance matrix, used to optimize the portfolio.  
The second part is the out-of-sample evaluation sample. It is the sample of returns that is used to evaluate the performance of the optimized portfolios. 

**

When doing the split sample, we mimic the investor who, at the end of the estimation sample, decides to invest and to use the weights optimized using the data in the estimation sample. 

***

By separating the estimation sample and the evaluation sample we thus give a realistic assessment of the performance of the portfolio.  

***

It is crucial that there is no overlap between the estimation sample and the evaluation sample. Otherwise there is a look ahead bias. This means that we are optimizing the portfolio using more information than we actually have at the time of the investment decision. Such a look ahead bias leads to a too optimistic view on how good the optimized portfolio performs in real-life. 

***

In R, split-sample analysis is made simple with the function window in the package xts. Let’s find out how that works in practice.

