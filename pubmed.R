#### pubmed

library(easyPubMed)

my_query <- "Institute of Occupational Medicine[affil] AND
             Edinburgh[affil]"
my_entrez_id <- get_pubmed_ids(my_query)
my_abstracts_txt <- fetch_pubmed_data(my_entrez_id, format = "abstract")

my_abstracts_xml <- fetch_pubmed_data(my_entrez_id, format="xml")

titles <- custom_grep(my_abstracts_xml, "ArticleTitle", "char")
abstracts <- custom_grep(my_abstracts_xml, "AbstractText", "char")
keywords <- custom_grep(my_abstracts_xml, "AbstractText", "char")

IOMPapers<-cbind(titles, keywords)
#write.csv(MarkPapers, "output/MarkPapers.csv", row.names = F)

# alternative
marko_abstracts_list <- articles_to_list(my_abstracts_xml)
allarticles<-NA
for(i in 1:(length(marko_abstracts_list))){
onearticle<-article_to_df(marko_abstracts_list[[i]], autofill = FALSE,
              max_chars = -1, getKeywords = T,
              getAuthors = TRUE)
allarticles<-rbind(allarticles, onearticle)
}

#write.csv(allarticles, "output/IOMPapers.csv", row.names = F)

