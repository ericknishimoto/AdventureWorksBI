CREATE TABLE [dbo].[StgSalesOrderHeader]
(
	[SalesOrderID] INT NOT NULL, 
    [OrderDate] DATE NULL, 
    [DueDate] DATE NULL, 
    [ShipDate] DATE NULL, 
    [CustomerID] INT NULL, 
    [TerritoryID] INT NULL, 
    [OnlineOrderFlag] INT NULL 
)
