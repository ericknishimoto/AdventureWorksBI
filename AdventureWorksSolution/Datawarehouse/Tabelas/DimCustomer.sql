CREATE TABLE [dbo].DimCustomer
(
    CustomerKey INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CustomerAlternateKey INT NOT NULL,
    CustomerFullName NVARCHAR(MAX) NOT NULL,
    CustomerMaritalStatus NVARCHAR(2) NULL,
    CustomerGender NVARCHAR(2) NULL,
    CustomerTotalChildren INT NULL,
    CustomerEducation NVARCHAR(50) NULL,
    CustomerTerritoryName NVARCHAR(50) NULL,
    TerritoryCountryRegionCode NVARCHAR(50) NULL,
    TerritoryGroup NVARCHAR(50) NULL
)