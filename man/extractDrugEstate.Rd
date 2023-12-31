% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/376-extractDrugEstate.R
\name{extractDrugEstate}
\alias{extractDrugEstate}
\title{Calculate the E-State Molecular Fingerprints (in Compact Format)}
\usage{
extractDrugEstate(molecules, silent = TRUE)
}
\arguments{
\item{molecules}{Parsed molucule object.}

\item{silent}{Logical. Whether the calculating process
should be shown or not, default is \code{TRUE}.}
}
\value{
A list, each component represents one of the molecules, each element
in the component represents the index of which element in the fingerprint is 1.
Each component's name is the length of the fingerprints.
}
\description{
Calculate the E-State Molecular Fingerprints (in Compact Format)
}
\details{
79 bit fingerprints corresponding to the E-State atom types
described by Hall and Kier.
}
\examples{
smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
\donttest{
mol = readMolFromSmi(smi, type = 'mol')
fp  = extractDrugEstate(mol)
head(fp)}
}
\seealso{
\link{extractDrugEstateComplete}
}
