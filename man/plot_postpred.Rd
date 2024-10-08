% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diagnostic_plots.R
\name{plot_postpred}
\alias{plot_postpred}
\title{Diagnostic plots from posterior predictive distribution}
\usage{
plot_postpred(
  ypp,
  y,
  p = NULL,
  x = NULL,
  whichplots = c(1, 2, 4),
  plot_data = TRUE,
  plot_residuals = TRUE,
  plot_sd = TRUE,
  pch = 1,
  pointcol = 1,
  lines = FALSE,
  ...
)
}
\arguments{
\item{ypp}{Either a matrix or \code{data.frame} of posterior samples, or an
output object returned from \code{jagsUI} and a supplied parameter name}

\item{y}{The associated data vector}

\item{p}{A character name, if a \code{jagsUI} object is passed to \code{ypp}}

\item{x}{The time measurements associated with time series \code{y}.  If the default
\code{NULL} is accepted, associated plots will be suppressed.}

\item{whichplots}{A vector of which sets of plots to produce (that is, with
respect to which variables on the x-axis).  See above for details.  Defaults
to \code{c(1, 2, 4)}.}

\item{plot_data}{Whether to produce plots associated with the data (\verb{y=})
time series and untransformed posterior predictive distribution.
Defaults to \code{TRUE}.}

\item{plot_residuals}{Whether to produce plots associated with the residual
time series and posterior predictive residuals.
Defaults to \code{TRUE}.}

\item{plot_sd}{Whether to produce plots of the moving-window standard deviation
of the residuals.
Defaults to \code{TRUE}.}

\item{pch}{Plotting character for points, which will accept a vector input.
See \link[graphics]{points}.  Defaults to \code{1}.}

\item{pointcol}{Plotting color for points.  Defaults to \code{1}.}

\item{lines}{Whether to add a line linking data time series points.
Defaults to \code{FALSE}.}

\item{...}{Additional arguments to \link{envelope}}
}
\value{
\code{NULL}
}
\description{
This is a wrapper function that produces a sequence of plots
illustrating the posterior predictive distribution.  Optional plots are:
\itemize{
\item An \link{envelope} plot of the posterior predictive distribution as a time series,
overlayed with the data values (if \code{plot_data=TRUE} is used)
\item The centered posterior predictive distributions, as plotted by \link{ts_postpred},
and overlayed with the data residuals (if \code{plot_residuals=TRUE} is used)
\item The approximate residual standard deviation, calculated from a moving
window of 10 data points in sequence. (if \code{plot_sd=TRUE} is used)
}

These three plots are repeated, for a sequence of different variables
expressed on the x-axis, potentially highlighting different features of the
dataset or model structure:
\itemize{
\item The data sequence (if \verb{whichplots=} contains \code{1})
\item The \verb{x=} variable supplied (if \verb{whichplots=} contains \code{2})
\item The \verb{y=} variable supplied (if \verb{whichplots=} contains \code{3})
\item The fitted values, as estimated by the posterior predictive median
(if \verb{whichplots=} contains \code{4})
}

While not an omnibus posterior predictive check, this plot can be useful
for detecting an overparameterized model, or else improper specification
of observation error.

It should be noted that this function will only produce meaningful results
with a vector of data, as opposed to a single value.

The posterior predictive distribution can be specified in two possible ways:
either a single output object from \code{jagsUI} with an associated parameter
name, or as a matrix or \code{data.frame} of posterior samples.
}
\note{
This function assumes the existence of a matrix of posterior predictive
samples corresponding to a data vector, the construction of which must be
left to the user.  This can be accomplished within JAGS, or using appropriate
simulation from the posterior samples.
}
\examples{
# first, a quick look at the example data...
str(SS_data)
str(SS_out$sims.list$ypp)

# recommended usage
parmfrow <- par("mfrow") # storing graphics state
par(mfcol = c(3,3))  # a recommended setting to organize plots

plot_postpred(ypp=SS_out, p="ypp", y=SS_data$y, x=SS_data$x)

par(mfrow = parmfrow) # resetting graphics state
}
\seealso{
\link{qq_postpred}, \link{ts_postpred}, \link{check_Rhat}, \link{check_neff}, \link{traceworstRhat}, \link{plotRhats}
}
\author{
Matt Tyers
}
