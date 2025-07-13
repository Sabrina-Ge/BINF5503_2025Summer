library(wordcloud)

# Generate word-frequency table
responses <- lapply(list.files("Practice_Problem", full.names = TRUE), 
                    scan, what = character(), sep = " ")

responses_cleaned <- gsub("[.,!]", "", tolower(unlist(responses)))
responses_cleaned <- responses_cleaned[responses_cleaned != ""]

all_word_counts <- as.data.frame(sort(table(responses_cleaned), decreasing = TRUE),
                                 stringsAsFactors = FALSE)

print(all_word_counts)

# Create word cloud
set.seed(1)
wordcloud(words = all_word_counts$responses_cleaned, 
          freq = all_word_counts$Freq, min.freq = 1)

# Filter to words that are at least 4 characters long
filtered_word_counts <- all_word_counts[nchar(all_word_counts$responses_cleaned) > 3, ]
set.seed(1)
wordcloud(words = filtered_word_counts$responses_cleaned, 
          freq = filtered_word_counts$Freq, min.freq = 1)
