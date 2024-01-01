Create database BI_STAGE
go
use BI_STAGE
-- Create ProductLine table
CREATE TABLE PRODUCT_LINE (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ProductLineID NVARCHAR(255),
    ProductLine NVARCHAR(255),
	CreatedDate Datetime,
	UpdateDate Datetime
);
go
create trigger UPDATE_PRODUCT_LINE on PRODUCT_LINE after update  as 
begin 
	update PRODUCT_LINE
	set UpdateDate = GETDATE()
	where ProductLineID in (select distinct ProductLineID from inserted)
end
go

create trigger CREATE_PRODUCT_LINE on PRODUCT_LINE after insert  as 
begin 
	update PRODUCT_LINE
	set UpdateDate = GETDATE(), CreatedDate = GETDATE()
	where ProductLineID in (select distinct ProductLineID from inserted)
end
go

-- Create Product table
CREATE TABLE PRODUCT (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ProductID NVARCHAR(255),
    UnitPrice FLOAT,
	ProductLine NVARCHAR(255),
	CreatedDate Datetime,
	UpdateDate Datetime
);
go
create trigger UPDATE_PRODUCT on PRODUCT after update  as 
begin 
	update PRODUCT
	set UpdateDate = GETDATE()
	where ProductID in (select distinct ProductID from inserted)
end
go

create trigger INSERT_PRODUCT on PRODUCT after insert  as 
begin 
	update PRODUCT
	set UpdateDate = GETDATE(), CreatedDate = GETDATE()
	where ProductID in (select distinct ProductID from inserted)
end
go

-- Create Branch Dimension table
CREATE TABLE BRANCH (
	 ID INT IDENTITY(1,1) PRIMARY KEY,

	Branch NVARCHAR(255),
    City NVARCHAR(255),
	CreatedDate Datetime,
	UpdateDate Datetime
);
go
create trigger UPDATE_BRANCH on BRANCH after update  as 
begin 
	update BRANCH
	set UpdateDate = GETDATE()
	where Branch in (select distinct Branch from inserted)
end
go

create trigger INSERT_BRANCH on BRANCH after insert  as 
begin 
	update BRANCH
	set UpdateDate = GETDATE(), CreatedDate = GETDATE()
	where Branch in (select distinct Branch from inserted)
end
go

-- Create SUPERMARKET_SALES Table
CREATE TABLE SUPERMARKET_SALES(
	 ID INT IDENTITY(1,1) PRIMARY KEY,
	InvoiceID NVARCHAR(255),
	Branch  NVARCHAR(255),
    CustomerType NVARCHAR(255),
    Gender NVARCHAR(255),
    ProductID NVARCHAR(255),
    Quantity INT,
    Tax5Percent FLOAT,
    Total FLOAT,
    Date Date,
	Time Time(7),
	Payment NVARCHAR(255),
    Cogs FLOAT,
    GrossMarginPercentage FLOAT,
    GrossIncome FLOAT,
    Rating FLOAT,
	CreatedDate Datetime,
	UpdateDate Datetime
);

go
create trigger UPDATE_SUPERMARKET_SALES on SUPERMARKET_SALES after update  as 
begin 
	update SUPERMARKET_SALES
	set UpdateDate = GETDATE()
	where InvoiceID in (select distinct InvoiceID from inserted)
end
go

create trigger INSERT_SUPERMARKET_SALES on SUPERMARKET_SALES after insert  as 
begin 
	update SUPERMARKET_SALES
	set UpdateDate = GETDATE(), CreatedDate = GETDATE()
	where InvoiceID in (select distinct InvoiceID from inserted)
end
go


--delete from BRANCH
--delete from SUPERMARKET_SALES
--delete from PRODUCT
--delete from PRODUCT_LINE