#' Peek at a SPARQL query
#'
#' @export
#' @param .data (list) input, using higher level interface
#' @examples
#' sparql_dsl("http://dbpedia.org/sparql") %>% ask(s, p, o) %>% inspect
inspect <- function(.data) {
  pipe_autoexec(toggle = FALSE)
  if (!inherits(.data, "sparql_dsl")) stop("must be of class jqr", call. = FALSE)
  structure(.data, class = "sparql_query")
}

#' @export
print.sparql_query <- function(x, ...) {
  cat("<sparql query>", sep = "\n")
  cat(paste0("  base url: ", x$url), sep = "\n")
  cat(sprintf("  query:\n   %s\n", paste(vapply(x$query, "[[", "", 1), collapse = "\n    ")))
}
