install.packages("RSentiment")
library(RSentiment)
importantConvos<-read.csv("Lemmatized.csv")
ScriptSentiment<- importantConvos$Narrative_Lemma
calculate_total_presence_sentiment(ScriptSentiment)
#sentiment analysis on entire script using RSentiment

scripts <- read.csv("Lemmatized.csv")

Harry<- subset(scripts, Speaker== "HARRY")
#seperate Harrys lines from the script
harrysentiment<- Harry$Narrative_Lemma
#seperate Harry's diologue
calculate_total_presence_sentiment(harrysentiment)
#sentiment analysis on all of Harrys lines

Ron<- subset(scripts, Speaker == "RON")
#separate Rons lines
ronsentiment<- Ron$Narrative_Lemma
#seperate the words
calculate_total_presence_sentiment(ronsentiment)
#sentiment of Rons lines


RontoHarry<- subset(Ron, Listener == "HARRY")
#instances where Harry is speaking to Ron
HarrytoRonSentiment<- RontoHarry$Narrative_Lemma
#seperate all dialogue from Harry speaking to Ron
calculate_total_presence_sentiment(HarrytoRonSentiment)
#Sentiment analysis on Harry to Ron lines


count.data <- data.frame(
  class = c("Positive", "Negative","Neutral"),
  n = c(8,15,9),
  prop = c(25,46.8,28.1)
)
count.data

count.data <- count.data %>%
  arrange(desc(class)) %>%
  mutate(lab.ypos = cumsum(prop) - 0.5*prop)
count.data

mycols <- c("#d80000", "#00468b", "#008b00")

ggplot(count.data, aes(x = "", y = prop, fill = class)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0)+
  geom_text(aes(y = lab.ypos, label = prop), color = "white")+
  scale_fill_manual(values = mycols) + labs(x = NULL, y = NULL, fill = NULL, 
                                            title = "Harry - Ron") + theme_classic() + theme(axis.line = element_blank(),
                                                                                             axis.text = element_blank(),
                                                                                             axis.ticks = element_blank(),
                                                                                             plot.title = element_text(hjust = 0.5, color = "#666666")) +
  
  theme_void()
