CREATE TABLE [dbo].[Table]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [title] NVARCHAR(256) NOT NULL, 
    [datetime] DATETIME NOT NULL, 
    [body] NVARCHAR(MAX) NOT NULL
)
