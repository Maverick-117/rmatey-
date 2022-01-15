#' Benchmarking the Halsey package.
#' 
#' @description GitHub Repo URL: https://github.com/Maverick-117/rmatey-

require(bench)
require(devtools)
require(ggplot2)
require(tidyr)
require(ggbeeswarm)
require(ggridges)
load_all('C:/Users/jhvo9/Documents/STATS 230/rmatey-/rmatey-/halsey')

#' Setup with big matrix indices to make the difference more obvious.

itrn <- 1000
nr <- 100

A <- matrix(runif(nr^2,min=-1,max=1),nrow=nr)
B <- matrix(runif(nr^2,min=-1,max=1),nrow=nr)
x <- runif(nr,min=-1,max=1)


#' Run benchmarks on the function mult2mv().
outp <- bench::mark(halsey::mult2mv(A,B,x,TRUE),
                     halsey::mult2mv(A,B,x,FALSE)
                     ,iterations=itrn)

#' Plot the output
pltp <- autoplot(outp)
pltp


