﻿/*
Deployment script for DW_AdventureWorks

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_AdventureWorks"
:setvar DefaultFilePrefix "DW_AdventureWorks"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 663b848a-104d-45f3-9ea7-619f71a4e18a is skipped, element [dbo].[StgVPersonDemographics].[Id] (SqlSimpleColumn) will not be renamed to BusinessEntityID';


GO
PRINT N'Creating Table [dbo].[DimProduct]...';


GO
CREATE TABLE [dbo].[DimProduct] (
    [ProductKey]          INT          NOT NULL,
    [ProducAlternatetKey] VARCHAR (50) NOT NULL,
    [ProductName]         VARCHAR (50) NOT NULL,
    [ProductColor]        VARCHAR (50) NULL,
    [ProductSubcategory]  VARCHAR (50) NOT NULL,
    [ProductCategory]     VARCHAR (50) NOT NULL,
    [ListPrice]           NUMERIC (18) NOT NULL,
    [StandardCost]        NUMERIC (18) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductKey] ASC)
);


GO
PRINT N'Creating Table [dbo].[StgVPersonDemographics]...';


GO
CREATE TABLE [dbo].[StgVPersonDemographics] (
    [BusinessEntityID] INT          NOT NULL,
    [BirthDate]        DATE         NULL,
    [MaritalStatus]    NCHAR (10)   NULL,
    [Gender]           NCHAR (10)   NULL,
    [TotalChildren]    INT          NULL,
    [Education]        VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC)
);


GO
PRINT N'Creating Foreign Key [dbo].[FK_FactInternetSales_DimCustomer]...';


GO
ALTER TABLE [dbo].[FactInternetSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactInternetSales_DimCustomer] FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_FactInternetSales_DimDate]...';


GO
ALTER TABLE [dbo].[FactInternetSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactInternetSales_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_FactInternetSales_DimProduct]...';


GO
ALTER TABLE [dbo].[FactInternetSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactInternetSales_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_FactInternetSales_DimSalesTerritory]...';


GO
ALTER TABLE [dbo].[FactInternetSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactInternetSales_DimSalesTerritory] FOREIGN KEY ([TerritoryKey]) REFERENCES [dbo].[DimSalesTerritory] ([TerritoryKey]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_FactInternetSales_DimSpecialOffer]...';


GO
ALTER TABLE [dbo].[FactInternetSales] WITH NOCHECK
    ADD CONSTRAINT [FK_FactInternetSales_DimSpecialOffer] FOREIGN KEY ([SpecialOfferKey]) REFERENCES [dbo].[DimSpecialOffer] ([SpecialOfferKey]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '663b848a-104d-45f3-9ea7-619f71a4e18a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('663b848a-104d-45f3-9ea7-619f71a4e18a')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[FactInternetSales] WITH CHECK CHECK CONSTRAINT [FK_FactInternetSales_DimCustomer];

ALTER TABLE [dbo].[FactInternetSales] WITH CHECK CHECK CONSTRAINT [FK_FactInternetSales_DimDate];

ALTER TABLE [dbo].[FactInternetSales] WITH CHECK CHECK CONSTRAINT [FK_FactInternetSales_DimProduct];

ALTER TABLE [dbo].[FactInternetSales] WITH CHECK CHECK CONSTRAINT [FK_FactInternetSales_DimSalesTerritory];

ALTER TABLE [dbo].[FactInternetSales] WITH CHECK CHECK CONSTRAINT [FK_FactInternetSales_DimSpecialOffer];


GO
PRINT N'Update complete.';


GO