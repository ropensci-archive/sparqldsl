#' SPARQL dsl
#'
#' @export
#' @param url A SPARQL url
#' @param x for print
#' @param ... ignored
#' @examples \dontrun{
#' sparql_dsl("http://dbpedia.org/sparql")
#'
#' # ask
#' ### should separate where from within ask, so ask() %>% where()
#' sparql_dsl("http://dbpedia.org/sparql") %>% ask(s, p, o)
#'
#' # select
#' ### SELECT * WHERE { ?s ?p ?o } OFFSET 100 LIMIT 10
#' ### query = sparql.select.where([:s, :p, :o]).offset(100).limit(10)
#' sparql_dsl("http://dbpedia.org/sparql") %>%
#'  select() %>%
#'  where(s, p, o) %>%
#'  limit(10)
#'
#' # construct
#' ### CONSTRUCT { ?s ?p ?o } WHERE { ?s ?p ?o } LIMIT 10
#' sparql_dsl("http://dbpedia.org/sparql") %>%
#'  construct(s, p, o) %>%
#'  where(s, p, o) %>%
#'  limit(10) %>%
#'  inspect
#' }
sparql_dsl <- function(url = NULL) {
  structure(list(url = url), class = "sparql_dsl")
}

#' @export
print.sparql_dsl <- function(x, ...) {
  cat("<sparql dsl>", sep = "\n")
  cat(paste0("  base url: ", x$url), sep = "\n")
  invisible()
}
