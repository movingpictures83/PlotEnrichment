knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE, fig.width = 8)
library(lipidr)
library(ggplot2)


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
	pdf(outputfile)
   de_results <- readRDS(paste(pfix, parameters["de", 2], sep="/"))
   enrich_results <- readRDS(paste(pfix, parameters["en", 2], sep="/"))
plot_enrichment(de_results, significant_lipidsets(enrich_results), annotation=parameters["an", 2])

}
