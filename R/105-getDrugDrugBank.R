#' Retrieve Drug Molecules in MOL Format from the DrugBank Database
#'
#' Retrieve Drug Molecules in MOL Format from the DrugBank Database
#'
#' This function retrieves drug molecules in MOL format from the
#' DrugBank database.
#'
#' @param id A character vector, as the DrugBank drug ID.
#' @param parallel An integer, the parallel parameter, indicates how many
#'                 process the user would like to use for retrieving
#'                 the data (using RCurl), default is \code{5}.
#'                 For regular cases, we recommend a number less than \code{20}.
#'
#' @return A length of \code{id} character vector,
#' each element containing the corresponding drug molecule.
#'
#' @seealso See \code{\link{getSmiFromDrugBank}} for retrieving drug molecules
#' in SMILES format from the DrugBank database.
#'
#' @export getMolFromDrugBank
#'
#' @examples
#' id = 'DB00859'  # Penicillamine
#' \donttest{
#' getMolFromDrugBank(id)}

getMolFromDrugBank = function (id, parallel = 5) {

    # example id : DB00859 (Penicillamine)
    # example url: https://go.drugbank.com/structures/small_molecule_drugs/DB00859.sdf

    SdfURL = paste0('https://go.drugbank.com/structures/small_molecule_drugs/', id, '.sdf')

    SdfTxt = get_url_parallel(url = SdfURL, total_con = parallel)

    return(SdfTxt)

}

#' Retrieve Drug Molecules in SMILES Format from the DrugBank Database
#'
#' Retrieve Drug Molecules in SMILES Format from the DrugBank Database
#'
#' This function retrieves drug molecules in SMILES format from the
#' DrugBank database.
#'
#' @param id A character vector, as the DrugBank drug ID.
#' @param parallel An integer, the parallel parameter, indicates how many
#'                 process the user would like to use for retrieving
#'                 the data (using RCurl), default is \code{5}.
#'                 For regular cases, we recommend a number less than \code{20}.
#'
#' @return A length of \code{id} character vector, each element containing
#' the corresponding drug molecule.
#'
#' @seealso See \code{\link{getMolFromDrugBank}} for retrieving drug molecules
#' in MOL format from the DrugBank database.
#'
#' @export getSmiFromDrugBank
#'
#' @examples
#' id = 'DB00859'  # Penicillamine
#' \donttest{
#' getSmiFromDrugBank(id)}

getSmiFromDrugBank = function (id, parallel = 5) {

    # example id : DB00859 (Penicillamine)
    # example url: https://go.drugbank.com/structures/small_molecule_drugs/DB00859.sdf

    SdfTxt = getMolFromDrugBank(id, parallel)

    tmpfile = tempfile(pattern = paste0(id, '-'), fileext = 'sdf')
    for (i in 1:length(id)) cat(SdfTxt[[i]], file = tmpfile[i])

    Mol = loadMolecules(tmpfile)
    Smi = sapply(Mol, getSmiles)

    unlink(tmpfile)

    return(Smi)

}
