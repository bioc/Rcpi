#' Calculate the Number of Atom Descriptor
#'
#' Calculate the Number of Atom Descriptor
#'
#' Calculates the number of atoms of a certain element type in a molecule.
#' By default it returns the count of all atoms.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature.
#' This function returns one column named \code{nAtom}.
#'
#' @export extractDrugAtomCount
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugAtomCount(mol)
#' head(dat)}

extractDrugAtomCount = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'AtomCountDescriptor', silent = silent)
}
