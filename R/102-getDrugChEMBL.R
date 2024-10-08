#' Retrieve Drug Molecules in MOL Format from the ChEMBL Database
#'
#' Retrieve Drug Molecules in MOL Format from the ChEMBL Database
#'
#' This function retrieves drug molecules in MOL format from the
#' ChEMBL database.
#'
#' @param id A character vector, as the ChEMBL drug ID.
#' @param parallel An integer, the parallel parameter, indicates how many
#'                 process the user would like to use for
#'                 retrieving the data (using RCurl), default is \code{5}.
#'                 For regular cases, we recommend a number less than \code{20}.
#'
#' @return A length of \code{id} character vector,
#' each element containing the corresponding drug molecule.
#'
#' @seealso See \code{\link{getSmiFromChEMBL}} for retrieving drug molecules
#' in SMILES format from the ChEMBL database.
#'
#' @export getMolFromChEMBL
#'
#' @examples
#' id = 'CHEMBL1430'  # Penicillamine
#' \donttest{
#' getMolFromChEMBL(id)}

getMolFromChEMBL = function (id, parallel = 5) {

    # example id : CHEMBL1430 (Penicillamine)
    # example url: https://www.ebi.ac.uk/chembldb/compound/inspect/CHEMBL1430
    # then we get: https://www.ebi.ac.uk/chembldb/download_helper/getmol/369179

    MolPageURL = paste0('https://www.ebi.ac.uk/chembldb/compound/inspect/', id)
    MolPageTxt = get_url_parallel(url = MolPageURL, total_con = parallel)

    n = length(id)
    tmp1 = rep(NA, n)
    tmp2 = rep(NA, n)

    for (i in 1:n) {
        tmp1[i] = strsplit(MolPageTxt,
                           "<a href='/chembl/download_helper/getmol/")[[1]][2]
    }

    for (i in 1:n) {
        tmp2[i] = strsplit(tmp1[i], "'>Download MolFile")[[1]][1]
    }

    MolURL = paste0('https://www.ebi.ac.uk/chembldb/download_helper/getmol/', tmp2)
    MolTxt = get_url_parallel(url = MolURL, total_con = parallel)

    return(MolTxt)

}

#' Retrieve Drug Molecules in SMILES Format from the ChEMBL Database
#'
#' Retrieve Drug Molecules in SMILES Format from the ChEMBL Database
#'
#' This function retrieves drug molecules in SMILES format from the
#' ChEMBL database.
#'
#' @param id A character vector, as the ChEMBL drug ID.
#' @param parallel An integer, the parallel parameter, indicates how many
#'                 process the user would like to use for retrieving
#'                 the data (using RCurl), default is \code{5}.
#'                 For regular cases, we recommend a number less than \code{20}.
#'
#' @return A length of \code{id} character vector,
#' each element containing the corresponding drug molecule.
#'
#' @seealso See \code{\link{getMolFromChEMBL}} for retrieving drug molecules
#' in MOL format from the ChEMBL database.
#'
#' @export getSmiFromChEMBL
#'
#' @examples
#' id = 'CHEMBL1430'  # Penicillamine
#' \donttest{
#' getSmiFromChEMBL(id)}

getSmiFromChEMBL = function (id, parallel = 5) {

    # example id : CHEMBL1430 (Penicillamine)
    # example url: https://www.ebi.ac.uk/chembl/api/data/molecule?molecule_chembl_id__in=CHEMBL1430&format=json

    MolURL = paste0('https://www.ebi.ac.uk/chembl/api/data/molecule?molecule_chembl_id__in=', id, '&format=json')

    MolTxt = get_url_parallel(url = MolURL, total_con = parallel)

    SmiTxt = lapply(MolTxt, jsonlite::fromJSON, simplifyVector = FALSE)
    SmiTxt = sapply(SmiTxt, `[[`, 'molecules')

    Smi = sapply(lapply(SmiTxt, `[[`, 'molecule_structures'), `[[`, 'canonical_smiles')

    names(Smi) = NULL

    return(Smi)

}
