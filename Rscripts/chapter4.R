

stockmu = colMeans(returns.estim)
grid = seq(min(stockmu),max(stockmu),length.out=100 )  
# Compute the efficient frontier
## for each solution, we save the portfolio mean,
## portfolio standard deviation and the weights
## Initialize them as an empty vector
vpm = vpsd = mweights = c()

# N is the number of stocks
N = ncol(returns.estim)

for( mutarget in grid ){
  out = try(portfolio.optim(x = returns.estim,pm=mutarget,
                            reshigh = rep(0.1, N)),silent=TRUE)
  if(class(out)!="try-error"){
    vpm = c(vpm,out$pm)
    vpsd = c(vpsd,out$ps)
    mweights = rbind( mweights,out$pw)
  }
}

# assign the stock names to the column names of mweights
colnames(mweights) = colnames(returns)

plot(vpsd,vpm)

# minimum variance portfolio
MVweights = mweights[ vpsd==min(vpsd), ]
MVpm = vpm[vpsd==min(vpsd)]
MVpsd = vpsd[vpsd==min(vpsd)]
print(MVpm)
print(MVpsd)
print(MVweights)
print(MVweights[MVweights > 0.001])
# use a barplot to visualize the solution
# focus on the non-zero weights
barplot(MVweights[MVweights > 0.001])

# assume zero risk free rate
Rf = 0
# sharpe ratios
vSR = (vpm-Rf)/vpsd
MSRweights = mweights[ vSR==max(vSR), ]
MSRpm = vpm[vSR==max(vSR)]
MSRpsd = vpsd[vSR==max(vSR)]
print(MSRpm)
print(MSRpsd)
print(max(vSR))
# use a barplot to visualize the solution
# focus on the non-zero weights
barplot(MSRweights[MSRweights > 0.001])


plot(vpsd,vpm,main="This is not the efficient frontier",ylim=c(0,1.2*max(vpm)))
plot(vpsd[vpm>=MVpm] , vpm[vpm>= MVpm ] , main="efficient frontier",ylim=c(0,1.2*max(vpm)))


# Calculate the returns for the different portfolios
returns.minvar = Return.portfolio(R=returns.oos, weights =MVweights)
# default is EW
returns.ew = Return.portfolio(R=returns.oos )
