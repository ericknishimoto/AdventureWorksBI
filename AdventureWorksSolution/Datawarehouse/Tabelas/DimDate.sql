CREATE TABLE [dbo].[DimDate]
(
	DateKey INT PRIMARY KEY NOT NULL,
	FullDateAlternateKey DATE NOT NULL,
	[Year] INT NOT NULL,
	[HalfNumber] INT NOT NULL,
	[Half] NVARCHAR(50) NOT NULL,
	[QuarterNumber] INT NOT NULL,
	[Quarter] NVARCHAR(50) NOT NULL,
	[MonthNumber] INT NOT NULL,
	[Month] NVARCHAR(50) NOT NULL,
	[Day] INT NOT NULL, 
    [WeekDayNumber] INT NOT NULL, 
    [WeekDay] NVARCHAR(50) NOT NULL, 
    [WeekYearNum] INT NOT NULL, 
    [WeekYear] NVARCHAR(50) NOT NULL
)
