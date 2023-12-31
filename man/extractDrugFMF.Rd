% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/322-extractDrugFMF.R
\name{extractDrugFMF}
\alias{extractDrugFMF}
\title{Calculate the FMF Descriptor}
\usage{
extractDrugFMF(molecules, silent = TRUE)
}
\arguments{
\item{molecules}{Parsed molucule object.}

\item{silent}{Logical. Whether the calculating process
should be shown or not, default is \code{TRUE}.}
}
\value{
A data frame, each row represents one of the molecules,
each column represents one feature.
This function returns one column named \code{FMF}.
}
\description{
Calculate the FMF Descriptor
}
\details{
Calculates the FMF descriptor characterizing molecular complexity
in terms of its Murcko framework. This descriptor is the ratio of
heavy atoms in the framework to the total number of heavy atoms
in the molecule. By definition, acyclic molecules which have no frameworks,
will have a value of 0. Note that the authors consider an isolated ring
system to be a framework (even though there is no linker).
}
\examples{
smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
\donttest{
mol = readMolFromSmi(smi, type = 'mol')
dat = extractDrugFMF(mol)
head(dat)}
}
\references{
Yang, Y., Chen, H., Nilsson, I., Muresan, S., & Engkvist, O. (2010).
Investigation of the relationship between topology and selectivity
for druglike molecules. Journal of medicinal chemistry,
53(21), 7709-7714.
}
