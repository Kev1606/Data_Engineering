USE [master]
GO
/****** Object:  Database [P5Bases]    Script Date: 18/06/2023 02:16:56 p. m. ******/
CREATE DATABASE [P5Bases]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'P5Bases', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\P5Bases.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'P5Bases_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\P5Bases_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [P5Bases] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [P5Bases].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [P5Bases] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [P5Bases] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [P5Bases] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [P5Bases] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [P5Bases] SET ARITHABORT OFF 
GO
ALTER DATABASE [P5Bases] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [P5Bases] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [P5Bases] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [P5Bases] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [P5Bases] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [P5Bases] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [P5Bases] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [P5Bases] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [P5Bases] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [P5Bases] SET  DISABLE_BROKER 
GO
ALTER DATABASE [P5Bases] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [P5Bases] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [P5Bases] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [P5Bases] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [P5Bases] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [P5Bases] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [P5Bases] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [P5Bases] SET RECOVERY FULL 
GO
ALTER DATABASE [P5Bases] SET  MULTI_USER 
GO
ALTER DATABASE [P5Bases] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [P5Bases] SET DB_CHAINING OFF 
GO
ALTER DATABASE [P5Bases] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [P5Bases] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [P5Bases] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [P5Bases] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'P5Bases', N'ON'
GO
ALTER DATABASE [P5Bases] SET QUERY_STORE = OFF
GO
USE [P5Bases]
GO
/****** Object:  Table [dbo].[tablaRecurrencia]    Script Date: 18/06/2023 02:16:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablaRecurrencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[useDate] [datetime] NOT NULL,
	[idUser] [int] NULL,
	[idService] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[fillData]    Script Date: 18/06/2023 02:16:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fillData] 
AS
BEGIN
    -- Declarar las variables necesarias
    DECLARE @counter INT = 1
    DECLARE @startDate DATETIME = '2018-01-01'
    DECLARE @endDate DATETIME = '2023-12-31'

    -- Iniciar el bucle WHILE
    WHILE @counter <= 218000
    BEGIN
        -- Generar valores aleatorios para idUsuario y idServicio
        DECLARE @randomUsuario INT
        SET @randomUsuario = ABS(CHECKSUM(NEWID())) % 10601 -- Rango: 0-10600

        DECLARE @randomServicio INT
        SET @randomServicio = ABS(CHECKSUM(NEWID())) % 16 -- Rango: 0-15
        
        -- Generar un valor datetime aleatorio entre @startDate y @endDate
        DECLARE @randomDate DATETIME
        SET @randomDate = DATEADD(SECOND, ABS(CHECKSUM(NEWID())) % DATEDIFF(SECOND, @startDate, @endDate), @startDate)
        
        -- Insertar los valores en la tabla
        INSERT INTO [dbo].[tablaRecurrencia] ([useDate], [idUser], [idService]) VALUES (@randomDate, @randomUsuario, @randomServicio)
        
        -- Incrementar el contador
        SET @counter = @counter + 1
    END
END
GO
USE [master]
GO
ALTER DATABASE [P5Bases] SET  READ_WRITE 
GO
