# Video 1: The power of portfolio diversification

Hi, I'm Kris. I'm a Professor of finance at the Solvay Business School in Brussels and an independent consultant for portfolio management companies. I will be your instructor for this course on analyzing portfolio returns in R. Let's get started by a simple example of the power of portfolio diversification. 

***

Here you see the value evolution of a stock price index, a real estate index and a commodities index. They all show variability due to the risky nature of the asset returns and the performance is very different. If we had perfect foresight, the best investment would be to invest all your money in ... . In reality, future prices are uncertain. 

(Slides should show the price evolution of a winning, losing and at par position.)

***

In order to mitigate the individual risks of each of the assets, it may be wiser to invest in all three assets at the same time. It we invest the same amount in each of them (e.g. 1000 UUSD), then we have an equally weighted portfolio with weights one third. 

(Slide should show the formula: W_i = 1000/(1000+1000+1000) = 1/3)

***

The resulting price evolution for the equally weighted portfolio is shown with a purple line. Note that the line is more smooth and the performance is the average of the two extremes. This shows the limits and the gains of diversification. In order to avoid extreme losses, it is definitely not a good idea to put all your eggs in the same basket. At the same time, you may lose upside potential by spreading too much the portfolio weights. The key questions are thus: (i) Which investments to choose and (ii) How to monitor the portfolio performance to make sure it does what you expect it to do. In this course you will learns the tools to answer these challenging questions in R. 

***


***

In this course, we'll break data cleaning down into a three step process: exploring your raw data, tidying your data, and preparing your data for analysis. Each of the first three chapters of this course will cover one of these steps in depth, then the fourth chapter will require you to use everything you've learned to take the weather data from raw to ready for analysis. 

***

Let's jump right in!

***

# Video 2: Portfolio returns are the weighted average of the individual returns

The portfolio weights thus express the percentage value invested in each portfolio component. The next step is to evaluate the performance of the investment for your choice of weights. This requires to compute the portfolio return. The portfolio return is the weighted average of the component returns. Understanding portfolio returns thus starts with understanding asset returns. 

***

There are two types of return definition in finance: log-returns and simple returns. For portfolio analysis, only the simple returns are relevant. 

***

The value of investment changes. The investment return is the change in investment value, relatively to the initial investment. Suppose that, in our example of 1000 USD invested in Apple and 9000 USD in MSFT, the Apple investment rises to 1100 USD and the value of the MSFT position does not change, then the return in Apple is (1100-1000)/1000 = 10%, versus 0% for Apple. Clearly, the weight allocation will be influential for the portfolio performance. In general, the portfolio return equals the average of the returns of the component positions, each of them multiplied with their portfolio weight. On the slide I show a proof of this for two assets. Extends to the general case.

***

Okay, so we're starting to get a feel for things, but let's dig deeper. The `str()` (for "structure") function is one of the most versatile and useful functions in the R language because it can be called on any object and will normally provide a useful and compact summary of its internal structure. When passed a data frame, as in this case, `str()` tells us how many rows and columns we have. Actually, the function refers to rows as observations and columns as variables, which, strictly speaking, is true in a tidy dataset, but not always the case as you'll see in the next chapter. In addition, you see the name of each column, followed by its data type and a preview of the data contained in it. The `lunch` dataset happens to be entirely integers and numerics. We'll have a closer look at these datatypes in chapter 3.

***

The dplyr package offers a slightly different flavor of `str()` called `glimpse()`, which offers the same information, but attempts to preview as much of each column as will fit neatly on your screen. So here, we first load dplyr with the `library()` command, then call `glimpse()` with a single argument, `lunch`.

***

Another extremely helpful function is `summary()`, which, when applied to a data frame, provides a useful summary of each column. Since the `lunch` data are entirely integers and numerics, we see a summary of the distribution of each column including the minimum and maximum, the mean, and the 25th, 50th, and 75th percent quartiles (also referred to as the first quartile, median, and third quartile, respectively.) As you'll soon see, when faced with character or factor variables, `summary()` will produce different summaries.

***

To review, you've seen how we can use the `class()` function to see the class of a dataset, the `dim()` function to view its dimensions, `names()` to see the column names, `str()` to view its structure, `glimpse()` to do the same in a slightly enhanced format, and `summary()` to see a helpful summary of each column.

***

Time to practice!

***

# Video 3: Exploring raw data (part 2)

Okay, so we've seen some useful summaries of our data, but there's no substitute for just looking at it. The `head()` function shows us the first 6 rows by default. If you add one additional argument, `n`, you can control how many rows to display. For example, `head(lunch, n = 15)` will display the first 15 rows of the data.

***

We can also view the bottom of `lunch` with the `tail()` function, which displays the last 6 rows by default, but that behavior can be altered in the same way with the `n` argument.

***

Viewing the top and bottom of your data only gets you so far. Sometimes the easiest way to identify issues with the data are to plot them. Here, we use `hist()` to plot a histogram of the percent free and reduced lunch column, which quickly gives us a sense of the distribution of this variable. It looks like the value of this variable falls between 50 and 60 for 20 out of the 46 years contained in the `lunch` dataset.

***

Finally, we can produce a scatter plot with the `plot()` function to look at the relationship between two variables. In this case, we clearly see that the percent of lunches that are either free or reduced price has been steadily rising over the years, going from roughly 15 to 70 percent between 1969 and 2014.

***

To review, `head()` and `tail()` can be used to view the top and bottom of your data, respectively. Of course, you can also just `print()` your data to the console, which may be okay when working with small datasets like `lunch`, but is definitely not recommended when working with larger datasets.

***

Lastly, `hist()` will show you a histogram of a single variable and `plot()` can be used to produce a scatter plot showing the relationship between two variables.

***

Time to practice!