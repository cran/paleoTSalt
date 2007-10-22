\name{logL.alt.GRW}
\alias{logL.alt.GRW}
\alias{logL.alt.URW}
\alias{logL.alt.Stasis}
\alias{logL.alt.OU}

\title{ Log-likelihoods for evolutionary models (alternate parameterization) }

\description{
Returns log-likelihood for general random walk (\code{logL.alt.GRW}), unbiased random walk (\code{logL.alt.URW}), stasis (\code{logL.alt.Stasis}) and OU (\code{logL.alt}) models.
}

\usage{
logL.alt.GRW(p, x)
logL.alt.URW(p, x)
logL.alt.Stasis(p, x)
logL.alt.OU(p, x)
}

\arguments{
  \item{p}{ a vector of parameters }
  \item{x}{ a \code{paleoTS} object }
}

\details{
 For the general random walk, \code{p = c(anc, mstep, vstep)}; for an unbiased random walk, \code{p = c(anc, vstep)}; for the stasis model, \code{p = c(theta, omega)}, and for the OU model \code{p = c(anc, vstep, theta, alpha)}.  In general, users will not be access these functions directly, but instead use the optimization functions, which use these functions to find the best-supported parameter values. }

\value{
  The log-likelihood of the parameter estimates (\code{p}), given the data (\code{x}).
  }
  
\references{ Hunt, G. 2006. Fitting and comparing models of phyletic evolution: random walks and beyond.  \emph{Paleobiology}\bold{32}:578--601. }
\author{ Gene Hunt }


\section{Warning}{
Because these functions parameterize the models differently, their log-likelihoods are not comparable to those from \code{paleoTS} package.
}

\seealso{ \code{\link{opt.alt.GRW}}, \code{\link[paleoTS]{logL.GRW}} }

\examples{
x<- sim.GRW(ns=20, ms=0, vs=1)
L1<- logL.alt.GRW(p=c(0,0,1), x)	# actual parameters
L2<- logL.alt.GRW(p=c(0,10,1), x)	# should be a bad guess
cat(L1, L2, "\n")
}

\keyword{models}
\keyword{ts}
