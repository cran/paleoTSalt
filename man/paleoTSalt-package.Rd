\name{paleoTSalt-package}
\alias{paleoTSalt-package}
\alias{paleoTSalt}
\docType{package}

\title{
Fitting models of evolution to paleontological time-series of phenotypic data
}

\description{
This package facilitates analysis of paleontological sequences of trait values from an evolving lineage.  
Functions are provided to fit, using maximum likelihood, evolutionary models including unbiased random walks, 
directional evolution, stasis and OU (Orstein-Uhlenbeck) models.  This package has a similar purpose as the 
\code{paleoTS} package, but employs a different parameterization of evolutionary models.  
}

\details{
\tabular{ll}{
Package: \tab paleoTSalt\cr
Type: \tab Package\cr
Version: \tab 0.1-1\cr
Date: \tab 2007-10-22\cr
License: \tab GPL 3 or newer\cr
}
}

\author{
Gene Hunt, \email{hunte@si.edu}
}

\references{
Hunt, G. 2006. Fitting and comparing models of phyletic evolution: random walks and beyond.  \emph{Paleobiology} \bold{32}:578--601.
}

\keyword{ package }
\seealso{
	 \code{\link[paleoTS]{paleoTS-package}}
}
\examples{
data(dorsal.spines)

# get subset of samples from invading lineage (tt>=4.5 Kyr), only those with nn>=5
ok<- dorsal.spines$tt >= 4.5 & dorsal.spines$nn >=5
ds2<- sub.paleoTS(dorsal.spines, ok=ok)

# convert time scale to generations (500 gen per Kyr)
ds2$tt<- ds2$tt*(1000/2)	
plot(ds2, pool=TRUE)

# compare URW (drift) and OU (adaptive) models
m.urw<- opt.alt.URW(ds2, pool=TRUE)
m.ou<- opt.alt.OU(ds2, pool=TRUE)
cat ("Model","logL", "AICc\n", sep="\t")
cat ("URW", round(m.urw$val, 2), round(m.urw$AICc, 2), sep="\t")
cat ("\nOU", round(m.ou$val, 2), round(m.ou$AICc, 2), sep="\t")
add.OU.curves(m.ou, ds2, col="grey")
}
