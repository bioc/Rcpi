#' BCUT -- Eigenvalue Based Descriptor
#'
#' BCUT -- Eigenvalue Based Descriptor
#'
#' Eigenvalue based descriptor noted for its utility in chemical diversity.
#' Described by Pearlman et al.
#' The descriptor is based on a weighted version of the Burden matrix which
#' takes into account both the connectivity as well as atomic properties
#' of a molecule. The weights are a variety of atom properties placed along
#' the diagonal of the Burden matrix.
#' Currently three weighting schemes are employed:
#' \itemize{
#' \item Atomic Weight
#' \item Partial Charge (Gasteiger Marsilli)
#' \item Polarizability (Kang et al.)
#' }
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature. This function returns 6 columns:
#' \itemize{
#' \item \code{BCUTw-1l, BCUTw-2l ...} - n high lowest atom weighted BCUTS
#' \item \code{BCUTw-1h, BCUTw-2h ...} - n low highest atom weighted BCUTS
#' \item \code{BCUTc-1l, BCUTc-2l ...} - n high lowest partial charge weighted BCUTS
#' \item \code{BCUTc-1h, BCUTc-2h ...} - n low highest partial charge weighted BCUTS
#' \item \code{BCUTp-1l, BCUTp-2l ...} - n high lowest polarizability weighted BCUTS
#' \item \code{BCUTp-1h, BCUTp-2h ...} - n low highest polarizability weighted BCUTS
#' }
#'
#' @export extractDrugBCUT
#'
#' @references
#' Pearlman, R.S. and Smith, K.M.,
#' Metric Validation and the Receptor-Relevant Subspace Concept,
#' J. Chem. Inf. Comput. Sci., 1999, 39:28-35.
#'
#' Burden, F.R., Molecular identification number for substructure searches,
#' J. Chem. Inf. Comput. Sci., 1989, 29:225-227.
#'
#' Burden, F.R., Chemically Intuitive Molecular Index,
#' Quant. Struct. -Act. Relat., 1997, 16:309-314
#'
#' Kang, Y.K. and Jhon, M.S.,
#' Additivity of Atomic Static Polarizabilities and Dispersion Coefficients,
#' Theoretica Chimica Acta, 1982, 61:41-48
#'
#' @note
#' By default, the descriptor will return the highest and lowest eigenvalues
#' for the three classes of descriptor in a single ArrayList
#' (in the order shown above). However it is also possible to supply a parameter
#' list indicating how many of the highest and lowest eigenvalues
#' (for each class of descriptor) are required. The descriptor works with
#' the hydrogen depleted molecule.
#'
#' A side effect of specifying the number of highest and lowest eigenvalues
#' is that it is possible to get two copies of all the eigenvalues. That is,
#' if a molecule has 5 heavy atoms, then specifying the 5 highest eigenvalues
#' returns all of them, and specifying the 5 lowest eigenvalues returns all of
#' them, resulting in two copies of all the eigenvalues.
#'
#' Note that it is possible to specify an arbitrarily large number of
#' eigenvalues to be returned. However if the number (i.e., nhigh or nlow)
#' is larger than the number of heavy atoms, the remaining eignevalues
#' will be \code{NaN}.
#'
#' Given the above description, if the aim is to gt all the eigenvalues for
#' a molecule, you should set nlow to 0 and specify the number of heavy atoms
#' (or some large number) for nhigh (or vice versa).
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' dat = extractDrugBCUT(mol)
#' head(dat)}

extractDrugBCUT = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'BCUTDescriptor', silent = silent)
}
