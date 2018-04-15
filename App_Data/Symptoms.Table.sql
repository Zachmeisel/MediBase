CREATE TABLE [dbo].[Diseases]
(
	[Id] INT NOT NULL , 
    [Disease_Id] NVARCHAR(50) NOT NULL, 
    [Name] NVARCHAR(50) NULL, 
    [Description] NVARCHAR(250) NULL, 
    [Prognosis] NVARCHAR(50) NULL, 
    [Timestamp] NCHAR(10) NULL, 
    [Phenotype_Id] NVARCHAR(50) NOT NULL FOREIGN KEY ([Phenotype_Id]) REFERENCES [Phenotype]([Phenotype_Id]), 
    PRIMARY KEY ([Disease_Id])
)
