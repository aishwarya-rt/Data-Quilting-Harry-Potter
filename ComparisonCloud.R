
library(dplyr)
library(tidytext)
install.packages("RSentiment")
library(RSentiment)
install.packages("wordcloud")
library(wordcloud)
install.packages("wordcloud2")
library(wordcloud2)
install.packages("tm")
library(tm)
library(tidyverse)
library(reshape2)
library(radarchart)
install.packages("textstem")
library(textstem)
scripts<-read.csv("Lemmatized.csv")
my_text <- scripts %>% select(Narrative_Lemma)

my_corpus <- my_text

my_corpus <- my_corpus %>% rename(text = Narrative_Lemma)  %>% mutate(doc_id = rownames(my_text))

my_corpus <- Corpus(DataframeSource(my_corpus))

my_dtm <- as.matrix(DocumentTermMatrix(my_corpus))

my_tdm <- as.matrix(TermDocumentMatrix(my_corpus))

my_tfidf <- as.matrix(DocumentTermMatrix(my_corpus, control = list(weighting = weightTfIdf)))

scripts <- scripts %>% select(Speaker, Listener, Narrative_Lemma)

colnames(scripts)<- c("Character1", "Character2", "dialogue")

freq = data.frame(sort(colSums(as.matrix(my_tfidf)), decreasing=TRUE))
freg= (-c("ahh"))
wordcloud(rownames(freq), freq[,1], max.words=100, colors=brewer.pal(5, "Reds"))
#most relevant words using tfidf in word cloud


topHarrypottercharacter <- as.data.frame(sort(table(scripts$Character1), decreasing=TRUE))[1:12,]
#12 characters with the most lines


ggplot(data=topHarrypottercharacter, aes(x=Var1, y=Freq)) +
  geom_bar(stat="identity", fill="#D95F02", colour="black") +
  theme_bw() +
  theme(axis.text.x=element_text(angle=30, hjust=1)) +
  labs(x="Character", y="Number of Lines")
#histogram with number of lines


tokens <- scripts %>%  
  mutate(dialogue=as.character(scripts$dialogue)) %>%
  unnest_tokens(word, dialogue)
#store every word as a token

install.packages("reshape2")
library(reshape2)

tokens %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort=TRUE) %>%
  acast(word ~ sentiment, value.var="n", fill=0) %>%
  comparison.cloud(colors=c("#F8766D", "#00BFC4"), max.words=100)

#Polarity cloud on entire script using tidy text
