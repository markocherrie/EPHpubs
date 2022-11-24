#### climate and health example

library(easyPubMed)
new_query <- 'Climate[TIAB] AND Health[AD] AND "2022"[PDAT]' 
out.B <- batch_pubmed_download(pubmed_query_string = new_query, 
                               dest_file_prefix = "NUBL_18_", 
                               encoding = "ASCII")


new_PM_file <- out.B[[1]]
new_PM_df <- table_articles_byAuth(pubmed_data = new_PM_file, 
                                   included_authors = "first", 
                                   max_chars = 0, 
                                   encoding = "ASCII")