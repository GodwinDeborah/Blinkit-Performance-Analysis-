# Step-by-Step: Load CSV Using GUI (Flat File Import)

## 1. Open SQL Server Management Studio (SSMS)

- Connect to your SQL Server instance
- Expand:
  - `Databases`
- Right-click on `Databases`
- Select:
  - `New Database`
- Enter database name:
  - `BlinkitDB`
- Click `OK`

## 2. Select Your Database

- Locate:
  - `BlinkitDB`
- Right-click on it
- Select:
  - `Tasks → Import Flat File`

> **Note:** This opens the Flat File Import Wizard.

## 3. Select the CSV File

- Click `Browse`
- Choose:
  - `BlinkIT Grocery Data.csv`
- Set table name:
  - `blinkit_data`

Click `Next`

## 4. Review Data Preview

Confirm the following:

- Columns are correctly separated
- Data appears properly aligned
- No shifting of values across columns

If everything looks correct, click `Next`

## 5. Configure Column Settings (Critical Step)

Assign data types as follows:

| Column Name                   | Data Type    |
|------------------------------|---------------|
| `Item_Fat_Content`           | VARCHAR(50)   |
| `Item_Identifier`            | VARCHAR(50)   |
| `Item_Type`                  | VARCHAR(50)   |
| `Outlet_Establishment_Year`  | INT           |
| `Outlet_Identifier`          | VARCHAR(50)   |
| `Outlet_Location_Type`       | VARCHAR(50)   |
| `Outlet_Size`                | VARCHAR(50)   |
| `Outlet_Type`                | VARCHAR(50)   |
| `Item_Visibility`            | FLOAT         |
| `Item_Weight`                | FLOAT         |
| `Total_Sales`                | FLOAT         |
| `Rating`                     | FLOAT         |

Click `Next`

## 6. Review Summary

- Confirm table name:
  - `blinkit_data`
- Verify column mappings

Click `Finish`

## 7. Complete Import

- Wait for the process to finish
- Confirm status shows:
  - `Success`

Click `Close`

## 8. Verify Data Load

Run the following query to preview the imported dataset:

```sql
SELECT TOP 10 *
FROM blinkit_data;

```
Check the total number of records loaded into the table:

```sql
SELECT COUNT(*) AS total_rows
FROM blinkit_data;
