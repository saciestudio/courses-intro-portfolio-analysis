# Video 1: Modern portfolio theory of Harry Markowitz

Hi, this video is about deciding on w = the vector of portfolio weights.   [slide should show the vector]

***

In case of investing in the 30 dow jones stocks, the choice of portfolio weights clearly matters, since:
(i) the performance of the returns is so different;
(ii) and most of the correlations are below 60%.

By overweighting the outperforming stocks and exploiting the diversification potential across the stocks, we should thus be able to outperform naive portfolio choices such as the 1/N allocations that assigns to each of the N stocks the same weight. .

***

Optimizing the portfolio weights requires first to specify exactly the objective and constraints the optimal portfolio weights should satisfy.

There are many possible objective functions, such as maximizing the expected return, minimizing the variance, maximizing the skewness, minimizing the portfolio's downside risk [slide should show table with 2 columns]

In terms of constraints, there could be the constraint that all weights have to sum to one, that they should be with a box defined by a lower and upper bound, that the risk is below some risk bound, etc. 

Of all possible combinations, we will follow those of Nobel prize winner Harry Markowitz: namely minimizing the portfolio variance, under a full invest constraint, no negative weights and that the expected return should be above a pre-specified return target.

***

Solving this problem is part of the modern portfolio theory of Harry Markowitz. In his theory, he assumes that investors are seeking for mean-variance efficient portfolios. This means that, they will only accept a portfolio, if there is no other portfolio offering
- a higher expected return at the same or lower portfolio standard deviation.
- or equivalently, a lower standard deviation, at the same or higher expected return. 

The portfolio that minimizes the variance under a return target constraint is of course mean-variance efficient.

***

To solve this problem, we will need our matrix notation again. Remember: W is the column-vector of portfolio weights, mu is the column vector of expected returns and sigma is the covariance matrix. 

Then the expected portfolio return is given by inner product of the weights and the expected return vector. The portfolio variance is the quadratic form of the weights with respect to the covariance matrix. And thus, the optimal portfolio is given by minimizing the portfolio variance under the constraint on the expected returns, together with the weight constraints. 

Since the objective function is quadratic in the portfolio weights, and the constraints are linear in the portfolio weights, this is called a quadratic program, which can be easily solved in R. 

# Video 2: The efficient frontier

For a given return target, we can thus find the corresponding mean-variance efficient portfolio. If we represent this in the  plot of portfolio expected return versus volatility, this means that there are no portfolios with a higher return and a lower risk. [show in the plot] 

***
If we take a different return target, we will obtain a different efficient portfolio. 

***

If we do this for all possible return targets, we obtain the so-called efficient frontier: it is the curve connecting the return/volatility couples of the mean-variance efficient portfolios. There are no portfolio above the frontier, and all portfolios below the frontier are dominated by the portfolios on the frontier: for the same level of volatility, they offer a higher expected return.

***

For each portfolio we can compute the Sharpe ratio, as the expected portfolio return in excess of the risk free rate, divided by the portfolio standard deviation. Note that this corresponds to the slope of the line connecting the risk free rate with the efficient portfolio. 

When this line is tangent to the frontier, it is impossible to find a portfolio with a higher Sharpe ratio and thus this tangency portfolio is the maximum Sharpe ratio portfolio. 

***

A second special case is the minimum variance portfolio, which is the portfolio offering the lowest variance of all mean-variance efficient portfolios considered.


***

In the exercises, you will be requested to construct the efficient frontier, by running a for-loop over the set of possible return targets. Suppose the loop runs from l to u, and the lowest target is below the return of the minimum variance portfolio. Then, you will obtain as a result a parabole in which the lower segment consists of portfolios that are dominated by the portfolios in the upper segment. 

***
Of course, only the upper segment of the parabole is then the efficient frontier


***




expected return investment objectives proposed by Nobel prize winner Harry Markowitz. In his modern portfolio theory, he assumed that investors are seeking for mean-variance efficient portfolios. This means that, they will only accept a portfolio, if there is no other portfolio offering
- a higher expected return at the same or lower portfolio standard deviation.
- or equivalently, a lower standard deviation, at the same or higher expected return. 

***

Finding such a mean-variance efficient portfolio requires to optimize the portfolio weights. In particular, we seek to minimum

Such optimalit
such decisions need to be optimal. investment decisions you will 

You have just explored the individual performances of the Dow Jones Industrial Average stocks, together with their correlation.
The analysis has shown that, actually, there is a lot of variation in the average return and volatility across stocks, and that almost all of the correlation between the stocks returns are below 0.6. 

Finding such a heterogeneity in performance and diversification potential is is good news for our ultimate goal of optimizing the portfolio weights. Since the individual performances are so different and there is scope of diversification, the actual choice of portfolio will matter. 

***

When 

almost all less   the average correlation between the stock return is positive, it  


Do not put all your eggs in one basket. 


A mean-variance efficient investor is thus an investor who ....

***

But how to find such a vector of mean-variance efficient portfolio weights in practice? 

***

Let us first write down the mathematical problem and then discuss the method used to solve that problem. 


Concept of minimizing variance given a return target

***

# Video 3: In-sample versus out-of-sample evalution

Optimizing portfolios based on the estimated mean and covariance matrix is senstivitive to errors in estimation. The estimated mean and covariance matrix have estimation errors. Optimizing portfolio weights based on those noisy inputs leads to noisy portfolio weights, that may be suboptimal. Risk of error maximization. The insample estimated mean and variance of the optimized portfolios versus the out of sample.  Important to be aware of this by analyzing performance out of sample. Distinghuish estimation window from evaluation window;


***

# Video 3: Main take-aways on portfolio optimization

Importance of optimizing portfolios: Diagram of the different steps: 
1) define objectives and constraint
2) implementation:
* Estimate the parameters needed;
* Find the solver
3) backtest

***
Discuss extensions
 
 
There are many possible objective functions, such as maximizing the expected return, minimizing the variance, maximizing the skewness, minimizing the portfolio's downside risk [slide should show table with 2 columns]

In terms of constraints, there could be the constraint that all weights have to sum to one, that they should be with a box defined by a lower and upper bound, that the risk is below some risk bound, etc. 


The traditional objective of minimizing the portfolio variance under the constraint that the portfolio expected return should be above some target level. This is a quadratic programming problem. At the end of the chapter, I will discuss extensions related to screening stocks using mixed integer linear programming and optimizing more complex objective functions combining different types of objectives and constraints.   


***

It is important to understand the structure of the data. As you can see on the slide, each row correspond to the ending day of the month, each column to a stock. 

***

We now thus need to convert this table of prices into a table of returns. This can be done using the function calculateReturns in the function PerformanceAnalytics. This leads to a table with the first row consisting of NA because there is no previous price available to compute the returns. In R, this first row can be easily removed by indexing that row with a minus 1 sign.

***

It ain't over: other objectives, other constraints, other solvers, other estimators, ... 


***
