CREATE TABLE [StgSalesOrderDetail]
(
	[SalesOrderID] INT NOT NULL, 
    [OrderQty] FLOAT NULL, 
    [ProductID] INT NULL, 
    [SpecialOfferID] INT NULL, 
    [UnitPrice] MONEY NULL, 
    [UnitPriceDiscount] FLOAT NULL, 
    [LineTotal] MONEY NULL
)
