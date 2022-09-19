CREATE TABLE [StgPerson](
	[BusinessEntityID] [int] NOT NULL,
	[FirstName] [nvarchar](50)NOT NULL,
	[MiddleName] [nvarchar](50)NOT NULL,
	[LastName] [nvarchar](50)NOT NULL,
	[AdditionalContactInfo] [xml] NULL,
	[Demographics] [xml] NULL
)