CREATE TABLE [dbo].[DimSpecialOffer]
(
	SpecialOfferKey INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	SpecialOfferAlternateKey INT NULL,
	SpecialOfferDescription NVARCHAR(50) NULL,
	DiscountPct NUMERIC NULL,
	SpecialOfferType NVARCHAR(50) NULL,
	SpecialOfferCategory NVARCHAR(50) NULL,
	SpecialOfferStarDate DATE NULL,
	SpecialOfferEndDate DATE NULL,
	SpecialOfferMinQty MONEY NULL,
	SpecialOfferMaxQty MONEY NULL,
)
