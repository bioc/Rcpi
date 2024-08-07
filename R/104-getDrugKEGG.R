#' Retrieve Drug Molecules in MOL Format from the KEGG Database
#'
#' Retrieve Drug Molecules in MOL Format from the KEGG Database
#'
#' This function retrieves drug molecules in MOL format from the KEGG database.
#'
#' @param id A character vector, as the KEGG drug ID.
#' @param parallel An integer, the parallel parameter, indicates how many
#'                 process the user would like to use for retrieving
#'                 the data (using RCurl), default is \code{5}.
#'                 For regular cases, we recommend a number less than \code{20}.
#'
#' @return A length of \code{id} character vector,
#' each element containing the corresponding drug molecule.
#'
#' @seealso See \code{\link{getSmiFromKEGG}} for retrieving drug molecules
#' in SMILES format from the KEGG database.
#'
#' @export getMolFromKEGG
#'
#' @examples
#' id = 'D00496'  # Penicillamine
#' \donttest{
#' getMolFromKEGG(id)}

getMolFromKEGG = function (id, parallel = 5) {

    # example id     : D00496 (Penicillamine)
    # example url    : http://rest.kegg.jp/get/D00496/mol
    # KEGG API Intro : http://www.kegg.jp/kegg/rest/keggapi.html

    MolURL = paste0('http://rest.kegg.jp/get/', id, '/mol')

    MolTxt = get_url_parallel(url = MolURL, total_con = parallel)

    return(MolTxt)

}

#' Retrieve Drug Molecules in SMILES Format from the KEGG Database
#'
#' Retrieve Drug Molecules in SMILES Format from the KEGG Database
#'
#' This function retrieves drug molecules in SMILES format from the
#' KEGG database.
#'
#' @param id A character vector, as the KEGG drug ID.
#' @param parallel An integer, the parallel parameter, indicates how many
#'                 process the user would like to use for retrieving
#'                 the data (using RCurl), default is \code{5}.
#'                 For regular cases, we recommend a number less than \code{20}.
#'
#' @return A length of \code{id} character vector,
#' each element containing the corresponding drug molecule.
#'
#' @seealso See \code{\link{getMolFromKEGG}} for retrieving drug molecules
#' in MOL format from the KEGG database.
#'
#' @export getSmiFromKEGG
#'
#' @examples
#' id = 'D00496'  # Penicillamine
#' \donttest{
#' getSmiFromKEGG(id)}

getSmiFromKEGG = function (id, parallel = 5) {

    # example id     : D00496 (Penicillamine)
    # example url    : http://rest.kegg.jp/get/D00496/mol
    # KEGG API Intro : http://www.kegg.jp/kegg/rest/keggapi.html

    MolTxt = getMolFromKEGG(id, parallel)

    tmpfile = tempfile(pattern = paste0(id, '-'), fileext = 'mol')
    for (i in 1:length(id)) cat(MolTxt[[i]], file = tmpfile[i])

    Mol = loadMolecules(tmpfile)
    Smi = sapply(Mol, getSmiles)

    unlink(tmpfile)

    return(Smi)

}
