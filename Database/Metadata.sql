create database BI_METADATA
go
use BI_METADATA

CREATE TABLE [dbo].[Data_Flow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
	[LSET] [datetime] NULL,
	[CET] [datetime] NULL,
	primary keY([ID])
)
go
create trigger insert_dataflow on Data_Flow after insert  as 
begin 
	update Data_Flow
	set LSET = GETDATE() , CET = GETDATE()
	where id in (select distinct id from inserted)
end
go

INSERT [dbo].[Data_Flow] ( [TableName], [LSET], [CET]) VALUES (N'PRODUCT_LINE', null, null)
INSERT [dbo].[Data_Flow] ( [TableName], [LSET], [CET]) VALUES (N'PRODUCT', null, null)
INSERT [dbo].[Data_Flow] ( [TableName], [LSET], [CET]) VALUES (N'BRANCH', null, null)
INSERT [dbo].[Data_Flow] ( [TableName], [LSET], [CET]) VALUES (N'SUPERMARKET_SALES', null, null)


select * from [Data_Flow]