\name{fit3models.alt}
\alias{fit3models.alt}

\title{ Do model fits for three evolutionary models (alternate parameterization) }

\description{
  Function fits three models to an evolutionary time series: (1) general random walk, (2) unbiased random walk, and (3) stasis. 
}

\usage{
fit3models.alt(y, pool = TRUE, silent = FALSE, wts = "AICc")
}

\arguments{
  \item{y}{ a \code{paleoTS} object }
  \item{pool}{ logical, if TRUE, variances are pooled across samples }
  \item{silent}{ logical, if TRUE, results are not printed }
  \item{wts}{ what version of AIC to use for calculation of Akaike weights; either \code{AIC} or \code{AICc} }
}


\value{
  If \code{silent=FALSE}, function \code{fit3models.alt} returns a vector of parameter estimates; if \code{silent=TRUE}, a list with the following components is returned, with models listed in the order of general random walk, unbiased random walk, and stasis: 
  \item{aic }{ Akaike information criterion}
  \item{aicc }{ bias-corrected AIC }
  \item{logl}{ log-likelihoods of the three models}
  \item{hats}{ parameter estimates for general random walk (mstep, vstep), unbiased random walk (vstep) and stasis (theta, omega) models}
  \item{ak.wts}{ vector of Akaike weights}
}

\references{ Hunt, G. 2006. Fitting and comparing models of phyletic evolution: random walks and beyond.  \emph{Paleobiology}\bold{32}:578--601. }
\author{ Gene Hunt }

\section{Warning}{
This function uses the alternate parameterization, and so its output is not comparable to those from \code{paleoTS} package.
}

\seealso{ \code{\link{opt.alt.GRW}}, \code{\link[paleoTS]{fit3models}} }

\examples{
 x1<- sim.GRW(ns=30, ms=0.5, vs=0.2)
 fit3models.alt(x1)
 x2<- sim.Stasis(ns=30, theta=10, omega=0) 
 fit3models.alt(x2)
}

\keyword{models}
\keyword{ts}
