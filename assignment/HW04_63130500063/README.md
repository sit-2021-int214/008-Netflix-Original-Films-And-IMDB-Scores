## R-Assignment 4

Created by Napasorn Patanadecha (ID: 63130500063)

## Choose Dataset:

2. Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)

## What you need to do:

1. Explore the dataset that you have select.
2. Transform data with dplyr and finding insight the dataat least 6 issues. Show your code, result and summary in form of sentence/paragraphs.
3. Using ggplot2 to create 2 graphs and explain each graph.
4. In this part, you need to using command from tidyverse (e.g. lubridate, stringr, forcats) that not learned in class and explain this command how to used it. If you can't implement to this dataset, you can select one command and show example how to used it.
5. Do in Markdown File (md or Rmd) and push into your folder in Team Repository. (Same as Workshop I)
6. Copy link to access this folder and paste into PDF file Part A

## Step 1: Explore the dataset that you have select.
```
#library
library(dplyr)
library(readr)      
library(stringr)    
library(assertive)
library(ggplot2)

#dataset
superstore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
View(superstore)   
```

ใข้ glimps() เพื่อดูข้อมูลทั้งหมดและชนิดของข้อมูลนั้น
```
glimpse(superstore)
```

Output :
```
Rows: 9,800
Columns: 18
$ Row.ID        <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27~
$ Order.ID      <chr> "CA-2017-152156", "CA-2017-152156", "CA-2017-138688", "US-2016-108966", "US-2016-108966", "CA-201~
$ Order.Date    <chr> "08/11/2017", "08/11/2017", "12/06/2017", "11/10/2016", "11/10/2016", "09/06/2015", "09/06/2015",~
$ Ship.Date     <chr> "11/11/2017", "11/11/2017", "16/06/2017", "18/10/2016", "18/10/2016", "14/06/2015", "14/06/2015",~
$ Ship.Mode     <chr> "Second Class", "Second Class", "Second Class", "Standard Class", "Standard Class", "Standard Cla~
$ Customer.ID   <chr> "CG-12520", "CG-12520", "DV-13045", "SO-20335", "SO-20335", "BH-11710", "BH-11710", "BH-11710", "~
$ Customer.Name <chr> "Claire Gute", "Claire Gute", "Darrin Van Huff", "Sean O'Donnell", "Sean O'Donnell", "Brosina Hof~
$ Segment       <chr> "Consumer", "Consumer", "Corporate", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer", ~
$ Country       <chr> "United States", "United States", "United States", "United States", "United States", "United Stat~
$ City          <chr> "Henderson", "Henderson", "Los Angeles", "Fort Lauderdale", "Fort Lauderdale", "Los Angeles", "Lo~
$ State         <chr> "Kentucky", "Kentucky", "California", "Florida", "Florida", "California", "California", "Californ~
$ Postal.Code   <int> 42420, 42420, 90036, 33311, 33311, 90032, 90032, 90032, 90032, 90032, 90032, 90032, 28027, 98103,~
$ Region        <chr> "South", "South", "West", "South", "South", "West", "West", "West", "West", "West", "West", "West~
$ Product.ID    <chr> "FUR-BO-10001798", "FUR-CH-10000454", "OFF-LA-10000240", "FUR-TA-10000577", "OFF-ST-10000760", "F~
$ Category      <chr> "Furniture", "Furniture", "Office Supplies", "Furniture", "Office Supplies", "Furniture", "Office~
$ Sub.Category  <chr> "Bookcases", "Chairs", "Labels", "Tables", "Storage", "Furnishings", "Art", "Phones", "Binders", ~
$ Product.Name  <chr> "Bush Somerset Collection Bookcase", "Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back~
$ Sales         <dbl> 261.9600, 731.9400, 14.6200, 957.5775, 22.3680, 48.8600, 7.2800, 907.1520, 18.5040, 114.9000, 170~
```
ซึ่งในข้อมูลชุดนี้มี Rows จำนวน 9,800 และColumns จำนวน 18

ใน dataset นี้มีข้อมูลดังนี้
Row ID = ลำดับข้อมูลในdatasetนี้       
Order ID = IDของออเดอร์       
Order Date = วันที่ที่ทำการสั่งสิ้นค้า      
Ship Date = วันที่ที่ทำการจัดส่ง      
Ship Mode = รูปแบบการขนส่ง      
Customer ID = IDของลูกค้า     
Customer Name = ชื่อลูกค้า  
Segment = บอกประเภทกลุ่มของลูกค้า        
Country = ประเทศที่ลูกค้าต้องการให้ทำการจัดส่ง        
City = เมืองที่ลูกค้าต้องการให้ทำการจัดส่ง          
State = รัฐที่ลูกค้าต้องการให้ทำการจัดส่ง          
Postal Code = รหัสไปรษณีย์ของที่อยู่นั้นๆ    
Region = บอกว่าที่อยู่นั้นๆอยู่ในบีิเวณภาคใด      
Product ID = IDของสินค้า     
Category = หมวดหมู่ของสินค้า      
Sub Category = หมวดหมู่ย่อยของสินค้า
Product Name = ชื่อสินค้า
Sales = ราคาของสินค้า    

## Step 2: Transform data with dplyr and finding **insight the data** at least 6 issues. Show your code, result and summary in form of sentence/paragraphs.

- Function select() from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns

starwars %>% select(name,height)
** You can sepearate this part or combine in part of Transform data with dplyr and finding insight the data

## Step 3: Using ggplot2 to create 2 graphs and explain each graph.

1.ยอดขายรวมของแต่ละ city ที่มียอดขายรวมมากกว่า 10000 โดยเรียงยอดขายรวมจากมากไปน้อย
```
citysum <- superstore %>% 
  group_by(City) %>% 
  summarise(totalsales = sum(Sales)) %>%
  filter(totalsales > 50000) %>%
  arrange(desc(totalsales))
  
citysum 
```

Result:

```
  City          totalsales
  <chr>              <dbl>
1 New York City    252463.
2 Los Angeles      173420.
3 Seattle          116106.
4 San Francisco    109041.
5 Philadelphia     108842.
6 Houston           63956.
```


## Step 4: Using command from tidyverse(forcats)
### 1.) Graph show relation between height and mass
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()
Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````
