#' Read Molecules from SDF Files and Return Parsed Java Molecular Object
#'
#' Read Molecules from SDF Files and Return Parsed Java Molecular Object
#'
#' This function reads molecules from SDF files and return
#' parsed Java molecular object needed by \code{extractDrug...} functions.
#'
#' @param sdffile Character vector, containing SDF file location(s).
#'
#' @return A list, containing parsed Java molecular object.
#'
#' @seealso See \code{\link{readMolFromSmi}} for reading molecules by SMILES
#' string and returning parsed Java molecular object.
#'
#' @export readMolFromSDF
#'
#' @examples
#' sdf  = system.file('compseq/DB00859.sdf', package = 'Rcpi')
#' sdfs = c(system.file('compseq/DB00859.sdf', package = 'Rcpi'),
#'          system.file('compseq/DB00860.sdf', package = 'Rcpi'))
#' \donttest{
#' mol  = readMolFromSDF(sdf)
#' mols = readMolFromSDF(sdfs)}

readMolFromSDF = function (sdffile) {

  mol = loadMolecules(normalizePath(sdffile))

  return(mol)

}
