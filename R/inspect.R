#' Peek at a SPARQL query
#'
#' @export
#' @param .data (list) input, using higher level interface
#' @examples
#' url <- "http://dbpedia.org/sparql"
#' sparql_dsl(url) %>% ask(s, p, o) %>% inspect
#' sparql_dsl(url) %>% select() %>% inspect
#' sparql_dsl(url) %>% where() %>% inspect
#' sparql_dsl(url) %>% prefix(dcterms = "http://purl.org/dc/terms/") %>% inspect
inspect <- function(.data) {
  pipe_autoexec(toggle = FALSE)
  if (!inherits(.data, "sparql_dsl")) stop("must be of class jqr", call. = FALSE)
  structure(.data, class = "sparql_query")
}

#' @export
print.sparql_query <- function(x, ...) {
  cat("<sparql query>", sep = "\n")
  cat(paste0("  base url: ", x$url), sep = "\n")
  cat("  query:\n")
  cz <- vapply(x$query, attr, "", which = "type")
  if (any(cz == "prefix")) {
    prefs <- x$query[cz == "prefix"][[1]]
    for (i in seq_along(prefs)) {
      cat(sprintf("   %s\n", prefs[[i]]))
    }
  }
  if ("select" %in% cz) cat(sprintf("     %s\n", x$query[cz == "select"][[1]][1]))
  if ("where" %in% cz) cat(sprintf("     %s\n", x$query[cz == "where"][[1]][1]))
  if ("ask" %in% cz) cat(sprintf("     %s\n", x$query[cz == "ask"][[1]][1]))
  if ("limit" %in% cz) cat(sprintf("     %s\n", x$query[cz == "limit"][[1]][1]))
  #cat(sprintf("  %s\n", paste(vapply(x$query, "[[", "", 1), collapse = "\n    ")))
  # cat(sprintf("  query:\n   %s\n", 
  #   paste(vapply(x$query, "[[", "", 1), collapse = "\n    ")))
}
