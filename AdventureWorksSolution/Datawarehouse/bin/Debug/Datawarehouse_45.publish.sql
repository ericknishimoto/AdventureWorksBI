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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Rename refactoring operation with key a41e7d52-e85a-46ef-858b-02f9821cf4ca is skipped, element [dbo].[Table1].[Id] (SqlSimpleColumn) will not be renamed to TerritoryKey';


GO
PRINT N'Rename refactoring operation with key 531b98c6-a005-40d3-b262-3c5d70d275a1 is skipped, element [dbo].[Table1].[Territory] (SqlSimpleColumn) will not be renamed to TerritoryAlternateKey';


GO
PRINT N'Rename refactoring operation with key 663b848a-104d-45f3-9ea7-619f71a4e18a is skipped, element [dbo].[StgVPersonDemographics].[Id] (SqlSimpleColumn) will not be renamed to BusinessEntityID';


GO
PRINT N'Rename refactoring operation with key a2b624e6-8ce1-4407-9a18-e7a1b51b62c8 is skipped, element [dbo].[StgSpecialOfferProduct].[Id] (SqlSimpleColumn) will not be renamed to ProductID';


GO
PRINT N'Rename refactoring operation with key 56cc48ed-ce13-42f7-a3c0-c453b9d801eb, 84b16a72-bcf2-413a-856d-2e5aee99a594 is skipped, element [dbo].[StgSpecialOffer].[Id] (SqlSimpleColumn) will not be renamed to SpecialOfferID';


GO
PRINT N'Rename refactoring operation with key 1eb4edfc-741e-4c06-bfa1-0d05865b515f is skipped, element [dbo].[StgSpecialOffer].[SpecialOfferDescription] (SqlSimpleColumn) will not be renamed to Description';


GO
PRINT N'Rename refactoring operation with key 8bdc1c30-5293-41e7-a649-a423520f3456 is skipped, element [dbo].[StgSpecialOffer].[SpecialOfferType] (SqlSimpleColumn) will not be renamed to Type';


GO
PRINT N'Rename refactoring operation with key a54db4ba-c337-49e5-877a-25f843beec12 is skipped, element [dbo].[StgSpecialOffer].[SpecialOfferCategory] (SqlSimpleColumn) will not be renamed to Category';


GO
PRINT N'Rename refactoring operation with key 15d6145d-8b3d-438c-8bd3-c1ad5507d9fe is skipped, element [dbo].[StgSpecialOffer].[SpecialOfferStarDate] (SqlSimpleColumn) will not be renamed to StarDate';


GO
PRINT N'Rename refactoring operation with key 65aadda1-4398-4ee1-b5c1-646a7935a129 is skipped, element [dbo].[StgSpecialOffer].[SpecialOfferEndDate] (SqlSimpleColumn) will not be renamed to EndDate';


GO
PRINT N'Rename refactoring operation with key ecd45feb-c8bf-44b1-8913-3651f42df4e7 is skipped, element [dbo].[StgSpecialOffer].[SpecialOfferMinQty] (SqlSimpleColumn) will not be renamed to MinQty';


GO
PRINT N'Rename refactoring operation with key f2f3d990-f3c1-421b-8797-d7525b3a7806 is skipped, element [dbo].[StgSpecialOffer].[SpecialOfferMaxQty] (SqlSimpleColumn) will not be renamed to MaxQty';


GO
PRINT N'Rename refactoring operation with key e29e81e8-4c30-4627-b75a-a18ec77733b7 is skipped, element [dbo].[StgInternetSales].[Id] (SqlSimpleColumn) will not be renamed to SalesOrderID';


GO
PRINT N'Creating Table [dbo].[DimCustomer]...';


GO
CREATE TABLE [dbo].[DimCustomer] (
    [CustomerKey]                INT            IDENTITY (1, 1) NOT NULL,
    [CustomerAlternateKey]       NVARCHAR (50)  NOT NULL,
    [CustomerFullName]           NVARCHAR (MAX) NOT NULL,
    [CustomerMaritalStatus]      NVARCHAR (2)   NULL,
    [CustomerGender]             NVARCHAR (2)   NULL,
    [CustomerTotalChildren]      INT            NULL,
    [CustomerEducation]          NVARCHAR (50)  NULL,
    [CustomerTerritoryName]      NVARCHAR (50)  NULL,
    [TerritoryCountryRegionCode] NVARCHAR (50)  NULL,
    [TerritoryGroup]             NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
);


GO
PRINT N'Creating Table [dbo].[DimDate]...';


