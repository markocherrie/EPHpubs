# 
library(scholar)
MC <- "m1Fw9UgAAAAJ"
ML <- "5642OgoAAAAJ"
WM <- "jdTSauAAAAAJ"


Mark.pubs <- get_publications(MC)
Miranda.pubs <- get_publications(ML)
Will.pubs <- get_publications(WM)


EPH.pubs<-do.call(rbind, list(Mark.pubs, Miranda.pubs, Will.pubs))
EPH.pubs$citation <- paste0(EPH.pubs$author, " (",EPH.pubs$year,") ", EPH.pubs$title,".", EPH.pubs$journal,", ", EPH.pubs$number)
EPH.pubs$citation<-gsub("[^[:print:]]","",EPH.pubs$citation)
EPH.pubs<-EPH.pubs[!duplicated(EPH.pubs$citation),]

write.csv(EPH.pubs, "EPH.pubs.csv", row.names=F)

#EPH.pubs<-EPH.pubs[EPH.pubs$year==2019,]
EPH.pubs<-EPH.pubs[!is.na(EPH.pubs$year),]

EPH.pubs <- EPH.pubs[order(-EPH.pubs$year),]
EPH.pubs<-subset(EPH.pubs, select=c("citation"))
rownames(EPH.pubs) <- 1:nrow(EPH.pubs)

fileConn<-file("EPHoutput.html")
writeLines(knitr::kable(EPH.pubs, format="html"), fileConn)
close(fileConn)


write_csv(PHP.pubs, "data/PHPpubs240919.csv")