# jagshelper 

### Extracting and Visualizing Output from 'jagsUI'

Tools are provided to streamline Bayesian analyses in 'JAGS' using 
the 'jagsUI' package.  Included are functions for extracting output in 
simpler format, functions for streamlining assessment of convergence, and 
functions for producing summary plots of output.  Also included is a 
function that provides a simple template for running 'JAGS' from 'R'.

### Commonly-used functions: Model construction and output summary

* `skeleton()` prints an example 'JAGS' model and associated 'jagsUI' code to 
the console, along with code to simulate a corresponding dataset.  This is 
intended to serve as a template that can be altered as needed by the user.

* `nparam()` and `nbyname()` give the total number of parameter nodes and the 
number (or array dimensions) per parameter name, respectively.  It can be 
useful to know how many parameter nodes have been saved before performing further
model diagnostics.

### Commonly-used functions: Assessing model convergence and appropriateness

* `check_Rhat()` and `check_neff()` give the proportion of parameter nodes to 
meet a given threshold of `Rhat` (Gelman-Rubin convergence diagnostic) or `n.eff` 
(effective sample size), respectively.

* `plotRhats()` plots all `Rhat` values from a model output (or alternately `n.eff`),
which can serve as a quick visualization to assess whether adequate convergence 
has been achieved.  

* `tracedens_jags()` produces trace plots and overlayed by-chain kernel densities
of all parameter nodes, or a subset given by the user.  

Note that functions are 
also provided to give trace plots or by-chain kernel densities by themselves, with
inputs of 'jagsUI' output objects, `data.frame`s, or single vectors.

* `traceworstRhat()` is a wrapper of `tracedens_jags()` that produces trace plots
of the parameter nodes with the worst (largest) associated values of `Rhat`, or 
alternately, the smallest values of `n.eff`.  This can be useful if a model contains
vectors or arrays of many parameter nodes.

* `pairstrace_jags()` gives methods for plotting two-dimensional trace plots, 
scatter plots, or contour plots, in which each possible pairing of parameter nodes are
plotted with respect to one another.  In addition to convergence, this may provide
a graphical check for correlation between parameter nodes, or problematic posterior 
surface shapes.

* `cor_jags()` and `plotcor_jags()` respectively return and plot correlation matrices 
for all or a subset of parameter nodes.

* `qq_postpred()` produces a quantile-quantile plot from the posterior predictive
distributions associated with a vector of data.  This can be visually interpreted
in a similar manner to a traditional Q-Q plot, with an appropriately-specified
model producing a plot that falls along the x=y line.  While not intended as
an omnibus posterior predictive check, this plot might be useful in detecting 
overparameterization, poor convergence, or a mis-specified error model.  It should
be noted that this function depends on the existence of a matrix of posterior 
predictive samples, which is up to the user.  This can be specified within JAGS,
or via appropriate simulation from the posterior samples.

* `ts_postpred()` produces an envelope plot of the centered posterior predictive
distribution associated with a vector of data (most likely a time series), which
is defined as the difference between the posterior predictive distribution and 
posterior predictive medians.  This may be used to explore possible temporal
features not visible using `qq_postpred()`.

* `plot_postpred()` is a wrapper that combines several calls of `envelope()`
and `ts_postpred()` for a sequence of different variables expressed on the x-axis, 
potentially highlighting different features of the dataset or model structure. 

* `kfold()` provides automated k-fold or leave-one-out cross validation for a 
specified component of a JAGS data object, for a specified JAGS model.  The intended 
utility of this function is comparison of predictive power between a set of candidate models, rather than
the fit or appropriateness of a single model.

### Commonly-used functions: Extracting simplified model output

* `jags_df()` extracts the MCMC iterations from a 'jagsUI' output object as a `data.frame`,
which may be preferable to some users.

* `pull_post()` extracts a subset of columns of a posterior formatted as a `data.frame`.

### Commonly-used functions: Plotting model output

* `envelope()` overlays a set of credible interval envelopes (default values are 50%
and 95%) and a median line, for a sequence of parameter nodes.  This 
function is intended for plotting the posterior densities of a vector of parameter
nodes in which order does matter, such as in a time series.

* `overlayenvelope()` is a wrapper for `envelope()` allowing for multiple envelope
plots to be overlayed.

* `caterpillar()` overlays a set of credible interval bars (default values are 50%
and 95%) and median markings, for a set of parameter nodes side-by-side.  This 
function is intended for plotting the posterior densities of a vector of parameter
nodes in which order may not matter, such as a set of random effects.

* `crossplot()` provides methods for bivariate plotting of a single pair of parameters
or paired vectors of parameter nodes.  Options are given to add credible intervals
in the x- and y- directions, credible intervals along the principal component 
axes, or approximate smoothed credible polygons.

* `comparecat()` produces an interleaved caterpillar plot for multiple 'jagsUI' 
output objects or `data.frame`s, in which parameter nodes with the same name across
output objects are plotted next to one another.  The intent of this function is to
allow comparison among multiple candidate models.

* `comparedens()` is similar in use to `comparecat()`, but instead plots left- 
and right-facing vertically-oriented kernel densities for TWO model output objects,
with parameter nodes with the same names plotted facing one another.

* `comparepriors()` is a wrapper of `comparedens()`, but compares all distributions
of parameters with names ending in `"_prior"` with the corresponding posterior
distributions.

* `plotdens()` produces a kernel density plot of a single parameter node, or 
overlays kernel densities for multiple parameter nodes.


### Installation

The development version is currently available on Github, and can be installed in R with the following code:

`install.packages("devtools",dependencies=T)`

`devtools::install_github("mbtyers/jagshelper")`
