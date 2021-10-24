# Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)


# Dataset
superstore_sales <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv");

# ViewDataset
glimpse(superstore_sales)

# Learning function from Tidyverse
superstore_sales %>% select(`Customer ID`,`Customer Name`,City) %>% filter(City == "New York City")

# Finding insight the data
# 1 
superstore_sales$`Order Date` <- as.Date(as.character(superstore_sales$`Order Date`),"%d/%m/%Y")
class(superstore_sales$`Order Date`)

superstore_sales$Year <- format(superstore_sales$`Order Date`, "%Y") 
superstore_sales %>% select(Year) %>% count(Year) %>% slice_max(Year)


# 2 
superstore_sales %>% select(`Customer Name` , Sales) %>% 
  group_by(`Customer Name`) %>% summarise(sumOfSales = sum(Sales)) %>% slice_max(sumOfSales)


# 3
superstore_sales %>% select(`Product Name` , Sales) %>% 
  group_by(`Product Name`) %>% summarise(sumOfSales = sum(Sales)) %>% arrange(desc(sumOfSales)) %>% slice(1:3)

# 4
superstore_sales %>% select(Category) %>% count(Category) %>% slice_max(Category)

# 5
minShipmode <- superstore_sales %>% select(`Ship Mode`) %>% count(`Ship Mode`) %>% slice_min(`Ship Mode`)
as_tibble(minShipmode)
maxShipmode <- superstore_sales %>% select(`Ship Mode`) %>% count(`Ship Mode`) %>% slice_max(`Ship Mode`)
as_tibble(maxShipmode)
maxShipmode$n - minShipmode$n


# 6
superstore_sales %>% select(City) %>% count(superstore_sales$City) %>% arrange(desc(n)) %>%  slice(1:3)

# Visualization 
#1
Region_plot <- ggplot(superstore_sales, aes(x= Region)) + geom_bar(); 

Region_plot + ggtitle("Number of Sales Region") +
  xlab("Region") + ylab("Sales")

#2
Category_plot <- ggplot(superstore_sales, aes(x= Category)) + geom_bar(); 

Category_plot + ggtitle("Number of Sales Category") +
  xlab("Category") + ylab("Sales")

