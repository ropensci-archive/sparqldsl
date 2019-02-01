cp <- function(x) Filter(Negate(is.null), x)

spqurl <- function() "http://dbpedia.org/sparql"

sparql_GET_old <- function(url, query, ...) {
  res <- httr::GET(url, query = list(query = query, output = "json"), ...)
  txt <- httr::content(res, "text", encoding = "UTF-8")
  jsonlite::fromJSON(txt)
}

sparql_GET <- function(url, path, query, format = "json", flatten = FALSE, ...) {
  cli <- crul::HttpClient$new(
    url = url, opts = list(...),
    headers = switch(
      format, 
      json = list(Accept = "application/sparql-results+json")
    )
  )
  qry <- list(query = query)
  if (format == "json") qry$format <- "json"
  res <- cli$get(path, query = qry)
  res$raise_for_status()
  jsonlite::fromJSON(res$parse("UTF-8"), flatten = flatten)
}

try_qry <- function(x) {
  res <- tryCatch(x$query, error = function(e) e)
  if (inherits(res, "simpleError")) {
    list()
  } else {
    x$query
  }
}

comb <- function(x, y) {
  cp(do.call("c", list(x, list(y))))
}

combine_args <- function(x) {
  if (length(x) > 0) {
  paste(
    "?",
    vapply(x, function(z) deparse(z$expr), "", USE.NAMES = FALSE),
    sep = "",
    collapse = " "
  )
  } else {
    NULL
  }
}

`%||%` <- function(x, y) if (is.null(x)) y else x

make_query <- function(x) {
  paste(vapply(x, "[[", "", 1), collapse = "")
}
