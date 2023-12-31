#' Descriptor that Calculates the Volume of A Molecule
#'
#' Descriptor that Calculates the Volume of A Molecule
#'
#' This descriptor calculates the volume of a molecule.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature.
#' This function returns one column named \code{VABC}.
#'
#' @export extractDrugVABC
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugVABC(mol)
#' head(dat)}

extractDrugVABC = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'VABCDescriptor', silent = silent)
}
