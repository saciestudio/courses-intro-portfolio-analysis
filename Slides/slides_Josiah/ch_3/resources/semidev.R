vx = seq(-1,1,0.001)

par(mfrow=c(1,1),mar=c(2,2,2,2))
plot(vx,dnorm(vx,mean=0,sd=0.15),main=" ",xlab="",ylab="",cex=1.4,
     ylim=c(0,3),type="l",col="black",lwd=2)
lines(vx,dnorm(vx,mean=0,sd=0.3),col="red",lwd=2,lty=3)
legend("topleft",legend=c("Normal with  15% volatility", "Normal with  30% volatility"),col=c("black","red"), 
       lty=c(1,3),lwd=2,bty="n",cex=1.4 )
text( x= -0.7, y=1 , labels = c("The higher the volatility, \n the higher the probability \n of extreme returns"),col="red" ,cex=1.4)
text( x= 0.7, y=1 , labels = c("The higher the volatility, \n the higher the probablity \n of extreme returns"),col="red" ,cex=1.4)

#####################################################################"
# zooming


library(tseries)# Its function get.hist.quote allows to download prices from Yahoo!Finance
library(xts) # Its function plot.zoo make simple, but attractive, time series plots
# download adjusted close prices (that is corrected for dividend payments and stock splits)
# dates have the format "YYYY-MM-DD"
sp500 <- get.hist.quote(instrument="^GSPC",start=as.Date("1970-12-31"),end=Sys.Date(),quote="AdjClose",quiet=T,compression="m")
library(PerformanceAnalytics)
sp500_returns <-  xts(Return.calculate(sp500))[-1]
names(sp500_returns) <- "sp500"

g = sp500_returns
m<-mean(g)
std<-sqrt(var(g))
hist(g, density=20, breaks=20, prob=TRUE, 
     xlab="",  
     main="")
curve(dnorm(x, mean=m, sd=std), 
      col="darkblue", lwd=2, add=TRUE, yaxt="n")

# zoom

hist(g, density=20, breaks=20, prob=TRUE, 
     xlab="",  
     main="",xlim=c(-0.22,-0.075),ylim=c(0,2))
curve(dnorm(x, mean=m, sd=std), 
      col="darkblue", lwd=2, add=TRUE, yaxt="n")
