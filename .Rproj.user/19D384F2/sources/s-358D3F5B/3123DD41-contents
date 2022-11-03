# library
library(scholar)

# put the id's heere
MC <- "m1Fw9UgAAAAJ"
ML <- "5642OgoAAAAJ"
WM <- "jdTSauAAAAAJ"

# function to get teh data
Mark.pubs <- get_publications(MC)
Miranda.pubs <- get_publications(ML)
Will.pubs <- get_publications(WM)

# add them togeher
EPH.pubs<-do.call(rbind, list(Mark.pubs, Miranda.pubs, Will.pubs))

# create the combined citation - edit to give what you want 
EPH.pubs$citation <- paste0(EPH.pubs$author, " (",EPH.pubs$year,") ", EPH.pubs$title,".", EPH.pubs$journal,", ", EPH.pubs$number)
# format citation 
EPH.pubs$citation<-gsub("[^[:print:]]","",EPH.pubs$citation)
# Important - remove duplicates, will happen a lot as we work together on papers
EPH.pubs<-EPH.pubs[!duplicated(EPH.pubs$citation),]
# write the data at this point
write.csv(EPH.pubs, "EPH.pubs.csv", row.names=F)

# aside --- have a look at fave journals
library(dplyr)
EPH.pubs %>%
  count(journal, sort = TRUE)

# if you only want current for the webpage
#EPH.pubs<-EPH.pubs[EPH.pubs$year==2019,]
# take out those with no year
# could have more exclusion criteria --- conference abstracts?
EPH.pubs<-EPH.pubs[!is.na(EPH.pubs$year),]
# create order based on year
EPH.pubs <- EPH.pubs[order(-EPH.pubs$year),]
# remove the citation
EPH.pubs<-subset(EPH.pubs, select=c("citation"))
# create an id
rownames(EPH.pubs) <- 1:nrow(EPH.pubs)

# export as an html for use in website
fileConn<-file("EPHoutput.html")
writeLines(knitr::kable(EPH.pubs, format="html"), fileConn)
close(fileConn)