GO
CREATE TABLE [dbo].[DimDate] (
    [DateKey]              INT          NOT NULL,
    [FullDateAlternateKey] DATETIME     NOT NULL,
    [DayNumberOfWeek]      INT          NOT NULL,
    [DayNumberOfMonth]     INT          NOT NULL,
    [WeekNumberOfYear]     INT          NOT NULL,
    [MonthName]            VARCHAR (50) NOT NULL,
    [MonthNumberOfYear]    INT          NOT NULL,
    [CalendarQuarter]      INT          NOT NULL,
    [CalendarYear]         INT          NOT NULL,
    [CalendarSemester]     INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO
PRINT N'Creating Table [dbo].[DimProduct]...';


GO
CREATE TABLE [dbo].[DimProduct] (
    [ProductKey]          INT           IDENTITY (1, 1) NOT NULL,
    [ProducAlternatetKey] INT           NOT NULL,
    [ProductName]         NVARCHAR (50) NOT NULL,
    [ProductColor]        NVARCHAR (50) NULL,
    [ProductSubcategory]  NVARCHAR (50) NOT NULL,
    [ProductCategory]     NVARCHAR (50) NOT NULL,
    [ListPrice]           MONEY         NOT NULL,
    [StandardCost]        MONEY         NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductKey] ASC)
);


GO
PRINT N'Creating Table [dbo].[DimSalesTerritory]...';


GO
CREATE TABLE [dbo].[DimSalesTerritory] (
    [TerritoryKey]               INT           IDENTITY (1, 1) NOT NULL,
    [TerritoryAlternateKey]      INT           NOT NULL,
    [TerritoryName]              NVARCHAR (50) NULL,
    [TerritoryCountryRegionCode] NVARCHAR (50) NULL,
    [TerritoryGroup]             NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([TerritoryKey] ASC)
);


GO
PRINT N'Creating Table [dbo].[DimSpecialOffer]...';


GO
CREATE TABLE [dbo].[DimSpecialOffer] (
    [SpecialOfferKey]          INT           IDENTITY (1, 1) NOT NULL,
    [SpecialOfferAlternateKey] NVARCHAR (50) NULL,
    [SpecialOfferDescription]  NVARCHAR (50) NULL,
    [DiscountPct]              NUMERIC (18)  NULL,
    [SpecialOfferType]         NVARCHAR (50) NULL,
    [SpecialOfferCategory]     NVARCHAR (50) NULL,
    [SpecialOfferStarDate]     DATE          NULL,
    [SpecialOfferEndDate]      DATE          NULL,
    [SpecialOfferMinQty]       MONEY         NULL,
    [SpecialOfferMaxQty]       MONEY         NULL,
    PRIMARY KEY CLUSTERED ([SpecialOfferKey] ASC)
);


GO
PRINT N'Creating Table [dbo].[FactInternetSales]...';


GO
CREATE TABLE [dbo].[FactInternetSales] (
    [SalesOrderKey]          INT          NOT NULL,
    [CustomerKey]            INT          NOT NULL,
    [DateKey]                INT          NOT NULL,
    [ProductKey]             INT          NOT NULL,
    [TerritoryKey]           INT          NOT NULL,
    [SpecialOfferKey]        INT          NOT NULL,
    [SalesOrderAlternateKey] VARCHAR (50) NOT NULL,
    [OrderDate]              INT          NOT NULL,
    [DueDate]                INT          NOT NULL,
    [ShipDate]               INT          NOT NULL,
    [Subtotal]               MONEY        NOT NULL,
    [OrderQty]               FLOAT (53)   NOT NULL,
    [UnitPrice]              MONEY        NOT NULL,
    [UnitPriceDiscount]      FLOAT (53)   NOT NULL,
    [LineTotal]              MONEY        NOT NULL,
    PRIMARY KEY CLUSTERED ([SalesOrderKey] ASC)
);


GO
PRINT N'Creating Table [dbo].[StgCustomer]...';


