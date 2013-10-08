
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/09/2013 00:25:56
-- Generated from EDMX file: E:\SU\Telerik\MVC\CarService\CarService.DataAccessLayer\EntityModel\CarServiceEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-CarService.WebApp-20132205416];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_RepairCards_Cars]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RepairCards] DROP CONSTRAINT [FK_RepairCards_Cars];
GO
IF OBJECT_ID(N'[dbo].[FK_RepairCards_Mechanics]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RepairCards] DROP CONSTRAINT [FK_RepairCards_Mechanics];
GO
IF OBJECT_ID(N'[dbo].[FK_PartsCards_RepairCards]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartsCards] DROP CONSTRAINT [FK_PartsCards_RepairCards];
GO
IF OBJECT_ID(N'[dbo].[FK_PartsCards_SpareParts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartsCards] DROP CONSTRAINT [FK_PartsCards_SpareParts];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cars]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cars];
GO
IF OBJECT_ID(N'[dbo].[Mechanics]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Mechanics];
GO
IF OBJECT_ID(N'[dbo].[RepairCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RepairCards];
GO
IF OBJECT_ID(N'[dbo].[SpareParts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpareParts];
GO
IF OBJECT_ID(N'[dbo].[PartsCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartsCards];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cars'
CREATE TABLE [dbo].[Cars] (
    [Id] uniqueidentifier  NOT NULL,
    [RegistrationNumber] nvarchar(50)  NOT NULL,
    [FrameNumber] nvarchar(50)  NOT NULL,
    [EngineNumber] nvarchar(50)  NOT NULL,
    [Brand] nvarchar(50)  NOT NULL,
    [Model] nvarchar(50)  NOT NULL,
    [ProductionYear] datetime  NULL,
    [OwnerName] nvarchar(50)  NOT NULL,
    [OwnerNumber] int  NOT NULL
);
GO

-- Creating table 'Mechanics'
CREATE TABLE [dbo].[Mechanics] (
    [Id] uniqueidentifier  NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'RepairCards'
CREATE TABLE [dbo].[RepairCards] (
    [Id] uniqueidentifier  NOT NULL,
    [AcceptedDate] datetime  NOT NULL,
    [FinishedDate] datetime  NULL,
    [CarId] uniqueidentifier  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [MechanicId] uniqueidentifier  NOT NULL,
    [SparePartsPrice] int  NOT NULL,
    [RepairPrice] int  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [Completed] bit  NOT NULL
);
GO

-- Creating table 'SpareParts'
CREATE TABLE [dbo].[SpareParts] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Price] int  NOT NULL,
    [Active] bit  NOT NULL
);
GO

-- Creating table 'PartsCards'
CREATE TABLE [dbo].[PartsCards] (
    [RepairCards_Id] uniqueidentifier  NOT NULL,
    [SpareParts_Id] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [PK_Cars]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Mechanics'
ALTER TABLE [dbo].[Mechanics]
ADD CONSTRAINT [PK_Mechanics]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RepairCards'
ALTER TABLE [dbo].[RepairCards]
ADD CONSTRAINT [PK_RepairCards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SpareParts'
ALTER TABLE [dbo].[SpareParts]
ADD CONSTRAINT [PK_SpareParts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [RepairCards_Id], [SpareParts_Id] in table 'PartsCards'
ALTER TABLE [dbo].[PartsCards]
ADD CONSTRAINT [PK_PartsCards]
    PRIMARY KEY NONCLUSTERED ([RepairCards_Id], [SpareParts_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CarId] in table 'RepairCards'
ALTER TABLE [dbo].[RepairCards]
ADD CONSTRAINT [FK_RepairCards_Cars]
    FOREIGN KEY ([CarId])
    REFERENCES [dbo].[Cars]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RepairCards_Cars'
CREATE INDEX [IX_FK_RepairCards_Cars]
ON [dbo].[RepairCards]
    ([CarId]);
GO

-- Creating foreign key on [MechanicId] in table 'RepairCards'
ALTER TABLE [dbo].[RepairCards]
ADD CONSTRAINT [FK_RepairCards_Mechanics]
    FOREIGN KEY ([MechanicId])
    REFERENCES [dbo].[Mechanics]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RepairCards_Mechanics'
CREATE INDEX [IX_FK_RepairCards_Mechanics]
ON [dbo].[RepairCards]
    ([MechanicId]);
GO

-- Creating foreign key on [RepairCards_Id] in table 'PartsCards'
ALTER TABLE [dbo].[PartsCards]
ADD CONSTRAINT [FK_PartsCards_RepairCards]
    FOREIGN KEY ([RepairCards_Id])
    REFERENCES [dbo].[RepairCards]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SpareParts_Id] in table 'PartsCards'
ALTER TABLE [dbo].[PartsCards]
ADD CONSTRAINT [FK_PartsCards_SpareParts]
    FOREIGN KEY ([SpareParts_Id])
    REFERENCES [dbo].[SpareParts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PartsCards_SpareParts'
CREATE INDEX [IX_FK_PartsCards_SpareParts]
ON [dbo].[PartsCards]
    ([SpareParts_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------