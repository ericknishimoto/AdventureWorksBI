CREATE TABLE [dbo].[StgSpecialOffer]
(
	[SpecialOfferID] INT NOT NULL, 
    [Description] NVARCHAR(50) NULL, 
    [DiscountPct] FLOAT NULL, 
    [Type] NVARCHAR(50) NULL, 
    [Category] NVARCHAR(50) NULL, 
    [StarDate] DATE NULL, 
    [EndDate] DATE NULL, 
    [MinQty] MONEY NULL, 
    [MaxQty] MONEY NULL
)
