% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/377-extractDrugPubChem.R
\name{extractDrugPubChemComplete}
\alias{extractDrugPubChemComplete}
\title{Calculate the PubChem Molecular Fingerprints (in Complete Format)}
\usage{
extractDrugPubChemComplete(molecules, silent = TRUE)
}
\arguments{
\item{molecules}{Parsed molucule object.}

\item{silent}{Logical. Whether the calculating process
should be shown or not, default is \code{TRUE}.}
}
\value{
An integer vector or a matrix. Each row represents one molecule,
the columns represent the fingerprints.
}
\description{
Calculate the PubChem Molecular Fingerprints (in Complete Format)
}
\details{
Calculate the 881 bit fingerprints defined by PubChem.
}
\examples{
smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
\donttest{
mol = readMolFromSmi(smi, type = 'mol')
fp  = extractDrugPubChemComplete(mol)
dim(fp)}
}
\seealso{
\link{extractDrugPubChem}
}
