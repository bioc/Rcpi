% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/402-extractProtDC.R
\name{extractProtDC}
\alias{extractProtDC}
\title{Dipeptide Composition Descriptor}
\usage{
extractProtDC(x)
}
\arguments{
\item{x}{A character vector, as the input protein sequence.}
}
\value{
A length 400 named vector
}
\description{
Dipeptide Composition Descriptor
}
\details{
This function calculates the Dipeptide Composition descriptor (Dim: 400).
}
\examples{
x = readFASTA(system.file('protseq/P00750.fasta', package = 'Rcpi'))[[1]]
extractProtDC(x)

}
\references{
M. Bhasin, G. P. S. Raghava.
Classification of Nuclear Receptors Based on
Amino Acid Composition and Dipeptide Composition.
\emph{Journal of Biological Chemistry}, 2004, 279, 23262.
}
\seealso{
See \code{\link{extractProtAAC}} and \code{\link{extractProtTC}}
         for Amino Acid Composition and Tripeptide Composition descriptors.
}
