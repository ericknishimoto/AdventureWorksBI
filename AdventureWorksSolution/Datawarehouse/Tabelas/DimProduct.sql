CREATE TABLE [dbo].DimProduct
(
	ProductKey INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ProducAlternatetKey INT NOT NULL,
    ProductName NVARCHAR(50) NOT NULL,
    ProductColor NVARCHAR(50) NULL,
    ProductSubcategory NVARCHAR(50) NOT NULL,
    ProductCategory NVARCHAR(50) NOT NULL,
    ListPrice MONEY NOT NULL,
    StandardCost MONEY NOT NULL
)
