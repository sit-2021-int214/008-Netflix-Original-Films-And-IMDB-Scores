# R-Assignment 4

**Created by Tarathep Siripis (ID: 63130500055)**

## Dataset
Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)

### _Context_
>Retail dataset of a global superstore for 4 years.
Perform EDA and Predict the sales of the next 7 days from the last date of the Training dataset!

### _Content_
>Time series analysis deals with time series based data to extract patterns for predictions and other characteristics of the data. It uses a model for forecasting future values in a small time frame based on previous observations. It is widely used for non-stationary data, such as economic data, weather data, stock prices, and retail sales forecasting.

### _Dataset_
>The dataset is easy to understand and is self-explanatory

### _Inspiration_
>Perform EDA and Predict the sales of the next 7 days from the last date of the Training dataset!

### Outlines
* Explore the dataset
* Learning function from Tidyverse
* Transform data with dplyr and finding insight the data
* Visualization with GGplot2

## Part 1: Explore the dataset
### Step 1: เรียกใช้ Library และ Import Dataset
```R
# Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)

# Dataset
superstore_sales <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv");
```
### Step 2: ดูข้อมูลใน dataset
```R
#ViewDataset
glimpse(superstore_sales)
```
Result:
```
Rows: 9,800
Columns: 18
$ `Row ID`        <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, ~
$ `Order ID`      <chr> "CA-2017-152156", "CA-2017-152156", "CA-2017-138688", "US-2016-108966", "US-2016-108966", "CA-2~
$ `Order Date`    <chr> "08/11/2017", "08/11/2017", "12/06/2017", "11/10/2016", "11/10/2016", "09/06/2015", "09/06/2015~
$ `Ship Date`     <chr> "11/11/2017", "11/11/2017", "16/06/2017", "18/10/2016", "18/10/2016", "14/06/2015", "14/06/2015~
$ `Ship Mode`     <chr> "Second Class", "Second Class", "Second Class", "Standard Class", "Standard Class", "Standard C~
$ `Customer ID`   <chr> "CG-12520", "CG-12520", "DV-13045", "SO-20335", "SO-20335", "BH-11710", "BH-11710", "BH-11710",~
$ `Customer Name` <chr> "Claire Gute", "Claire Gute", "Darrin Van Huff", "Sean O'Donnell", "Sean O'Donnell", "Brosina H~
$ Segment         <chr> "Consumer", "Consumer", "Corporate", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer"~
$ Country         <chr> "United States", "United States", "United States", "United States", "United States", "United St~
$ City            <chr> "Henderson", "Henderson", "Los Angeles", "Fort Lauderdale", "Fort Lauderdale", "Los Angeles", "~
$ State           <chr> "Kentucky", "Kentucky", "California", "Florida", "Florida", "California", "California", "Califo~
$ `Postal Code`   <dbl> 42420, 42420, 90036, 33311, 33311, 90032, 90032, 90032, 90032, 90032, 90032, 90032, 28027, 9810~
$ Region          <chr> "South", "South", "West", "South", "South", "West", "West", "West", "West", "West", "West", "We~
$ `Product ID`    <chr> "FUR-BO-10001798", "FUR-CH-10000454", "OFF-LA-10000240", "FUR-TA-10000577", "OFF-ST-10000760", ~
$ Category        <chr> "Furniture", "Furniture", "Office Supplies", "Furniture", "Office Supplies", "Furniture", "Offi~
$ `Sub-Category`  <chr> "Bookcases", "Chairs", "Labels", "Tables", "Storage", "Furnishings", "Art", "Phones", "Binders"~
$ `Product Name`  <chr> "Bush Somerset Collection Bookcase", "Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Ba~
$ Sales           <dbl> 261.9600, 731.9400, 14.6200, 957.5775, 22.3680, 48.8600, 7.2800, 907.1520, 18.5040, 114.9000, 1~
```
>จากผลลัพธ์ด้านบนจะเห็นได้ว่ามีข้อมูลทั้งหมด 9800 ข้อมูล และตัวแปรทั้งหมด 18 ตัว ซึ่งแต่ละตัวแปรมีความหมาย ดังนี้

| _No._ | _Columns_        | _Type_     | _Explanation_  |
|:-|:-|:-|:-|
|  1  | Row ID         | numeric  | ลำดับของข้อมูล |
|  2  | Order ID       | character| ID ของออเดอร์ |
|  3  | Order Date     | character| วันที่สั่งสินค้า |
|  4  | Ship Date      | character| วันที่จัดส่ง |
|  5  | Ship mode      | character| รูปแบบการจัดส่ง |
|  6  | Customer ID    | character| ID ของลูกค้า |
|  7  | Customer Name  | character| ชื่อของลูกค้า |
|  8  | Segment        | character| ประเภทของลูกค้า |
|  9  | Country        | character| ประเทศที่ลูกค้าต้องการจัดส่ง |
|  10  | City          | character| เมืองที่ลูกค้าต้องการจัดส่ง |
|  11  | State         | character| รัฐที่ลูกค้าต้องการจัดส่ง  |
|  12  | Postal Code   | numeric  | รหัสไปรษณีย์ที่ลูกค้าต้องการจัดส่ง |
|  13  | Region        | character| ภูมิภาคที่ลูกค้าต้องการจัดส่ง |
|  14  | Product ID    | character| ID ของสินค้า |
|  15  | Category      | character| หมวดหมู่ของสินค้า |
|  16  | Sub Category  | character| หมวดหมู่ย่อยของสินค้า |
|  17  | Product Name  | character| ชื่อสินค้า |
|  18  | Sales         | numeric  | ราคาของสินค้า |

## Part 2: Learning function from Tidyverse

- 
```

```

## Part 3: Transform data with dplyr and finding insight the data


```

```

Result:

```

```

## Part 4: Visualization with GGplot2

```

```
Result:

````

````
