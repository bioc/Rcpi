#' Calculate the Ratio of Length to Breadth Descriptor
#'
#' Calculate the Ratio of Length to Breadth Descriptor
#'
#' Calculates the Ratio of Length to Breadth, as a result ti does not perform
#' any orientation and only considers the X & Y
#' extents for a series of rotations about the Z axis
#' (in 10 degree increments).
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A data frame, each row represents one of the molecules,
#' each column represents one feature.
#' This function returns two columns named \code{LOBMAX} and \code{LOBMIN}:
#' \itemize{
#' \item \code{LOBMAX} - The maximum L/B ratio;
#' \item \code{LOBMIN} - The L/B ratio for the rotation that results in the
#' minimum area (defined by the product of the X & Y extents for that orientation).
#' }
#'
#' @export extractDrugLengthOverBreadth
#'
#' @note The descriptor assumes that the atoms have been configured.
#'
#' @examples
#' sdf = system.file('sysdata/OptAA3d.sdf', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSDF(sdf)
#' dat = extractDrugLengthOverBreadth(mol)
#' head(dat)}

extractDrugLengthOverBreadth = function (molecules, silent = TRUE) {
    evaluateDescriptor(molecules, type = 'LengthOverBreadthDescriptor', silent = silent)
}
