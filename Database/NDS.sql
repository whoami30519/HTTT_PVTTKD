create database BI_NDS
GO
use BI_NDS
GO

CREATE TABLE SOURCE (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	SourceName NVARCHAR(255),
	LSET Datetime,
);

go
create trigger UPDATE_SOURCE on SOURCE after update  as 
begin 
	update SOURCE
	set LSET = GETDATE()
	where SourceName in (select distinct SourceName from inserted)
end
go


INSERT [dbo].[SOURCE] ( [SourceName], [LSET]) VALUES (N'PRODUCT_LINE', GETDATE())
INSERT [dbo].[SOURCE] ( [SourceName], [LSET]) VALUES (N'PRODUCT', GETDATE())
INSERT [dbo].[SOURCE] ( [SourceName], [LSET]) VALUES (N'BRANCH', GETDATE())
INSERT [dbo].[SOURCE] ( [SourceName], [LSET]) VALUES (N'SUPERMARKET_SALES', GETDATE())




-- Create Date  table
CREATE TABLE DATE (
    SourceID INT IDENTITY(1,1) PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT,
    Time time
);


-- Create ProductLine table
CREATE TABLE PRODUCT_LINE (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	ProductLineID NVARCHAR(255),
    ProductLine NVARCHAR(255),
	SourceID INT,
	CreatedDate Datetime,
	UpdateDate Datetime,
);

-- Create Product table
CREATE TABLE PRODUCT (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID NVARCHAR(255),
    UnitPrice FLOAT,
	ProductLine NVARCHAR(255),
	SourceID INT,
	CreatedDate Datetime,
	UpdateDate Datetime,
);

-- Create Branch Dimension table
CREATE TABLE BRANCH (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	Branch NVARCHAR(255) UNIQUE,
    City NVARCHAR(255),
	SourceID INT,
	CreatedDate Datetime,
	UpdateDate Datetime,
);

-- Create Fact Table
CREATE TABLE SUPERMARKET_SALES(
    ID INT IDENTITY(1,1) PRIMARY KEY,
	InvoiceID NVARCHAR(255),
	Branch nvarchar(255),
    CustomerType NVARCHAR(255),
    Gender NVARCHAR(255),
    Quantity INT,
    Tax5Percent FLOAT,
    Total FLOAT,
    Payment NVARCHAR(255),
    Cogs FLOAT,
    GrossMarginPercentage FLOAT,
    GrossIncome FLOAT,
    Rating FLOAT,
    ProductID NVARCHAR(255),
    DateID INT,	
    SourceID INT,
	CreatedDate Datetime,
	UpdateDate Datetime,
);

