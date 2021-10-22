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
3. Netflix Original Films ของแต่ละภาษามีกี่เรื่อง
4. ค่าเฉลี่ย Runtime ของ Netflix Original Films ทั้งหมด
5. คะแนน IMDB ของ Netflix Original Films ที่มากที่สุด ห่างจาก คะแนนที่น้อยที่สุดอยู่เท่าไหร่
6. Netflix Original Films มีหนังประเภทใดมากที่สุด และมีจำนวนเท่าไหร่

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
Netflix_IMDB$Title <- Netflix_IMDB$Title %>% str_remove("???")

Netflix_IMDB <- Netflix_IMDB %>% rename(IMDB_Score=`IMDB Score`)
Netflix_IMDB$Genre <- as.factor(Netflix_IMDB$Genre)
```
## Question 1

Netflix Original Films ที่มีจำนวนคะแนนใน IMDB มากที่สุุด

```R
Netflix_maxIMDB <- Netflix_IMDB %>% filter(IMDB_Score == max(IMDB_Score))
Netflix_maxIMDB
```

Result :

```
Title                                    Genre       Premiere        Runtime `IMDB Score` Language
  <chr>                                    <chr>       <chr>             <dbl>        <dbl> <chr>   
1 David Attenborough: A Life on Our Planet Documentary October 4, 2020      83            9 English 
```
-Summary <br>
Netflix Original Films ที่มีจำนวนคะแนนใน IMDB มากที่สุุด คือเรื่อง David Attenborough: A Life on Our Planet ซึ่งมีคะแนนใน IMDB สูงถึง 9 คะแนน 


## Question 2

คะแนน IMDB เฉลี่ยของหนังแต่ละประเภท

```R
GenreIMDBmean <- Netflix_IMDB %>% group_by(Genre) %>% summarise_at(vars(IMDB_Score), list(meanIMDB = mean))
GenreIMDBmean
```
Result :
```
   Genre                  meanIMDB
   <chr>                     <dbl>
 1 Action                     5.41
 2 Action-adventure           7.3 
 3 Action-thriller            6.13
 4 Action comedy              5.42
 5 Action thriller            6.4 
 6 Action/Comedy              5.4 
 7 Action/Science fiction     5.4 
 8 Adventure                  6.3 
 9 Adventure-romance          6.1 
10 Adventure/Comedy           5.5 
# ... with 105 more rows
```


## Question 3

หนังของแต่ละภาษามีกี่เรื่อง

```R
movie_language <- Netflix_IMDB %>% mutate(
  NFlanguage = strsplit(as.character(Netflix_IMDB$Language),"/"),
  NFlanguage = lapply(NFlanguage, gsub, pattern = " ", replacement = "")
)

language <- movie_language %>% select(NFlanguage) %>% unnest(NFlanguage)%>% 
  count(NFlanguage)%>% arrange(desc(n))
```
Result :
```
   NFlanguage     n
   <chr>      <int>
 1 English      422
 2 Spanish       39
 3 Hindi         35
 4 French        21
 5 Italian       14
 6 Portuguese    12
 7 Indonesian     9
 8 Japanese       8
 9 Korean         7
10 German         5
# ... with 22 more rows
```

## Question 4
ค่าเฉลี่ย Runtime ของหนังทั้งหมด
```R
meanRuntime <- data.frame(Netflix_IMDB$Runtime %>% mean())
```
Result :
```
  Netflix_IMDB.Runtime.....mean..
                            <dbl>
1                            93.6
```

## Question 5 
คะแนน IMDB ของ Netflix Original Films ที่มากที่สุด ห่างจาก คะแนนที่น้อยที่สุดอยู่เท่าไหร่

```R
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == min(Netflix_IMDB$IMDB_Score)) 
Netflix_IMDB %>% select(Title,IMDB_Score) %>% filter(Netflix_IMDB$IMDB_Score == max(Netflix_IMDB$IMDB_Score))
max(Netflix_IMDB$IMDB_Score)-min(Netflix_IMDB$IMDB_Score)
```
Result :
```
  value
  <dbl>
1   6.5
```

## Question 6
Netflix Original Films มีหนังประเภทใดมากที่สุด และมีจำนวนเท่าไหร่
```R
Netflix <- Netflix_IMDB %>% mutate(
  movieGenre = strsplit(as.character(Netflix_IMDB$Genre)," "),
  movieGenre = lapply(movieGenre, gsub, pattern = " ", replacement = "")
)
View(Netflix)

Netflix2 <- Netflix %>% mutate(
  NetflixGenre = strsplit(as.character(Netflix$movieGenre),"/"),
  NetflixGenre = lapply(NetflixGenre, gsub, pattern = " ", replacement = "")
)

View(Netflix2)

FinalNetflix <- Netflix2 %>% mutate(
  Netflix_Genre = strsplit(as.character(Netflix2$NetflixGenre),"-"),
  Netflix_Genre = lapply(Netflix_Genre, gsub, pattern = " ", replacement = "")
)
View(FinalNetflix)

FinalNetflix %>% select(Netflix_Genre) %>% unnest(Netflix_Genre)%>% 
  count(Netflix_Genre)%>% arrange(desc(n))%>% View()

```
Result :
```
Genre           n
  <chr>       <int>
1 Documentary   159

![Caption](image1.png)
```
