CREATE TABLE [dbo].[DimSalesTerritory]
(
	[TerritoryKey] INT NOT NULL PRIMARY KEY IDENTITY (1,1), 
    [TerritoryAlternateKey] INT NOT NULL, 
    [TerritoryName] NVARCHAR(50) NULL, 
    [TerritoryCountryRegionCode] NVARCHAR(50) NULL, 
    [TerritoryGroup] NVARCHAR(50) NULL
)
