# Video 1: The inputs in case of two assets [word count: 659]


Analyzing portfolios in R goes beyond analyzing the portfolio returns. It is also about understanding how the portfolio can be optimized such that the future portfolio return has the desired properties in terms of mean and volatility.

***

Since we are talking about the future, I need to teach you first about the difference between computing averages on past returns and taking expectations of random variables. 

In chapter 2, we took the observed returns as a given and we thus used averages of the returns to describe the past performance. 

But, when optimizing a portfolio, we need to deal with the uncertainty of what the future return will be. Since its future value is a random outcome, the portfolio return is a random variable. 

***

The transition to working with portfolio returns as random variables has also implications for how we write the mean and variance of the portfolio return. 

The mean return is no longer the average of the past returns, but it is the best possible prediction of the portfolio return. 
This best possible prediction is called the expectation of the portfolio return, or also, the expected portfolio return. When we take the expectation of a random variable, we denote this by the capital letter E.

***

A similar result holds for the portfolio variance, which is no longer the sample variance of the past portfolio returns. The variance of a random variable is instead defined as the expected squared deviation of the portfolio return with respect to its mean. 

***

Let’s now turn to our main question: what are the drivers of the portfolio mean and variance? 

I will work this out for the case of two assets in the portfolio:  asset 1 has weight w1 and asset 2 has weight w2. 

Then, the portfolio return is the weight of asset 1 times the return of asset 1, plus the weight of asset 2 times the return of asset 2. 

***

Plugging the formula of the portfolio return into the definition of the expectation of the portfolio return, and using that the expected value of a sum is the sum of the expected values, we see that the expected portfolio return is the weight of asset 1 times the expected return of asset 1 plus the weight of asset 2 times the expected return of asset 2.

***

The impact of the weights on the portfolio variance is slightly more complex because of the square. 
Working out the square of the portfolio de-meaned return, we find that the portfolio variance equals the sum of the squared weight of the assets times their individual variance plus two times the product of the weights and the expected value of the product between the demeaned return of asset 1 and the demeaned return of asset 2. 

The expectation of this product between the demeaned returns of asset 1 and asset 2 is called the covariance of those two asset returns.

***

The term covariance may be new for you, but probably you have already heard about correlations. If you know about correlations, then you also know about covariances, since the covariance of two asset returns is the product of their standard deviations and the correlation between the asset returns. 

***

The correlation measures the intensity of the relationship between the asset returns.  
If they are unrelated, then the correlation is zero. 
If there is on average a positive linear relationship between both, then the correlation will be positive. This means that, when one asset return is above average, then the return of the other asset also tends to be above average. 
In the case of a negative correlation, then it will be the case that, if one return is above average, the other one tends to be below average. 

***

To conclude, the drivers of expected portfolio returns are the expected return of the individual assets and their portfolio weights.
The drivers of the portfolio variance are the individual variances of the asset returns, their covariance and the portfolio weights.

***
Let’s do a few interactive exercises, to see what this means in practice. 
 


# Video 2: The general case using matrix notation [word count: 584 words]

We have just seen the drivers of portfolio mean and variance in the case of a portfolio with two assets. In this video I show you how those results can be extended to the general case of N assets, where N can be any number of assets. 

When working with many assets, we just have to be careful about the many variables that come into play. I will show you how the use of matrices in R will help you in keeping the data analysis well organized. 

***

The first matrix that we use is the matrix of portfolio weights.
So, we have N assets. This means that we also have N portfolio weights: w1, w2, up to wN. We will stack them into a column-matrix of dimension N times 1 and call this the matrix w.

***

The next matrix we use is the matrix of asset returns.

For each of the assets, we have a return, that we denote as R1, R2,…RN. Again these returns can be stacked into a column-matrix of dimension N times 1, that I call R.

***

