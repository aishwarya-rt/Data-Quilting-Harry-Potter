# Data-Quilting-Harry-Potter
Identified the most popular actors by creating a Social Network of all the characters and applying Sentiment Analysis on the reviews of various audiences using R. Predicted the popularity of upcoming movies by performing Regression Analysis on the box office numbers from various parts of the world. 

Data Quilting : https://www.tandfonline.com/doi/full/10.1080/23311975.2019.1629095

Synopsis : Chapter 4 (Harry Potter and the Goblet of Fire) The key story of this episode is developed along with the Triwizard Tournament, which led to an important turning point of the series – to mark the return of Voldemort. 
Concerning the tournament, champions from 3 different wizarding academies, including Hogwards, gather to complete for one thousand galleons.
The twist is that, to enter the competition, students need to put their names into the goblet of fire; and only those over 17 years old are qualified to do so. However, mysteriously and magically, Harry’s name was placed into the goblet of fire and thus, he had to unwilling participate in the tournament.
Throughout the tournament, Harry and other 3 champions had to go through several tasks, which involved dragon in the first round, rescuing beloved under the lake in the second round, and a hedge maze in the final one. Harry was guided during the tournament by Alastor Mad Eye Moody.
The secret was revealed in the final round. Moody turns out to be one of Voldemort’s supporters named Barty Crouch Jr in disguise. He used the tournament to bring Harry to Voldemort. Although Harry managed to escape, Cedric – a participant in the tournament was killed. Voldemort re-enters the Wizarding World with a physical body.

Text Mining : Most frequency words and wordcloud.
harry & potter take a huge portion on the list. He is the main character in the movie.
But he appears too many times, 119 times in total, which dwarf other key words, so we remove them.
Stopwords, like “know”, “get”, show many times, but seem to not give us useful info. Can not identify the sentiment based on this kind of words solely. 
SMART stopword list, has a wider coverage, and contain these words


Social Network Analysis: Harry is the central character. All the characters in the story are related to him, except for the old man and the kids – they appear in Harry’s dream at the beginning of the movie. 
At first glance, those with most conversations with Harry: Dumbledore, Ron, Mad Eye, Hermione, Cedric. Next comes Sirius, Voldemort. 
Most of the conversations of the movie are among these above-mentioned characters.
Other characters seem to appear very few times and do not contribute significantly to the development of the story.


Sentiment Analysis: Perfomed the sentiment analysis on 2 characters at a time using the Rsentiment package. Used the NRC lexicon to see the frequencies of various sentiments in the movie. Used the Bing lexicon to capsture all the negative and positive words in the movie. Used the Harry potter package available in the Git repository to download the 7 Harry potter books into R and performed a sentiment analysis on all the books to see the negative and positive trends.


Business Question : Is there any relationship between 
the sentiment of Harry Potter series 
and book sales & box office revenues?

Numeric Analysis: Compared the positiveness or the negativeness to the box office sales in the movie and the those to the Book sales. 

See the attached PPT for the results
 
