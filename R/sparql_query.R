#' SPARQL query, end around the DSL
#'
#' @export
#' @param .data a \code{sparql_dsl} class object, result of a call to
#' \code{\link{sparql_dsl}}
#' @param x A SPARQL query
#' @param ... Further arguments passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' sparql_dsl("http://dbpedia.org/sparql") %>%
#'  sparql_query("SELECT * WHERE { ?s ?p ?o } OFFSET 100 LIMIT 10")
#' }
sparql_query <- function(.data, x, ...) {
  sparql_exec(.data$url, query = x, ...)
}
