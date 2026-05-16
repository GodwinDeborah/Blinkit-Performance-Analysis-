# Blinkit-Performance-Analysis

## Table of Contents
1. [Project Overview](#1-project-overview)
2. [Business Objectives](#2-business-objectives)
3. [Tools & Technologies](#3-tools--technologies)
4. [Repository Structure](#4-repository-structure)
5. [Dataset Overview](#5-dataset-overview)
6. [Data Ingestion](#6-data-ingestion)
7. [Data Preparation](#7-data-preparation)
8. [KPIs & Analysis](#8-kpis--analysis)
9. [Key Insights](#9-key-insights)
10. [Recommendations](#10-recommendations)
11. [Assumptions & Limitations](#11-assumptions--limitations)
12. [Future Enhancements](#12-future-enhancements)
13. [How to Run the Project](#13-how-to-run-the-project)
14. [Author](#14-author)

## 1. Project Overview
This project analyzes Blinkit sales data to evaluate business performance, customer satisfaction, and operational efficiency across products and outlet locations.

The workflow includes data cleaning, transformation, and analytical querying to generate insights into sales trends, product performance, customer ratings, and outlet operations using SQL.

## 2. Business Objectives
The primary objectives of this project are to evaluate overall revenue performance, measure customer satisfaction levels, analyze product-level sales distribution, assess outlet performance across key business attributes, and identify the major drivers influencing sales growth and operational performance.

## 3. Tools & Technologies
The project was implemented using SQL Server for database management, data cleaning, transformation, and analytical querying.

## 4. Repository Structure
```text
Blinkit-Performance-Analysis/
│
├── data/
│   ├── raw/
│   │   └── BlinkIT_Grocery_Data.csv
│   │
│   └── processed/
│       └── blinkit_data.csv
│
├── docs/
│   ├── business-requirement.md
│   └── insights.md
│
├── scripts/
│   ├── 00_init_database.sql
│   ├── 01_standardization.sql
│   └── 02_analysis.sql
│
├── LICENSE
└── README.md
```

## 5. Dataset Overview
The dataset represents retail transactional and product-level data from Blinkit operations. It includes key business dimensions:
-	Product Attributes: Item Type, Item Fat Content
-	Sales Metrics: Total Sales
-	Customer Data: Ratings
-	Outlet Attributes: Size, Location Type, Outlet Type, Establishment Year
This structure enables multi-dimensional analysis across products, customers, and outlet performance.

## 6. Data Ingestion
The dataset was imported using SQL Server’s Flat File Import Wizard to efficiently load raw data into a structured table format. This approach ensured controlled handling of data inconsistencies prior to transformation.

## 7. Data Preparation
-	Standardized categorical values (e.g., Item Fat Content consolidated into "Low Fat" and "Regular")
-	Validated numeric fields (Sales and Ratings)
-	Ensured consistency for aggregation and reporting

## 8. KPIs & Analysis
### Key Performance Indicators (KPIs)
The following KPIs were developed to measure business performance:
-	Total Sales → Overall revenue generated (reported in millions)
-	Average Sales → Revenue per item
-	Number of Items Sold → Transaction volume
-	Average Rating → Customer satisfaction indicator

### Analysis 
### Product-Level Analysis
-	Evaluate how fat content impacts sales performance
Identify top-performing item categories by revenue contribution
### Outlet Performance Analysis
-	Analyze sales distribution across outlet types and sizes
-	Examine performance differences by location type
-	Evaluate sales trends by establishment year
-	Identify high-performing outlet segments

## 9. Key Insights
-	Medium-sized outlets are the primary revenue drivers, contributing over 42% of total sales, outperforming both small and large outlet segments.
-	Tier 3 locations generate the highest sales, indicating strong demand in emerging markets and highlighting a key growth opportunity.
-	Low-fat products lead in sales performance, reflecting a clear customer preference for healthier product options.

## 10. Recommendations
-	Prioritize expansion of medium-sized outlets, as they generate the highest share of revenue and demonstrate optimal operational efficiency. 
-	Increase investment in Tier 3 locations, which show the strongest sales performance and represent a key growth opportunity. 
-	Expand and promote low-fat product offerings to align with clear customer preferences for healthier options. 
-	Strengthen availability and promotion of top-performing categories (Fruits & Vegetables, Snacks, Household, Frozen, Dairy) to maximize revenue contribution.

## 11. Assumptions & Limitations

## 12. Future Enhancements
-	Introduce time-series forecasting to predict future sales trends and improve demand planning. 
-	Integrate the dataset with a BI tool (Power BI or Tableau) to enable interactive dashboards and self-service analytics. 
-	Implement advanced customer segmentation (e.g., RFM analysis) to better understand purchasing behavior and improve targeting strategies. 
-	Expand the data model to include profitability and cost metrics, enabling margin-based performance analysis instead of only revenue-based insights.

These enhancements aim to evolve the current SQL-based solution into a scalable end-to-end business intelligence system.

## 13. How to Run the Project
1.	Create the database and load the dataset using the Flat File Import Wizard 
2.	Execute scripts in the following order:
-	Standardization.sql
-	Analysis.sql 

## 14. Author
**Godwin Deborah**

Data Analyst
- 🔗 [Linkedin](https://www.linkedin.com/in/godwin-deborah-163b10398/?skipRedirect=true)
- 💼 [GitHub](https://github.com/GodwinDeborah)
- 📧 [Email](mailto:debbiegodwin001@gmail.com)
