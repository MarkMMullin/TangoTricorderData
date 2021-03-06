USE [master]
GO
/****** Object:  Database [TangoData]    Script Date: 2/17/2015 3:34:47 PM ******/
CREATE DATABASE [TangoData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TangoData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TangoData.mdf' , SIZE = 354304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TangoData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TangoData_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TangoData] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TangoData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TangoData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TangoData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TangoData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TangoData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TangoData] SET ARITHABORT OFF 
GO
ALTER DATABASE [TangoData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TangoData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TangoData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TangoData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TangoData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TangoData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TangoData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TangoData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TangoData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TangoData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TangoData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TangoData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TangoData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TangoData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TangoData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TangoData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TangoData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TangoData] SET RECOVERY FULL 
GO
ALTER DATABASE [TangoData] SET  MULTI_USER 
GO
ALTER DATABASE [TangoData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TangoData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TangoData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TangoData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TangoData] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TangoData]
GO
/****** Object:  UserDefinedFunction [dbo].[getClosestLocationTimestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MMM
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getClosestLocationTimestamp] 
(
	-- Add the parameters for the function here
	@timestamp float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float
	DECLARE @best int;
	-- Add the T-SQL statements to compute the return value here
	RETURN (SELECT top 1 Timestamp FROM Location ORDER BY ABS(@timestamp - Timestamp) asc)
END

GO
/****** Object:  UserDefinedFunction [dbo].[getClosestPictureTimestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MMM
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getClosestPictureTimestamp] 
(
	-- Add the parameters for the function here
	@timestamp float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float
	DECLARE @best int;
	-- Add the T-SQL statements to compute the return value here
	RETURN (SELECT top 1 Timestamp FROM Picture ORDER BY ABS(@timestamp - Timestamp) asc)
END

GO
/****** Object:  UserDefinedFunction [dbo].[getClosestPointsTimestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MMM
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getClosestPointsTimestamp] 
(
	-- Add the parameters for the function here
	@timestamp float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float
	DECLARE @best int;
	-- Add the T-SQL statements to compute the return value here
	RETURN (SELECT top 1 Timestamp FROM Points ORDER BY ABS(@timestamp - Timestamp) asc)
END

GO
/****** Object:  UserDefinedFunction [dbo].[getClosestPoseTimestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MMM
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getClosestPoseTimestamp] 
(
	-- Add the parameters for the function here
	@timestamp float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float
	DECLARE @best int;
	-- Add the T-SQL statements to compute the return value here
	RETURN (SELECT top 1 Timestamp FROM Pose ORDER BY ABS(@timestamp - Timestamp) asc)
END

GO
/****** Object:  UserDefinedFunction [dbo].[getClosestSessionTimestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MMM
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getClosestSessionTimestamp] 
(
	-- Add the parameters for the function here
	@timestamp float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result float
	DECLARE @best int;
	-- Add the T-SQL statements to compute the return value here
	RETURN (SELECT top 1 Timestamp FROM Session ORDER BY ABS(@timestamp - Timestamp) asc)
END

GO
/****** Object:  Table [dbo].[Location]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Device] [nchar](16) NOT NULL,
	[At] [datetime2](7) NOT NULL,
	[Timestamp] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Elevation] [float] NOT NULL,
	[Provider] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Location_1] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[At] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Picture](
	[Device] [nchar](16) NOT NULL,
	[At] [datetime2](7) NOT NULL CONSTRAINT [DF_Picture_At]  DEFAULT (sysutcdatetime()),
	[Timestamp] [float] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[Depth] [int] NOT NULL,
	[Image] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[At] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Points]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Points](
	[Device] [nchar](16) NOT NULL,
	[At] [datetime2](7) NOT NULL CONSTRAINT [DF_Points_At]  DEFAULT (sysutcdatetime()),
	[Timestamp] [float] NOT NULL,
	[Cloud] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Points_1] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[At] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pose]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pose](
	[Device] [nchar](16) NOT NULL,
	[At] [datetime2](7) NOT NULL CONSTRAINT [DF_Pose_At]  DEFAULT (sysutcdatetime()),
	[Timestamp] [float] NOT NULL,
	[Quality] [tinyint] NOT NULL,
	[PX] [float] NOT NULL,
	[PY] [float] NOT NULL,
	[PZ] [float] NOT NULL,
	[AX] [float] NOT NULL,
	[AY] [float] NOT NULL,
	[AZ] [float] NOT NULL,
	[AW] [float] NOT NULL,
	[ADF] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pose] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[At] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Device] [nchar](16) NOT NULL,
	[At] [datetime2](7) NOT NULL,
	[Timestamp] [float] NOT NULL,
	[EndTime] [datetime2](7) NULL,
	[Name] [nvarchar](50) NULL,
	[DevIMUx] [float] NOT NULL,
	[DevIMUy] [float] NOT NULL,
	[DevIMUz] [float] NOT NULL,
	[DevIMUq0] [float] NOT NULL,
	[DevIMUq1] [float] NOT NULL,
	[DevIMUq2] [float] NOT NULL,
	[DevIMUq3] [float] NOT NULL,
	[CamIMUx] [float] NOT NULL,
	[CamIMUy] [float] NOT NULL,
	[CamIMUz] [float] NOT NULL,
	[CamIMUq0] [float] NOT NULL,
	[CamIMUq1] [float] NOT NULL,
	[CamIMUq2] [float] NOT NULL,
	[CamIMUq3] [float] NOT NULL,
	[ImageWidth] [int] NOT NULL,
	[ImageHeight] [int] NOT NULL,
	[FocalX] [float] NOT NULL,
	[FocalY] [float] NOT NULL,
	[PrincipalX] [float] NOT NULL,
	[PrincipalY] [float] NOT NULL,
	[Distortion0] [float] NOT NULL,
	[Distortion1] [float] NOT NULL,
	[Distortion2] [float] NOT NULL,
	[Distortion3] [float] NOT NULL,
	[Distortion4] [float] NOT NULL,
 CONSTRAINT [PK_Session_1] PRIMARY KEY CLUSTERED 
(
	[At] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[CoherentSample]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CoherentSample]
AS
SELECT        dbo.Pose.Device, dbo.Pose.At, dbo.Pose.Timestamp, dbo.Pose.Quality, dbo.Pose.PX, dbo.Pose.PY, dbo.Pose.PZ, dbo.Pose.AX, dbo.Pose.AY, dbo.Pose.AZ, 
                         dbo.Pose.AW, dbo.Pose.ADF, dbo.Picture.At AS PictureAt, dbo.Picture.Timestamp AS PictureTimestamp, dbo.Points.At AS PointsAt, 
                         dbo.Points.Timestamp AS PointsTimestamp, dbo.Location.At AS LocationAt, dbo.Location.Timestamp AS LocationTimestamp, dbo.Location.Latitude, 
                         dbo.Location.Longitude, dbo.Location.Elevation, dbo.Location.Provider
FROM            dbo.Pose INNER JOIN
                         dbo.Picture ON dbo.Picture.Timestamp = dbo.getClosestPictureTimestamp(dbo.Pose.Timestamp) INNER JOIN
                         dbo.Points ON dbo.Points.Timestamp = dbo.getClosestPointsTimestamp(dbo.Pose.Timestamp) INNER JOIN
                         dbo.Location ON dbo.Location.Timestamp = dbo.getClosestLocationTimestamp(dbo.Pose.Timestamp)

GO
/****** Object:  View [dbo].[CoherentTimestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CoherentTimestamp]
AS
SELECT        dbo.Pose.At AS PoseAt, dbo.Pose.Timestamp AS PoseTimestamp, dbo.Picture.At AS PictureAt, dbo.Picture.Timestamp AS PictureTimestamp, 
                         dbo.Points.At AS PointsAt, dbo.Points.Timestamp AS PointsTimestamp, dbo.Location.At AS LocationAt, dbo.Location.Timestamp AS LocationTimestamp
FROM            dbo.Pose INNER JOIN
                         dbo.Picture ON dbo.Picture.Timestamp = dbo.getClosestPictureTimestamp(dbo.Pose.Timestamp) INNER JOIN
                         dbo.Points ON dbo.Points.Timestamp = dbo.getClosestPointsTimestamp(dbo.Pose.Timestamp) INNER JOIN
                         dbo.Location ON dbo.Location.Timestamp = dbo.getClosestLocationTimestamp(dbo.Pose.Timestamp)

GO
/****** Object:  Index [IX_Location_At]    Script Date: 2/17/2015 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_Location_At] ON [dbo].[Location]
(
	[At] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_Timestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_Location_Timestamp] ON [dbo].[Location]
(
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Picture_Timestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_Picture_Timestamp] ON [dbo].[Picture]
(
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Points_Timestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_Points_Timestamp] ON [dbo].[Points]
(
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pose_ADF]    Script Date: 2/17/2015 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pose_ADF] ON [dbo].[Pose]
(
	[ADF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Timestamp]    Script Date: 2/17/2015 3:34:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_Timestamp] ON [dbo].[Pose]
(
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getClosestPicture]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getClosestPicture] @target float
AS
SELECT top 1 * 
FROM Picture
ORDER BY ABS(@target - Timestamp) asc 


GO
/****** Object:  StoredProcedure [dbo].[getClosestPoints]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getClosestPoints] @target float
AS
SELECT top 1 * 
FROM Points
ORDER BY ABS(@target - Timestamp) asc 
GO
/****** Object:  StoredProcedure [dbo].[getClosestPose]    Script Date: 2/17/2015 3:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getClosestPose] @target float
AS
SELECT top 1 * 
FROM Pose
ORDER BY ABS(@target - Timestamp) asc 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[17] 4[58] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Pose"
            Begin Extent = 
               Top = 165
               Left = 485
               Bottom = 294
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Picture"
            Begin Extent = 
               Top = 0
               Left = 197
               Bottom = 129
               Right = 367
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Points"
            Begin Extent = 
               Top = 159
               Left = 177
               Bottom = 324
               Right = 347
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 92
               Left = 764
               Bottom = 221
               Right = 934
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoherentSample'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoherentSample'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[32] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Pose"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Picture"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Points"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 135
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 135
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1815
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoherentTimestamp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoherentTimestamp'
GO
USE [master]
GO
ALTER DATABASE [TangoData] SET  READ_WRITE 
GO
