
h = c(6,10,8,20,42,80,120,160,240,255,199,115,60,27,22,14,4,2,3,3,1,1)
args=as.character(seq(from=-0.08, to=0.13,by=0.01))
cols <- ifelse(h == c(6,10,8,20), "red", "#51A7F9")

barplot(h, names.arg=args, ylab = "Frequency", xlab = "",
        main = "NASDAQ Daily Returns",
        col = cols)


h2 <- c(2,3,7,3,3,8,4,14,22,27,60,115,199,215,230,160,120,80,42,20,8,10)

barplot(h2, names.arg=args, ylab = "Frequency", xlab = "",
        main = "NASDAQ Daily Returns",
        col = cols)