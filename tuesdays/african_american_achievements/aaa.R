# African american achievements 
# EM Sogin 


# load packages
library(tidyr)
library(dplyr)
library(ggplot2)
library(tidytext)
library(wordcloud2)
library(htmlwidgets)
library(webshot)

webshot::install_phantomjs()


# load data
firsts <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-09/firsts.csv')
head(firsts)


# convert accomplishment to text
acc<-firsts %>% 
  select(accomplishment) %>% unnest_tokens(word,accomplishment) %>% 
  anti_join(stop_words) %>% 
  count(word,sort=T) %>% filter(n<400) 
head(acc)

my_graph<-wordcloud2(acc, figPath = "~/Desktop/blm.jpg",size = 1.5, color = "#B5D6B2", backgroundColor="#black")
saveWidget(my_graph,"tmp.html",selfcontained = F)
webshot("tmp.html","blm_words.png", delay =5, vwidth = 480, vheight=480) # changed to png. 
