/*
File: 02_Staging_Tables.sql
Purpose: Create staging tables for raw and clean data
*/

-- Raw table (text only)
CREATE TABLE Staging_OnlineRetail_Raw (
    InvoiceNo NVARCHAR(50),
    StockCode NVARCHAR(50),
    Description NVARCHAR(255),
    Quantity NVARCHAR(50),
    InvoiceDate NVARCHAR(50),
    UnitPrice NVARCHAR(50),
    CustomerID NVARCHAR(50),
    Country NVARCHAR(100)
);

-- Clean table
CREATE TABLE Staging_OnlineRetail_Clean (
    InvoiceNo NVARCHAR(50),
    StockCode NVARCHAR(50),
    Description NVARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country NVARCHAR(100)
);
س