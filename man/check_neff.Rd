% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize.R
\name{check_neff}
\alias{check_neff}
\title{Quick summary of n.eff values by parameter name}
\usage{
check_neff(x, thresh = 500)
}
\arguments{
\item{x}{Output object from \code{jagsUI::jags()}}

\item{thresh}{Threshold value (defaults to 500)}
}
\value{
Numeric (named) giving the proportion of \code{n.eff} values above the given threshold.
}
\description{
Returns the mean number of \code{n.eff} values (by each parameter) that are greater than a specified threshold criterion.

\code{n.eff} is calculated within 'JAGS', and may be interpreted as a crude measure of
effective sample size for a given parameter node.
}
\examples{
check_neff(SS_out)
}
\seealso{
\link{check_Rhat}, \link{traceworstRhat}, \link{plotRhats}, \link{qq_postpred}, \link{ts_postpred}
}
\author{
Matt Tyers
}
