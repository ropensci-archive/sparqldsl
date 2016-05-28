#' ASK
#'
#' @export
#' @template args
#' @examples \dontrun{
#' ### should separate where from within ask, so ask() %>% where()
#' sparql_dsl("http://dbpedia.org/sparql") %>% ask(s, p, o)
#' }
ask <- function(.data, ...) {
  ask_(.data, .dots = lazyeval::lazy_dots(...))
}

#' @export
#' @rdname ask
ask_ <- function(.data, ..., .dots) {
  pipe_autoexec(toggle = TRUE)
  tmp <- lazyeval::all_dots(.dots, ...)
  z <- sprintf("ASK WHERE { %s }", combine_args(tmp))
  dots <- comb(tryargs(.data), structure(z, type = "ask"))
  structure(list(url = .data$url, query = dots), class = "sparql_dsl")
}
