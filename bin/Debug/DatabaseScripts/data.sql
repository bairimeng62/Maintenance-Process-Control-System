USE [机械检修工序卡控系统]
GO
/****** Object:  Table [dbo].[FaultDictionary]    Script Date: 2025/4/2 19:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultDictionary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](255) NOT NULL,
	[mainpart] [varchar](255) NOT NULL,
	[part1] [varchar](255) NOT NULL,
	[part2] [varchar](255) NOT NULL,
	[part3] [varchar](255) NOT NULL,
	[note] [varchar](255) NOT NULL,
	[consuming] [int] NOT NULL,
	[pyindex] [varchar](255) NOT NULL,
 CONSTRAINT [PK_FaultDictionary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerCar]    Script Date: 2025/4/2 19:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerCar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](20) NOT NULL,
	[part1] [varchar](50) NOT NULL,
	[part2] [varchar](50) NOT NULL,
	[part3] [varchar](50) NOT NULL,
	[note] [varchar](255) NOT NULL,
	[man_hours] [int] NOT NULL,
	[team] [nvarchar](50) NULL,
	[createtime] [datetime] NOT NULL,
	[starttime] [datetime] NULL,
	[status] [tinyint] NOT NULL,
	[overtime] [datetime] NULL,
	[costtime] [int] NULL,
 CONSTRAINT [PK_ManagerCar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManageUser]    Script Date: 2025/4/2 19:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManageUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[account] [varchar](100) NOT NULL,
	[pwd] [nvarchar](100) NULL,
	[post] [varchar](50) NOT NULL,
	[team] [varchar](50) NULL,
	[note] [varchar](100) NULL,
 CONSTRAINT [PK_UsersInfor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairPart]    Script Date: 2025/4/2 19:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairPart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[part1] [varchar](50) NOT NULL,
	[part2] [varchar](50) NOT NULL,
	[part3] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PartCombination] UNIQUE NONCLUSTERED 
(
	[part1] ASC,
	[part2] ASC,
	[part3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairTarget]    Script Date: 2025/4/2 19:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairTarget](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](50) NOT NULL,
	[part1] [varchar](50) NOT NULL,
	[part2] [varchar](50) NOT NULL,
	[part3] [varchar](50) NOT NULL,
	[note] [varchar](100) NOT NULL,
	[man_hours] [int] NOT NULL,
	[team] [varchar](50) NOT NULL,
	[createtime] [datetime] NOT NULL,
	[starttime] [datetime] NULL,
	[status] [tinyint] NOT NULL,
	[overtime] [datetime] NULL,
	[costtime] [int] NULL,
 CONSTRAINT [PK_RepairTarget] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechFault]    Script Date: 2025/4/2 19:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechFault](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](50) NOT NULL,
	[part1] [varchar](50) NOT NULL,
	[part2] [varchar](50) NOT NULL,
	[part3] [varchar](50) NOT NULL,
	[note] [varchar](100) NOT NULL,
	[man_hours] [int] NOT NULL,
	[team] [nvarchar](50) NULL,
	[createtime] [datetime] NULL,
 CONSTRAINT [PK__TechFaul__3213E83FBBDC598D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleInfo]    Script Date: 2025/4/2 19:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [varchar](50) NOT NULL,
	[number] [varchar](50) NOT NULL,
	[type] [varchar](100) NOT NULL,
	[blong] [varchar](100) NOT NULL,
	[entertime] [datetime] NOT NULL,
	[staff] [varchar](50) NOT NULL,
	[status] [varchar](50) NULL,
	[outtime] [datetime] NULL,
 CONSTRAINT [UQ_VehicleInfo_Number] UNIQUE NONCLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ManagerCar] ADD  DEFAULT (getdate()) FOR [createtime]
GO
ALTER TABLE [dbo].[ManagerCar] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[RepairTarget] ADD  CONSTRAINT [DF_RepairTarget_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[TechFault] ADD  CONSTRAINT [DF__TechFault__creat__72910220]  DEFAULT (getdate()) FOR [createtime]
GO
ALTER TABLE [dbo].[TechFault]  WITH CHECK ADD  CONSTRAINT [FK_TechFault_VehicleInfo] FOREIGN KEY([number])
REFERENCES [dbo].[VehicleInfo] ([number])
GO
ALTER TABLE [dbo].[TechFault] CHECK CONSTRAINT [FK_TechFault_VehicleInfo]
GO
ALTER TABLE [dbo].[ManagerCar]  WITH CHECK ADD  CONSTRAINT [CHK_ManagerCar_Status] CHECK  (([status]=(2) OR [status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[ManagerCar] CHECK CONSTRAINT [CHK_ManagerCar_Status]
GO
ALTER TABLE [dbo].[ManageUser]  WITH CHECK ADD  CONSTRAINT [CHK_Post_Role] CHECK  (([post]='Inspector' OR [post]='Technician' OR [post]='Admin'))
GO
ALTER TABLE [dbo].[ManageUser] CHECK CONSTRAINT [CHK_Post_Role]
GO
