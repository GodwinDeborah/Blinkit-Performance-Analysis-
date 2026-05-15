/*
Purpose:
Performs basic data exploration and standardization on the blinkit_data table.
This includes:
- Retrieving all records
- Counting total records
- Cleaning and standardizing Item_Fat_Content values
- Validating distinct values after transformation
*/

-- Retrieve all records for initial data inspection
SELECT * 
FROM blinkit_data;

-- Get total number of records in the dataset
SELECT COUNT(*) 
FROM blinkit_data;

-- Standardize Item_Fat_Content values for consistency
UPDATE blinkit_data
SET Item_Fat_Content =
CASE
    -- Normalize different representations of Low Fat
    WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
    
    -- Standardize shorthand representation of Regular
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    
    -- Preserve all other existing values
    ELSE Item_Fat_Content
END;

-- Validate distinct Item_Fat_Content values after cleaning
SELECT DISTINCT Item_Fat_Content
FROM blinkit_data;
