library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)

# Step 1: Load data
Netflix_IMDB <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/008-Netflix-Original-Films-And-IMDB-Scores/main/NetflixOriginals.csv")

# Step 2: Change to tibble
Netflix_IMDB <- as_tibble(Netflix_IMDB)
glimpse(Netflix_IMDB)


# Step 3: Cleaning Data
Netflix_IMDB$Title <- Netflix_IMDB$Title %>% str_remove("???")

Netflix_IMDB <- Netflix_IMDB %>% rename(IMDB_Score=`IMDB Score`)
Netflix_IMDB$Genre <- as.factor(Netflix_IMDB$Genre)

# 1 
Netflix_maxIMDB <- data.frame(Netflix_IMDB %>% filter(`IMDB Score` == max(`IMDB Score`)))
as_tibble(Netflix_maxIMDB)

# 2
GenreIMDBmean <- data.frame(Netflix_IMDB %>% group_by(Genre) %>% summarise_at(vars(`IMDB Score`), list(meanIMDB = mean)))
as_tibble(GenreIMDBmean)

# 3
movie_language <- data.frame(Netflix_IMDB %>%count(Language))
as_tibble(movie_language)

# 4
meanRuntime <- data.frame(Netflix_IMDB$Runtime %>% mean())
as_tibble(meanRuntime)

# 5
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == min(Netflix_IMDB$IMDB_Score)) 
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == max(Netflix_IMDB$IMDB_Score))
distanceneIMDB <- max(Netflix_IMDB$IMDB_Score)-min(Netflix_IMDB$IMDB_Score)
as_tibble(distanceneIMDB)

# 6
quantityGenre <- Netflix_IMDB %>% count(Genre)
as_tibble(quantityGenre)
quantityGenre %>% select(Genre,n) %>% filter(n == max(n))

# 7 


##Checkpoint 1
write.csv(Netflix_IMDB,"c:/Users/Admin/Desktop/int214/008-Netflix-Original-Films-And-IMDB-Scores/Netflix_IMDB_Clean.csv",row.names=FALSE)
