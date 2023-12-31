USE [master]
GO
/****** Object:  Database [Zatraty]    Script Date: 25.12.2023 14:32:00 ******/
CREATE DATABASE [Zatraty]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zatraty', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Zatraty.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zatraty_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Zatraty_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Zatraty] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zatraty].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zatraty] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zatraty] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zatraty] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zatraty] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zatraty] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zatraty] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zatraty] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zatraty] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zatraty] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zatraty] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zatraty] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zatraty] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zatraty] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zatraty] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zatraty] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zatraty] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zatraty] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zatraty] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zatraty] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zatraty] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zatraty] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zatraty] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zatraty] SET RECOVERY FULL 
GO
ALTER DATABASE [Zatraty] SET  MULTI_USER 
GO
ALTER DATABASE [Zatraty] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zatraty] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zatraty] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zatraty] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zatraty] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Zatraty] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Zatraty', N'ON'
GO
ALTER DATABASE [Zatraty] SET QUERY_STORE = ON
GO
ALTER DATABASE [Zatraty] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Zatraty]
GO
/****** Object:  Table [dbo].[Должности]    Script Date: 25.12.2023 14:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должности](
	[КодДолжности] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[Оклад] [money] NULL,
 CONSTRAINT [PK_Должности] PRIMARY KEY CLUSTERED 
(
	[КодДолжности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Затраты]    Script Date: 25.12.2023 14:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Затраты](
	[КодЗатрат] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[Примечание] [varchar](50) NULL,
 CONSTRAINT [PK_Затраты] PRIMARY KEY CLUSTERED 
(
	[КодЗатрат] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПлановыеПоказатели]    Script Date: 25.12.2023 14:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПлановыеПоказатели](
	[Номер] [int] NOT NULL,
	[Дата] [date] NULL,
	[Затраты] [int] NULL,
	[ПлановыйПоказатель] [int] NULL,
	[Значение] [int] NULL,
	[Сотрудник] [int] NULL,
 CONSTRAINT [PK_ПлановыеПоказатели] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Показатели]    Script Date: 25.12.2023 14:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Показатели](
	[КодПоказателя] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[Периодичность] [varchar](50) NULL,
	[Примечание] [varchar](50) NULL,
 CONSTRAINT [PK_Показатели] PRIMARY KEY CLUSTERED 
(
	[КодПоказателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 25.12.2023 14:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[КодСотрудника] [int] NOT NULL,
	[ФИО] [varchar](50) NULL,
	[Адрес] [varchar](50) NULL,
	[Телефон] [varchar](50) NULL,
	[Должность] [int] NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[КодСотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ФактическиеПоказатели]    Script Date: 25.12.2023 14:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФактическиеПоказатели](
	[Номер] [int] NOT NULL,
	[Дата] [date] NULL,
	[Затраты] [int] NULL,
	[ФактическийПоказатель] [int] NULL,
	[Значение] [int] NULL,
	[Сотрудник] [int] NULL,
 CONSTRAINT [PK_ФактическиеПоказатели] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Затраты] ([КодЗатрат], [Название], [Примечание]) VALUES (200, N'Постоянные затраты', NULL)
INSERT [dbo].[Затраты] ([КодЗатрат], [Название], [Примечание]) VALUES (201, N'Затраты на коммунальные платежи', N'Периодические затраты')
INSERT [dbo].[Затраты] ([КодЗатрат], [Название], [Примечание]) VALUES (202, N'Затраты на аренду', N'Периодические затраты')
INSERT [dbo].[Затраты] ([КодЗатрат], [Название], [Примечание]) VALUES (203, N'Затраты на покупку помещения', NULL)
GO
INSERT [dbo].[Показатели] ([КодПоказателя], [Название], [Периодичность], [Примечание]) VALUES (300, N'Период окупаемости', N'Да', NULL)
INSERT [dbo].[Показатели] ([КодПоказателя], [Название], [Периодичность], [Примечание]) VALUES (301, N'Индекс рентабельности', N'Нет', NULL)
INSERT [dbo].[Показатели] ([КодПоказателя], [Название], [Периодичность], [Примечание]) VALUES (302, N'Максимальное значение', N'Да', NULL)
INSERT [dbo].[Показатели] ([КодПоказателя], [Название], [Периодичность], [Примечание]) VALUES (303, N'Среднее значение', N'Да', NULL)
GO
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Адрес], [Телефон], [Должность]) VALUES (100, N'Иванов Е.К.', NULL, NULL, NULL)
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Адрес], [Телефон], [Должность]) VALUES (101, N'Монин Е.Е.', NULL, NULL, NULL)
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Адрес], [Телефон], [Должность]) VALUES (102, N'Карский Н.У.', NULL, NULL, NULL)
INSERT [dbo].[Сотрудники] ([КодСотрудника], [ФИО], [Адрес], [Телефон], [Должность]) VALUES (103, N'Папиков И.А.', NULL, NULL, NULL)
GO
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (1, CAST(N'2023-11-20' AS Date), 200, 300, 55000, 100)
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (2, CAST(N'2023-11-20' AS Date), 201, 300, 59000, 101)
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (3, CAST(N'2023-11-20' AS Date), 202, 300, 54000, 102)
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (4, CAST(N'2023-11-20' AS Date), 203, 300, 555000, 103)
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (5, CAST(N'2023-12-20' AS Date), 200, 301, 35000, 100)
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (6, CAST(N'2023-12-20' AS Date), 201, 301, 75000, 100)
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (7, CAST(N'2023-12-20' AS Date), 202, 301, 8000, 103)
INSERT [dbo].[ФактическиеПоказатели] ([Номер], [Дата], [Затраты], [ФактическийПоказатель], [Значение], [Сотрудник]) VALUES (8, CAST(N'2023-12-20' AS Date), 203, 301, 9000, 100)
GO
ALTER TABLE [dbo].[ПлановыеПоказатели]  WITH CHECK ADD  CONSTRAINT [FK_ПлановыеПоказатели_Затраты] FOREIGN KEY([Затраты])
REFERENCES [dbo].[Затраты] ([КодЗатрат])
GO
ALTER TABLE [dbo].[ПлановыеПоказатели] CHECK CONSTRAINT [FK_ПлановыеПоказатели_Затраты]
GO
ALTER TABLE [dbo].[ПлановыеПоказатели]  WITH CHECK ADD  CONSTRAINT [FK_ПлановыеПоказатели_Показатели] FOREIGN KEY([ПлановыйПоказатель])
REFERENCES [dbo].[Показатели] ([КодПоказателя])
GO
ALTER TABLE [dbo].[ПлановыеПоказатели] CHECK CONSTRAINT [FK_ПлановыеПоказатели_Показатели]
GO
ALTER TABLE [dbo].[ПлановыеПоказатели]  WITH CHECK ADD  CONSTRAINT [FK_ПлановыеПоказатели_Сотрудники] FOREIGN KEY([Сотрудник])
REFERENCES [dbo].[Сотрудники] ([КодСотрудника])
GO
ALTER TABLE [dbo].[ПлановыеПоказатели] CHECK CONSTRAINT [FK_ПлановыеПоказатели_Сотрудники]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Должности] FOREIGN KEY([Должность])
REFERENCES [dbo].[Должности] ([КодДолжности])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Должности]
GO
ALTER TABLE [dbo].[ФактическиеПоказатели]  WITH CHECK ADD  CONSTRAINT [FK_ФактическиеПоказатели_Затраты] FOREIGN KEY([Затраты])
REFERENCES [dbo].[Затраты] ([КодЗатрат])
GO
ALTER TABLE [dbo].[ФактическиеПоказатели] CHECK CONSTRAINT [FK_ФактическиеПоказатели_Затраты]
GO
ALTER TABLE [dbo].[ФактическиеПоказатели]  WITH CHECK ADD  CONSTRAINT [FK_ФактическиеПоказатели_Показатели] FOREIGN KEY([ФактическийПоказатель])
REFERENCES [dbo].[Показатели] ([КодПоказателя])
GO
ALTER TABLE [dbo].[ФактическиеПоказатели] CHECK CONSTRAINT [FK_ФактическиеПоказатели_Показатели]
GO
ALTER TABLE [dbo].[ФактическиеПоказатели]  WITH CHECK ADD  CONSTRAINT [FK_ФактическиеПоказатели_Сотрудники] FOREIGN KEY([Сотрудник])
REFERENCES [dbo].[Сотрудники] ([КодСотрудника])
GO
ALTER TABLE [dbo].[ФактическиеПоказатели] CHECK CONSTRAINT [FK_ФактическиеПоказатели_Сотрудники]
GO
USE [master]
GO
ALTER DATABASE [Zatraty] SET  READ_WRITE 
GO
