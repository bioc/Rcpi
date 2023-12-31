% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/381-extractDrugOBFP3.R
\name{extractDrugOBFP3}
\alias{extractDrugOBFP3}
\title{Calculate the FP3 Molecular Fingerprints}
\usage{
extractDrugOBFP3(molecules, type = c("smile", "sdf"))
}
\arguments{
\item{molecules}{R character string object containing the molecules.
See the example section for details.}

\item{type}{\code{'smile'} or \code{'sdf'}.}
}
\value{
A matrix. Each row represents one molecule,
the columns represent the fingerprints.
}
\description{
Calculate the FP3 Molecular Fingerprints
}
\details{
Calculate the 64 bit FP3 fingerprints provided by OpenBabel.
}
\examples{
mol1 = 'C1CCC1CC(CN(C)(C))CC(=O)CC'  # one molecule SMILE in a vector
mol2 = c('CCC', 'CCN', 'CCN(C)(C)', 'c1ccccc1Cc1ccccc1',
         'C1CCC1CC(CN(C)(C))CC(=O)CC')  # multiple SMILEs in a vector
mol3 = readChar(system.file('compseq/DB00860.sdf', package = 'Rcpi'),
                nchars = 1e+6)  # single molecule in a sdf file
mol4 = readChar(system.file('sysdata/OptAA3d.sdf', package = 'Rcpi'),
                nchars = 1e+6)  # multiple molecules in a sdf file
\dontrun{
smifp0 = extractDrugOBFP3(mol1, type = 'smile')
smifp1 = extractDrugOBFP3(mol2, type = 'smile')
sdffp0 = extractDrugOBFP3(mol3, type = 'sdf')
sdffp1 = extractDrugOBFP3(mol4, type = 'sdf')}
}
