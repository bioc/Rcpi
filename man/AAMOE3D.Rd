% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Rcpi-datalist.R
\docType{data}
\name{AAMOE3D}
\alias{AAMOE3D}
\title{3D Descriptors for 20 Amino Acids calculated by MOE 2011.10}
\value{
AAMOE3D data
}
\description{
3D Descriptors for 20 Amino Acids calculated by MOE 2011.10
}
\details{
This dataset includes the 3D descriptors of the 20 amino acids
calculated by MOE 2011.10 used for scales extraction in this package.
All amino acid molecules had also been optimized with MOE (semiempirical AM1)
before calculating these 3D descriptors.
The SDF file containing the information of the optimized amino acid molecules
is included in this package. See \code{\link{OptAA3d}} for more information.
}
\examples{
data(AAMOE3D)

}
