/*
File: 04_Data_Cleaning.sql
Purpose:
- Clean raw data
- Convert data types
- Remove invalid and duplicate records
*/

-- Insert clean records
INSERT INTO Staging_OnlineRetail_Clean
SELECT
    InvoiceNo,
    StockCode,
    Description,
    TRY_CAST(Quantity AS INT),
    TRY_CAST(InvoiceDate AS DATETIME),
    TRY_CAST(UnitPrice AS DECIMAL(10,2)),
    TRY_CAST(CustomerID AS INT),
    Country
FROM Staging_OnlineRetail_Raw
WHERE
    TRY_CAST(Quantity AS INT) > 0
    AND TRY_CAST(UnitPrice AS DECIMAL(10,2)) >= 0
    AND TRY_CAST(CustomerID AS INT) IS NOT NULL;

-- Remove duplicates
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY InvoiceNo, StockCode
               ORDER BY InvoiceDate DESC
           ) AS rn
    FROM Staging_OnlineRetail_Clean
)
DELETE FROM CTE WHERE rn > 1;
س