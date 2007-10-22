\name{opt.alt.GRW}
\alias{opt.alt.GRW}
\alias{opt.alt.URW}
\alias{opt.alt.Stasis}
\alias{opt.alt.OU}

\title{ Optimize evolutionary models (alternate parameterization) }

\description{
Functions to find maximum likelihood solutions to general random walk (\code{opt.alt.GRW}), unbiased random walk (\code{opt.alt.URW}), stasis (\code{opt.alt.Stasis}) and OU models (\code{opt.alt.OU}).
}

\usage{
opt.alt.GRW(x, pool = TRUE, cl = list(fnscale = -1), meth = "L-BFGS-B", hess = FALSE)
opt.alt.URW(x, pool = TRUE, cl = list(fnscale = -1), meth = "L-BFGS-B", hess = FALSE)
opt.alt.Stasis(x, pool = TRUE, cl = list(fnscale = -1), meth = "L-BFGS-B", hess = FALSE)
opt.alt.OU(x, pool = TRUE, cl = list(fnscale = -1), meth = "L-BFGS-B", hess = FALSE)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ a \code{paleoTS} object }
  \item{pool}{ logical indicating whether to pool variances across samples }
  \item{cl}{ control list, passed to function \code{optim} }
  \item{meth}{ optimization method, passed to function \code{optim} }
  \item{hess}{ logical, indicating whether to calculate standard errors from the Hessian matrix }
}
\details{
  These functions numerically search a log-likelihood surface for its optimum--they are a convenient wrapper to \code{optim}.  
  Arguments \code{meth}, \code{cl}, and \code{hess} are passed to \code{optim}; see the help for that function for details.  
  These are included to allow sophisticated users greater control over the optimization; the defaults seem to work well for most, 
  but not all sequences. For \code{meth="L-BFGS-B"}, some parameters are constrained to be non-negative, which is useful parameters 
  which cannot truly be negative, such as \code{vstep} (random walk) and \code{omega} (stasis model). \cr
  
  Initial estimates to start the optimization come in part from analytical solutions based on assuming equal sampling error across 
  samples and evenly spaced samples in time (functions \code{mle.GRW}, \code{mle.URW} and \code{mle.Stasis}). 

}
\value{
  \item{par }{ parameter estimates}
  \item{value }{ the log-likelihood of the optimal solution}
  \item{counts}{ returned by \code{optim} }
  \item{convergence}{ returned by \code{optim} }
  \item{message}{ returned by \code{optim} }
  \item{p0}{ initial guess for parameter values at start of optimization}
  \item{K}{ number of parameters in the model}
  \item{n}{ the number of observations, equal to the number of samples}
  \item{AIC}{ Akaike information criterion}
  \item{AICc}{ bias-corrected Akaike information criterion}
  \item{BIC}{ Bayes (or Schwarz) information criterion}
  \item{se}{ standard errors for parameter estimates, computed from the curvature of the log-likelihood surface (only if \code{hess = TRUE})}
  \item{\dots}{ other output from call to \code{optim}}
}

\references{ Hunt, G. 2006. Fitting and comparing models of phyletic evolution: random walks and beyond.  \emph{Paleobiology}\bold{32}:578--601.  }
\author{ Gene Hunt }

\note{
These optimizations are performed with a parameterization of the GRW, URW and Stasis models that differs from the 
package \code{paleoTS} (the OU model is not implemented in that package).  Specifically, in \code{paleoTS}, models are 
fit from the \emph{differences} between adjacent samples, removing the autocorrelation in the time-series.  In package 
{paleoTSalt}, models are fit using the actual sample values, with the autocorrelation among samples accounted for in 
the log-likelihood function.  With each model, the joint distribution of sample means is multivariate normal, with means 
and variance-covariances determined by evolutionary parameters and sampling errors. \cr

For details on this parameterization of the models, see the upcoming paper in Evolution by G. Hunt, M. Bell and M. Travis.
}

\section{Warning}{
Because these functions parameterize the models differently, their outputs are not comparable to those from \code{paleoTS} package.
}

\seealso{ \code{\link{logL.alt.GRW}}, \code{\link[paleoTS]{opt.GRW}} }

\examples{
 x<- sim.GRW(ns=30, ms=1, vs=1)
 plot(x)
 m.urw<- opt.alt.URW(x)
 m.grw<- opt.alt.GRW(x)
 m.sta<- opt.alt.Stasis(x)
 
 cat(m.urw$AICc, m.grw$AICc, m.sta$AICc, "\n")	# print AICc scores
	
}
\keyword{models}
\keyword{ts}