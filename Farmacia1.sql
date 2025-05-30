USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 15/04/2025 17:36:46 ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia_OLTP', FILENAME = N'C:\BD\Farmacia.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Farmacia_OLTP_log', FILENAME = N'C:\BD\Farmacia_1.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY FULL 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE = OFF
GO
USE [Farmacia]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[articulos]    Script Date: 15/04/2025 17:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulos](
	[idarticulo] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precio] [money] NULL,
	[stock] [int] NULL,
	[stock_min] [int] NULL,
 CONSTRAINT [PK_artículos] PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 15/04/2025 17:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idcliente] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NULL,
	[nombres] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[ruc] [varchar](50) NULL,
	[fnac] [datetime] NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 15/04/2025 17:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[idfactura] [int] NOT NULL,
	[idarticulo] [varchar](50) NOT NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [PK_detalle] PRIMARY KEY CLUSTERED 
(
	[idfactura] ASC,
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendedores]    Script Date: 15/04/2025 17:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendedores](
	[idvendedor] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NULL,
	[nombres] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
 CONSTRAINT [PK_vendedores] PRIMARY KEY CLUSTERED 
(
	[idvendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 15/04/2025 17:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[idfactura] [int] NOT NULL,
	[fecha] [date] NULL,
	[idcliente] [varchar](50) NULL,
	[idvendedor] [varchar](50) NULL,
 CONSTRAINT [PK_facturas] PRIMARY KEY CLUSTERED 
(
	[idfactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_artículos] FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulos] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_artículos]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_facturas] FOREIGN KEY([idfactura])
REFERENCES [dbo].[ventas] ([idfactura])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_facturas]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_facturas_clientes] FOREIGN KEY([idcliente])
REFERENCES [dbo].[clientes] ([idcliente])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_facturas_clientes]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_facturas_vendedores] FOREIGN KEY([idvendedor])
REFERENCES [dbo].[vendedores] ([idvendedor])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_facturas_vendedores]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
