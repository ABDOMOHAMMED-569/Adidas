select * 
from adidas 

--Calculate The Total Sales 

SELECT SUM([Total Sales]) AS Totalsales 
FROM adidas 



--the Total Sales Of Each City 

SELECT City, SUM([Operating Profit]) AS CityProfit , sum([Units Sold]) AS cityUnits
FROM adidas 
GROUP BY CITY
ORDER BY CityProfit DESC



--the Total Sales Of Each STATE 


SELECT [State], SUM([Operating Profit]) AS StateProfit
FROM adidas 
GROUP BY [State]
ORDER BY StateProfit DESC


---- Discover data about Region  

SELECT Region, SUM([Total Sales]) AS RegionSales ,SUM([operating profit]) AS RegionProfit ,SUM([operating Margin]) RegionMargin
FROM adidas
where region is not null
Group by Region 


--calculate the Cost Of Goods Sold and Units Cost 

select  [Total Sales] - [Operating Profit] as Cost_Of_Goods_Sold , [Total Sales] - [Operating Profit] /[Units Sold] AS Units_Cost , [Total sales]
from adidas 
where [Units Sold] != 0 



--adding the Cost Of Goods Sold column into adidas table


ALTER TABLE adidas
ADD [Cost Of Goods Sold] DECIMAL(10,2);


UPDATE adidas
SET [Cost Of Goods Sold] = [Total Sales] - [Operating Profit] 



--adding the Units_Cost column into adidas table


ALTER TABLE adidas
ADD [Units_Cost] DECIMAL(10,2);

UPDATE adidas
SET [Units_Cost] =  [Cost Of Goods Sold]/[Units Sold] 
where [Units Sold] != 0 

ALTER TABLE adidas
ALTER COLUMN Units_Cost AFTER [Total Sales]



--Discover Monthly Sales and Monthly Cost in each month


SELECT DATEFROMPARTS(YEAR([Invoice Date]), MONTH([Invoice Date]), 1) AS InvoiceMonth, SUM([Total Sales]) AS MonthlySales, SUM([Cost Of Goods Sold]) AS MonthlyCost
FROM adidas
GROUP BY DATEFROMPARTS(YEAR([Invoice Date]), MONTH([Invoice Date]), 1)
ORDER BY MonthlySales DESC;




--the sales in the Days of the highest month making sales 

SELECT DAY([Invoice Date]) AS [Day], SUM([Total Sales]) AS DailySales,SUM([Operating Margin]) AS DailyMargin
FROM adidas
WHERE MONTH([Invoice Date]) = 7 AND YEAR([Invoice Date]) = 2021
GROUP BY DAY([Invoice Date])
ORDER BY DAY([Invoice Date])



--Discover the Daily Margin over month 7   

SELECT DAY([Invoice Date]) AS Day_Of_Month, SUM([Operating Margin]) AS DailyMargin
FROM adidas
WHERE MONTH([Invoice Date]) = 7
GROUP BY DAY([Invoice Date])
ORDER BY DAY([Invoice Date])



--The Relationship Between Price Per Unit and Operating Margin

SELECT  [Price Per Unit], MAX([Operating Margin]) AS MaxOperatingMargin
FROM adidas
GROUP BY  [Price Per Unit]
ORDER BY [Price Per Unit], MaxOperatingMargin 



--Discover Retailer Sales 

select Retailer , SUM([Operating Profit])  AS RetailerProfit
from adidas
GROUP BY Retailer 
ORDER BY RetailerProfit DESC





