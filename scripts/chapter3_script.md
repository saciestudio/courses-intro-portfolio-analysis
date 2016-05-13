# Video 1: The inputs in case of two assets


This chapter bridges the material for analyzing portfolio performance in chapter 2 and the functionality to determine the portfolio allocation for which the predicted portfolio performance is optimal. 

***

The decision process can be visualized as follows. First of all, the investor needs to specify her objectives and constraints. We will be considering a portfolio whose preferences are completely described by the mean and variance of the portfolio return over the investment horizon. Since the future return is a random variable, the relevant definition of the mean is the expectation of the portfolio return, and the variance is the expectation of the portfolio squared centered return. 

***

Both the portfolio mean and variance depend on the portfolio weights. In this video, we will work out the case of two assets. In the next video, the general case will be presented. 


***

OK, suppose that we have two assets, say equities and bonds, and the weights of equities in the portfolio is w. The portfolio is fully invested such that (1-w) is the allocation to bonds. The portfolio return is then given by w times the return on the equities + (1-w) times the bond return. 

If we then work out the expected portfolio return, and using that the expected value of a sum is the sum of the expected values, we obtain that the  portfolio mean is the weighted average of the component means.

Suppose e.g. that the portfolio is equally weighted and the expected returns are 6% for equities and 4% for bonds, then the portfolio expected return is 5%. If the portfolio is 60/40 weighted than the expected portfolio return is 5.6%.  

***

The impact of the weights on the portfolio variance is slightly more complex because the centered returns are squared, implying that we will need to take the expectation of the cross-products into account. 

Doing this in the 2-asset case yields that the portfolio variance equals the sum of the squared weights their variance plus the product of the weights and the exected value of the product of the centered returns. The latter is called the covarians and equals the products of the standard deviation and the correlation. 

***

The correlation measures the degree of comovement of the two assets. If they are unrelated, then the correlation is zero. If there is on average a positive linear relatioship between both, then the correlation will be positive: when one is above average, the other also tends to be below average. If the average relationhip is the reverse, namely that if one is above avarage, then the other one tends to be below average, then the correlation will be negative.

[illustrate with plots]
 

***

So what determines the portfolio variance. From the formula, we thus see that the portfolio variance will tend to be higher when the weight on the relatively more risky asset is higher and when the correlation between the two assets is higher.

***

As a conclusion, optimal portfolio allocation requires to determine the weights for which the portfolio expected return and variance are optimized. This will require three important types of input in the analysis:
* expected returns
* the variances of the returns
* and the correlation between the returns.

***

In the next exercises will consider estimators for these three inputs.

# Video 2: The general case using matrix notation


In the general case, we have N assets and N can vary from 2 to over a thousand. We denote then the portfolio weights as a column vector with each element being the weights of the corresponding asset. The portfolio is fully invested such that the sum of the portfolio weights equal to one. 

***

We further stack the returns of each asset in a column-vector $R$. This return vector is now a vector of random variables, and thus called a random vector. Its expected value mu is the vector of expected returns of each of the assets. 

***

Because it is a vector of returns, its variance is not one number, but a table of N rows and N colums. This table is called the covariance matrix. The elements on the diagonal are the variances of each of the returns.

***

Outside of the diagonal are the covariances, which can be rewritten as the products of the standard deviations and the correlations. Since the element in row i, column j is identical to the element in row j, column i, the covariance matrix is symmetric. 

***

We thus have the following matrices: a column-vector of portfolio weights, a column-vector of expected returns and a covariance matrix. 

In order to relate those multivariate objects to the portfolio return, we use the following important result.

Since the portfolio return is the weighted average of the component returns, this is equivalent, to defining the portfolio return as the inner product of the portfolio vector and the vector of returns. 

***

It then follows that the expected return is the inner product of the weights and the vector of expected returns. Working this out, it gives us that the expected portfolio return is the weighted average of the expected returns on the different assets.

***

The portfolio variance is the quadratic function of the weights in terms of the variance covariance matrix. If we work this out, we obtain that the portfolio variance is the sum of the individual component variances multiplied by their squared weights and the different covariances multiplied with their weights.

***

In the exercises we will see how to estimate the vector of expected return and the covariance matrix, as well as examples of matrix multiplication in R to obtain estimates of the portfolio expected return and variance. 

# Video 3: The general case using matrix notation

We have seen that the portfolio volatility is a non-linear function of the assets' volatilities and correlations. 

***

We also saw that portfolio volatility has the property of subadditivity, meaning that the portfolio volatility is less than the weighted average of the component volatilities. 

Note that the function is also homogeneous of order one, meaning that if we multiply the portfolio weights with a positive constant, then also the portfolio volatility is multiplied with this constant. 


***

An important remaining question is how much risk each of the assets caused in the portfolio. This is the question answered by the risk budgeting analysis.

***

It uses the property that the portfolio volatility equals the sum of the weights multiplied with the partial derivative of the portfolio volatility with respect to that weight. Such a term is called the component risk contribution. 

***

If we work out the math, then we see that this risk contribution depend on the covariance matrix:

***

When expressed in percentage of the total portfolio volatility, we have the percentage risk contribution of the asset. Of course, those percentage risk contribution add up to 1. 

***

Let's put the theory in practice and compute the risk budget in the case of our asset allocation problem.

 