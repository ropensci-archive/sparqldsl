#' PREFIX
#'
#' @export
#' @param .data input. This can be JSON input, or an object of class
#' \code{sparql_dsl} that has JSON and query params combined, which is passed
#' from function to function when using the sparqldsl DSL.
#' @param .dots Used to work around non-standard evaluation
#' @param ... (logical) named prefixes
#' @examples \dontrun{
#' ### PREFIX cito: <http://purl.org/spar/cito/>
#' x <- sparql_dsl("http://dbpedia.org/sparql")
#' x %>% prefix(cito = "http://purl.org/spar/cito/") %>% inspect
#' x %>% select() %>% prefix(dcterms = "http://purl.org/dc/terms/") %>% inspect
#' x %>% prefix(cito = "http://purl.org/spar/cito/", dcterms = "http://purl.org/dc/terms/") %>% inspect
#' }
prefix <- function(.data, ...) {
  prefix_(.data, .dots = lazyeval::lazy_dots(...))
}

#' @export
#' @rdname prefix
prefix_ <- function(.data, ..., .dots) {
  #pipe_autoexec(toggle = TRUE)
  tmp <- lazyeval::all_dots(.dots, ...)
  z <- Map(function(a, b) sprintf("PREFIX %s: <%s>", b, a$expr), tmp, names(tmp))
  if (length(z) != 0) z <- as.list(unlist(z, FALSE))
  dots <- comb(try_qry(.data), structure(z, type = "prefix"))
  structure(list(url = .data$url, query = dots), class = "sparql_dsl")
}
