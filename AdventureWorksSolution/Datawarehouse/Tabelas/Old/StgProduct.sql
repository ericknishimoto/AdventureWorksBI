CREATE TABLE [StgProduct](
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](50)NOT NULL,
	[Color] [nvarchar](15) NULL,	
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[ProductSubcategoryID] [int] NULL
)