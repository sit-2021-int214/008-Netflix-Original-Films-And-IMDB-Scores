# R-Assignment 4

**Created by TeeradeT Panklai (ID: 63130500061)**

Choose Dataset:
1. Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

2. Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)


### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)

# Dataset
Superstore_Sales <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv");

View(Superstore_Sales);


In this dataset has .....



## Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns

```
starwars %>% select(name,height)
```
** You can sepearate this part or combine in part of `Transform data with dplyr and finding insight the data`

## Part 3: Transform data with dplyr and finding insight the data

##1 ลูกค้าที่มีการซื้อสินค้ามากที่สุด

```R
customerMostBuy <- Superstore_Sales %>% select(`Customer ID`,`Customer Name`,Sales) %>% 
                    filter(Superstore_Sales$Sales == max(Superstore_Sales$Sales));
```

Result:

```
`Customer ID` `Customer Name`  Sales
  <chr>         <chr>            <dbl>
1 SM-20320      Sean Miller     22638.
```
ลูกค้าที่มีการซื้อสินค้ามากที่สุดคือ Sean Miller

##2 จำนวนยอดขายของสินค้าแต่ละประเภท

```R
cleanSuperstore <- Superstore_Sales %>% mutate(
  SuperstoreCategory = strsplit(as.character(Superstore_Sales$Category)," "),
  SuperstoreCategory = lapply(SuperstoreCategory,gsub,pattern = " ",replacement= "")
);

View(cleanSuperstore);

cleanSuperstore %>% select(SuperstoreCategory) %>% unnest(SuperstoreCategory)%>%
                    count(SuperstoreCategory) %>% arrange(desc(n)) %>%as_tibble();

```

Result:

```
 SuperstoreCategory     n
  <chr>              <int>
1 Office              5909
2 Supplies            5909
3 Furniture           2078
4 Technology          1813
```
OfficeSupplies มียอดขายเท่ากับ 5909
Furniture มียอดขายเท่ากับ 2078
Technology มียอดขายเท่ากับ 1813

##3 พนักงานที่อยู่ในสาขาเมือง Los Angeles มีการขายสินค้าอะไรบ้าง

```R
LA_Customer <- Superstore_Sales %>% select(`Customer Name`, City, `Product Name`) %>% 
               filter(City == "Los Angeles");

as_tibble(LA_Customer);
```

Result:

```
`Customer Name` City        `Product Name`                                                  
   <chr>           <chr>       <chr>                                                           
 1 Darrin Van Huff Los Angeles Self-Adhesive Address Labels for Typewriters by Universal       
 2 Brosina Hoffman Los Angeles Eldon Expressions Wood and Plastic Desk Accessories, Cherry Wood
 3 Brosina Hoffman Los Angeles Newell 322                                                      
 4 Brosina Hoffman Los Angeles Mitel 5320 IP Phone VoIP phone                                  
 5 Brosina Hoffman Los Angeles DXL Angle-View Binders with Locking Rings by Samsill            
 6 Brosina Hoffman Los Angeles Belkin F5C206VTEL 6 Outlet Surge                                
 7 Brosina Hoffman Los Angeles Chromcraft Rectangular Conference Tables                        
 8 Brosina Hoffman Los Angeles Konftel 250 Conference phone - Charcoal black                   
 9 Eric Hoffmann   Los Angeles Wilson Jones Active Use Binders                                 
10 Eric Hoffmann   Los Angeles Imation 8GB Mini TravelDrive USB 2.0 Flash Drive                
# ... with 718 more rows
```
พนักงานที่อยู่ในสาขาเมือง Los Angeles มีการขายสินค้าหลายอย่างเช่น  Newell 322, Mitel 5320 IP Phone VoIP phone, DXL Angle-View Binders with Locking Rings by Samsill  

##4 ให้แสดงสินค้าที่มีชื่อขึ้นต้นด้วยคำว่า Xerox 

```R
findXerox <- str_subset( Superstore_Sales$`Product Name`, "Xerox");

as_tibble(findXerox);
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
แสดงสินทั้งหมดที่ขึ้นต้นด้วย Xerox ได้ทั้งหมด 844 Rows

##5 แสดงการจำนวนการซื้อขายในแต่ละภูมิภาคแล้วแสดงผลแบบมากไปน้อย

```R
totalSalesRegion <- Superstore_Sales %>% select(Region) %>% count(Superstore_Sales$Region) %>% 
                    arrange(desc(n));

as_tibble(totalSalesRegion);
```

Result:

```
  `Superstore_Sales$Region`     n
  <chr>                     <int>
1 West                       3140
2 East                       2785
3 Central                    2277
4 South                      1598
```
West 3140 ครั้ง
East 2785 ครั้ง
Central 2277 ครั้ง
South 1598 ครั้ง

##6 ผลรวมยอดขายทั้งหมดของทั้งตาราง

```R
totalSales <- sum(Superstore_Sales$Sales);

as_tibble(totalSales);
```

Result:

```
 value
     <dbl>
1 2261537.
```
ได้ยอดขายทั้งหมด 2261537 

## Part 4: Visualization with GGplot2
### 1.) Graph show relation between height and mass
```
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()
```
Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````