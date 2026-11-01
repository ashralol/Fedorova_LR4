USE [master]
GO
CREATE DATABASE [DB_Users]
GO
USE [DB_Users]
GO
CREATE TABLE [dbo].[Roles](
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([Name] ASC)
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[First_Name] [nvarchar](50) NULL,
	[Role_Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([ID] ASC)
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([Name]) VALUES (N'Admin')
INSERT [dbo].[Roles] ([Name]) VALUES (N'Director')
INSERT [dbo].[Roles] ([Name]) VALUES (N'Guest')
INSERT [dbo].[Roles] ([Name]) VALUES (N'Seller')
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [Login], [Password], [First_Name], [Role_Name]) VALUES (4, N'funny', N'somepass', N'Dave', N'Admin')
INSERT [dbo].[Users] ([ID], [Login], [Password], [First_Name], [Role_Name]) VALUES (6, N'bummer', N'02061995', N'Fred', N'Seller')
INSERT [dbo].[Users] ([ID], [Login], [Password], [First_Name], [Role_Name]) VALUES (8, N'dolorous', N'polk159', N'Brian', N'Seller')
INSERT [dbo].[Users] ([ID], [Login], [Password], [First_Name], [Role_Name]) VALUES (19, N'Boss', N'123456', N'Jorge', N'Director')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Users] WITH CHECK ADD CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role_Name]) REFERENCES [dbo].[Roles] ([Name])
GO
