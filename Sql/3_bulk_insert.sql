/*
File: 03_Bulk_Insert.sql
Purpose: Load raw data from CSV into staging table
*/

BULK INSERT Staging_OnlineRetail_Raw
FROM 'C:\Temp\OnlineRetail.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);
