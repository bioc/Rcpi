% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/325-extractDrugHBondAcceptorCount.R
\name{extractDrugHBondAcceptorCount}
\alias{extractDrugHBondAcceptorCount}
\title{Number of Hydrogen Bond Acceptors}
\usage{
extractDrugHBondAcceptorCount(molecules, silent = TRUE)
}
\arguments{
\item{molecules}{Parsed molucule object.}

\item{silent}{Logical. Whether the calculating process
should be shown or not, default is \code{TRUE}.}
}
\value{
A data frame, each row represents one of the molecules,
each column represents one feature.
This function returns one column named \code{nHBAcc}.
}
\description{
Number of Hydrogen Bond Acceptors
}
\details{
This descriptor calculates the number of hydrogen bond acceptors
using a slightly simplified version of the PHACIR atom types.
The following groups are counted as hydrogen bond acceptors:
any oxygen where the formal charge of the oxygen is
non-positive (i.e. formal charge <= 0) except
\enumerate{
\item an aromatic ether oxygen (i.e. an ether oxygen that is
adjacent to at least one aromatic carbon)
\item an oxygen that is adjacent to a nitrogen
}
and any nitrogen where the formal charge of the nitrogen is
non-positive (i.e. formal charge <= 0) except a nitrogen
that is adjacent to an oxygen.
}
\examples{
smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
\donttest{
mol = readMolFromSmi(smi, type = 'mol')
dat = extractDrugHBondAcceptorCount(mol)
head(dat)}
}
