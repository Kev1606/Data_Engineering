USE [master]
GO
/****** Object:  Database [TranspAcces]    Script Date: 18/06/2023 15:52:43 ******/
CREATE DATABASE [TranspAcces]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TranspAcces', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TranspAcces.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TranspAcces_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TranspAcces_log.ldf' , SIZE = 794624KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TranspAcces] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TranspAcces].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TranspAcces] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TranspAcces] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TranspAcces] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TranspAcces] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TranspAcces] SET ARITHABORT OFF 
GO
ALTER DATABASE [TranspAcces] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TranspAcces] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TranspAcces] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TranspAcces] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TranspAcces] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TranspAcces] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TranspAcces] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TranspAcces] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TranspAcces] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TranspAcces] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TranspAcces] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TranspAcces] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TranspAcces] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TranspAcces] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TranspAcces] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TranspAcces] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TranspAcces] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TranspAcces] SET RECOVERY FULL 
GO
ALTER DATABASE [TranspAcces] SET  MULTI_USER 
GO
ALTER DATABASE [TranspAcces] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TranspAcces] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TranspAcces] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TranspAcces] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TranspAcces] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TranspAcces] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TranspAcces', N'ON'
GO
ALTER DATABASE [TranspAcces] SET QUERY_STORE = ON
GO
ALTER DATABASE [TranspAcces] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [TranspAcces]
GO
/****** Object:  User [ss]    Script Date: 18/06/2023 15:52:43 ******/
CREATE USER [ss] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Disabilities]    Script Date: 18/06/2023 15:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disabilities](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[isActive] [tinyint] NOT NULL,
	[createdBy] [nvarchar](50) NOT NULL,
	[createdAt] [nvarchar](50) NOT NULL,
	[updatedBy] [nvarchar](50) NOT NULL,
	[updatedAt] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Disabilities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[disabilitiesOn]    Script Date: 18/06/2023 15:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[disabilitiesOn] as
    

SELECT id, [name]
FROM dbo.Disabilities
WHERE id IS NOT NULL AND [name] IS NOT NULL
    
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/06/2023 15:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[firstName] [nvarchar](100) NOT NULL,
	[lastName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[roleTypesId] [tinyint] NOT NULL,
	[realm] [nvarchar](50) NULL,
	[username] [nvarchar](50) NOT NULL,
	[emailVerified] [bit] NOT NULL,
	[verificationToken] [nvarchar](50) NULL,
	[isDeleted] [tinyint] NOT NULL,
	[telephone] [nvarchar](50) NOT NULL,
	[languagesId] [tinyint] NOT NULL,
	[isActive] [bit] NOT NULL,
	[sex] [tinyint] NOT NULL,
	[createdBy] [tinyint] NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedBy] [tinyint] NULL,
	[updatedAt] [nvarchar](50) NOT NULL,
	[deletionJustification] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[usersOn]    Script Date: 18/06/2023 15:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[usersOn] as
    

SELECT
    id AS userId,
    firstName AS firstName,
    lastName AS lastName,
    email AS email,
    telephone AS phoneNumber
FROM dbo.Users
WHERE lastName IS NOT NULL
    
GO
/****** Object:  Table [dbo].[DisabilitiesByUser]    Script Date: 18/06/2023 15:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisabilitiesByUser](
	[usersId] [int] NOT NULL,
	[disabilitiesId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecurrenceServices]    Script Date: 18/06/2023 15:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecurrenceServices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[useDate] [datetime] NULL,
	[idUser] [int] NULL,
	[idService] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 18/06/2023 15:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] NOT NULL,
	[tipoViaje] [nvarchar](50) NOT NULL,
	[tarifaMinima] [smallint] NOT NULL,
	[tiempoMinutos] [smallint] NOT NULL,
	[precioKM] [smallint] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Disabilities] ([id], [name], [isActive], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (1, N'Ceguera Total', 1, N'NULL', N'NULL', N'NULL', N'NULL')
INSERT [dbo].[Disabilities] ([id], [name], [isActive], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (2, N'Baja Visión', 1, N'NULL', N'NULL', N'NULL', N'NULL')
INSERT [dbo].[Disabilities] ([id], [name], [isActive], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (3, N'Auditiva', 1, N'NULL', N'NULL', N'NULL', N'NULL')
INSERT [dbo].[Disabilities] ([id], [name], [isActive], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (4, N'Cognitiva', 1, N'NULL', N'NULL', N'NULL', N'NULL')
INSERT [dbo].[Disabilities] ([id], [name], [isActive], [createdBy], [createdAt], [updatedBy], [updatedAt]) VALUES (5, N'Motora', 1, N'NULL', N'NULL', N'NULL', N'NULL')
GO
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (6, 1)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (11, 1)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (11, 2)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (11, 3)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (11, 4)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (11, 5)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (17, 1)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (17, 2)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (18, 1)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (18, 2)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (18, 3)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (25, 1)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (25, 2)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (25, 3)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (25, 4)
INSERT [dbo].[DisabilitiesByUser] ([usersId], [disabilitiesId]) VALUES (25, 5)
GO
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (1, N'UberX', 863, 42, 215)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (2, N'UberXL', 1500, 62, 322)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (3, N'UberX VIP', 863, 42, 315)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (4, N'UberAccess', 1294, 84, 215)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (5, N'Uber Flash Moto', 345, 30, 150)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (6, N'Didi', 855, 40, 240)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (7, N'Taxi rojo (servicio particular)', 530, 815, 595)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (8, N'Taxi rojo (discapacitados)', 530, 815, 595)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (9, N'Taxi rural', 530, 815, 595)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (10, N'Taxis aeropuerto', 900, 710, 710)
INSERT [dbo].[Services] ([id], [tipoViaje], [tarifaMinima], [tiempoMinutos], [precioKM]) VALUES (11, N'Microbús aeropuerto (turistas)', 1075, 1230, 1230)
GO
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (1, N'Super Administrador', N'(SA)', N'superadministrador@itcr.ac.cr', N'$2a$10$2IlK0zzcqxwH2v3/qaXTOe0sSuEf/4RSgTCH7NvCXEG5dx7NNjfkK', 1, N'super', N'superadministrador@itcr.ac.cr', 1, N'NULL', 0, N'25252525', 1, 1, 0, NULL, NULL, NULL, N'NULL', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (2, N'Catalina', N'Espinach', N'cespinach@itcr.ac.cr', N'$2a$10$cKc0JtEBaY3ECtRirjVeceMb1oaCl6AVMOhKY0L8.ItJ68zMuMUrq', 2, NULL, N'cespinach@itcr.ac.cr', 0, NULL, 0, N'70137180', 1, 1, 1, 1, CAST(N'2020-03-29T21:31:53.0000000' AS DateTime2), 1, N'2020-03-30 14:12:29', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (3, N'Víctor', N'Romero Chacón', N'vjrch451@gmail.com', N'$2a$10$mrRUAJG.5w0gS2usnnjcjubpYFc3vVwbGtid9cDUd6AtBXkotq4oW', 2, NULL, N'vjrch451@gmail.com', 0, NULL, 0, N'+50671696634', 1, 1, 0, 1, CAST(N'2020-04-06T21:40:48.0000000' AS DateTime2), 1, N'NULL', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (4, N'Jonathan', N'Rodriguez Gonzales', N'jonastu.9@gmail.com', N'$2a$10$YIT9voU7ZZNAM4.3xagCpucXHmrtsRl76v47kGK0hq0QddRMiQjv6', 2, NULL, N'jonastu.9@gmail.com', 0, NULL, 0, N'+50683914923', 1, 0, 0, 1, CAST(N'2020-04-06T21:52:53.0000000' AS DateTime2), 1, N'2020-05-19 16:43:56', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (6, N'Dennis', N'Solís Solano', N'dennissolis28@gmail.com', N'$2a$10$LcocJMZxnf9KAtAXPvzch.I5BbqcYrY6S2THOZjjRJZUF8F6T.lc2', 3, NULL, N'dennissolis28@gmail.com', 1, NULL, 0, N'88052781', 1, 1, 0, 1, CAST(N'2020-04-06T22:52:18.0000000' AS DateTime2), 6, N'2022-07-21 14:23:31', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (7, N'Ana Gabriela', N'Madrigal', N'agmadrigal@itcr.ac.cr', N'$2a$10$cKc0JtEBaY3ECtRirjVeceMb1oaCl6AVMOhKY0L8.ItJ68zMuMUrq', 2, NULL, N'agmadrigal@itcr.ac.cr', 0, NULL, 0, N'+506 25509387', 1, 1, 1, 1, CAST(N'2020-04-07T14:45:02.0000000' AS DateTime2), 1, N'NULL', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (8, N'Jose Andres', N'Lizano', N'jalgsg2@gmail.com', N'$2a$10$cKc0JtEBaY3ECtRirjVeceMb1oaCl6AVMOhKY0L8.ItJ68zMuMUrq', 1, NULL, N'jalgsg2@gmail.com', 0, NULL, 0, N'88878792', 1, 1, 0, 1, CAST(N'2020-05-08T20:57:12.0000000' AS DateTime2), 1, N'2020-05-19 16:43:20', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (11, N'Marcello', N'Calvo', N'marcello_calvo@hotmail.com', N'$2a$10$5NiKZr7ld4p6flIwx3OKfeQfx9gTv0tKKJOZHuDomSt4Lv8P9', 3, NULL, N'marcello_calvo@hotmail.com', 1, NULL, 0, N'87239843', 1, 0, 0, 1, CAST(N'2020-05-19T17:44:26.0000000' AS DateTime2), 1, N'2021-03-22 16:44:31', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (12, N'Marcello', N'Calvo Zamora', N'mchellocz@gmail.com', N'$2a$10$5NiKZr7ld4p6flIwx3OKfeQfx9gTv0tKKJOZHuDomSt4Lv8P9.NJa', 2, NULL, N'mchellocz@gmail.com', 0, NULL, 0, N'83176758', 1, 1, 0, 1, CAST(N'2020-05-19T20:54:17.0000000' AS DateTime2), 1, N'2020-05-19 20:54:35', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (16, N'Mario', N'Chacón Rivas (TEC)', N'machacon@itcr.ac.cr', N'$2a$10$VN/UoGI1zDzORGLlA5KXAOtAZTssH.qu45Zaams2JLG21opeMXPcS', 1, NULL, N'machacon@itcr.ac.cr', 0, NULL, 0, N'83901475', 1, 1, 0, 1, CAST(N'2020-09-01T17:27:31.0000000' AS DateTime2), 1, N'NULL', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (17, N'Wilmer', N'Rodriguez', N'wilmer8981@hotmail.com', N'$2a$10$lYfF4ipQEJR6yS7Ux1nN1eoTrccFj0j5HqNe.MhgqbdIULO65nOHa', 3, NULL, N'wilmer8981@hotmail.com', 1, NULL, 0, N'88888888', 1, 1, 0, 12, CAST(N'2020-12-11T15:12:09.0000000' AS DateTime2), 12, N'2022-07-20 23:41:18', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (18, N'Helena', N'Matarrita', N'elenamatarrita69@gmail.com', N'$2a$10$6uyba4uj1259osCoCKCqO.t9Ji05s2IY9T6jUptb1t0wNUtekcdiC', 3, NULL, N'elenamatarrita69@gmail.com', 1, NULL, 0, N'88888888', 1, 1, 1, 12, CAST(N'2020-12-11T15:14:34.0000000' AS DateTime2), 12, N'2021-02-08 01:29:36', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (19, N'Inclutec', NULL, N'inclutec.notifications@gmail.com', N'$2a$10$ElJdqQZoCoaLvcvOon4Wnut7ZI7sHZIiNe4hvQA8pt2D20YKumIKW', 4, NULL, N'inclutec.notifications@gmail.com', 0, NULL, 0, N'25505050', 1, 1, 2, 12, CAST(N'2020-12-18T14:48:30.0000000' AS DateTime2), 2, N'2021-02-25 15:46:10', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (20, N'Observatorio de Tecnologías Accesibles e Inclusivas OTAI', NULL, N'otai@itcr.ac.cr', N'$2a$10$fnJ5alPE2nizND7LQ1WeKOT.yx4z2TSAQ/YuajCyxQNpzw7ptFotK', 4, NULL, N'otai@itcr.ac.cr', 0, NULL, 0, N'2250-9254', 1, 1, 2, 2, CAST(N'2021-02-26T21:27:34.0000000' AS DateTime2), NULL, N'NULL', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (24, N'Luis ', N'Badilla Godínez ', N'abadillagodinez@gmail.com', N'$2a$10$MOVv5noRZaq.MScN/.IxAOVc8m2gtDNgHvG.M9h8a2x4BD5VgBAzy', 1, NULL, N'abadillagodinez@gmail.com', 0, NULL, 0, N'25509254', 1, 1, 0, 1, CAST(N'2021-03-22T21:45:48.0000000' AS DateTime2), NULL, N'2021-03-22 22:22:08', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (25, N'Erick', N'Salazar', N'ericksalazar_g@hotmail.com', N'$2a$10$P.GVNihCMKvX5yYRwoxhRuVQmWL59bEBwe210791.ZWIRfH80tUR6', 3, NULL, N'ericksalazar_g@hotmail.com', 1, NULL, 0, N'25509254', 1, 0, 0, 1, CAST(N'2021-03-22T21:47:35.0000000' AS DateTime2), 1, N'2021-09-09 21:40:27', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (26, N'Mauricio ', N'Quirós Bravo', N'mqbravo@gmail.com', N'$2a$10$SYx3wJzEYbjLOwiofkD.kelGz4Q0IFNsDFRta3.yf7.3HAI0vD3k6', 2, NULL, N'mqbravo@gmail.com', 0, NULL, 0, N'25509254', 1, 1, 0, 1, CAST(N'2021-03-22T21:51:05.0000000' AS DateTime2), NULL, N'2021-03-22 22:25:50', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (27, N'Lery', N'Sanchez Calderon', N'ljazminsc205@gmail.com', N'$2a$10$cKc0JtEBaY3ECtRirjVeceMb1oaCl6AVMOhKY0L8.ItJ68zMuMUrq', 2, NULL, N'ljazminsc205@gmail.com', 0, NULL, 0, N'87775109', 1, 1, 1, 1, CAST(N'2021-08-13T13:46:52.0000000' AS DateTime2), 27, N'2021-08-17 19:28:12', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (28, N'Dirección General de Servicio Civil ', NULL, N'aledezma@dgsc.go.cr', N'$2a$10$cKc0JtEBaY3ECtRirjVeceMb1oaCl6AVMOhKY0L8.ItJ68zMuMUrq', 4, NULL, N'aledezma@dgsc.go.cr', 0, NULL, 0, N'25868324', 1, 1, 2, 7, CAST(N'2021-08-26T21:10:54.0000000' AS DateTime2), 7, N'2021-08-26 21:11:42', N'NULL')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [email], [password], [roleTypesId], [realm], [username], [emailVerified], [verificationToken], [isDeleted], [telephone], [languagesId], [isActive], [sex], [createdBy], [createdAt], [updatedBy], [updatedAt], [deletionJustification]) VALUES (29, N'Popular Pensiones ', NULL, N'popularpensiones@bp.fi.cr', N'$2a$10$9PNKlKk43dO/tgPqJRcJcOvqWuvee/C9sWzK/5n/0k7U9YzI62Yqm', 4, NULL, N'popularpensiones@bp.fi.cr', 0, NULL, 0, N'20100300', 1, 1, 2, 7, CAST(N'2021-10-04T15:53:55.0000000' AS DateTime2), NULL, N'NULL', N'NULL')
GO
ALTER TABLE [dbo].[DisabilitiesByUser]  WITH CHECK ADD  CONSTRAINT [id_fk] FOREIGN KEY([disabilitiesId])
REFERENCES [dbo].[Disabilities] ([id])
GO
ALTER TABLE [dbo].[DisabilitiesByUser] CHECK CONSTRAINT [id_fk]
GO
ALTER TABLE [dbo].[DisabilitiesByUser]  WITH CHECK ADD  CONSTRAINT [idUser_fk] FOREIGN KEY([usersId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[DisabilitiesByUser] CHECK CONSTRAINT [idUser_fk]
GO
/****** Object:  StoredProcedure [dbo].[fillData]    Script Date: 18/06/2023 15:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fillData] 
AS
BEGIN
    -- Declarar las variables necesarias
    DECLARE @counter INT = 1
	DECLARE @startDate DATETIME = '2018-01-01T00:00:00'
	DECLARE @endDate DATETIME = '2023-12-31T00:00:00'

    -- Iniciar el bucle WHILE
    WHILE @counter <= 218000
    BEGIN
        -- Generar valores aleatorios para idUsuario y idServicio
        DECLARE @randomUsuario INT
        SET @randomUsuario = ABS(CHECKSUM(NEWID())) % 10601 -- Rango: 0-10600

        DECLARE @randomServicio INT
        SET @randomServicio = ABS(CHECKSUM(NEWID())) % 12 -- Rango: 0-11
        
        -- Generar un valor datetime aleatorio entre @startDate y @endDate
        DECLARE @randomDate DATETIME
        SET @randomDate = DATEADD(SECOND, ABS(CHECKSUM(NEWID())) % DATEDIFF(SECOND, @startDate, @endDate), @startDate)
        
        -- Insertar los valores en la tabla
        INSERT INTO [dbo].[RecurrenceServices] ([useDate], [idUser], [idService]) VALUES (@randomDate, @randomUsuario, @randomServicio)
        
        -- Incrementar el contador
        SET @counter = @counter + 1
    END
END
GO
USE [master]
GO
ALTER DATABASE [TranspAcces] SET  READ_WRITE 
GO
