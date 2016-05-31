
h = c(6,10,8,20,42,80,120,160,240,255,199,115,60,27,22,14,4,2,3,3,1,1)
args=as.character(seq(from=-0.08, to=0.13,by=0.01))
cols <- ifelse(h == c(6,10,8,20), "red", "#51A7F9")

barplot(h, names.arg=args, ylab = "Frequency", xlab = "Percent Return",
        main = "NASDAQ Daily Returns",
        col = cols)

