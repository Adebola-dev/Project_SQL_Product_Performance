PRODUCT PERFOMANCE ANALYSIS - SUPERMART GROCERY STORE IN INDIA 
[The analysis involves relationship between Category Vs {sales, region and customers}]

USE Projects;

*Default table of the Grocery store dataset
SELECT *
FROM [dbo].[Supermart Grocery Store Dataset];

*Freqency table of products(Category)
SELECT Category, COUNT(Category) AS 'Frequency'
FROM [dbo].[Supermart Grocery Store Dataset]
GROUP BY Category;

*What is the frequency of products(Category) at region?
SELECT Region, Category, COUNT(Category) AS 'Frequency'
FROM [dbo].[Supermart Grocery Store Dataset]
GROUP BY Category, Region
ORDER BY COUNT(Category)DESC;

*What is the frequency of products(Category) at city?
SELECT City, Category, COUNT(Category) AS 'Frequency'
FROM [dbo].[Supermart Grocery Store Dataset]
GROUP BY Category, City
ORDER BY COUNT(Category)DESC;

*What is the performance of products(Category) at each region relating sales?
SELECT Region, Category, COUNT(Category) AS 'Frequency', SUM(Sales) AS 'Total Sales', SUM(Profit) AS 'Total Profit'
FROM [dbo].[Supermart Grocery Store Dataset]
GROUP BY Category, Region
ORDER BY SUM(Sales)DESC;

*Who are the customers that falls in Bakery Category?
SELECT Customer_Name, Category
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Category = 'Bakery'
GROUP BY Category,Customer_Name;

*How many times did each customer that visit/patronized the Bakery Category?
SELECT Customer_Name, Category, COUNT(Category) AS 'Frequency'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Category = 'Bakery'
GROUP BY Category,Customer_Name;

*What is the connection between the numbers of times customers visit/patronized the Bakery Category and total sales made from the total visit/patronage?
SELECT Customer_Name, Category, COUNT(Category) AS 'Frequency', SUM(Sales) AS 'Total Sales'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Category = 'Bakery'
GROUP BY Category,Customer_Name;

*What region had patronage on Bakery Category? 
SELECT Region, Category
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Category = 'Bakery'
GROUP BY Category, Region
ORDER BY Region;

*What is the total sales made at each region had patronage on Bakery Category? 
SELECT Region, Category, SUM(Sales) AS 'Total Sales'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Category = 'Bakery'
GROUP BY Category, Region
ORDER BY Region;

*What is the percentage of Bakery category on other category at Supermart grocery stores?
SELECT Category, Sales, Sales*100/SUM(Sales) OVER () AS 'Percentage of bakery'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Category = 'Bakery';

*Rename the COLUMN 'Order Date' AS 'Order_Date' FROM the Table '[dbo].[Supermart Grocery Store Dataset]'
EXEC sp_rename '[dbo].[Supermart Grocery Store Dataset].Order Date', 'Order_Date','COLUMN';

*What are the product(Category) by year?
SELECT Year(Order_Date) AS Year, COUNT(Category) AS 'Category Frequency', Category
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Year(Order_Date) IN (2015,2016,2017,2018)
GROUP BY Year(Order_Date), Category
ORDER BY Year(Order_Date)DESC;

*What is the total sales of product(category) per year?
SELECT Category, Year(Order_Date) AS Year, SUM(Sales) AS 'Total Sales', COUNT(Category) AS 'Category Frequency'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Year(Order_Date) BETWEEN 2015 AND 2018
GROUP BY Year(Order_Date), Category
ORDER BY SUM(Sales)DESC;

*What is the total sales of category in the year 2015? And what category is the best that year?
SELECT Year(Order_Date) AS 'Year 2015', Category, COUNT(Category) AS 'Frequency of Category in the year 2015', SUM(Sales) AS 'Total Sales', SUM(Profit) AS 'Total Profit'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Year(Order_Date) IN (2015)
GROUP BY Year(Order_Date), Category
ORDER BY SUM(Sales)DESC;
INTERPRETATION: The total sales made in the year 2015 was (Eggs, Meat & Fish had the highest total sales(489,956) and Food Grains had the lowest total sales(357,681)

THEN WE WILL DO LIKEWISE FOR THE REMAINING YEARS. THOUGH, THERE HAVE BEEN INCREASE IN TOTAL SALES AND TOTAL PROFIT YEAR OVER YEAR. AND THE YEAR 2018 HAD THE HIGHEST TOTAL SALES.
*What top 3 category sales within the sales year?
SELECT TOP 3 Category, Year(Order_Date) AS Year, SUM(Sales) AS 'Total Sales'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Year(Order_Date) BETWEEN 2015 AND 2018
GROUP BY Year(Order_Date), Category
ORDER BY SUM(Sales)DESC;

*What are the bottom 3 category within the sales years?
SELECT TOP 3 Category, Year(Order_Date) AS 'Sales Year', SUM(Sales) AS 'Total Sales'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Year(Order_Date) BETWEEN 2015 AND 2018
GROUP BY Year(Order_Date), Category
ORDER BY SUM(Sales)ASC;

*Are the top 3 category sales the same with top 3 category profit within the sales year?
SELECT TOP 3 Category, Year(Order_Date) AS Year, SUM(Sales) AS 'Total Sales', SUM(Profit) AS 'Total Profit'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Year(Order_Date) BETWEEN 2015 AND 2018
GROUP BY Year(Order_Date), Category
ORDER BY SUM(Profit)DESC;

*Are the bottom 3 category sales the same with top 3 category profit within the sales year?
SELECT TOP 3 Category, Year(Order_Date) AS Year, SUM(Sales) AS 'Total Sales', SUM(Profit) AS 'Total Profit'
FROM [dbo].[Supermart Grocery Store Dataset]
WHERE Year(Order_Date) BETWEEN 2015 AND 2018
GROUP BY Year(Order_Date), Category
ORDER BY SUM(Profit)ASC;
INTERPRETATION: The bottom 3 total sales are different from the bottom 3 total profit.