% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jagshelper1.R
\name{skeleton}
\alias{skeleton}
\title{Skeleton}
\usage{
skeleton(NAME = "NAME")
}
\arguments{
\item{NAME}{Name to append to JAGS model object, etc.}
}
\value{
\code{NULL}
}
\description{
Prints an example 'JAGS' model and associated 'jagsUI' code to
the console, along with code to simulate a corresponding dataset.  This is
intended to serve as a template that can be altered as needed by the user.
}
\note{
The printed code will use the \code{cat()} function to write the model code to an
external text file.  It may be desirable to use a call to \verb{\link{tempfile}()}
instead, to eliminate creation of unneeded files.
}
\examples{
skeleton("asdf")
}
\author{
Matt Tyers
}
