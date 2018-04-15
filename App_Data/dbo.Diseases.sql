CREATE TABLE [dbo].[Diseases] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (250) NOT NULL,
    [Description]  NVARCHAR (250) NULL,
    [Prognosis]    NVARCHAR (250) NULL,
    [Timestamp]    ROWVERSION     NOT NULL,
    [Phenotype_Id] INT            NOT NULL,
    CONSTRAINT [PK_Diseases] PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([Phenotype_Id]) REFERENCES [dbo].[Phenotype] ([Id]),
	
);

