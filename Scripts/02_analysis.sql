/*
Purpose:
Generates key business metrics and segmented sales analysis from the blinkit_data table.
The query supports performance monitoring across product categories, outlet attributes,
and customer satisfaction indicators.

Metrics covered:
- Total Sales, Average Sales, Number of Items, Average Rating
- Sales breakdown by Item Fat Content, Item Type
- Outlet-level performance (Location, Size, Type, Establishment Year)
- Percentage contribution to total sales
*/

-- Total Sales 
SELECT
	CAST(SUM(Total_Sales) / 1000000 AS DECIMAL (10,2)) AS Total_Sales_Millions
FROM blinkit_data;

-- Average Sales per item
SELECT 
	CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales
FROM blinkit_data;

-- Total number of items 
SELECT
	COUNT(*) AS No_of_Items
FROM blinkit_data;

-- Average customer rating
SELECT 
	CAST(AVG(Rating) AS DECIMAL (10,2)) AS Avg_Rating
FROM blinkit_data;

-- Sales performance segmented by fat content category
SELECT
	Item_Fat_Content,
	CAST(SUM(Total_Sales) / 1000 AS DECIMAL (10,2)) AS Total_Sales_Thousands,
	CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
	COUNT(*) AS No_of_Items,
	CAST(AVG(Rating) AS DECIMAL (10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_Thousands DESC;

-- Sales performance by product category
SELECT
	Item_Type,
	CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
	COUNT(*) AS No_of_Items,
	CAST(AVG(Rating) AS DECIMAL (10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

-- Pivoted view of fat content sales across outlet locations
SELECT 
	Outlet_Location_Type,
	ISNULL([Low Fat], 0) AS Low_Fat,
	ISNULL([Regular], 0) AS Regular
FROM
(
	SELECT 
		Outlet_Location_Type,
		Item_Fat_Content,
		CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales
	FROM blinkit_data
	GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
	SUM(Total_Sales)
	FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

-- Performance trend by outlet establishment year
SELECT
	Outlet_Establishment_Year,
	CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
	COUNT(*) AS No_of_Items,
	CAST(AVG(Rating) AS DECIMAL (10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

-- Sales contribution by outlet size
SELECT
	Outlet_Size,
	CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales,
	-- Percentage contribution using window function
	CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER () ) AS DECIMAL (10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

-- Sales performance by outlet location tier
SELECT
	Outlet_Location_Type,
	CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales,
	CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER () ) AS DECIMAL (10,2)) AS Sales_Percentage,
	CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
	COUNT(*) AS No_of_Items,
	CAST(AVG(Rating) AS DECIMAL (10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

-- Comprehensive KPI view by outlet type
SELECT
	Outlet_Type,
	CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales,
	CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER () ) AS DECIMAL (10,2)) AS Sales_Percentage,
	CAST(AVG(Total_Sales) AS DECIMAL (10,1)) AS Avg_Sales,
	COUNT(*) AS No_of_Items,
	CAST(AVG(Rating) AS DECIMAL (10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;
