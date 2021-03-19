#' Utility functions for generating title box.
#'
#' @description
#' utility functions for generating title box
#' @export
title <- function(){
  if(exists("rmarkdown::metadata")){
    meta = rmarkdown::metadata
    paste0('<h2 id=poster_title>',meta$title,'</h2>')
  }
}

#' Utility functions for generating authors.
#' @description
#' utility functions for generating title box
#' @export
authors<- function(){
  if(exists("rmarkdown::metadata")){
    meta = rmarkdown::metadata
    len = length(meta$author)
    ls = list()
    for(i in 1:len){
      ls[[i]] = paste0(
        meta$author[[i]]$name, shiny::tags$sup(meta$author[[i]]$affil), htmltools::HTML('&nbsp')
      )
    }

    together = toString(unlist(ls))
    no_commas = gsub(',', '', together)
    with_header = paste0('<h4 id=poster_authors>', no_commas, '</h4>')

    return(with_header)
  }
}

#' Utility functions for generating affilitations.
#' @description
#' utility functions for generating title box
#' @export
affiliations<- function(){
  if(exists("rmarkdown::metadata")){
    meta = rmarkdown::metadata
    len = length(meta$affiliation)
    ls = list()
    for(i in 1:len){
      ls[[i]] = paste0(
        shiny::tags$sup(meta$affiliation[[i]]$num), meta$affiliation[[i]]$address, htmltools::HTML('&nbsp')
      )
    }

    together = toString(unlist(ls))
    no_commas = gsub(',', '', together)
    with_header = paste0('<p style = "color:white; text-align:center; font-style:italic;">', no_commas, '</p>')

    return(with_header)
  }
}

title_box <- shiny::div(htmltools::HTML(
  title(),
  authors(),
  affiliations()
)
)