GO
CREATE TABLE [dbo].[StgCustomer] (
    [CustomerID]  INT NOT NULL,
    [PersonID]    INT NULL,
    [TerritoryID] INT NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO
PRINT N'Creating Table [dbo].[StgPerson]...';


GO
CREATE TABLE [dbo].[StgPerson] (
    [BusinessEntityID] INT           NOT NULL,
    [FirstName]        NVARCHAR (50) NOT NULL,
    [MiddleName]       NVARCHAR (50) NULL,
    [LastName]         NVARCHAR (50) NULL
);


GO
PRINT N'Creating Table [dbo].[StgProduct]...';


GO
CREATE TABLE [dbo].[StgProduct] (
    [ProductID]            INT           NOT NULL,
    [Name]                 NVARCHAR (50) NOT NULL,
    [Color]                NVARCHAR (15) NULL,
    [StandardCost]         MONEY         NOT NULL,
    [ListPrice]            MONEY         NOT NULL,
    [ProductSubcategoryID] INT           NULL
);


GO
PRINT N'Creating Table [dbo].[StgProductCategory]...';


GO
CREATE TABLE [dbo].[StgProductCategory] (
    [ProductCategoryID] INT           NOT NULL,
    [Name]              NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating Table [dbo].[StgProductSubcategory]...';


GO
CREATE TABLE [dbo].[StgProductSubcategory] (
    [ProductSubcategoryID] INT           NOT NULL,
    [ProductCategoryID]    INT           NOT NULL,
    [Name]                 NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating Table [dbo].[StgSalesOrderDetail]...';


GO
CREATE TABLE [dbo].[StgSalesOrderDetail] (
    [SalesOrderID]      INT        NOT NULL,
    [OrderQty]          FLOAT (53) NULL,
    [ProductID]         INT        NULL,
    [SpecialOrderID]    INT        NULL,
    [UnitPrice]         MONEY      NULL,
    [UnitPriceDiscount] FLOAT (53) NULL,
    [LineTotal]         MONEY      NULL
);


GO
PRINT N'Creating Table [dbo].[StgSalesOrderHeader]...';


GO
CREATE TABLE [dbo].[StgSalesOrderHeader] (
    [SalesOrderID] INT   NOT NULL,
    [OrderDate]    DATE  NULL,
    [DueDate]      DATE  NULL,
    [ShipDate]     DATE  NULL,
    [CustomerID]   INT   NULL,
    [TerritoryID]  INT   NULL,
    [Subtotal]     MONEY NULL
);


GO
PRINT N'Creating Table [dbo].[StgSalesTerritory]...';


GO
CREATE TABLE [dbo].[StgSalesTerritory] (
    [TerritoryID]       INT           NOT NULL,
    [Name]              NVARCHAR (50) NOT NULL,
    [CountryRegionCode] NVARCHAR (3)  NOT NULL,
    [Group]             NVARCHAR (50) NOT NULL
);


GO
PRINT N'Creating Table [dbo].[StgSpecialOffer]...';


GO
CREATE TABLE [dbo].[StgSpecialOffer] (
    [SpecialOfferID] INT           NOT NULL,
    [Description]    NVARCHAR (50) NULL,
    [DiscountPct]    FLOAT (53)    NULL,
    [Type]           NVARCHAR (50) NULL,
    [Category]       NVARCHAR (50) NULL,
    [StarDate]       DATE          NULL,
    [EndDate]        DATE          NULL,
    [MinQty]         MONEY         NULL,
    [MaxQty]         MONEY         NULL
);


GO
PRINT N'Creating Table [dbo].[StgVPersonDemographics]...';


GO
CREATE TABLE [dbo].[StgVPersonDemographics] (
    [BusinessEntityID] INT           NOT NULL,
    [BirthDate]        DATE          NULL,
    [MaritalStatus]    NVARCHAR (2)  NULL,
    [Gender]           NVARCHAR (2)  NULL,
    [TotalChildren]    INT           NULL,
    [Education]        NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC)
);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a41e7d52-e85a-46ef-858b-02f9821cf4ca')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a41e7d52-e85a-46ef-858b-02f9821cf4ca')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '531b98c6-a005-40d3-b262-3c5d70d275a1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('531b98c6-a005-40d3-b262-3c5d70d275a1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '663b848a-104d-45f3-9ea7-619f71a4e18a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('663b848a-104d-45f3-9ea7-619f71a4e18a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a2b624e6-8ce1-4407-9a18-e7a1b51b62c8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a2b624e6-8ce1-4407-9a18-e7a1b51b62c8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '56cc48ed-ce13-42f7-a3c0-c453b9d801eb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('56cc48ed-ce13-42f7-a3c0-c453b9d801eb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '84b16a72-bcf2-413a-856d-2e5aee99a594')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('84b16a72-bcf2-413a-856d-2e5aee99a594')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1eb4edfc-741e-4c06-bfa1-0d05865b515f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1eb4edfc-741e-4c06-bfa1-0d05865b515f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8bdc1c30-5293-41e7-a649-a423520f3456')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8bdc1c30-5293-41e7-a649-a423520f3456')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a54db4ba-c337-49e5-877a-25f843beec12')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a54db4ba-c337-49e5-877a-25f843beec12')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '15d6145d-8b3d-438c-8bd3-c1ad5507d9fe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('15d6145d-8b3d-438c-8bd3-c1ad5507d9fe')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '65aadda1-4398-4ee1-b5c1-646a7935a129')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('65aadda1-4398-4ee1-b5c1-646a7935a129')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ecd45feb-c8bf-44b1-8913-3651f42df4e7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ecd45feb-c8bf-44b1-8913-3651f42df4e7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f2f3d990-f3c1-421b-8797-d7525b3a7806')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f2f3d990-f3c1-421b-8797-d7525b3a7806')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e29e81e8-4c30-4627-b75a-a18ec77733b7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e29e81e8-4c30-4627-b75a-a18ec77733b7')

GO

GO
PRINT N'Update complete.';


GO
