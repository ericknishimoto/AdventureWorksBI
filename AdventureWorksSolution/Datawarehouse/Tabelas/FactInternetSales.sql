CREATE TABLE [dbo].[FactInternetSales]
(
	[SalesOrderKey] INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	[CustomerKey] INT NOT NULL,
	[ProductKey] INT NOT NULL,
	[TerritoryKey] INT NOT NULL,
	[SpecialOfferKey] INT NOT NULL,
	[OrderDate] INT NOT NULL,
	[DueDate] INT NOT NULL,
	[ShipDate] INT NOT NULL,
	[OrderQty] FLOAT NOT NULL,
	[UnitPrice] MONEY NOT NULL,
	[UnitPriceDiscount] FLOAT NOT NULL,
	[LineTotal] MONEY NOT NULL,
	[SalesOrderAlternateKey] INT NOT NULL
)
