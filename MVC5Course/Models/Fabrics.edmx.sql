
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/11/2018 16:21:43
-- Generated from EDMX file: C:\Users\Administrator\source\repos\MVC5Course\MVC5Course\Models\Fabrics.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Fabrics];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Client_Occupation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Client] DROP CONSTRAINT [FK_Client_Occupation];
GO
IF OBJECT_ID(N'[dbo].[fk_Order_ClientId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [fk_Order_ClientId];
GO
IF OBJECT_ID(N'[dbo].[fk_OrderLine_OrderId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderLine] DROP CONSTRAINT [fk_OrderLine_OrderId];
GO
IF OBJECT_ID(N'[dbo].[fk_OrderLine_ProductId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderLine] DROP CONSTRAINT [fk_OrderLine_ProductId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Client]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Client];
GO
IF OBJECT_ID(N'[dbo].[Occupation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Occupation];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderLine]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderLine];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Client'
CREATE TABLE [dbo].[Client] (
    [ClientId] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(40)  NULL,
    [MiddleName] varchar(40)  NULL,
    [LastName] varchar(40)  NULL,
    [Gender] char(1)  NULL,
    [DateOfBirth] datetime  NULL,
    [CreditRating] float  NULL,
    [XCode] char(7)  NULL,
    [OccupationId] int  NULL,
    [TelephoneNumber] varchar(20)  NULL,
    [Street1] varchar(100)  NULL,
    [Street2] varchar(100)  NULL,
    [City] varchar(100)  NULL,
    [ZipCode] varchar(15)  NULL,
    [Longitude] float  NULL,
    [Latitude] float  NULL,
    [Notes] varchar(max)  NULL,
    [IdNumber] nchar(10)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Occupation'
CREATE TABLE [dbo].[Occupation] (
    [OccupationId] int IDENTITY(1,1) NOT NULL,
    [OccupationName] varchar(60)  NULL
);
GO

-- Creating table 'Order'
CREATE TABLE [dbo].[Order] (
    [OrderId] int  NOT NULL,
    [ClientId] int  NULL,
    [OrderDate] datetime  NULL,
    [OrderTotal] decimal(18,2)  NULL,
    [OrderStatus] char(1)  NULL
);
GO

-- Creating table 'OrderLine'
CREATE TABLE [dbo].[OrderLine] (
    [OrderId] int  NOT NULL,
    [LineNumber] int  NOT NULL,
    [ProductId] int  NOT NULL,
    [Qty] decimal(18,3)  NOT NULL,
    [LineTotal] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [ProductName] varchar(80)  NULL,
    [Price] decimal(10,4)  NULL,
    [Active] bit  NULL,
    [Stock] decimal(18,3)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ClientId] in table 'Client'
ALTER TABLE [dbo].[Client]
ADD CONSTRAINT [PK_Client]
    PRIMARY KEY CLUSTERED ([ClientId] ASC);
GO

-- Creating primary key on [OccupationId] in table 'Occupation'
ALTER TABLE [dbo].[Occupation]
ADD CONSTRAINT [PK_Occupation]
    PRIMARY KEY CLUSTERED ([OccupationId] ASC);
GO

-- Creating primary key on [OrderId] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [PK_Order]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [OrderId], [LineNumber] in table 'OrderLine'
ALTER TABLE [dbo].[OrderLine]
ADD CONSTRAINT [PK_OrderLine]
    PRIMARY KEY CLUSTERED ([OrderId], [LineNumber] ASC);
GO

-- Creating primary key on [ProductId] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OccupationId] in table 'Client'
ALTER TABLE [dbo].[Client]
ADD CONSTRAINT [FK_Client_Occupation]
    FOREIGN KEY ([OccupationId])
    REFERENCES [dbo].[Occupation]
        ([OccupationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Client_Occupation'
CREATE INDEX [IX_FK_Client_Occupation]
ON [dbo].[Client]
    ([OccupationId]);
GO

-- Creating foreign key on [ClientId] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [fk_Order_ClientId]
    FOREIGN KEY ([ClientId])
    REFERENCES [dbo].[Client]
        ([ClientId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Order_ClientId'
CREATE INDEX [IX_fk_Order_ClientId]
ON [dbo].[Order]
    ([ClientId]);
GO

-- Creating foreign key on [OrderId] in table 'OrderLine'
ALTER TABLE [dbo].[OrderLine]
ADD CONSTRAINT [fk_OrderLine_OrderId]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Order]
        ([OrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductId] in table 'OrderLine'
ALTER TABLE [dbo].[OrderLine]
ADD CONSTRAINT [fk_OrderLine_ProductId]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Product]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_OrderLine_ProductId'
CREATE INDEX [IX_fk_OrderLine_ProductId]
ON [dbo].[OrderLine]
    ([ProductId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------