For each asset return, we also have an expected return. I will denote them as mu_i. 
So mu_1 is the expected return of asset 1, mu_2 is the expected return of asset 2, and so on.   Stacking the N expected returns into the column matrix mu gives us the matrix of expected returns mu. 

***
Last, but not least, there is the covariance matrix.

For each of the assets, we have the variance of their return, which I denote by sigma square. We have N assets, and thus N variances sigma^2_i. 

For each pair of asset returns i and j, we have a covariance, which i denote by sigma_ij. 

We have thus N variances and for each pair of assets, we have a covariance. In order to handle all those variances and covariances, it is useful to put them together into the so-called covariance matrix.  
This is a square matrix with N rows and N columns. The elements on the diagonal are the variances of each of the returns. Outside of the diagonal are the covariances. For example in row 2, column 1 we have the covariance between asset return 2 and asset return 1. 

***

The aim of this video is to show you the drivers of the mean and variance of portfolio in the general case of N assets. The question to answer is thus how all these expected returns, variances and covariances affect the portfolio mean and variance. 

I show you this in the table on the slide. It shows in one column the results for the case of two asset, and in the next column how it generalizes in the case of N assets. 
 

We see that in the general case, the portfolio return is the weighted average of the returns of all N assets.

It follows that the expected portfolio return is the weighted average of the expected returns of all N assets.

Finally, we have that the variance of the portfolio return is the sum of the squared weights times the variance of all N assets, plus, for each pair of assets, the product between their weights and their covariance. 

***

There is a large number of terms in each expression. I will now show you how to avoid these summations by using matrix notation. 
Remember that we have four matrices: the column-matrix of portfolio weights w, the column-matrix of returns R, the column-matrix of expected returns mu and the covariance matrix sigma. 

I will also be using the transpose of N times 1 column-matrix of weights. This is the same vector, but instead of being a N times 1 column-matrix of weights, it is the 1 times N row-matrix of weights.  

*** 

The first result is that the weighted average return is exactly the same as the result of computing the matrix product between the transpose of the portfolio weights and the matrix of returns.

It follows that the expected portfolio return is the transpose of the weights times the matrix of expected returns.

Finally, one can show that the variance of the portfolio return equals the number you obtain by computing the product of the transpose of the weights times the covariance matrix times the weights again.

***

If this is new to you, these results may seem daunting, but you will see in the exercises that using the matrices simplifies a lot the data management when analyzing large portfolios in R.


# Video 3: The portfolio risk budget [word count: 305]

Let’s end this chapter with a who did it game, called risk budgeting. It tries to answer the question about how much of the portfolio risk is caused by each of the individual portfolio positions. 

This is not just for fun, but it is now common practice for portfolio managers to identify the sources of portfolio risk and to avoid that the portfolio risk is too concentrated in a few assets. 

***

This slide visualizes what we will be doing. It shows on the left an example of a capital allocation budget saying how much of the wealth is invested in each asset. 
On the right it shows how much of the portfolio volatility risk is caused by each of those assets. The figure on the right is called the risk budget. 

As you can see, the capital allocation and the risk allocation can be very different. The reason is that the portfolio volatility does not only depend on the weights, but also on the assets' volatilities and their correlations.

***

So, practically, how do we obtain such a risk budget? 

The first step in constructing the risk budget is to rewrite the portfolio volatility as the sum of the volatility risk contributions of the N portfolio positions. 

I show the corresponding mathematical formula on the slide, but in the exercises we will see the functions that implement this in practice.  

***

The risk contributions add up to the total portfolio volatility. 

In order to have an estimate of the percentage risk caused by each of the N portfolio positions, we will take the risk contribution of that position and divide it by the total portfolio risk. This ratio is called the percentage risk contribution. 

***

Let's now play the who did it game in the case of our asset allocation problem. Because investing in stocks is more risky than investing in bonds, you will see that the percentage risk contributions of the position in stocks is much larger than its portfolio weight, while for bonds, it is the opposite.  
 
