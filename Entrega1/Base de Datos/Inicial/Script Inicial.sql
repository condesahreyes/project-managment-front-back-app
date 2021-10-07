USE [master]
GO
/****** Object:  Database [OBL2]    Script Date: 07/10/2021 11:52:28 ******/
CREATE DATABASE [OBL2]
 CONTAINMENT = NONE

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
ALTER DATABASE [OBL2] SET  DISABLE_BROKER 
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
USE [OBL2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/10/2021 11:52:28 ******/
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
/****** Object:  Table [dbo].[Bugs]    Script Date: 07/10/2021 11:52:28 ******/
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
 CONSTRAINT [PK_Bugs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 07/10/2021 11:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [uniqueidentifier] NOT NULL,
	[TotalBugs] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rols]    Script Date: 07/10/2021 11:52:28 ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 07/10/2021 11:52:28 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 07/10/2021 11:52:28 ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersProject]    Script Date: 07/10/2021 11:52:28 ******/
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
GO
INSERT [dbo].[Rols] ([Id], [Name]) VALUES (N'8e1c2470-fa28-4a02-b159-88c5674ec602', N'Administrador')
INSERT [dbo].[Rols] ([Id], [Name]) VALUES (N'8e1c2470-fa28-4a02-b159-88c5674ec603', N'Tester')
INSERT [dbo].[Rols] ([Id], [Name]) VALUES (N'8e1c2470-fa28-4a02-b159-88c5674ec604', N'Desarrollador')
GO
INSERT [dbo].[States] ([Name], [Id]) VALUES (N'activo', N'8e1c2470-fa28-4a02-b159-88c5674ec603')
INSERT [dbo].[States] ([Name], [Id]) VALUES (N'resuelto', N'8e1c2470-fa28-4a02-b159-88c5674ec602')
GO
INSERT [dbo].[Users] ([Id], [Name], [LastName], [UserName], [Password], [Email], [Token], [RolId]) VALUES (N'8e1c2470-fa28-4a02-b159-88c5674ec602', N'SuperAdmin', N'SuperAdmin', N'SuperAdmin', N'SuperAdmin', N'super@admin.com', NULL, N'8e1c2470-fa28-4a02-b159-88c5674ec602')
GO
/****** Object:  Index [IX_Bugs_ProjectId]    Script Date: 07/10/2021 11:52:28 ******/
CREATE NONCLUSTERED INDEX [IX_Bugs_ProjectId] ON [dbo].[Bugs]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bugs_SolvedById]    Script Date: 07/10/2021 11:52:28 ******/
CREATE NONCLUSTERED INDEX [IX_Bugs_SolvedById] ON [dbo].[Bugs]
(
	[SolvedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bugs_StateName]    Script Date: 07/10/2021 11:52:28 ******/
CREATE NONCLUSTERED INDEX [IX_Bugs_StateName] ON [dbo].[Bugs]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RolId]    Script Date: 07/10/2021 11:52:28 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RolId] ON [dbo].[Users]
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersProject_UsersId]    Script Date: 07/10/2021 11:52:28 ******/
CREATE NONCLUSTERED INDEX [IX_UsersProject_UsersId] ON [dbo].[UsersProject]
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [OBL2] SET  READ_WRITE 
GO
