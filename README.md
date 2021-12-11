# 008-Netflix Original Films & IMDB Scores
![image](https://www.nanitalk.com/wp-content/uploads/2021/05/Netflix-Original.jpg)

Original Datasets from: [Netflix Original Films & IMDB Scores](https://www.kaggle.com/luiscorter/netflix-original-films-imdb-scores)

### About's Products Datasets

This dataset consists of all Netflix original films released as of June 1st, 2021. Additionally, it also includes all Netflix documentaries and specials. The data was webscraped off of this Wikipedia page, which was then integrated with a dataset consisting of all of their corresponding IMDB scores. IMDB scores are voted on by community members, and the majority of the films have 1,000+ reviews.

## Overview

Netflix เป็น Platform ดูหนังที่มีจำนวนผู้ใช้งานติดอันดับต้น ๆ ของประเทศไทย และอันดับต้น ๆ ของโลก โดย Netflix มีหนังที่เข้าฉายในเฉพาะ Platform ของตัวเองจึงทำให้เป็นที่นิยม และเป็นที่จับตามองของนักรีวิวต่าง ๆ และเว็บไซต์จัดอันดับที่มีอิทธิพลมากที่สุดส่งผลต่อการเลือกดูหนัง ซึ่งเปิดให้คนจากทั่วโลกเข้ามาให้คะแนนหนังที่ดูจบไปแล้ว รวมทั้งร่วมวิจารณ์บนเว็บไซต์ได้เลย นั่นก็คือ IMDB ด้วยเหตุผลเหล่านี้ พวกเราจึงอยากรู้ว่าหนังเรื่องใดใน Netflix ที่ถูกให้คะแนนมากที่สุดจากเว็บไซต์จัดอันดับนี้ รวมไปถึงอยากรู้ว่า Netflix มีหนังประเภทใดมากที่สุด ช่วงเวลาไหนที่มีการปล่อยภาพยนตร์ออกมามากที่สุดในแต่ละปี และความยาวของหนังจะส่งผลต่อการให้คะแนนของหนังหรือไม่

### Define a question
1. Netflix Original Films ที่มีจำนวนคะแนนใน IMDB มากที่สุุด
2. คะแนน IMDB เฉลี่ยของ Netflix Original Films แต่ละประเภท
3. Top5 จำนวน Netflix Original Films ของแต่ละภาษา
4. คะแนน IMDB ของ Netflix Original Films ที่มากที่สุด ห่างจากคะแนนที่น้อยที่สุดอยู่เท่าไหร่
5. Netflix Original Films มีหนังประเภทใดมากที่สุด และมีจำนวนเท่าไหร่
6. Netflix Original Films ประเภท documentary มีคะแนน IMDB เฉลี่ยอยู่ที่เท่าไหร่

### Steps

1. Define a question
2. Search datasets from Kaggle
3. Download Library and dataset
4. Explore the dataset from the original dataset
5. Cleaning Dataset
6. Exploratory Data Analysis

### Tools

- R Language
- R Studio Desktop

## Table of Contents

1. [Exploratory Data Analysis](./01_explore.md)
2. [Data Visualization](./Netflix_IMDB_Clean.csv)
3. [Analytical Inferential Statistics](./Analytical Inferential Statistics.md)

## Resources

### Important Files in Repository

- [code_eda.R](./code_eda.R) : Exploratory Data Analysis
- [products_original.csv](./NetflixOriginals.csv): Original Dataset
- [products_clean.csv](./Netflix_IMDB_Clean.csv): Clean Dataset


## About Us

งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี

### Team: TammaKratookJit
| No. | Name              | Student ID   |
|:---:|-------------------|--------------|
|  1  | ทรงสิจ สินนุรักษ์    | 63130500043|
|  2  | ธราเทพ ศิริพิศ  | 63130500055|
|  3  | ธัญกร แถลงดี    | 63130500056|
|  4  | ธีระเดช ปานคล้าย     | 63130500061|
|  5  | นภษร พัฒนะเดชา      | 63130500063|

### Instructor

- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))
