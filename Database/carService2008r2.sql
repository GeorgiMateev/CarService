USE [master]
GO
/****** Object:  Database [aspnet-CarService.WebApp-20132205416]    Script Date: 02/17/2013 12:41:27 ******/
CREATE DATABASE [aspnet-CarService.WebApp-20132205416] ON  PRIMARY 
( NAME = N'aspnet-CarService.WebApp-20132205416', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\aspnet-CarService.WebApp-20132205416.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'aspnet-CarService.WebApp-20132205416_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\aspnet-CarService.WebApp-20132205416_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aspnet-CarService.WebApp-20132205416].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET ANSI_NULLS OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET ANSI_PADDING OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET ARITHABORT OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET  ENABLE_BROKER
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET  READ_WRITE
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET RECOVERY FULL
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET  MULTI_USER
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [aspnet-CarService.WebApp-20132205416] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'aspnet-CarService.WebApp-20132205416', N'ON'
GO
USE [aspnet-CarService.WebApp-20132205416]
GO
/****** Object:  Table [dbo].[Mechanics]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mechanics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Mechanics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mechanics] ON
INSERT [dbo].[Mechanics] ([Id], [FirstName], [LastName]) VALUES (1, N'Georgi', N'Mateev')
INSERT [dbo].[Mechanics] ([Id], [FirstName], [LastName]) VALUES (2, N'Ivan', N'Ivanov')
INSERT [dbo].[Mechanics] ([Id], [FirstName], [LastName]) VALUES (3, N'Stefcho', N'Gurukov')
INSERT [dbo].[Mechanics] ([Id], [FirstName], [LastName]) VALUES (4, N'Tosho', N'Marinov')
SET IDENTITY_INSERT [dbo].[Mechanics] OFF
/****** Object:  Table [dbo].[Cars]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNumber] [nvarchar](50) NOT NULL,
	[FrameNumber] [nvarchar](50) NOT NULL,
	[EngineNumber] [nvarchar](50) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[ProductionYear] [date] NOT NULL,
	[OwnerName] [nvarchar](50) NOT NULL,
	[OwnerNumber] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cars] ON
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (1, N'123jcasdk', N'asasc3', N'qwdc22', N'BMW', N'X1', CAST(0x00000000 AS Date), N'Georgi', 0)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (2, N'123jcasdk', N'asasc3', N'qwdc22', N'BMW', N'X1', CAST(0x00000000 AS Date), N'Georgi', 0)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (3, N'123jcasdk', N'asasc3', N'qwdc22', N'BMW', N'X1', CAST(0x00000000 AS Date), N'Georgi', 0)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (4, N'en8888re', N'asasc3', N'qwdc22', N'BMW', N'X1', CAST(0x00000000 AS Date), N'Georgi', 88873287)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (5, N'rt4238re', N'shg42j3g1', N'3341313', N'Mercedes', N'S', CAST(0x00000000 AS Date), N'Petko Bicepsa', 0)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (6, N'fr4543er', N'asdasd', N'asd', N'BMW', N'320', CAST(0x00000000 AS Date), N'Pesho Peshev', 34234)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (7, N'en1323sd', N'sda5616sd', N'213123ss', N'Ford', N'Focus', CAST(0x00000000 AS Date), N'Ivan Ivanov', 2132983883)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (8, N'hd7283sa', N'as8sd8asd8d', N'sdasd12222', N'Ford', N'Fiesta', CAST(0x00000000 AS Date), N'Nencho Gergov', 1212)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (9, N'er3432dd', N'444ddfooo55', N'sskdk333', N'Lada', N'Niva', CAST(0x00000000 AS Date), N'Bache Kiko', 4403233)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (10, N'sf4452sd', N'asda43ffff', N'123hhh3232', N'Moskvich', N'Unknown', CAST(0x00000000 AS Date), N'Dedo Liben', 0)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (11, N'er2344', N'sdasd234', N'asd2343', N'Opel', N'Corsa', CAST(0x00000000 AS Date), N'Mela Petrova', 1231)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (12, N'rt5600fh', N'das123sdd', N'dasd22222', N'Fiat', N'Bravo', CAST(0x00000000 AS Date), N'Penka Svetalnova', 2133333)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (13, N'rg4455er', N'dasewew', N'dasdqw', N'Fiat', N'Punto', CAST(0x00000000 AS Date), N'Mitko Penchev', 9993222)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (14, N'en3233mm', N'das', N'das', N'Mercedes', N'E300', CAST(0x00000000 AS Date), N'Ivan Baraban', 47444)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (15, N'pe452we', N'asd232323', N'asd22323', N'Porshe', N'911', CAST(0x00000000 AS Date), N'Sergei Egei', 888442)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (16, N'iu4545iu', N'dasdqcc333', N'asdwqq111dd', N'Lada', N'Niva', CAST(0x00000000 AS Date), N'Cvetelin Ceckov', 8822333)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (17, N'bg6761iu', N'asdasds112e1ed', N'dasd122de12', N'Shkoda', N'Octavia', CAST(0x00000000 AS Date), N'Cecka Cacheva', 123)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (18, N'rr3233rr', N'dasderwe2r2', N'as3rrrrr43r4', N'Jeep', N'Jeep', CAST(0x00000000 AS Date), N'Joko Rosich', 231)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (19, N'df3455rr', N'sada2r2r22r', N'asd23r22', N'Ford', N'Focus', CAST(0x00000000 AS Date), N'Boris Lubenov', 3123)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (20, N'rt2343er', N'2233asdqweq', N'323dd32332', N'Reno', N'Laguna', CAST(0x00000000 AS Date), N'Stefcho Stefchov', 123)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (21, N'gr4344gr', N'322323232', N'dasd3232323', N'Reno', N'Laguna', CAST(0x00000000 AS Date), N'Ivan Ivanov', 12312)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (22, N'ut4535tr', N'kwe234234', N'asdasd', N'Citroen', N'C4', CAST(0x00000000 AS Date), N'Georgi Georgiev', 23434)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (23, N'fewf2434', N'asdasd322', N'asdasd', N'BMW', N'X6', CAST(0x00000000 AS Date), N'Mitio Pishtova', 3123)
INSERT [dbo].[Cars] ([Id], [RegistrationNumber], [FrameNumber], [EngineNumber], [Brand], [Model], [ProductionYear], [OwnerName], [OwnerNumber]) VALUES (24, N'rt7778ee', N'asndas7ds7d8', N'7887dasdsd78', N'Renault', N'Megan', CAST(0x00000000 AS Date), N'Jake Jacob', 8882323)
SET IDENTITY_INSERT [dbo].[Cars] OFF
/****** Object:  Table [dbo].[Applications]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Applications] ([ApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'736b7bd0-462d-4310-ac45-af5a93fb8d48', NULL)
/****** Object:  Table [dbo].[SpareParts]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpareParts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SpareParts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpareParts] ON
INSERT [dbo].[SpareParts] ([Id], [Name], [Price], [Active]) VALUES (18, N'Engine', 4500, 1)
INSERT [dbo].[SpareParts] ([Id], [Name], [Price], [Active]) VALUES (19, N'Frame', 2340, 1)
INSERT [dbo].[SpareParts] ([Id], [Name], [Price], [Active]) VALUES (20, N'Door', 400, 1)
INSERT [dbo].[SpareParts] ([Id], [Name], [Price], [Active]) VALUES (21, N'Trunk', 1000, 1)
INSERT [dbo].[SpareParts] ([Id], [Name], [Price], [Active]) VALUES (22, N'Wheel', 100, 0)
INSERT [dbo].[SpareParts] ([Id], [Name], [Price], [Active]) VALUES (23, N'Window', 350, 1)
INSERT [dbo].[SpareParts] ([Id], [Name], [Price], [Active]) VALUES (24, N'Seats', 3590, 1)
SET IDENTITY_INSERT [dbo].[SpareParts] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'a4e37e3b-7c6e-41fa-ac6d-06e55b5a07f7', N'Operator', NULL)
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'55879692-0d1f-46f6-b637-dcef443761ff', N'Administrator', NULL)
/****** Object:  Table [dbo].[Users]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'1a565edd-a42f-4381-8d4f-6720cd5685da', N'admin2', 0, CAST(0x0000A1680011188C AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'bdb8f60c-3bc4-4e61-89e6-cbc7e4e1f68b', N'user', 0, CAST(0x0000A16800185A8A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'6d394479-7993-4672-be3f-e83e119e3911', N'admin', 0, CAST(0x0000A1680017D02E AS DateTime))
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'1a565edd-a42f-4381-8d4f-6720cd5685da', N'55879692-0d1f-46f6-b637-dcef443761ff')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'bdb8f60c-3bc4-4e61-89e6-cbc7e4e1f68b', N'a4e37e3b-7c6e-41fa-ac6d-06e55b5a07f7')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'6d394479-7993-4672-be3f-e83e119e3911', N'55879692-0d1f-46f6-b637-dcef443761ff')
/****** Object:  Table [dbo].[Memberships]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'1a565edd-a42f-4381-8d4f-6720cd5685da', N'RxlZ5keAs2eBb1ddtKTUSIKE1fziyzhLcUZm7SgsgTM=', 1, N'luBMn2CGtYhVskc82ImB9A==', N'asd@asd.com', NULL, NULL, 1, 0, CAST(0x0000A15A01862325 AS DateTime), CAST(0x0000A1680011188C AS DateTime), CAST(0x0000A15A01862325 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'bdb8f60c-3bc4-4e61-89e6-cbc7e4e1f68b', N'coPmA4qD0y2srRTYt9l5oaYRgut1PnqfKU5K+Au42mg=', 1, N'DFKdZd/kgGfvzd33VMnqYA==', N'aser@user.com', NULL, NULL, 1, 0, CAST(0x0000A1680012E91A AS DateTime), CAST(0x0000A16800394352 AS DateTime), CAST(0x0000A1680012E91A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'736b7bd0-462d-4310-ac45-af5a93fb8d48', N'6d394479-7993-4672-be3f-e83e119e3911', N'AxcoY0wf/TYefsTC5VPdubzsGcFsuUXZZIvXcBYmc6M=', 1, N'ZitMnyTfSHyktYtai2lf7g==', N'admin@admin.com', NULL, NULL, 1, 0, CAST(0x0000A158017CBB07 AS DateTime), CAST(0x0000A1680017D02E AS DateTime), CAST(0x0000A158017CBB07 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[RepairCards]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcceptedDate] [date] NOT NULL,
	[FinishedDate] [date] NOT NULL,
	[CarId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MechanicId] [int] NOT NULL,
	[SparePartId] [int] NOT NULL,
	[SparePartsPrice] [int] NOT NULL,
	[RepairPrice] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Completed] [bit] NOT NULL,
 CONSTRAINT [PK_RepairCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RepairCards] ON
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (10, CAST(0xB5360B00 AS Date), CAST(0xBE360B00 AS Date), 4, N'Test change', 3, 0, 11430, 12334, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (11, CAST(0xB5360B00 AS Date), CAST(0xC2360B00 AS Date), 5, N'crash', 4, 0, 7840, 12121, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (13, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 6, N'created by admin2', 1, 0, 1000, 1000, N'1a565edd-a42f-4381-8d4f-6720cd5685da', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (14, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 7, N'asdasd', 2, 0, 1400, 1400, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (15, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 8, N'crash', 4, 0, 400, 500, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (16, CAST(0xB6360B00 AS Date), CAST(0xC3360B00 AS Date), 9, N'big crash', 2, 0, 8240, 15000, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (17, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 10, N'too old', 1, 0, 3740, 4000, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (18, CAST(0xB6360B00 AS Date), CAST(0xC3360B00 AS Date), 11, N'adas', 3, 0, 3590, 4000, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (19, CAST(0xB6360B00 AS Date), CAST(0xC3360B00 AS Date), 12, N'asdasd', 4, 0, 3090, 4000, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (20, CAST(0xB6360B00 AS Date), CAST(0xC3360B00 AS Date), 13, N'asd', 4, 0, 3940, 4500, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (21, CAST(0xB6360B00 AS Date), CAST(0xC3360B00 AS Date), 14, N'asda', 1, 0, 2340, 3000, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (22, CAST(0xB6360B00 AS Date), CAST(0xC3360B00 AS Date), 15, N'asd', 3, 0, 4500, 5000, N'6d394479-7993-4672-be3f-e83e119e3911', 1)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (23, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 16, N'asdas', 3, 0, 1750, 3000, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (24, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 17, N'asd', 1, 0, 400, 500, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (25, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 18, N'asdas', 1, 0, 2340, 2500, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (26, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 19, N'asd', 1, 0, 350, 400, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (27, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 20, N'asdas', 1, 0, 1000, 1000, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (28, CAST(0xB6360B00 AS Date), CAST(0x00000000 AS Date), 21, N'asd', 1, 0, 350, 350, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (29, CAST(0xC3360B00 AS Date), CAST(0x00000000 AS Date), 22, N'sasdas', 1, 0, 3590, 4000, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (30, CAST(0xC3360B00 AS Date), CAST(0x00000000 AS Date), 23, N'total damage', 3, 0, 12180, 15000, N'6d394479-7993-4672-be3f-e83e119e3911', 0)
INSERT [dbo].[RepairCards] ([Id], [AcceptedDate], [FinishedDate], [CarId], [Description], [MechanicId], [SparePartId], [SparePartsPrice], [RepairPrice], [UserId], [Completed]) VALUES (31, CAST(0xC3360B00 AS Date), CAST(0x00000000 AS Date), 24, N'created by user', 1, 0, 3940, 4400, N'bdb8f60c-3bc4-4e61-89e6-cbc7e4e1f68b', 0)
SET IDENTITY_INSERT [dbo].[RepairCards] OFF
/****** Object:  Table [dbo].[Profiles]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](4000) NOT NULL,
	[PropertyValueStrings] [nvarchar](4000) NOT NULL,
	[PropertyValueBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartsCards]    Script Date: 02/17/2013 12:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartsCards](
	[RepairCardId] [int] NOT NULL,
	[SparePartId] [int] NOT NULL,
 CONSTRAINT [PK_PartsCards] PRIMARY KEY CLUSTERED 
(
	[RepairCardId] ASC,
	[SparePartId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (10, 18)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (10, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (10, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (10, 24)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (11, 18)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (11, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (11, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (13, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (14, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (14, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (15, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (16, 18)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (16, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (16, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (16, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (17, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (17, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (17, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (18, 24)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (19, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (19, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (19, 23)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (20, 23)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (20, 24)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (21, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (22, 18)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (23, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (23, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (23, 23)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (24, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (25, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (26, 23)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (27, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (28, 23)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (29, 24)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (30, 18)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (30, 19)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (30, 20)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (30, 21)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (30, 23)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (30, 24)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (31, 23)
INSERT [dbo].[PartsCards] ([RepairCardId], [SparePartId]) VALUES (31, 24)
/****** Object:  ForeignKey [RoleApplication]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
/****** Object:  ForeignKey [UserApplication]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
/****** Object:  ForeignKey [UsersInRoleRole]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
/****** Object:  ForeignKey [UsersInRoleUser]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO
/****** Object:  ForeignKey [MembershipApplication]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
/****** Object:  ForeignKey [MembershipUser]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
/****** Object:  ForeignKey [FK_RepairCards_Cars]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[RepairCards]  WITH CHECK ADD  CONSTRAINT [FK_RepairCards_Cars] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[RepairCards] CHECK CONSTRAINT [FK_RepairCards_Cars]
GO
/****** Object:  ForeignKey [FK_RepairCards_Mechanics]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[RepairCards]  WITH CHECK ADD  CONSTRAINT [FK_RepairCards_Mechanics] FOREIGN KEY([MechanicId])
REFERENCES [dbo].[Mechanics] ([Id])
GO
ALTER TABLE [dbo].[RepairCards] CHECK CONSTRAINT [FK_RepairCards_Mechanics]
GO
/****** Object:  ForeignKey [FK_RepairCards_Users]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[RepairCards]  WITH CHECK ADD  CONSTRAINT [FK_RepairCards_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[RepairCards] CHECK CONSTRAINT [FK_RepairCards_Users]
GO
/****** Object:  ForeignKey [UserProfile]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
/****** Object:  ForeignKey [FK_PartsCards_RepairCards]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[PartsCards]  WITH CHECK ADD  CONSTRAINT [FK_PartsCards_RepairCards] FOREIGN KEY([RepairCardId])
REFERENCES [dbo].[RepairCards] ([Id])
GO
ALTER TABLE [dbo].[PartsCards] CHECK CONSTRAINT [FK_PartsCards_RepairCards]
GO
/****** Object:  ForeignKey [FK_PartsCards_SpareParts]    Script Date: 02/17/2013 12:41:28 ******/
ALTER TABLE [dbo].[PartsCards]  WITH CHECK ADD  CONSTRAINT [FK_PartsCards_SpareParts] FOREIGN KEY([SparePartId])
REFERENCES [dbo].[SpareParts] ([Id])
GO
ALTER TABLE [dbo].[PartsCards] CHECK CONSTRAINT [FK_PartsCards_SpareParts]
GO
