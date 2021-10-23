# Library
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)

install.packages("ggplot2")
library(ggplot2)

# Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")


View(dataset)


dataset %>% arrange(Sales)


dataset %>% count(`Postal Code` == "42420")

dataset$Sales %>% max()

meansales <- data.frame(dataset$Sales %>% mean())
meansales

dataset$`Customer Name` %>% head(50)

MAXsales <- dataset$Sales %>% max()
MINsales <- dataset$Sales %>% min()
MAXsales - MINsales




scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()



kuymaeyed <- dataset %>% ggplot(aes(x=Region)+
  geom_bar())

kuymaeyed+geom_bar()


ggplot(dataset,aes(x=Region))+geom_bar()+ggtitle("Amount of Region")+ylab("Sum Of Region")


AMST <- dataset %>% head(20) %>% ggplot(aes(x=State))+geom_bar()+ggtitle("Amount of State")+ylab("Sum Of State")
AMST


