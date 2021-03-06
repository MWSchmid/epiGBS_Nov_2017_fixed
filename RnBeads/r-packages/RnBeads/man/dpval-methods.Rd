% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{methods}
\name{dpval,RnBeadSet-method}
\alias{dpval}
\alias{dpval,RnBeadSet-method}
\title{dpval-methods}
\usage{
\S4method{dpval}{RnBeadSet}(object, type = "sites", row.names = FALSE)
}
\arguments{
\item{object}{\code{\linkS4class{RnBeadSet}} or \code{\linkS4class{RnBeadRawSet}} object}

\item{type}{\code{character} singleton. If \code{sites} detection p-values per each available
site is returned. Otherwise should be one of region types for for which the summarized
p-values are available}

\item{row.names}{Flag indicating of row names are to be generated in the result.}
}
\value{
detection p-values available for the dataset in the form of a \code{matrix}.
}
\description{
Extract detection p-values from an object of \code{\linkS4class{RnBeadSet}} class.
}
\examples{
\dontrun{
library(RnBeads.hg19)
data(small.example.object)
dp<-dpval(rnb.set.example, row.names=TRUE)
head(dp)
}
}

