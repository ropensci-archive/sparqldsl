#' WHERE
#'
#' @export
#' @template args
#' @examples \dontrun{
#' ### CONSTRUCT { ?s ?p ?o } WHERE { ?s ?p ?o } LIMIT 10
#' sparql_dsl("http://dbpedia.org/sparql") %>%
#'  construct(s, p, o) %>%
#'  where(s, p, o) %>%
#'  limit(10) %>%
#'  inspect
#' }
where <- function(.data, ...) {
  where_(.data, .dots = lazyeval::lazy_dots(...))
}

#' @export
#' @rdname where
where_ <- function(.data, ..., .dots) {
  pipe_autoexec(toggle = TRUE)
  tmp <- lazyeval::all_dots(.dots, ...)
  z <- sprintf("WHERE { %s } ", combine_args(tmp) %||% " ")
  dots <- comb(try_qry(.data), structure(z, type = "where"))
  structure(list(url = .data$url, query = dots), class = "sparql_dsl")
}
