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




***

# Video 3: In-sample versus out-of-sample evalution


Ideally, we should be optimizing using the true vector of expected returns mu and the true covariance matrix sigma.

In practice they are unknown and need to be estimate (slides: mu becomes hatmu, sigma becomes hatsigma)

***

These errors in estimation directly lead to errors in the estimates portfolio weights, which may have a negative effect on portfolio performance. It is therefore always important to account for the estimation error in testing portfolio performances on historic data. 

***

A common pitfall in portfolio analysis is to commit the sin of look ahead bias. This means that you use data which at the time of the decision you will not have. 

Suppose eg we wish [show with a time line]

***

In the exercises, we will use the function window to split the returns table in two:
* estimation sample
* evaluation sample
(show with plot)

On the estimation sample we determine the optimized weights. On the evaluation sample we test how well those weights do in terms of portfolio performance.

 


