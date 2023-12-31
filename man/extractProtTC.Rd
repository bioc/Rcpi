% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/403-extractProtTC.R
\name{extractProtTC}
\alias{extractProtTC}
\title{Tripeptide Composition Descriptor}
\usage{
extractProtTC(x)
}
\arguments{
\item{x}{A character vector, as the input protein sequence.}
}
\value{
A length 8000 named vector
}
\description{
Tripeptide Composition Descriptor
}
\details{
This function calculates the Tripeptide Composition descriptor (Dim: 8000).
}
\examples{
x = readFASTA(system.file('protseq/P00750.fasta', package = 'Rcpi'))[[1]]
extractProtTC(x)

}
\references{
M. Bhasin, G. P. S. Raghava.
Classification of Nuclear Receptors Based on
Amino Acid Composition and Dipeptide Composition.
\emph{Journal of Biological Chemistry}, 2004, 279, 23262.
}
\seealso{
See \code{\link{extractProtAAC}} and \code{\link{extractProtDC}}
         for Amino Acid Composition and Dipeptide Composition descriptors.
}
