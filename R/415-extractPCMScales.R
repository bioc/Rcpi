#' Generalized Scales-Based Descriptors derived by Principal Components Analysis
#'
#' Generalized Scales-Based Descriptors derived by Principal Components Analysis
#'
#' This function calculates the generalized scales-based descriptors
#' derived by Principal Components Analysis (PCA).
#' Users could provide customized amino acid property matrices.
#' This function implements the core computation procedure needed for
#' the generalized scales-based descriptors derived by AA-Properties (AAindex)
#' and generalized scales-based descriptors derived by 20+ classes of 2D and 3D
#' molecular descriptors (Topological, WHIM, VHSE, etc.).
#'
#' @param x A character vector, as the input protein sequence.
#' @param propmat A matrix containing the properties for the amino acids.
#'        Each row represent one amino acid type, each column represents
#'        one property.
#'        Note that the one-letter row names must be provided for we need
#'        them to seek the properties for each AA type.
#' @param pc Integer. Use the first pc principal components as the scales.
#'        Must be no greater than the number of AA properties provided.
#' @param lag The lag parameter. Must be less than the amino acids.
#' @param scale Logical. Should we auto-scale the property matrix
#'        (\code{propmat}) before PCA? Default is \code{TRUE}.
#' @param silent Logical. Whether we print the standard deviation,
#'        proportion of variance and the cumulative proportion of
#'        the selected principal components or not.
#'        Default is \code{TRUE}.
#'
#' @return A length \code{lag * p^2} named vector,
#' \code{p} is the number of scales (principal components) selected.
#'
#' @seealso See \code{\link{extractPCMDescScales}} for generalized
#' AA property based scales descriptors, and \code{\link{extractPCMPropScales}}
#' for (19 classes) AA descriptor based scales descriptors.
#'
#' @export extractPCMScales
#'
#' @examples
#' x = readFASTA(system.file('protseq/P00750.fasta', package = 'Rcpi'))[[1]]
#' data(AAindex)
#' AAidxmat = t(na.omit(as.matrix(AAindex[, 7:26])))
#' scales = extractPCMScales(x, propmat = AAidxmat, pc = 5, lag = 7, silent = FALSE)

extractPCMScales = function (x, propmat, pc, lag, scale = TRUE, silent = TRUE) {

    if (checkProt(x) == FALSE) stop('x has unrecognized amino acid types')

    pc = min(pc, ncol(propmat), nrow(propmat))

    prop.pr = prcomp(propmat, scale = scale)
    prop.pred = predict(prop.pr)

    accmat = matrix(0, pc, nchar(x))
    x.split = strsplit(x, '')[[1]]

    for (i in 1:nchar(x)) {
        accmat[, i] = prop.pred[x.split[i], 1:pc]
    }

    result = acc(accmat, lag)

    if (!silent) {
        cat('Summary of the first', pc,'principal components:\n')
        print(summary(prop.pr)$importance[, 1:pc])
    }

    return(result)

}
