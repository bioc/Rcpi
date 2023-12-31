#' Descriptor that Calculates the Total Weight of Atoms
#'
#' Descriptor that Calculates the Total Weight of Atoms
#'
#' This descriptor calculates the molecular weight.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature.
#' This function returns one column named \code{MW}.
#'
#' @export extractDrugWeight
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugWeight(mol)
#' head(dat)}

extractDrugWeight = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'WeightDescriptor', silent = silent)
}
