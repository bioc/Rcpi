#' Descriptor that Calculates the LogP Based on a Simple Equation
#' Using the Number of Carbons and Hetero Atoms
#'
#' Descriptor that Calculates the LogP Based on a Simple Equation
#' Using the Number of Carbons and Hetero Atoms
#'
#' This descriptor calculates the LogP based on a simple equation using
#' the number of carbons and hetero atoms.
#' The implemented equation was proposed in Mannhold et al.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature.
#' This function returns one column named \code{MLogP}.
#'
#' @export extractDrugMannholdLogP
#'
#' @references
#' Mannhold, R., Poda, G. I., Ostermann, C., & Tetko, I. V. (2009).
#' Calculation of molecular lipophilicity: State-of-the-art and
#' comparison of log P methods on more than 96,000 compounds.
#' Journal of pharmaceutical sciences, 98(3), 861-893.
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugMannholdLogP(mol)
#' head(dat)}

extractDrugMannholdLogP = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'MannholdLogPDescriptor', silent = silent)
}
