#' SPARQL dsl
#'
#' @export
#' @param behavior Behavior of the error. See Details
#' @details
#' \strong{Methods}
#' \describe{
#'  \item{\code{xx}}
#' }
#'
#' @format NULL
#' @usage NULL
#' @examples \dontrun{
#' (x <- SparqlDsl$new(url = "http://dbpedia.org/sparql"))
#' x$url
#'
#' # ask
#' x$ask(c("s", "p", "o"))
#'
#' # select
#' # SELECT * WHERE { ?s ?p ?o } OFFSET 100 LIMIT 10
#' x$select$where([:s, :p, :o]).offset(100).limit(10)
#' }
SparqlDsl <- R6::R6Class(
  "SparqlDsl",
  public = list(
    url = "https://query.wikidata.org/bigdata/namespace/wdq/sparql",

    initialize = function(url) {
      if (!missing(url)) self$url <- url
    },

    print = function(...) {
      cat("<GeneWiki SPARQL DSL>", sep = "\n")
      cat("  stuff: ...", sep = "\n")
      invisible()
    },

    ask = function(x, ...) {
      query <- sprintf("ASK WHERE { %s }", paste("?", x, sep = "", collapse = " "))
      sparql_GET(self$url, query, ...)$boolean
    },

    select = list(
      where = function() {
        "fart"
      }
    )
  )
)
