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

1. แสดงยอดขายรวมทั้งหมดของแต่ละ city ที่มียอดขายรวมทั้งหมดมากกว่า 50000 โดยเรียงยอดขายรวมทั้งหมดจากมากไปน้อย
```
superstore %>% 
  group_by(City) %>% 
  summarise(totalsales = sum(Sales)) %>%
  filter(totalsales > 50000) %>%
  arrange(desc(totalsales))
  

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
ยอดขายรวมทั้งหมดของแต่ละ city ที่มียอดขายรวมทั้งหมดมากกว่า 50000 มีทั้งหมด 6 เมือง ดังนี้
1 New York City    252463.
2 Los Angeles      173420.
3 Seattle          116106.
4 San Francisco    109041.
5 Philadelphia     108842.
6 Houston           63956.

2. แสดงรายชื่อสินค้าทั้งหมดที่มีชื่อขึ้นต้นด้วยคำว่า Xerox
```
findXerox <- str_subset(superstore$Product.Name, "Xerox");
as_tibble(findXerox)
```

Result:
```
   value     
   <chr>     
 1 Xerox 1967
 2 Xerox 232 
 3 Xerox 1943
 4 Xerox 1995
 5 Xerox 1999
 6 Xerox 1921
 7 Xerox 1916
 8 Xerox 195 
 9 Xerox 1880
10 Xerox 1911
# ... with 834 more rows
```
รายชื่อสินค้าทั้งหมดที่มีชื่อขึ้นต้นด้วยคำว่า Xerox มีทั้งหมด 844 rows

3. แสดงยอดขายรวมทั้งหมดของ Segment ที่เป็น Consumer
```
superstore %>%group_by(Segment) %>% summarise(totalsales = sum(Sales)) %>% filter(Segment == "Consumer") 
```
Result:
```
  Segment  totalsales
  <chr>         <dbl>
1 Consumer   1148061.
```
ยอดขายรวมทั้งหมดของSegment ที่เป็น Consumer มียอดขายรวมทั้งหมด 1148061 

4. แสดงยอดขายรวมทั้งหมดของแต่ละ Sub Category โดยเรียงยอดขายรวมทั้งหมดจากมากไปน้อย
```
superstore %>% count(Sub.Category) %>% group_by(Sub.Category) %>% rename(totalsales = n) %>%
  arrange(desc(totalsales))
```

Result:
```
   Sub.Category totalsales
   <chr>             <int>
 1 Binders            1492
 2 Paper              1338
 3 Furnishings         931
 4 Phones              876
 5 Storage             832
 6 Art                 785
 7 Accessories         756
 8 Chairs              607
 9 Appliances          459
10 Labels              357
11 Tables              314
12 Envelopes           248
13 Bookcases           226
14 Fasteners           214
15 Supplies            184
16 Machines            115
17 Copiers              66
```
ยอดขายรวมทั้งหมดของแต่ละ Sub Category ซึ่งมี Sub Category ทั้งหมด 17 rows


5. แสดงจำนวนการซื้อทั้งหมดของ Customer แต่ละคน โดยเรียงจำนวนการซื้อทั้งหมดจากมากไปน้อย
```
totalSalesCus <- superstore %>% select(Customer.Name) %>% count(Customer.Name) %>% 
                    arrange(desc(n)) %>%  rename(totalbuy = n);

as_tibble(totalSalesCus);
```

Result:
```
   Customer.Name       totalsales
   <chr>                    <int>
 1 William Brown               35
 2 Matt Abelman                34
 3 Paul Prost                  34
 4 John Lee                    33
 5 Chloris Kastensmidt         32
 6 Jonathan Doherty            32
 7 Seth Vernon                 32
 8 Arthur Prichep              31
 9 Emily Phan                  31
10 Zuschuss Carroll            31
# ... with 783 more rows
```
จำนวนการซื้อทั้งหมดของ Customer แต่ละคน ซึ่งเรียงจากมากไปน้อย ซึ่งมีทั้งหมด 793 rows

6. แสดงสินค้าที่ทำยอดขายได้มากที่สุดและน้อยที่สุด รวมทั้งยอดที่แตกต่างกันระหว่างยอดขายที่มากที่สุดและน้อยที่สุด

หาสินค้าที่ทำยอดขายได้มากที่สุด
```
maxSale <- superstore %>% 
  group_by(Product.Name) %>% 
  summarise(totalsale = sum(Sales)) %>%
  filter(totalsale == max(totalsale))
```
หาสินค้าที่ทำยอดขายได้น้อยที่สุด
```
minSale <- superstore %>% 
  group_by(Product.Name) %>% 
  summarise(totalsale = sum(Sales)) %>%
  filter(totalsale == min(totalsale))
```
หายอดที่แตกต่างกันระหว่างยอดขายที่มากที่สุดและน้อยที่สุด
```
different <- (maxSale$totalsale) -(minSale$totalsale)
```
แสดงสินค้าที่ทำยอดขายได้มากที่สุดและน้อยที่สุด รวมทั้งยอดที่แตกต่างกันระหว่างยอดขายที่มากที่สุดและน้อยที่สุด
```
maxSale
minSale
different
```

Result:
```
> maxSale
# A tibble: 1 x 2
  Product.Name                          totalsale
  <chr>                                     <dbl>
1 Canon imageCLASS 2200 Advanced Copier    61600.

> minSale
# A tibble: 1 x 2
  Product.Name                                                     totalsale
  <chr>                                                                <dbl>
1 Eureka Disposable Bags for Sanitaire Vibra Groomer I Upright Vac      1.62

> different
[1] 61598.2
```
สินค้าที่ทำยอดขายได้มากที่สุด Canon imageCLASS 2200 Advanced Copier ซึ่งทำยอดขายได้ทั้งหมด 61600 และ
สินค้าที่ทำยอดขายได้น้อยที่สุด Eureka Disposable Bags for Sanitaire Vibra Groomer I Upright Vac  ซึ่งทำยอดขายได้ทั้งหมด 1.62
ยอดที่แตกต่างกันระหว่างยอดขายที่มากที่สุดและน้อยที่สุดคือ 61598.2

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
