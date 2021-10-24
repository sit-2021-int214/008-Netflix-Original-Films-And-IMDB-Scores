# Part 1: Explore the dataset
# Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)
library(DescTools)

# Dataset
Superstore_Sales <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv");

View(Superstore_Sales);

# Part 2+3 : Transform data with dplyr and finding insight the data
# 1.
countSub <- Superstore_Sales %>% select(`Sub-Category`) %>% count(`Sub-Category`) %>% arrange(desc(n)) %>% slice(2:3)
as_tibble(countSub)

# 2.
Top1Category <- Mode(Superstore_Sales$Category)
as_tibble(Top1Category);

# 3.
highestPrice <- Superstore_Sales %>% select(`Customer Name`,`Product Name`,Sales) %>% 
  filter(Superstore_Sales$Sales == max(Superstore_Sales$Sales));
as_tibble(highestPrice)

# 4.
Superstore_Sales$`Order Date` <- as.Date(as.character(Superstore_Sales$`Order Date`),"%d/%m/%Y")
class(Superstore_Sales$`Order Date`)

Superstore_Sales$OrderYear <- format(Superstore_Sales$`Order Date`, "%Y") 
Top3OrderYear <- Superstore_Sales %>% select(OrderYear) %>% count(OrderYear) %>% arrange(desc(n)) %>% slice(1:3)
as_tibble(Top3OrderYear)

# 5.
TopCity <- Superstore_Sales %>% select(City) %>% count(City) %>% arrange(desc(n)) %>% slice(1:1)
as_tibble(TopCity)

# 6.
CustID_DK13150 <- Superstore_Sales %>% select(`Customer ID`,`Customer Name`, City, `Product Name`) %>% 
  filter(`Customer ID` == "DK-13150")
as_tibble(CustID_DK13150)

# Part 4
# 1.Graph show relation between Ship Mode and Sales
ShipMode_plot <- ggplot(Superstore_Sales, aes(x= `Ship Mode`)) + geom_bar(); 

ShipMode_plot + ggtitle("Number of Sales Ship Mode") +
  xlab("Ship Mode") + ylab("Sales")

# 2.Graph show relation between Segment and Sales
Segment_plot <- ggplot(Superstore_Sales, aes(x= Segment)) + geom_bar(); 

Segment_plot + ggtitle("Number of Sales Segment") +
  xlab("Segment") + ylab("Sales")
