#' Paging
#'
#' @export
#' @rdname paging
#' @param .data input. This can be JSON input, or an object of class
#' \code{sparql_dsl} that has JSON and query params combined, which is passed
#' from function to function when using the sparqldsl DSL.
#' @param offset (numeric|integer) an offset value
#' @param limit  (numeric|integer) a limit value
offset <- function(.data, offset = 0) {
  pipe_autoexec(toggle = TRUE)
  if (!class(offset) %in% c('numeric', 'integer')) stop('offset must be numeric or integer', call. = FALSE)
  z <- sprintf("OFFSET %s ", offset)
  dots <- comb(try_qry(.data), structure(z, type = "offset"))
  structure(list(url = .data$url, query = dots), class = "sparql_dsl")
}

#' @export
#' @rdname paging
limit <- function(.data, limit = 10) {
  pipe_autoexec(toggle = TRUE)
  if (!class(limit) %in% c('numeric', 'integer')) stop('limit must be numeric or integer', call. = FALSE)
  z <- sprintf("LIMIT %s ", limit)
  dots <- comb(try_qry(.data), structure(z, type = "limit"))
  structure(list(url = .data$url, query = dots), class = "sparql_dsl")
}

