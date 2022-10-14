## ---- include = FALSE---------------------------------------------------------
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

## ---- fig.width=6-------------------------------------------------------------
pairstrace_jags(asdf_jags_out, p=c("a","sig_a"), points=TRUE, parmfrow=c(3,2))

## -----------------------------------------------------------------------------
out_df <- jags_df(asdf_jags_out)
str(out_df)

## ----fig.width=5,fig.height=8-------------------------------------------------
old_parmfrow <- par("mfrow")  # storing old graphics state
par(mfrow=c(2,1))
caterpillar(asdf_jags_out, "a")
envelope(SS_out, "trend", x=SS_data$x)
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

