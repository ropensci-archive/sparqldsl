sparqldsl
=========



A SPARQL DSL

## Install

Development version


```r
devtools::install_github("ropenscilabs/sparqldsl")
```


```r
library("sparqldsl")
```

For examples we'll use DBpedia

## ask


```r
sparql_dsl("http://dbpedia.org/sparql") %>% ask(s, p, o)
#> [1] TRUE
```

## select


```r
sparql_dsl("http://dbpedia.org/sparql") %>%
  select() %>%
  where(s, p, o) %>%
  limit(10)
#>    s.type
#> 1     uri
#> 2     uri
#> 3     uri
#> 4     uri
#> 5     uri
#> 6     uri
#> 7     uri
#> 8     uri
#> 9     uri
#> 10    uri
#>                                                                         s.value
#> 1                    http://www.openlinksw.com/virtrdf-data-formats#default-iid
#> 2           http://www.openlinksw.com/virtrdf-data-formats#default-iid-nullable
#> 3           http://www.openlinksw.com/virtrdf-data-formats#default-iid-nonblank
#> 4  http://www.openlinksw.com/virtrdf-data-formats#default-iid-nonblank-nullable
#> 5                        http://www.openlinksw.com/virtrdf-data-formats#default
#> 6               http://www.openlinksw.com/virtrdf-data-formats#default-nullable
#> 7                    http://www.openlinksw.com/virtrdf-data-formats#sql-varchar
#> 8           http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-nullable
#> 9                 http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-dt
#> 10       http://www.openlinksw.com/virtrdf-data-formats#sql-varchar-dt-nullable
#>    p.type                                         p.value o.type
#> 1     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 2     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 3     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 4     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 5     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 6     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 7     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 8     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 9     uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#> 10    uri http://www.w3.org/1999/02/22-rdf-syntax-ns#type    uri
#>                                                    o.value
#> 1  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 2  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 3  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 4  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 5  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 6  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 7  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 8  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 9  http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
#> 10 http://www.openlinksw.com/schemas/virtrdf#QuadMapFormat
```

## Open citations methods


```r
oc_doi2ids("10.1097/igc.0000000000000609")
#>    type                           value
#> 1 paper https://w3id.org/oc/corpus/br/1
#> 2  pmid                        26645990
#> 3 pmcid                      PMC4679344
#> 4   doi    10.1097/igc.0000000000000609
oc_pmid2ids("26645990")
#>    type                           value
#> 1 paper https://w3id.org/oc/corpus/br/1
#> 2   doi    10.1097/igc.0000000000000609
#> 3 pmcid                      PMC4679344
#> 4  pmid                        26645990
oc_pmcid2ids("PMC4679344")
#>    type                           value
#> 1 paper https://w3id.org/oc/corpus/br/1
#> 2   doi    10.1097/igc.0000000000000609
#> 3  pmid                        26645990
#> 4 pmcid                      PMC4679344
```

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/sparqldsl/issues)
* License: MIT
* Get citation information for `sparqldsl` in R doing `citation(package = 'sparqldsl')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
