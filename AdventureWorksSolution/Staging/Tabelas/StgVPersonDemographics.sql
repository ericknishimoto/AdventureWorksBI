CREATE TABLE [dbo].[StgVPersonDemographics]
(
	[BusinessEntityID] INT NOT NULL PRIMARY KEY, 
    [BirthDate] DATE NULL, 
    [MaritalStatus] NVARCHAR(2) NULL, 
    [Gender] NVARCHAR(2) NULL, 
    [TotalChildren] INT NULL, 
    [Education] NVARCHAR(50) NULL
)
