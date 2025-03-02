%%
%% WARNING! DO NOT EDIT!
%% This file is automatically generated from set.default.arguments.R
%%
\name{control.inla}
\alias{control.inla}
\alias{inla.control.inla}
\alias{inla.set.control.inla.default}
\alias{set.control.inla.default}
\alias{control.inla.default}
\title{Control variables in control.inla}
\description{Control variables in \code{control.inla} for use in \code{inla}}
\usage{
inla.set.control.inla.default(...)
control.inla(adapt.hessian.max.trials, adapt.hessian.mode, adapt.hessian.scale, adaptive.max, adjust.weights, cmin, correct, correct.factor, correct.strategy, correct.verbose, cpo.diff, cutoff, diagonal, diff.logdens, dz, fast, force.diagonal, global.node.degree, global.node.factor, h, huge, int.design, int.strategy, interpolator, lincomb.derived.correlation.matrix, lincomb.derived.only, linear.correction, mode.known, npoints, numint.abserr, numint.maxfeval, numint.relerr, optimiser, print.joint.hyper, reordering, restart, skip.configurations, stencil, step.factor, step.len, strategy, stupid.search, stupid.search.factor, stupid.search.max.iter, tolerance, tolerance.f, tolerance.g, tolerance.step, tolerance.x, verbose)
}
\arguments{
\item{...}{Possible arguments}
\item{strategy}{  Character The strategy to use for the approximations; one of 'gaussian', 'simplified.laplace' (default), 'laplace' or 'adaptive'}
\item{int.strategy}{  Character The integration strategy to use; one of 'auto' (default), 'ccd', 'grid', 'eb' (empirical bayes), 'user' or 'user.std'}
\item{int.design}{  Matrix Matrix of user-defined integration points and weights. Each row consists theta values and the integration weight. (EXPERIMENTAL!)}
\item{interpolator}{  Character The interpolator used to compute the marginals for the hyperparameters. One of 'auto', 'nearest', 'quadratic', 'weighted.distance', 'ccd', 'ccdintegrate', 'gridsum', 'gaussian'. Default is 'auto'.}
\item{fast}{  Logical If TRUE, then replace conditional modes in the Laplace approximation with conditional expectation (default TRUE)}
\item{linear.correction}{  Logical Default TRUE for the 'strategy = laplace' option.}
\item{h}{  Numerical The step-length for the gradient calculations for the hyperparameters. Default 0.01.}
\item{dz}{  Numerical The step-length in the standarised scale for the integration of the hyperparameters. Default 0.75.}
\item{diff.logdens}{  Numerical The difference of the log.density for the hyperpameters to stop numerical integration using int.strategy='grid'. Default 6.}
\item{print.joint.hyper}{  Logical If TRUE, the store also the joint distribution of the hyperparameters (without any costs). Default TRUE.}
\item{force.diagonal}{  Logical If TRUE, then force the Hessian to be diagonal. (Default \code{FALSE})}
\item{skip.configurations}{  Logical Skip configurations if the values at the main axis are to small. (Default \code{TRUE})}
\item{mode.known}{  Logical If TRUE then no optimisation is done. (Default FALSE.)}
\item{adjust.weights}{  Logical If TRUE then just more accurate integration weights. (Default TRUE.)}
\item{tolerance}{  Numerical The tolerance for the optimisation of the hyperparameters. If set, this is the default value for for 'tolerance.f^(2/3)', 'tolerance.g' and 'tolerance.x'; see below.}
\item{tolerance.f}{  Numerical The tolerance for the absolute change in the log posterior in the optimisation of the hyperparameters.}
\item{tolerance.g}{  Numerical The tolerance for the absolute change in the gradient of the log posterior in the optimisation of the hyperparameters.}
\item{tolerance.x}{  Numerical The tolerance for the change in the hyperparameters (root-mean-square) in the optimisation of the hyperparameters.}
\item{tolerance.step}{  Numerical The tolerance for the change in root-mean_squre in the inner Newton-like optimisation of the latent field.}
\item{restart}{  Numerical To improve the optimisation, the optimiser is restarted at the found optimum 'restart' number of times.}
\item{optimiser}{  Character The optimiser to use; one of 'gsl' or 'default'.}
\item{verbose}{  Logical Run in verbose mode? (Default FALSE)}
\item{reordering}{  Character Type of reordering to use. (EXPERT OPTION; one of "AUTO", "DEFAULT", "IDENTITY", "REVERSEIDENTITY", "BAND", "METIS", "GENMMD", "AMD", "MD", "MMD", "AMDBAR", "AMDC", "AMDBARC", or the output from \code{inla.qreordering}. Default is 'auto'.)}
\item{cpo.diff}{  Numerical Threshold to define when the cpo-calculations are inaccurate. (EXPERT OPTION.)}
\item{npoints}{  Numerical Number of points to use in the 'stratey=laplace' approximation (default 9)}
\item{cutoff}{  Numerical The cutoff used in the 'stratey=laplace' approximation. (Smaller value is more accurate and more slow.) (default 1e-4)}
\item{adapt.hessian.mode}{  Logical Should optimisation be continued if the Hessian estimate is void? (Default TRUE)}
\item{adapt.hessian.max.trials}{  Numerical Number of steps in the adaptive Hessian optimisation}
\item{adapt.hessian.scale}{  Numerical The scaling of the 'h' after each trial.}
\item{adaptive.max}{  Selecting \code{strategy="adaptive"} will chose the default strategy for all fixed effects and model components with length less or equal to \code{adaptive.max}, for others, the gaussian strategy will be applied.}
\item{huge}{  Logical If TRUE then try to do some of the internal parallisations differently. Hopefully this will be of benefite for 'HUGE' models. (Default FALSE.) [THIS OPTION IS OBSOLETE AND NOT USED!]}
\item{step.len}{  Numerical The step-length used to compute numerical derivaties of the log-likelihood}
\item{stencil}{  Numerical Number of points in the stencil used to compute the numerical derivaties of the log-likelihood (3, 5, 7 or 9). (default 5)}
\item{lincomb.derived.only}{  Logical If TRUE the only compute the marginals for the derived linear combinations and if FALSE, the and also the linear combinations to the graph (Default TRUE)}
\item{lincomb.derived.correlation.matrix}{  Logical If TRUE compute also the correlations for the derived linear combinations, if FALSE do not (Default FALSE)}
\item{diagonal}{  Numerical Expert use only! Add a this value on the diagonal of the joint precision matrix. (default 0.0)}
\item{numint.maxfeval}{  Numerical Maximum number of function evaluations in the the numerical integration for the hyperparameters. (Default 100000.)}
\item{numint.relerr}{  Numerical Relative error requirement in the the numerical integration for the hyperparameters. (Default 1e-5)}
\item{numint.abserr}{  Numerical Absolute error requirement in the the numerical integration for the hyperparameters. (Default 1e-6)}
\item{cmin}{  Numerical The minimum value for the negative Hessian from the likelihood. Increasing this value will stabalise the optimisation but can introduce bias in some estimates unless \code{-Inf} is used. (Default -Inf)}
\item{step.factor}{  Numerical The step factor in the Newton-Raphson algorithm saying how large step to take (Default 1.0)}
\item{global.node.factor}{  Numerical The factor which defines the degree required (how many neighbors), as a fraction of n-1, that is required to be classified as a global node and numbered last (whatever the reordering routine says). Here, n, is the size of the graph. (Disabled if larger than 1.) (default 2.0)}
\item{global.node.degree}{  Numerical The degree required (number of neighbors) to be classified as a global node and numbered last (whatever the reordering routine says). (default \code{.Machine$integer.max})}
\item{stupid.search}{  Logical Enable or disable the stupid-search-algorithm, if the Hessian calculations reveals that the mode is not found. (Default \code{TRUE}.)}
\item{stupid.search.max.iter}{  Numerical Maximum number of iterations allowed for the stupid-search-algorithm. (default 1000)}
\item{stupid.search.factor}{  Numerical Factor (>=1) to increase the step-length with after each new interation. (default 1.05)}
\item{correct}{  Logical Add correction for the Laplace approximation. (default \code{FALSE})}
\item{correct.factor}{  Numerical Factor used in adjusting the correction factor (default=10) if correct=TRUE}
\item{correct.strategy}{  Character The strategy used to compute the correction; one of 'simplified.laplace' (default) or 'laplace'}
\item{correct.verbose}{  Logical Be verbose when computing the correction? (default \code{FALSE})}
}
\value{
 
The function \code{control.inla} is used to TAB-complete arguments and returns a list of given arguments.
The function \code{inla.set.control.inla.default} returns a list with all the default values of all parameters within this control statement.
}
\seealso{
\code{\link{control.update}}, \code{\link{control.lincomb}}, \code{\link{control.group}}, \code{\link{control.mix}}, \code{\link{control.link}}, \code{\link{control.expert}}, \code{\link{control.compute}}, \code{\link{control.gev2.default}}, \code{\link{control.family}}, \code{\link{control.fixed}}, \code{\link{control.inla}}, \code{\link{control.predictor}}, \code{\link{control.results}}, \code{\link{control.mode}}, \code{\link{control.hazard}}, 
\code{\link{inla}}
}
