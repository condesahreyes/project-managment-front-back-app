/****** Object:  Database [OBL2]    Script Date: 14/11/2021 21:52:41 ******/
CREATE DATABASE [OBL2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OBL2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OBL2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OBL2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OBL2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OBL2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OBL2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OBL2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OBL2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OBL2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OBL2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OBL2] SET ARITHABORT OFF 
GO
ALTER DATABASE [OBL2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OBL2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OBL2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OBL2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OBL2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OBL2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OBL2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OBL2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OBL2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OBL2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OBL2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OBL2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OBL2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OBL2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OBL2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OBL2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OBL2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OBL2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OBL2] SET  MULTI_USER 
GO
ALTER DATABASE [OBL2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OBL2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OBL2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OBL2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OBL2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OBL2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OBL2] SET QUERY_STORE = OFF
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bugs]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bugs](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Domain] [nvarchar](max) NULL,
	[Version] [nvarchar](max) NULL,
	[ProjectId] [uniqueidentifier] NULL,
	[SolvedById] [uniqueidentifier] NULL,
	[StateName] [nvarchar](450) NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_Bugs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalBugs] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Duration] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rols]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rols](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rols] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Name] [nvarchar](450) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[ProjectId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Token] [nvarchar](max) NULL,
	[RolId] [uniqueidentifier] NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersProject]    Script Date: 14/11/2021 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersProject](
	[ProjectsId] [uniqueidentifier] NOT NULL,
	[UsersId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UsersProject] PRIMARY KEY CLUSTERED 
(
	[ProjectsId] ASC,
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210924014508_Create-Database', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211001212204_DataBaseWithConnectionString', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211003214740_Agregado de token a modelo user', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211004214634_Eliminando tabla de bug para cambiar su comportamiento', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211004215246_Nueva migración estable sin tabla bug', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211004215400_Creando nueva tabla bug', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211014042839_Creación de tabla task con respectivas configuraciones', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211031014554_Nuevos atributos en User, Bug y Project para el calculo de duración y costos.', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211031035905_Cambio del tipo de variable Duration en entidad Task.', N'5.0.10')
GO
INSERT [dbo].[Bugs] ([Id], [Name], [Domain], [Version], [ProjectId], [SolvedById], [StateName], [Duration]) VALUES (1, N'Diseño 2 - bug 1', N'dominio', N'1.0', N'9a8d96ad-9075-4373-b64f-376205a0aeb3', NULL, N'resuelto', 100)
INSERT [dbo].[Bugs] ([Id], [Name], [Domain], [Version], [ProjectId], [SolvedById], [StateName], [Duration]) VALUES (2, N'Diseño 1 - bug 1', N'ort', N'1.1', N'fa8af5a2-bf2f-4232-971b-a4733d17de51', NULL, N'activo', 50)
INSERT [dbo].[Bugs] ([Id], [Name], [Domain], [Version], [ProjectId], [SolvedById], [StateName], [Duration]) VALUES (3, N'Inac - bug 1', N'dominio', N'5.1', N'15f30e39-dd8f-41bd-ac25-3dacb50eab04', NULL, N'activo', 50)
INSERT [dbo].[Bugs] ([Id], [Name], [Domain], [Version], [ProjectId], [SolvedById], [StateName], [Duration]) VALUES (5, N'Diseño 2 - bug 2', N'ort', N'1.2', N'9a8d96ad-9075-4373-b64f-376205a0aeb3', NULL, N'activo', 1)
INSERT [dbo].[Bugs] ([Id], [Name], [Domain], [Version], [ProjectId], [SolvedById], [StateName], [Duration]) VALUES (10, N'Diseño 1 - bug 2', N'10', N'10.1', N'fa8af5a2-bf2f-4232-971b-a4733d17de51', NULL, N'activo', 2)
GO
INSERT [dbo].[Projects] ([Id], [TotalBugs], [Name], [Duration], [Price]) VALUES (N'49ec2192-9856-4f84-8cd7-19c9587b4787', 0, N'Proyecto en JSON', 0, 0)
INSERT [dbo].[Projects] ([Id], [TotalBugs], [Name], [Duration], [Price]) VALUES (N'9a8d96ad-9075-4373-b64f-376205a0aeb3', 0, N'Diseño 2', 0, 0)
INSERT [dbo].[Projects] ([Id], [TotalBugs], [Name], [Duration], [Price]) VALUES (N'15f30e39-dd8f-41bd-ac25-3dacb50eab04', 0, N'INAC', 0, 0)
INSERT [dbo].[Projects] ([Id], [TotalBugs], [Name], [Duration], [Price]) VALUES (N'3942be31-9d7a-4bed-b07e-45660f3279a1', 0, N'Proyecto en xml', 0, 0)
INSERT [dbo].[Projects] ([Id], [TotalBugs], [Name], [Duration], [Price]) VALUES (N'fa8af5a2-bf2f-4232-971b-a4733d17de51', 0, N'Diseño 1 ', 0, 0)
INSERT [dbo].[Projects] ([Id], [TotalBugs], [Name], [Duration], [Price]) VALUES (N'9ff612f1-cffb-4e79-9d63-e2d069c25144', 0, N'Proyecto en txt', 0, 0)
GO
INSERT [dbo].[Rols] ([Id], [Name]) VALUES (N'8e1c2470-fa28-4a02-b159-88c5674ec602', N'Administrador')
INSERT [dbo].[Rols] ([Id], [Name]) VALUES (N'8e1c2470-fa28-4a02-b159-88c5674ec603', N'Tester')
INSERT [dbo].[Rols] ([Id], [Name]) VALUES (N'8e1c2470-fa28-4a02-b159-88c5674ec604', N'Desarrollador')
GO
INSERT [dbo].[States] ([Name], [Id]) VALUES (N'activo', N'8e1c2470-fa28-4a02-b159-88c5674ec603')
INSERT [dbo].[States] ([Name], [Id]) VALUES (N'resuelto', N'8e1c2470-fa28-4a02-b159-88c5674ec602')
GO
INSERT [dbo].[Tasks] ([Id], [Name], [Price], [Duration], [ProjectId]) VALUES (N'8d9ef779-a600-4b88-bf03-191381a6c0f1', N'Deploy', 2, 2, N'fa8af5a2-bf2f-4232-971b-a4733d17de51')
INSERT [dbo].[Tasks] ([Id], [Name], [Price], [Duration], [ProjectId]) VALUES (N'7fb3644d-ed4a-4dce-ad97-1f635bac27da', N'Importar bugs en XML', 1, 1, N'3942be31-9d7a-4bed-b07e-45660f3279a1')
INSERT [dbo].[Tasks] ([Id], [Name], [Price], [Duration], [ProjectId]) VALUES (N'5adb9da6-76aa-4ac5-b67c-4959cc45a18a', N'Implementar funcionalidad alta usuario', 10, 10, N'9a8d96ad-9075-4373-b64f-376205a0aeb3')
INSERT [dbo].[Tasks] ([Id], [Name], [Price], [Duration], [ProjectId]) VALUES (N'ddbfc82c-495d-456f-8399-640a1c437eb8', N'Testear pantalla usuario', 5, 5, N'9a8d96ad-9075-4373-b64f-376205a0aeb3')
GO
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId], [Price]) VALUES (N'7ea4c11e-4eb2-43f4-b61b-08d989afbe0e', N'Admin', N'Admin', N'Admin', N'Admin', N'admin@admin.com', N'Administrador-96870d55-6919-45b8-9a19-75acf7da5c19', N'8e1c2470-fa28-4a02-b159-88c5674ec602', 0)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId], [Price]) VALUES (N'bf366e0f-b05e-4544-8eab-08d9a7c3a750', N'Hernán', N'Reyes', N'hrAdmin', N'Admin', N'hreyes@gmail.com', NULL, N'8e1c2470-fa28-4a02-b159-88c5674ec602', 0)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId], [Price]) VALUES (N'b82da448-7c32-4643-8eac-08d9a7c3a750', N'Juan', N'Pedro', N'JpDesarollador', N'Desarrollador', N'jp@desarrollo.com', NULL, N'8e1c2470-fa28-4a02-b159-88c5674ec604', 10)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId], [Price]) VALUES (N'ea32030c-de02-40d3-8ead-08d9a7c3a750', N'Pablo', N'Asadurian', N'asaduDesarrollador', N'Desarrollador', N'pasadurian@desarrollo.com', NULL, N'8e1c2470-fa28-4a02-b159-88c5674ec604', 15)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId], [Price]) VALUES (N'7742e020-c9f8-440d-8eae-08d9a7c3a750', N'Diego', N'carrizo', N'dcarrizo', N'Admin', N'dcarrizo@admin.com', NULL, N'8e1c2470-fa28-4a02-b159-88c5674ec602', 0)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId], [Price]) VALUES (N'9cbdcf4a-ffb4-4fc8-8eb0-08d9a7c3a750', N'Alberto', N'Riquelme', N'alberTester', N'Tester', N'alberto@tester.com', NULL, N'8e1c2470-fa28-4a02-b159-88c5674ec603', 30)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId], [Price]) VALUES (N'374d8603-7459-4ce6-8eb1-08d9a7c3a750', N'Nicolas', N'Gonzales', N'nicoTester', N'Tester', N'nico@tester.com', NULL, N'8e1c2470-fa28-4a02-b159-88c5674ec603', 10)
GO
INSERT [dbo].[UsersProject] ([ProjectsId], [UsersId]) VALUES (N'9a8d96ad-9075-4373-b64f-376205a0aeb3', N'b82da448-7c32-4643-8eac-08d9a7c3a750')
INSERT [dbo].[UsersProject] ([ProjectsId], [UsersId]) VALUES (N'fa8af5a2-bf2f-4232-971b-a4733d17de51', N'ea32030c-de02-40d3-8ead-08d9a7c3a750')
INSERT [dbo].[UsersProject] ([ProjectsId], [UsersId]) VALUES (N'9a8d96ad-9075-4373-b64f-376205a0aeb3', N'9cbdcf4a-ffb4-4fc8-8eb0-08d9a7c3a750')
INSERT [dbo].[UsersProject] ([ProjectsId], [UsersId]) VALUES (N'fa8af5a2-bf2f-4232-971b-a4733d17de51', N'374d8603-7459-4ce6-8eb1-08d9a7c3a750')
GO
/****** Object:  Index [IX_Bugs_ProjectId]    Script Date: 14/11/2021 21:52:42 ******/
CREATE NONCLUSTERED INDEX [IX_Bugs_ProjectId] ON [dbo].[Bugs]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bugs_SolvedById]    Script Date: 14/11/2021 21:52:42 ******/
CREATE NONCLUSTERED INDEX [IX_Bugs_SolvedById] ON [dbo].[Bugs]
(
	[SolvedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bugs_StateName]    Script Date: 14/11/2021 21:52:42 ******/
CREATE NONCLUSTERED INDEX [IX_Bugs_StateName] ON [dbo].[Bugs]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tasks_ProjectId]    Script Date: 14/11/2021 21:52:42 ******/
CREATE NONCLUSTERED INDEX [IX_Tasks_ProjectId] ON [dbo].[Tasks]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RolId]    Script Date: 14/11/2021 21:52:42 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RolId] ON [dbo].[Users]
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersProject_UsersId]    Script Date: 14/11/2021 21:52:42 ******/
CREATE NONCLUSTERED INDEX [IX_UsersProject_UsersId] ON [dbo].[UsersProject]
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Projects] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_States_StateName] FOREIGN KEY([StateName])
REFERENCES [dbo].[States] ([Name])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_States_StateName]
GO
ALTER TABLE [dbo].[Bugs]  WITH CHECK ADD  CONSTRAINT [FK_Bugs_Users_SolvedById] FOREIGN KEY([SolvedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Bugs] CHECK CONSTRAINT [FK_Bugs_Users_SolvedById]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Rols_RolId] FOREIGN KEY([RolId])
REFERENCES [dbo].[Rols] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Rols_RolId]
GO
ALTER TABLE [dbo].[UsersProject]  WITH CHECK ADD  CONSTRAINT [FK_UsersProject_Projects_ProjectsId] FOREIGN KEY([ProjectsId])
REFERENCES [dbo].[Projects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersProject] CHECK CONSTRAINT [FK_UsersProject_Projects_ProjectsId]
GO
ALTER TABLE [dbo].[UsersProject]  WITH CHECK ADD  CONSTRAINT [FK_UsersProject_Users_UsersId] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersProject] CHECK CONSTRAINT [FK_UsersProject_Users_UsersId]
GO
ALTER DATABASE [OBL2] SET  READ_WRITE 
GO
