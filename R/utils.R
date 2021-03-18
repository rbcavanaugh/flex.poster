library(shiny)

#' get authors
#'
#' @description
#' utility fuctions for getting authors from metadata
#' @export
authors<- function(){
  len = length(meta$author)
  ls = list()
  for(i in 1:len){
    ls[[i]] = paste0(
      meta$author[[i]]$name, tags$sup(meta$author[[i]]$affil)
    )
  }

  together = toString(unlist(ls))
  no_commas = gsub(',', '', together)
  with_header = paste0('<h3>', no_commas, '</h3>')

  return(with_header)
}

#' get affilitations
#'
#' @description
#' utility fuctions for getting affiliations from metadata
#' @export
affiliations<- function(){
  len = length(meta$affiliation)
  ls = list()
  for(i in 1:len){
    ls[[i]] = paste0(
      tags$sup(meta$affiliation[[i]]$num), meta$affiliation[[i]]$address
    )
  }

  together = toString(unlist(ls))
  no_commas = gsub(',', '', together)
  with_header = paste0('<h3>', no_commas, '</h3>')

  return(with_header)
}
