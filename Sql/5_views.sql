/*
File: 05_Views.sql
Purpose: Create analytical views for Power BI
*/

CREATE VIEW vw_TotalRevenue AS
SELECT 
    SUM(Quantity * UnitPrice) AS Total_Revenue
FROM Staging_OnlineRetail_Clean;

CREATE VIEW vw_MonthlySales AS
SELECT
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    SUM(Quantity * UnitPrice) AS Monthly_Revenue
FROM Staging_OnlineRetail_Clean
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate);

CREATE VIEW vw_TopProducts AS
SELECT
    Description,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Quantity * UnitPrice) AS Revenue
FROM Staging_OnlineRetail_Clean
GROUP BY Description;

CREATE VIEW vw_SalesByCountry AS
SELECT
    Country,
    SUM(Quantity * UnitPrice) AS Revenue
FROM Staging_OnlineRetail_Clean
GROUP BY Country;
