
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 12/12/2015 20:28:32
-- Generated from EDMX file: C:\Users\nil-p\documents\visual studio 2012\Projects\blog\blog\Models\BlogModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Blog];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Comments_Posts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Posts];
GO
IF OBJECT_ID(N'[dbo].[FK_PostsTags_Posts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostsTags] DROP CONSTRAINT [FK_PostsTags_Posts];
GO
IF OBJECT_ID(N'[dbo].[FK_PostsTags_Tags]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostsTags] DROP CONSTRAINT [FK_PostsTags_Tags];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Administrators]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Administrators];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[Posts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Posts];
GO
IF OBJECT_ID(N'[dbo].[PostsTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostsTags];
GO
IF OBJECT_ID(N'[dbo].[Tags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Administrators'
CREATE TABLE [dbo].[Administrators] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [Password] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [PostID] int  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [Email] nvarchar(128)  NOT NULL,
    [Body] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Posts'
CREATE TABLE [dbo].[Posts] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(256)  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Body] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(64)  NOT NULL
);
GO

-- Creating table 'PostsTags'
CREATE TABLE [dbo].[PostsTags] (
    [Posts_ID] int  NOT NULL,
    [Tags_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Administrators'
ALTER TABLE [dbo].[Administrators]
ADD CONSTRAINT [PK_Administrators]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Posts'
ALTER TABLE [dbo].[Posts]
ADD CONSTRAINT [PK_Posts]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Posts_ID], [Tags_ID] in table 'PostsTags'
ALTER TABLE [dbo].[PostsTags]
ADD CONSTRAINT [PK_PostsTags]
    PRIMARY KEY NONCLUSTERED ([Posts_ID], [Tags_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PostID] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_Comments_Posts]
    FOREIGN KEY ([PostID])
    REFERENCES [dbo].[Posts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Comments_Posts'
CREATE INDEX [IX_FK_Comments_Posts]
ON [dbo].[Comments]
    ([PostID]);
GO

-- Creating foreign key on [Posts_ID] in table 'PostsTags'
ALTER TABLE [dbo].[PostsTags]
ADD CONSTRAINT [FK_PostsTags_Posts]
    FOREIGN KEY ([Posts_ID])
    REFERENCES [dbo].[Posts]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tags_ID] in table 'PostsTags'
ALTER TABLE [dbo].[PostsTags]
ADD CONSTRAINT [FK_PostsTags_Tags]
    FOREIGN KEY ([Tags_ID])
    REFERENCES [dbo].[Tags]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostsTags_Tags'
CREATE INDEX [IX_FK_PostsTags_Tags]
ON [dbo].[PostsTags]
    ([Tags_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------