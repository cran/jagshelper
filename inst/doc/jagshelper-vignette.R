## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=7,
  fig.height=7
)

## ----setup--------------------------------------------------------------------
library(jagshelper)

## -----------------------------------------------------------------------------
library(jagshelper)
skeleton("EXAMPLE")

## -----------------------------------------------------------------------------
nparam(asdf_jags_out)  # how many parameters in total
nbyname(asdf_jags_out)  # how many parameters (or dimensions) per parameter name
tracedens_jags(asdf_jags_out, parmfrow=c(3,3))  # trace plots for all parameters
check_Rhat(asdf_jags_out)  # proportion of Rhats below a threshold of 1.1
asdf_jags_out$Rhat  #  Rhat values

## -----------------------------------------------------------------------------
nparam(SS_out)  # how many parameters in total
nbyname(SS_out)  # how many parameters (or dimensions) per parameter name
traceworstRhat(SS_out, parmfrow=c(3,2))  # trace plots for least-converged nodes
check_Rhat(SS_out)  # proportion of Rhats below a threshold of 1.1

## ----fig.width=6,fig.height=5-------------------------------------------------
plotRhats(SS_out)  # plotting Rhat values

## ----fig.width=7, fig.height=4------------------------------------------------
old_parmfrow <- par("mfrow")   # storing previous graphics state
par(mfrow=c(1, 2))
qq_postpred(ypp=SS_out, p="ypp", y=SS_data$y)
ts_postpred(ypp=SS_out, p="ypp", y=SS_data$y)
par(mfrow=old_parmfrow)        # restoring previous graphics state

## ----fig.width=6--------------------------------------------------------------
pairstrace_jags(asdf_jags_out, p=c("a","sig_a"), points=TRUE, parmfrow=c(3,2))

## ----fig.width=7, fig.height=6------------------------------------------------
plotcor_jags(SS_out, p=c("trend","rate","sig"))

## -----------------------------------------------------------------------------
out_df <- jags_df(asdf_jags_out)
str(out_df)

## ----fig.width=5,fig.height=8-------------------------------------------------
old_parmfrow <- par("mfrow")  # storing old graphics state
par(mfrow=c(3,1))
caterpillar(asdf_jags_out, "a")
envelope(SS_out, "trend", x=SS_data$x)
plotdens(asdf_jags_out, "a")
par(mfrow=old_parmfrow)  # resetting graphics state

## ----fig.width=5,fig.height=8-------------------------------------------------
old_parmfrow <- par("mfrow")  # storing old graphics state
par(mfrow=c(2,1))
comparecat(x=list(asdf_jags_out, asdf_jags_out, asdf_jags_out),
           p=c("a","b","sig"))
comparedens(x1=asdf_jags_out, x2=asdf_jags_out, p=c("a","b","sig"))
par(mfrow=old_parmfrow)  # resetting graphics state

## -----------------------------------------------------------------------------
par(mfrow=c(2,2))

## usage with list of input data.frames
overlayenvelope(df=list(SS_out$sims.list$cycle_s[,,1],
                            SS_out$sims.list$cycle_s[,,2]))

## usage with a 3-d input array
overlayenvelope(df=SS_out$sims.list$cycle_s)

## usage with a jagsUI output object and parameter name (2-d parameter)
overlayenvelope(df=SS_out, p="cycle_s")

## usage with a single jagsUI output object and multiple parameters
overlayenvelope(df=SS_out, p=c("trend","rate"))

## -----------------------------------------------------------------------------
## Usage with single vectors (or data.frames or 2d matrices) 
xx <- SS_out$sims.list$trend[,41]
yy <- SS_out$sims.list$cycle[,41]

## Showing possible geometries
par(mfrow = c(2, 2))
plot(xx, yy, col=adjustcolor(1, alpha.f=.1), pch=16, main="Cross Geometry")
crossplot(xx, yy, add=TRUE, col=1)
plot(xx, yy, col=adjustcolor(1, alpha.f=.1), pch=16, main="X Geometry")
crossplot(xx, yy, add=TRUE, col=1,
          drawcross=FALSE, drawx=TRUE)
plot(xx, yy, col=adjustcolor(1, alpha.f=.1), pch=16, main="Blob Geometry")
crossplot(xx, yy, add=TRUE, col=1,
          drawcross=FALSE, drawblob=TRUE)
plot(xx, yy, col=adjustcolor(1, alpha.f=.1), pch=16, main="Blob Outlines")
crossplot(xx, yy, add=TRUE, col=1,
          drawcross=FALSE, drawblob=TRUE, outline=TRUE)

## Usage with jagsUI object and parameter names, plus addl functionality
par(mfrow = c(1, 1))
crossplot(SS_out, p=c("trend","cycle"),
          labels=SS_data$x, labelpos=1, link=TRUE, drawblob=TRUE,
          col="random")

## ----eval=FALSE---------------------------------------------------------------
#  ...
#  sig ~ dunif(0, 10)   # this is the parameter that is used elsewhere in the model
#  sig_prior ~ dunif(0, 10)  # this is only used to give samples of the prior
#  ...

## -----------------------------------------------------------------------------
comparepriors(asdf_prior_jags_out, parmfrow=c(2,3))

