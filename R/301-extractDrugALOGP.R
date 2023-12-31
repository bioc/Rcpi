#' Calculate Atom Additive logP and Molar Refractivity Values Descriptor
#'
#' Calculate Atom Additive logP and Molar Refractivity Values Descriptor
#'
#' Calculates ALOGP (Ghose-Crippen LogKow) and the Ghose-Crippen molar
#' refractivity as described by Ghose, A.K. and Crippen, G.M.
#' Note the underlying code in CDK assumes that aromaticity
#' has been detected before evaluating this descriptor.
#' The code also expects that the molecule will have
#' hydrogens explicitly set. For SD files, this is
#' usually not a problem since hydrogens are explicit.
#' But for the case of molecules obtained from SMILES,
#' hydrogens must be made explicit.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature. This function returns three columns
#' named \code{ALogP}, \code{ALogp2} and \code{AMR}.
#'
#' @export extractDrugALOGP
#'
#' @references
#' Ghose, A.K. and Crippen, G.M. ,
#' Atomic physicochemical parameters for three-dimensional structure-directed
#' quantitative structure-activity relationships.
#' I. Partition coefficients as a measure of hydrophobicity,
#' Journal of Computational Chemistry, 1986, 7:565-577.
#'
#' Ghose, A.K. and Crippen, G.M. ,
#' Atomic physicochemical parameters for three-dimensional-structure-directed
#' quantitative structure-activity relationships.
#' 2. Modeling dispersive and hydrophobic interactions,
#' Journal of Chemical Information and Computer Science, 1987, 27:21-35.
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugALOGP(mol)
#' head(dat)}

extractDrugALOGP = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'ALOGPDescriptor', silent = silent)
}
