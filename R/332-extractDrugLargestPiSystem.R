#' Descriptor that Calculates the Number of Atoms in the Largest Pi Chain
#'
#' Descriptor that Calculates the Number of Atoms in the Largest Pi Chain
#'
#' This descriptor calculates the number of atoms in the largest pi chain.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature.
#' This function returns one column named \code{nAtomP}.
#'
#' @export extractDrugLargestPiSystem
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugLargestPiSystem(mol)
#' head(dat)}

extractDrugLargestPiSystem = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'LargestPiSystemDescriptor', silent = silent)
}
