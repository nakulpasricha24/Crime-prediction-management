statecrime <- function(indiacrime, row, state,crime) {
  year <- c(2001:2012)
  atitle <- paste(state," - ", crime)
  thecrime <- as.numeric(indiacrime[row,3:14])
  ymin <- min(thecrime)
  ymax <- max(thecrime)
  print(ymin)
  print(ymax)
  if(ymin > 8000) {
    interval <- 2000
    ymin <- min(thecrime)
    ymax <- max(thecrime)
  }
  else {
    interval <- 100
  }
  if(!file.exists(state)) {
    dir.create(state)
  }
  setwd(state)
  crimeplot <- paste(crime,".jpg")
  jpeg(crimeplot)
  plot(year,thecrime ,pch= 15, col="red", xlab = "Year", ylab= crime, main = atitle,
       ,xlim=c(2001,2018),ylim=c(ymin,ymax), axes=FALSE)
  axis(side=1, at=c(2000:2018))
  axis(side=2, at=seq(ymin, ymax, by=interval))
  box()
  lmfit <-lm(thecrime~year)
  abline(lmfit)
  nyears <-c(2013:2018)
  nthecrime <- rep(0,length(nyears))
  for (i in seq_along(nyears)) {
    nthecrime[i] <- lmfit$coefficients[2] * nyears[i] + lmfit$coefficients[1]
    summary(nthecrime[i])
  }
  alegend <- paste(
    "Plotted ",crime, " in ", state)
  points(nyears,nthecrime,pch= 17, col="blue")
  legend( x="topleft",
          legend=c(alegend),
          col=c("red"), bty="n" , lwd=1, lty=c(2),
          pch=c(15) )

  dev.off()
  setwd("..")

  nthecrime <- round(nthecrime,2)
  nthecrime <- c(state, nthecrime, "\n")
  print(nthecrime)
  filename <- paste(crime,".csv")

  setwd("./output")
  cat(nthecrime, file=filename, sep=",",append=TRUE)

  setwd("..")

}

