#' Calculate the E-State Molecular Fingerprints (in Compact Format)
#'
#' Calculate the E-State Molecular Fingerprints (in Compact Format)
#'
#' 79 bit fingerprints corresponding to the E-State atom types
#' described by Hall and Kier.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return A list, each component represents one of the molecules, each element
#' in the component represents the index of which element in the fingerprint is 1.
#' Each component's name is the length of the fingerprints.
#'
#' @export extractDrugEstate
#'
#' @seealso \link{extractDrugEstateComplete}
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' fp  = extractDrugEstate(mol)
#' head(fp)}

extractDrugEstate = function (molecules, silent = TRUE) {

    if (length(molecules) == 1) {

        x = getFingerprint(molecules, type = 'estate', silent = silent)

        fp = vector('list', 1)
        fp[[1]] = x@bits
        names(fp) = x@nbit

    } else {

        x = lapply(molecules, getFingerprint, type = 'estate', silent = silent)

        fp = vector('list', length(molecules))

        for (i in 1:length(molecules)) {

            fp[[i]] = x[[i]]@bits
            names(fp)[i] = x[[i]]@nbit

        }

    }

    return(fp)

}

#' Calculate the E-State Molecular Fingerprints (in Complete Format)
#'
#' Calculate the E-State Molecular Fingerprints (in Complete Format)
#'
#' 79 bit fingerprints corresponding to the E-State atom types
#' described by Hall and Kier.
#'
#' @param molecules Parsed molucule object.
#' @param silent Logical. Whether the calculating process
#' should be shown or not, default is \code{TRUE}.
#'
#' @return An integer vector or a matrix. Each row represents one molecule,
#' the columns represent the fingerprints.
#'
#' @export extractDrugEstateComplete
#'
#' @seealso \link{extractDrugEstate}
#'
#' @examples
#' smi = system.file('vignettedata/FDAMDD.smi', package = 'Rcpi')
#' \donttest{
#' mol = readMolFromSmi(smi, type = 'mol')
#' fp  = extractDrugEstateComplete(mol)
#' dim(fp)}

extractDrugEstateComplete = function (molecules, silent = TRUE) {

    if (length(molecules) == 1) {

        x = getFingerprint(molecules, type = 'estate', silent = silent)

        fp = integer(79)
        fp[x@bits] = 1L

    } else {

        x = lapply(molecules, getFingerprint, type = 'estate', silent = silent)

        fp = matrix(0L, nrow = length(molecules), ncol = 79)

        for (i in 1:length(molecules)) fp[ i, x[[i]]@bits ] = 1L

    }

    return(fp)

}
