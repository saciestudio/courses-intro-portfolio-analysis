# Video 1: Modern portfolio theory of Harry Markowitz


A mean-variance efficient investor is thus an investor who ....

***

But how to find such a vector of mean-variance efficient portfolio weights in practice? 

***

Let us first write down the mathematical problem and then discuss the method used to solve that problem. 



***

# Video 2: In-sample versus out-of-sample evalution

Optimizing portfolios based on the estimated mean and covariance matrix is senstivitive to errors in estimation. The estimated mean and covariance matrix have estimation errors. Optimizing portfolio weights based on those noisy inputs leads to noisy portfolio weights, that may be suboptimal. Risk of error maximization. The insample estimated mean and variance of the optimized portfolios versus the out of sample.  Important to be aware of this by analyzing performance out of sample. Distinghuish estimation window from evaluation window;


***

# Video 3: Main take-aways

 

***

It is important to understand the structure of the data. As you can see on the slide, each row correspond to the ending day of the month, each column to a stock. 

***

We now thus need to convert this table of prices into a table of returns. This can be done using the function calculateReturns in the function PerformanceAnalytics. This leads to a table with the first row consisting of NA because there is no previous price available to compute the returns. In R, this first row can be easily removed by indexing that row with a minus 1 sign.

***

It ain't over: other objectives, other constraints, other solvers, other estimators, ... 


***
