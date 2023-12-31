% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/371-extractDrugStandard.R
\name{extractDrugStandardComplete}
\alias{extractDrugStandardComplete}
\title{Calculate the Standard Molecular Fingerprints (in Complete Format)}
\usage{
extractDrugStandardComplete(molecules, depth = 6, size = 1024, silent = TRUE)
}
\arguments{
\item{molecules}{Parsed molucule object.}

\item{depth}{The search depth. Default is \code{6}.}

\item{size}{The length of the fingerprint bit string. Default is \code{1024}.}

\item{silent}{Logical. Whether the calculating process
should be shown or not, default is \code{TRUE}.}
}
\value{
An integer vector or a matrix. Each row represents one molecule,
the columns represent the fingerprints.
}
\description{
Calculate the Standard Molecular Fingerprints (in Complete Format)
}
\details{
Calculate the standard molecular fingerprints.
Considers paths of a given length.
This is hashed fingerprints, with a default length of 1024.
}
\examples{
smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
\donttest{
mol = readMolFromSmi(smi, type = 'mol')
fp  = extractDrugStandardComplete(mol)
dim(fp)}
}
\seealso{
\link{extractDrugStandard}
}
