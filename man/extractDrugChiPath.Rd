% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/320-extractDrugChiPath.R
\name{extractDrugChiPath}
\alias{extractDrugChiPath}
\title{Calculate the Kier and Hall Chi Path Indices of Orders 0 to 7}
\usage{
extractDrugChiPath(molecules, silent = TRUE)
}
\arguments{
\item{molecules}{Parsed molucule object.}

\item{silent}{Logical. Whether the calculating process
should be shown or not, default is \code{TRUE}.}
}
\value{
A data frame, each row represents one of the molecules,
each column represents one feature.
This function returns 16 columns,
The order and names of the columns returned is:
\itemize{
\item \code{SP.0, SP.1, ..., SP.7} - Simple path, orders 0 to 7
\item \code{VP.0, VP.1, ..., VP.7} - Valence path, orders 0 to 7
}
}
\description{
Calculate the Kier and Hall Chi Path Indices of Orders 0 to 7
}
\details{
Evaluates chi path descriptors. This function utilizes the graph isomorphism
code of the CDK to find fragments matching SMILES strings representing the
fragments corresponding to each type of chain.
}
\note{
These descriptors are calculated using graph isomorphism to identify
the various fragments. As a result calculations may be slow.
In addition, recent versions of Molconn-Z use simplified fragment definitions
(i.e., rings without branches etc.) whereas these descriptors use the older
more complex fragment definitions.
}
\examples{
smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
\donttest{
mol = readMolFromSmi(smi, type = 'mol')
dat = extractDrugChiPath(mol)
head(dat)}
}
