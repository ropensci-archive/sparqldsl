#' Execute sparql request
#'
#' @export
#' @param x a SPARQL server url, or an object of class \code{sparql_dsl}
#' @param query (character) A SPARQL query
#' @param ... Further arguments passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' sparql_exec(spqurl())
#'
#' out <- sparql_exec(spqurl(), query)
#' head(out)
#' }
sparql_exec <- function(x, query = NULL, ...) {
  UseMethod("sparql_exec")
}

#' @export
sparql_exec.default <- function(x, query = NULL, ...) {
  stop("no sparql_exec method for class ", class(x), call. = FALSE)
}

#' @export
sparql_exec.character <- function(x, query = NULL, ...) {
  sparql_GET(x, query, ...)
}

#' @export
sparql_exec.sparql_dsl <- function(x, ...) {
  tmp <- sparql_GET(x$url, make_query(x$query), ...)
  switch(
    attr(x$query[[1]], "type"),
    ask = tmp$boolean,
    select = tmp$results$bindings
  )
}
