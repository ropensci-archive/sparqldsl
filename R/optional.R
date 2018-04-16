#' OPTIONAL
#'
#' @export
#' @template args
#' @examples \dontrun{
#' ### OPTIONAL { ?s ?p ?o }
#' conn <- sparql_dsl("http://dbpedia.org/sparql")
#' conn %>% optional(x, y) %>% inspect
#' sparql_dsl("http://dbpedia.org/sparql") %>% where(s, p, o, )
#' }
optional <- function(.data, ...) {
  optional_(.data, .dots = lazyeval::lazy_dots(...))
}

#' @export
#' @rdname optional
optional_ <- function(.data, ..., .dots) {
  pipe_autoexec(toggle = TRUE)
  tmp <- lazyeval::all_dots(.dots, ...)
  z <- sprintf("OPTIONAL { %s } ", combine_args(tmp) %||% " ")
  dots <- comb(try_qry(.data), structure(z, type = "optional"))
  structure(list(url = .data$url, query = dots), class = "sparql_dsl")
}
