# Library
library(dplyr)
library(readr)
library(stringr)
library(tidyr)
library(assertive)
library(ggplot2)


# Dataset
Superstore_Sales <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv");

View(Superstore_Sales);

#1 
customerMostBuy <- Superstore_Sales %>% select(`Customer ID`,`Customer Name`,Sales) %>% 
                    filter(Superstore_Sales$Sales == max(Superstore_Sales$Sales));

as_tibble(customerMostBuy);

#2
cleanSuperstore <- Superstore_Sales %>% mutate(
  SuperstoreCategory = strsplit(as.character(Superstore_Sales$Category)," "),
  SuperstoreCategory = lapply(SuperstoreCategory,gsub,pattern = " ",replacement= "")
);

View(cleanSuperstore);

cleanSuperstore %>% select(SuperstoreCategory) %>% unnest(SuperstoreCategory)%>%
                    count(SuperstoreCategory) %>% arrange(desc(n)) %>%as_tibble();

#3
LA_Customer <- Superstore_Sales %>% select(`Customer Name`, City, `Product Name`) %>% 
               filter(City == "Los Angeles");

as_tibble(LA_Customer);

#4
findXerox <- str_subset( Superstore_Sales$`Product Name`, "Xerox");

as_tibble(findXerox);

#5
totalSalesRegion <- Superstore_Sales %>% select(Region) %>% count(Superstore_Sales$Region) %>% 
                    arrange(desc(n));

as_tibble(totalSalesRegion);

#6
totalSales <- sum(Superstore_Sales$Sales);

as_tibble(totalSales);

#ggplot

Region_plot <- ggplot(Superstore_Sales, aes(x= Region)) + geom_bar(); 

Region_plot + ggtitle("Number of Sales Region") +
              xlab("Region") + ylab("Sales")

Country_plot <- ggplot(Superstore_Sales, aes(x = Sales, y = Category))+
                geom_bar(stat="identity")+
                scale_x_continuous(breaks=c(50000 ,250000 ,450000 ,650000 ,850000))

Country_plot + ggtitle("Total of Sales Category") +
              xlab("Category") + ylab("Total Sales")