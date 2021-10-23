# Netflix Original Films & IMDB Scores Dataset

Dataset from [Netflix Original Films & IMDB Scores](./NetflixOriginals.csv)


### My Step
1. Define a question
2. Search datasets from Kaggle
3. Download Library and dataset
4. Explore the dataset from the original dataset
5. Cleaning Dataset
6. Exploratory Data Analysis

## Define a question

1. Netflix Original Films ที่มีจำนวนคะแนนใน IMDB มากที่สุุด
2. คะแนน IMDB เฉลี่ยของ Netflix Original Films แต่ละประเภท
3. Top5 จำนวน Netflix Original Films ของแต่ละภาษา 
4. คะแนน IMDB ของ Netflix Original Films ที่มากที่สุด ห่างจาก คะแนนที่น้อยที่สุดอยู่เท่าไหร่
5. Netflix Original Films มีหนังประเภทใดมากที่สุด และมีจำนวนเท่าไหร่
6. Netflix Original Films ประเภท documentary มีคะแนน IMDB เฉลี่ยอยู่ที่เท่าไหร่

## Loading library and dataset

```R
#library
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)

#DataSet
Netflix_IMDB <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/008-Netflix-Original-Films-And-IMDB-Scores/main/NetflixOriginals.csv")
```
## Change to tibble
```R
Netflix_IMDB <- as_tibble(Netflix_IMDB)
glimpse(Netflix_IMDB)
```
## Cleaning Data

```R
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
```
## Question 1

Netflix Original Films ที่มีจำนวนคะแนนใน IMDB มากที่สุุด

```R
Netflix_maxIMDB <- data.frame(Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(IMDB_Score == max(IMDB_Score)))
```

Result :

```
                                     Title IMDB_Score
1 David Attenborough: A Life on Our Planet          9
```
Netflix Original Films ที่มีจำนวนคะแนนใน IMDB มากที่สุด คือเรื่อง David Attenborough: A Life on Our Planet ซึ่งมีคะแนนใน IMDB สูงถึง 9 คะแนน 

## Question 2

Top5 จำนวน Netflix Original Films ของแต่ละภาษา 

```R
language <- Clean_Netflix_IMDB %>% select(CleanLanguage) %>% unnest(CleanLanguage)%>% 
  count(CleanLanguage)%>% arrange(desc(n)) %>% slice(1:5)
```
Result :
```
  CleanLanguage     n
  <chr>         <int>
1 English         422
2 Spanish          39
3 Hindi            35
4 French           21
5 Italian          14
```
Top5 จำนวน Netflix Original Films ของแต่ละภาษา 
อันดับ 1 English         422 เรื่อง
อันดับ 2 Spanish          39 เรื่อง
อันดับ 3 Hindi            35 เรื่อง
อันดับ 4 French           21 เรื่อง
อันดับ 5 Italian          14 เรื่อง

## Question 3

ค่าเฉลี่ย Runtime ของ Netflix Original Films ทั้งหมด

```R
meanRuntime <- data.frame(Netflix_IMDB$Runtime %>% mean())
```
Result :
```
  Netflix_IMDB.Runtime.....mean..
                            <dbl>
1                            93.6
```

## Question 4
คะแนน IMDB ของ Netflix Original Films ที่มากที่สุด ห่างจาก คะแนนที่น้อยที่สุดอยู่เท่าไหร่
```R
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == min(Netflix_IMDB$IMDB_Score)) 
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == max(Netflix_IMDB$IMDB_Score))
distanceneIMDB <- max(Netflix_IMDB$IMDB_Score)-min(Netflix_IMDB$IMDB_Score)
```
Result :
```
  value
  <dbl>
1   6.56
```
คะแนน IMDB ของ Netflix Original Films ที่มากที่สุด ห่างจาก คะแนนที่น้อยที่สุดอยู่ 6.56 คะแนน 

## Question 5 
Netflix Original Films มีหนังประเภทใดมากที่สุด และมีจำนวนเท่าไหร่
```R
countGenre <- Clean_Netflix_IMDB %>% select(CleanGenre) %>% unnest(CleanGenre)%>% 
count(CleanGenre)%>% arrange(desc(n)) %>% slice(1:1)
```
Result :
```
  CleanGenre      n
  <chr>       <int>
1 documentary   159
```
Netflix Original Films มีหนังประเภท documentary มากที่สุด และมีจำนวน 159 เรื่อง

## Question 6
Netflix Original Films ประเภท documentary มีคะแนน IMDB เฉลี่ยอยู่ที่เท่าไหร่
```R
Clean_Netflix_IMDB %>% select(CleanGenre) %>% filter(CleanGenre == "documentary") %>% summarise(mean(Clean_Netflix_IMDB$IMDB_Score))
```
Result :
```
  `mean(Clean_Netflix_IMDB$IMDB_Score)`
                                  <dbl>
1                                  6.27
```
Netflix Original Films ประเภท documentary มีคะแนน IMDB เฉลี่ยอยู่ที่ 6.27 คะแนน

