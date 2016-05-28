#' SELECT
#'
#' @export
#' @template args
#' @examples \dontrun{
#' ### SELECT * WHERE { ?s ?p ?o } OFFSET 100 LIMIT 10
#' ### query = sparql.select.where([:s, :p, :o]).offset(100).limit(10)
#' sparql_dsl("http://dbpedia.org/sparql") %>%
#'  select() %>%
#'  where(s, p, o) %>%
#'  limit(10)
#' }
select <- function(.data, ..., distinct = FALSE) {
  select_(.data, .dots = lazyeval::lazy_dots(...))
}

#' @export
#' @rdname select
select_ <- function(.data, ..., .dots, distinct = FALSE) {
  pipe_autoexec(toggle = TRUE)
  tmp <- lazyeval::all_dots(.dots, ...)
  distinct <- if (distinct) "DISTINCT " else ""
  z <- sprintf("SELECT %s%s", distinct, combine_args(tmp) %||% "* ")
  dots <- comb(try_qry(.data), structure(z, type = "select"))
  structure(list(url = .data$url, query = dots), class = "sparql_dsl")
}
