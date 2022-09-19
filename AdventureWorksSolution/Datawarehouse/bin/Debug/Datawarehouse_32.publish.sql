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
PRINT N'Creating Table [dbo].[DimSpecialOffer]...';


GO
CREATE TABLE [dbo].[DimSpecialOffer] (
    [SpecialOfferKey]          INT           NOT NULL,
    [SpecialOfferAlternateKey] NVARCHAR (50) NOT NULL,
    [SpecialOfferDescription]  NVARCHAR (50) NOT NULL,
    [DiscountPct]              NUMERIC (18)  NOT NULL,
    [SpecialOfferType]         NVARCHAR (50) NOT NULL,
    [SpecialOfferCategory]     NVARCHAR (50) NOT NULL,
    [SpecialOfferStarDate]     DATE          NOT NULL,
    [SpecialOfferEndDate]      DATE          NOT NULL,
    [SpecialOfferMinQty]       NUMERIC (18)  NOT NULL,
    [SpecialOfferMaxQty]       NUMERIC (18)  NOT NULL,
    PRIMARY KEY CLUSTERED ([SpecialOfferKey] ASC)
);


GO
PRINT N'Update complete.';


GO
