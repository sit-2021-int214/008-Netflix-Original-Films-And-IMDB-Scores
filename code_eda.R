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
Netflix_IMDB <- Netflix_IMDB %>% rename(IMDB_Score=`IMDB Score`)
Netflix_IMDB$Genre <- gsub('Science fiction','Science',Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('Heist film','Heist',Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('Family film','Family' ,Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('Romance','Romantic' ,Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('Sports film','Sports' ,Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('Concert film','Concert' ,Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('Making-of','MakingOf' ,Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('Coming-of-age','ComingOfAge comedy-drama' ,Netflix_IMDB$Genre)
Netflix_IMDB$Genre <- gsub('One-man show','OneMan show' ,Netflix_IMDB$Genre)
Netflix_IMDB <- Netflix_IMDB %>% mutate(
  CleanGenre = strsplit(as.character(Netflix_IMDB$Genre)," |/|-"),
  CleanGenre = lapply(CleanGenre, gsub, pattern = " ", replacement = ""),
  CleanGenre = lapply(CleanGenre, tolower),
  CleanLanguage = strsplit(as.character(Netflix_IMDB$Language),"/"),
  CleanLanguage = lapply(CleanLanguage, gsub, pattern = " ", replacement = "")
)

Netflix_IMDB$Genre <- as.factor(Netflix_IMDB$Genre)

# 1 
Netflix_maxIMDB <- data.frame(Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(IMDB_Score == max(IMDB_Score)))
as_tibble(Netflix_maxIMDB)

# 2
Netflix_IMDB %>% select(CleanGenre) %>% filter(CleanGenre == "documentary") %>% summarise(mean(Netflix_IMDB$IMDB_Score))

# 3
meanRuntime <- data.frame(Netflix_IMDB$Runtime %>% mean())
as_tibble(meanRuntime)

# 4
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == min(Netflix_IMDB$IMDB_Score)) 
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == max(Netflix_IMDB$IMDB_Score))
distanceneIMDB <- max(Netflix_IMDB$IMDB_Score)-min(Netflix_IMDB$IMDB_Score)
as_tibble(distanceneIMDB)

# 5 
countGenre <- Netflix_IMDB %>% select(CleanGenre) %>% unnest(CleanGenre)%>% 
  count(CleanGenre)%>% arrange(desc(n)) %>% slice(1:1)
as_tibble(countGenre)

# 6
language <- Netflix_IMDB %>% select(CleanLanguage) %>% unnest(CleanLanguage)%>% 
  count(CleanLanguage)%>% arrange(desc(n)) %>% slice(1:5)
as_tibble(language)

##Checkpoint 1
write.csv(Netflix_IMDB,"C\\Users\\USER\\Desktop\\008-Netflix-Original-Films-And-IMDB-Scores\\Netflix_IMDB_Clean.csv",row.names=FALSE)
