#' Calculate the Number of Amino Acids Descriptor
#'
#' Calculate the Number of Amino Acids Descriptor
#'
#' Calculates the number of each amino acids (total 20 types)
#' found in the molecues.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature.
#' This function returns 20 columns named
#' \code{nA}, \code{nR}, \code{nN}, \code{nD}, \code{nC},
#' \code{nF}, \code{nQ}, \code{nE}, \code{nG}, \code{nH},
#' \code{nI}, \code{nP}, \code{nL} \code{nK}, \code{nM},
#' \code{nS}, \code{nT}, \code{nY} \code{nV}, \code{nW}.
#'
#' @export extractDrugAminoAcidCount
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugAminoAcidCount(mol)
#' head(dat)}

extractDrugAminoAcidCount = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'AminoAcidCountDescriptor', silent = silent)
}
