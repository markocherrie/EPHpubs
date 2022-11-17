#### pubmed

library(easyPubMed)

my_query <- "Mark Cherrie[AU]"
my_entrez_id <- get_pubmed_ids(my_query)
my_abstracts_txt <- fetch_pubmed_data(my_entrez_id, format = "abstract")

my_abstracts_xml <- fetch_pubmed_data(my_entrez_id, format="xml")

titles <- custom_grep(my_abstracts_xml, "ArticleTitle", "char")
abstracts <- custom_grep(my_abstracts_xml, "AbstractText", "char")
keywords <- custom_grep(my_abstracts_xml, "AbstractText", "char")

MarkPapers<-cbind(titles, abstracts)
write.csv(MarkPapers, "output/MarkPapers.csv", row.names = F)

# alternative
marko_abstracts_list <- articles_to_list(my_abstracts_xml)
onearticle<-article_to_df(marko_abstracts_list[[1]], autofill = FALSE,
              max_chars = 500, getKeywords = T,
              getAuthors = TRUE)
write.csv(onearticle, "output/MarkonePaper.csv", row.names = F)

