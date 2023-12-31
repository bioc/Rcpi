% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/407-extractProtCTDC.R
\name{extractProtCTDC}
\alias{extractProtCTDC}
\title{CTD Descriptors - Composition}
\usage{
extractProtCTDC(x)
}
\arguments{
\item{x}{A character vector, as the input protein sequence.}
}
\value{
A length 21 named vector
}
\description{
CTD Descriptors - Composition
}
\details{
This function calculates the Composition descriptor of the
CTD descriptors (Dim: 21).
}
\examples{
x = readFASTA(system.file('protseq/P00750.fasta', package = 'Rcpi'))[[1]]
extractProtCTDC(x)
}
\references{
Inna Dubchak, Ilya Muchink, Stephen R. Holbrook and Sung-Hou Kim.
Prediction of protein folding class using global description of
amino acid sequence. \emph{Proceedings of the National Academy of Sciences}.
USA, 1995, 92, 8700-8704.

Inna Dubchak, Ilya Muchink, Christopher Mayor, Igor Dralyuk and Sung-Hou Kim.
Recognition of a Protein Fold in the Context of the SCOP classification.
\emph{Proteins: Structure, Function and Genetics}, 1999, 35, 401-407.
}
\seealso{
See \code{\link{extractProtCTDT}} and \code{\link{extractProtCTDD}}
for the Transition and Distribution descriptors.
}
