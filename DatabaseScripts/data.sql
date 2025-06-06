IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = '机械检修工序卡控系统')
BEGIN
    CREATE DATABASE [机械检修工序卡控系统]
END
GO
USE [机械检修工序卡控系统]
GO

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
/****** Object:  Table [dbo].[ManagerCar]    Script Date: 2025/4/3 22:21:50 ******/
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
	[costtime] [decimal](10, 3) NULL,
 CONSTRAINT [PK_ManagerCar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManageUser]    Script Date: 2025/4/3 22:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManageUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[account] [varchar](100) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[post] [varchar](50) NOT NULL,
	[team] [varchar](50) NOT NULL,
	[note] [varchar](100) NULL,
 CONSTRAINT [PK_UsersInfor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairTarget]    Script Date: 2025/4/3 22:21:50 ******/
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
/****** Object:  Table [dbo].[TechFault]    Script Date: 2025/4/3 22:21:50 ******/
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
/****** Object:  Table [dbo].[VehicleInfo]    Script Date: 2025/4/3 22:21:50 ******/
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
	[outtime] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FaultDictionary] ON 

INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (1, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'大排障器', N'排障器安装螺丝松、断、丢失', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (2, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'大排障器', N'底座裂、开焊', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (3, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'小排障器变形', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (4, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'安装螺丝松、断、丢失', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (5, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'高度不合适', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (6, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'底座裂、开焊', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (7, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'大排障器', N'排障器安装螺丝松、断、丢失', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (8, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'大排障器', N'底座裂、开焊', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (9, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'小排障器变形', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (10, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'安装螺丝松、断、丢失', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (11, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'高度不合适', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (12, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'底座裂、开焊', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (13, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩体', N'钩体裂', 5, N'GT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (14, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌', N'钩舌有裂纹', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (15, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌', N'销孔超限', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (16, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌销', N'钩舌销裂、变形', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (17, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌销', N'销径超限', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (18, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌推铁', N'钩舌推铁变形，有裂纹', 5, N'GSTT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (19, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩锁铁', N'钩锁铁变形，有裂纹', 5, N'GST')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (20, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'下锁销装配', N'下锁销装配不良', 5, N'XSXZP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (21, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩提杆', N'钩提杆变形、安装螺丝松', 5, N'GTG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (22, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'防跳装置', N'防跳装置不良', 5, N'FTZZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (23, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'车钩中心线', N'车钩中心线标识不清', 5, N'CGZXX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (24, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩尾框', N'钩尾框摆动不灵活', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (25, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩尾框', N'钩尾框裂', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (26, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩体', N'钩体裂', 5, N'GT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (27, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌', N'钩舌有裂纹', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (28, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌', N'销孔超限', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (29, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌销', N'钩舌销裂、变形', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (30, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌销', N'销径超限', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (31, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌推铁', N'钩舌推铁变形，有裂纹', 5, N'GSTT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (32, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩锁铁', N'钩锁铁变形，有裂纹', 5, N'GST')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (33, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'下锁销装配', N'下锁销装配不良', 5, N'XSXZP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (34, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩提杆', N'钩提杆变形、安装螺丝松', 5, N'GTG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (35, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'防跳装置', N'防跳装置不良', 5, N'FTZZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (36, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'大排障器', N'排障器安装螺丝松、断、丢失', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (37, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'大排障器', N'底座裂、开焊', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (38, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'小排障器变形', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (39, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'安装螺丝松、断、丢失', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (40, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'高度不合适', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (41, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'小排障器', N'底座裂、开焊', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (42, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（1端）', N'大排障器', N'排障器安装螺丝松、断、丢失', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (43, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'大排障器', N'底座裂、开焊', 5, N'DPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (44, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'小排障器变形', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (45, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'安装螺丝松、断、丢失', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (46, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'高度不合适', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (47, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'小排障器', N'底座裂、开焊', 5, N'XPZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (48, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'排障器（2端）', N'钩体', N'钩体裂', 5, N'GT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (49, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌', N'钩舌有裂纹', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (50, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌', N'销孔超限', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (51, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌销', N'钩舌销裂、变形', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (52, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌销', N'销径超限', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (53, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩舌推铁', N'钩舌推铁变形，有裂纹', 5, N'GSTT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (54, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩锁铁', N'钩锁铁变形，有裂纹', 5, N'GST')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (55, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'下锁销装配', N'下锁销装配不良', 5, N'XSXZP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (56, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩提杆', N'钩提杆变形、安装螺丝松', 5, N'GTG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (57, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'防跳装置', N'防跳装置不良', 5, N'FTZZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (58, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'车钩中心线', N'车钩中心线标识不清', 5, N'CGZXX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (59, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩尾框', N'钩尾框摆动不灵活', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (60, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩尾框', N'钩尾框裂', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (61, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'钩体', N'钩体裂', 5, N'GT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (62, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌', N'钩舌有裂纹', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (63, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌', N'销孔超限', 5, N'GS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (64, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌销', N'钩舌销裂、变形', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (65, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌销', N'销径超限', 5, N'GSX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (66, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩舌推铁', N'钩舌推铁变形，有裂纹', 5, N'GSTT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (67, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩锁铁', N'钩锁铁变形，有裂纹', 5, N'GST')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (68, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'下锁销装配', N'下锁销装配不良', 5, N'XSXZP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (69, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩提杆', N'钩提杆变形、安装螺丝松', 5, N'GTG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (70, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'防跳装置', N'防跳装置不良', 5, N'FTZZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (71, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'车钩中心线', N'车钩中心线标识不清', 5, N'CGZXX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (72, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩尾框', N'钩尾框摆动不灵活', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (73, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩尾框', N'钩尾框裂', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (74, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'簧箱体', N'箱体裂，作用不良', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (75, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'簧箱体', N'簧箱体上浮', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (76, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'牵引扁销', N'磨耗到限', 5, N'QYBX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (77, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'防脱螺栓', N'防跳螺栓裂、磨耗到限', 5, N'FTLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (78, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'托板螺丝', N'螺丝松、断', 5, N'TBLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (79, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'簧箱体', N'箱体裂，作用不良', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (80, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'簧箱体', N'簧箱体上浮', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (81, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'牵引扁销', N'磨耗到限', 5, N'QYBX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (82, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'防脱螺栓', N'防跳螺栓裂、磨耗到限', 5, N'FTLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (83, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'托板螺丝', N'螺丝松、断', 5, N'TBLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (84, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'左侧手扶杆', N'手扶杆裂、变形', 5, N'ZCSFG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (85, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧手扶杆', N'手扶杆裂、变形', 5, N'YCSFG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (86, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'门锁不良', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (87, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'门框缺铆钉', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (88, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'漏风', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (89, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧司机室门', N'门锁不良', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (90, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧司机室门', N'门框缺铆钉', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (91, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧司机室门', N'漏风', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (92, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'窗框裂', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (93, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'侧窗扶手断', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (94, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (95, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'漏风', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (96, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'上下不灵活', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (97, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'窗框裂', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (98, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'侧窗扶手断', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (99, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'YCCC')
GO
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (100, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'漏风', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (101, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'上下不灵活', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (102, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'作用不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (103, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'靠背不能调节', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (104, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'底座裂、螺丝松', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (105, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'座椅扶手不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (106, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'作用不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (107, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'靠背不能调节', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (108, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'车钩中心线', N'车钩中心线标识不清', 5, N'CGZXX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (109, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩尾框', N'钩尾框摆动不灵活', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (110, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'钩尾框', N'钩尾框裂', 5, N'GWK')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (111, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'簧箱体', N'箱体裂，作用不良', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (112, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'簧箱体', N'簧箱体上浮', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (113, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'牵引扁销', N'磨耗到限', 5, N'QYBX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (114, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'防脱螺栓', N'防跳螺栓裂、磨耗到限', 5, N'FTLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (115, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（1端）', N'托板螺丝', N'螺丝松、断', 5, N'TBLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (116, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'簧箱体', N'箱体裂，作用不良', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (117, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'簧箱体', N'簧箱体上浮', 5, N'HXT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (118, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'牵引扁销', N'磨耗到限', 5, N'QYBX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (119, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'防脱螺栓', N'防跳螺栓裂、磨耗到限', 5, N'FTLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (120, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'复原装置（2端）', N'托板螺丝', N'螺丝松、断', 5, N'TBLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (121, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧手扶杆', N'手扶杆裂、变形', 5, N'ZCSFG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (122, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧手扶杆', N'手扶杆裂、变形', 5, N'YCSFG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (123, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'门锁不良', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (124, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'门框缺铆钉', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (125, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'漏风', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (126, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧司机室门', N'门锁不良', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (127, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧司机室门', N'门框缺铆钉', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (128, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧司机室门', N'漏风', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (129, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'窗框裂', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (130, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'侧窗扶手断', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (131, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (132, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'漏风', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (133, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧侧窗', N'上下不灵活', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (134, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'窗框裂', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (135, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'侧窗扶手断', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (136, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (137, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'漏风', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (138, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧侧窗', N'上下不灵活', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (139, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'作用不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (140, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'靠背不能调节', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (141, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'底座裂、螺丝松', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (142, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧座椅', N'座椅扶手不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (143, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'作用不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (144, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'靠背不能调节', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (145, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'底座裂、螺丝松', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (146, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'座椅扶手不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (147, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧遮阳帘', N'作用不良', 5, N'ZCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (148, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧遮阳帘', N'作用不良', 5, N'YCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (149, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'下柜门', N'下柜门变形', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (150, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'下柜门', N'门锁不良', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (151, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'后柜门', N'下柜门变形', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (152, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'后柜门', N'门锁不良', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (153, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊门', N'门锁不良', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (154, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊门', N'抽风严重', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (155, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊门', N'门合叶螺丝松', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (156, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧走廊门', N'门锁不良', 5, N'YCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (157, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧走廊门', N'抽风严重', 5, N'YCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (158, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧走廊门', N'门合叶螺丝松', 5, N'YCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (159, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'司机室地板', N'地板变形', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (160, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'司机室地板', N'地板缺少螺丝', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (161, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊地板', N'地板变形', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (162, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊地板', N'地板缺少螺丝', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (163, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧下水管', N'胶管脱', 5, N'ZCXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (164, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧灭火器', N'安装座开焊、不良', 5, N'ZCMHQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (165, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧门联锁', N'门联锁作用不良', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (166, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧门联锁', N'锁臂压杆开焊', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (167, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧手扶杆', N'手扶杆裂、变形', 5, N'ZCSFG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (168, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧手扶杆', N'手扶杆裂、变形', 5, N'YCSFG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (169, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧司机室门', N'门锁不良', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (170, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧司机室门', N'门框缺铆钉', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (171, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧司机室门', N'漏风', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (172, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧司机室门', N'门锁不良', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (173, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧司机室门', N'门框缺铆钉', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (174, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧司机室门', N'漏风', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (175, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'窗框裂', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (176, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'侧窗扶手断', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (177, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (178, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'漏风', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (179, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'上下不灵活', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (180, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'窗框裂', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (181, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'侧窗扶手断', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (182, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (183, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'漏风', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (184, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'上下不灵活', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (185, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'作用不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (186, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'靠背不能调节', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (187, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'底座裂、螺丝松', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (188, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'座椅扶手不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (189, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'作用不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (190, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'靠背不能调节', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (191, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'底座裂、螺丝松', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (192, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'座椅扶手不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (193, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧遮阳帘', N'作用不良', 5, N'ZCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (194, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧遮阳帘', N'作用不良', 5, N'YCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (195, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'下柜门', N'下柜门变形', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (196, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'下柜门', N'门锁不良', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (197, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'后柜门', N'下柜门变形', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (198, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'后柜门', N'门锁不良', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (199, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊门', N'门锁不良', 5, N'ZCZLM')
GO
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (200, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊门', N'抽风严重', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (201, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊门', N'门合叶螺丝松', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (202, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（3端）', N'右侧走廊们', N'门锁不良', 5, N'YCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (203, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（4端）', N'右侧走廊们', N'抽风严重', 5, N'YCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (204, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（5端）', N'右侧走廊们', N'门合叶螺丝松', 5, N'YCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (205, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'司机室地板', N'地板变形', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (206, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'司机室地板', N'地板缺少螺丝', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (207, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊地板', N'地板变形', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (208, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊地板', N'地板缺少螺丝', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (209, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧下水管', N'胶管脱', 5, N'ZCXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (210, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧灭火器', N'安装座开焊、不良', 5, N'ZCMHQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (211, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧门联锁', N'门联锁作用不良', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (212, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧门联锁', N'锁臂压杆开焊', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (213, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'天窗', N'天窗门', N'门臂、合叶开焊', 5, N'TCM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (214, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'天窗', N'天窗门', N'漏雨', 5, N'TCM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (215, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'天窗', N'天窗梯', N'安装螺丝松、断、丢失', 5, N'TCT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (216, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左1侧向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (217, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左1侧向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (218, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左1侧向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (219, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左2侧向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (220, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左2侧向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (221, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左2侧向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (222, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'右1侧向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (223, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'右1侧向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (224, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'右1侧向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (225, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'右2侧向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (226, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'右2侧向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (227, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'右2侧向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (228, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'左1垂向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (229, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'左1垂向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (230, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'左1垂向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (231, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'左2垂向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (232, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'左2垂向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (233, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'左2垂向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (234, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'右1垂向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (235, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'右1垂向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (236, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'右1垂向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (237, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'右2垂向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (238, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'右2垂向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (239, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'垂向限制器', N'右2垂向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (240, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Z1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (241, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1砂箱、砂管', N'砂管角度不正确', 5, N'Z1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (242, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1砂箱、砂管', N'砂管卡子松', 5, N'Z1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (243, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1砂箱、砂管', N'砂箱变形、开焊', 5, N'Z1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (244, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1砂箱、砂管', N'砂箱盖丢失', 5, N'Z1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (245, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1砂箱、砂管', N'砂箱安装螺丝松', 5, N'Z1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (246, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Z2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (247, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2砂箱、砂管', N'砂管角度不正确', 5, N'Z2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (248, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2砂箱、砂管', N'砂管卡子松', 5, N'Z2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (249, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2砂箱、砂管', N'砂箱变形、开焊', 5, N'Z2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (250, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2砂箱、砂管', N'砂箱盖丢失', 5, N'Z2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (251, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2砂箱、砂管', N'砂箱安装螺丝松', 5, N'Z2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (252, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Z3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (253, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3砂箱、砂管', N'砂管角度不正确', 5, N'Z3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (254, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3砂箱、砂管', N'砂管卡子松', 5, N'Z3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (255, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3砂箱、砂管', N'砂箱变形、开焊', 5, N'Z3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (256, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3砂箱、砂管', N'砂箱盖丢失', 5, N'Z3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (257, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3砂箱、砂管', N'砂箱安装螺丝松', 5, N'Z3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (258, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Z4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (259, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4砂箱、砂管', N'砂管角度不正确', 5, N'Z4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (260, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4砂箱、砂管', N'砂管卡子松', 5, N'Z4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (261, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4砂箱、砂管', N'砂箱变形、开焊', 5, N'Z4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (262, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4砂箱、砂管', N'砂箱盖丢失', 5, N'Z4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (263, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4砂箱、砂管', N'砂箱安装螺丝松', 5, N'Z4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (264, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Y1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (265, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1砂箱、砂管', N'砂管角度不正确', 5, N'Y1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (266, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1砂箱、砂管', N'砂管卡子松', 5, N'Y1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (267, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1砂箱、砂管', N'砂箱变形、开焊', 5, N'Y1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (268, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1砂箱、砂管', N'砂箱盖丢失', 5, N'Y1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (269, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1砂箱、砂管', N'砂箱安装螺丝松', 5, N'Y1SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (270, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Y2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (271, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2砂箱、砂管', N'砂管角度不正确', 5, N'Y2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (272, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2砂箱、砂管', N'砂管卡子松', 5, N'Y2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (273, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2砂箱、砂管', N'砂箱变形、开焊', 5, N'Y2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (274, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2砂箱、砂管', N'砂箱盖丢失', 5, N'Y2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (275, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2砂箱、砂管', N'砂箱安装螺丝松', 5, N'Y2SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (276, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Y3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (277, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3砂箱、砂管', N'砂管角度不正确', 5, N'Y3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (278, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3砂箱、砂管', N'砂管卡子松', 5, N'Y3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (279, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3砂箱、砂管', N'砂箱变形、开焊', 5, N'Y3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (280, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3砂箱、砂管', N'砂箱盖丢失', 5, N'Y3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (281, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3砂箱、砂管', N'砂箱安装螺丝松', 5, N'Y3SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (282, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4砂箱、砂管', N'安装螺丝松、断、丢失', 5, N'Y4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (283, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4砂箱、砂管', N'砂管角度不正确', 5, N'Y4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (284, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4砂箱、砂管', N'砂管卡子松', 5, N'Y4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (285, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4砂箱、砂管', N'砂箱变形、开焊', 5, N'Y4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (286, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4砂箱、砂管', N'砂箱盖丢失', 5, N'Y4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (287, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4砂箱、砂管', N'砂箱安装螺丝松', 5, N'Y4SXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (288, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'轴箱盖螺丝松', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (289, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'接地线断股超限', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (290, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'接地碳刷磨耗到限', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (291, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'接地碳刷压簧断', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (292, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'箱盖密封圈断', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (293, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (294, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'轴箱拉杆不良', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (295, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轴箱', N'一系圆簧断', 5, N'Z1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (296, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'轴箱盖螺丝松', 5, N'Z2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (297, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'接地线断股超限', 5, N'Z2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (298, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'接地碳刷磨耗到限', 5, N'Z2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (299, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'接地碳刷压簧断', 5, N'Z2ZX')
GO
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (300, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'箱盖密封圈断', 5, N'Z2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (301, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Z2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (302, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'轴箱拉杆不良', 5, N'Z2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (303, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轴箱', N'一系圆簧断', 5, N'Z2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (304, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'轴箱盖螺丝松', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (305, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'接地线断股超限', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (306, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'接地碳刷磨耗到限', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (307, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'接地碳刷压簧断', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (308, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'箱盖密封圈断', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (309, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (310, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'轴箱拉杆不良', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (311, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左3轴箱', N'一系圆簧断', 5, N'Z3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (312, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'轴箱盖螺丝松', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (313, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'接地线断股超限', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (314, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'接地碳刷磨耗到限', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (315, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'接地碳刷压簧断', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (316, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'箱盖密封圈断', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (317, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (318, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'轴箱拉杆不良', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (319, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左4轴箱', N'一系圆簧断', 5, N'Z4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (320, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左5轴箱', N'轴箱盖螺丝松', 5, N'Z5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (321, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左5轴箱', N'接地碳刷压簧断', 5, N'Z5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (322, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左5轴箱', N'箱盖密封圈断', 5, N'Z5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (323, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左5轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Z5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (324, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左5轴箱', N'轴箱拉杆不良', 5, N'Z5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (325, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左5轴箱', N'一系圆簧断', 5, N'Z5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (326, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'轴箱盖螺丝松', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (327, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'接地线断股超限', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (328, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'接地碳刷磨耗到限', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (329, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'接地碳刷压簧断', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (330, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'箱盖密封圈断', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (331, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (332, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'轴箱拉杆不良', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (333, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左6轴箱', N'一系圆簧断', 5, N'Z6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (334, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'轴箱盖螺丝松', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (335, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'接地线断股超限', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (336, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'接地碳刷磨耗到限', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (337, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'接地碳刷压簧断', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (338, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'箱盖密封圈断', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (339, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (340, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'轴箱拉杆不良', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (341, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轴箱', N'一系圆簧断', 5, N'Y1ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (342, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'轴箱盖螺丝松', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (343, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'接地线断股超限', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (344, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'接地碳刷磨耗到限', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (345, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'接地碳刷压簧断', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (346, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'箱盖密封圈断', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (347, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (348, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'轴箱拉杆不良', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (349, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轴箱', N'一系圆簧断', 5, N'Y2ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (350, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'轴箱盖螺丝松', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (351, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'接地线断股超限', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (352, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'接地碳刷磨耗到限', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (353, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'接地碳刷压簧断', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (354, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'箱盖密封圈断', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (355, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (356, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'轴箱拉杆不良', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (357, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3轴箱', N'一系圆簧断', 5, N'Y3ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (358, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'轴箱盖螺丝松', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (359, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'接地线断股超限', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (360, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'接地碳刷磨耗到限', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (361, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'接地碳刷压簧断', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (362, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'箱盖密封圈断', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (363, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (364, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'轴箱拉杆不良', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (365, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4轴箱', N'一系圆簧断', 5, N'Y4ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (366, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'轴箱盖螺丝松', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (367, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'接地线断股超限', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (368, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'接地碳刷磨耗到限', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (369, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'接地碳刷压簧断', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (370, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'箱盖密封圈断', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (371, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'接地铜棒磨耗严重、松脱', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (372, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'轴箱拉杆不良', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (373, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右5轴箱', N'一系圆簧断', 5, N'Y5ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (374, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右6轴箱', N'轴箱盖螺丝松', 5, N'Y6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (375, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右6轴箱', N'接地线断股超限', 5, N'Y6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (376, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右6轴箱', N'接地碳刷磨耗到限', 5, N'Y6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (377, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右6轴箱', N'接地碳刷压簧断', 5, N'Y6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (378, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右6轴箱', N'箱盖密封圈断', 5, N'Y6ZX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (379, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'底座裂、螺丝松', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (380, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧座椅', N'座椅扶手不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (381, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧遮阳帘', N'作用不良', 5, N'ZCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (382, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧遮阳帘', N'作用不良', 5, N'YCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (383, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'下柜门', N'下柜门变形', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (384, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'下柜门', N'门锁不良', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (385, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'后柜门', N'下柜门变形', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (386, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'后柜门', N'门锁不良', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (387, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊门', N'门锁不良', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (388, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊门', N'抽风严重', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (389, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊门', N'门合叶螺丝松', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (390, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'司机室地板', N'地板变形', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (391, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'司机室地板', N'地板缺少螺丝', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (392, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊地板', N'地板变形', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (393, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧走廊地板', N'地板缺少螺丝', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (394, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧下水管', N'胶管脱', 5, N'ZCXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (395, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧灭火器', N'安装座开焊、不良', 5, N'ZCMHQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (396, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧门联锁', N'门联锁作用不良', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (397, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧门联锁', N'锁臂压杆开焊', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (398, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧手扶杆', N'手扶杆裂、变形', 5, N'ZCSFG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (399, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧手扶杆', N'手扶杆裂、变形', 5, N'YCSFG')
GO
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (400, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'门锁不良', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (401, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'门框缺铆钉', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (402, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'左侧司机室门', N'漏风', 5, N'ZCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (403, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（1端）', N'右侧司机室门', N'门锁不良', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (404, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧司机室门', N'门框缺铆钉', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (405, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧司机室门', N'漏风', 5, N'YCSJSM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (406, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'窗框裂', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (407, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'侧窗扶手断', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (408, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (409, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'漏风', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (410, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧侧窗', N'上下不灵活', 5, N'ZCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (411, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'窗框裂', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (412, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'侧窗扶手断', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (413, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'侧窗扶手螺丝松、挂钩不良', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (414, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'漏风', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (415, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧侧窗', N'上下不灵活', 5, N'YCCC')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (416, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'作用不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (417, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'靠背不能调节', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (418, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'底座裂、螺丝松', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (419, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧座椅', N'座椅扶手不良', 5, N'ZCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (420, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'作用不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (421, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'靠背不能调节', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (422, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'底座裂、螺丝松', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (423, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧座椅', N'座椅扶手不良', 5, N'YCZY')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (424, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧遮阳帘', N'作用不良', 5, N'ZCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (425, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1二系横向减震器', N'外罩变形', 5, N'Z1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (426, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2二系横向减震器', N'安装螺丝松、断、丢失', 5, N'Z2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (427, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2二系横向减震器', N'漏油', 5, N'Z2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (428, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2二系横向减震器', N'橡胶件老化', 5, N'Z2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (429, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2二系横向减震器', N'安装底座裂', 5, N'Z2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (430, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2二系横向减震器', N'外罩变形', 5, N'Z2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (431, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1二系横向减震器', N'安装螺丝松、断、丢失', 5, N'Y1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (432, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1二系横向减震器', N'漏油', 5, N'Y1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (433, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1二系横向减震器', N'橡胶件老化', 5, N'Y1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (434, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1二系横向减震器', N'安装底座裂', 5, N'Y1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (435, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1二系横向减震器', N'外罩变形', 5, N'Y1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (436, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2二系横向减震器', N'安装螺丝松、断、丢失', 5, N'Y2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (437, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2二系横向减震器', N'漏油', 5, N'Y2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (438, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2二系横向减震器', N'橡胶件老化', 5, N'Y2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (439, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2二系横向减震器', N'安装底座裂', 5, N'Y2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (440, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2二系横向减震器', N'外罩变形', 5, N'Y2EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (441, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1摩擦减震器', N'安装螺丝松、断、丢失', 5, N'Z1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (442, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1摩擦减震器', N'摩擦板断裂', 5, N'Z1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (443, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1摩擦减震器', N'橡胶件老化', 5, N'Z1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (444, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1摩擦减震器', N'安装底座裂', 5, N'Z1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (445, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1摩擦减震器', N'外罩变形', 5, N'Z1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (446, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2摩擦减震器', N'安装螺丝松、断、丢失', 5, N'Z2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (447, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2摩擦减震器', N'摩擦板断裂', 5, N'Z2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (448, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2摩擦减震器', N'橡胶件老化', 5, N'Z2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (449, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2摩擦减震器', N'安装底座裂', 5, N'Z2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (450, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2摩擦减震器', N'外罩变形', 5, N'Z2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (451, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1摩擦减震器', N'安装螺丝松、断、丢失', 5, N'Y1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (452, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1摩擦减震器', N'摩擦板断裂', 5, N'Y1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (453, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1摩擦减震器', N'橡胶件老化', 5, N'Y1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (454, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1摩擦减震器', N'安装底座裂', 5, N'Y1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (455, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1摩擦减震器', N'外罩变形', 5, N'Y1MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (456, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2摩擦减震器', N'安装螺丝松、断、丢失', 5, N'Y2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (457, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2摩擦减震器', N'摩擦板断裂', 5, N'Y2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (458, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2摩擦减震器', N'橡胶件老化', 5, N'Y2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (459, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2摩擦减震器', N'安装底座裂', 5, N'Y2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (460, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2摩擦减震器', N'外罩变形', 5, N'Y2MCJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (461, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轮喷', N'不喷油', 5, N'Z1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (462, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轮喷', N'轮喷软管老化、破损', 5, N'Z1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (463, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轮喷', N'轮喷罐安装不牢固', 5, N'Z1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (464, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轮喷', N'罐盖漏风', 5, N'Z1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (465, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1轮喷', N'喷嘴角度不正', 5, N'Z1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (466, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轮喷', N'不喷油', 5, N'Z2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (467, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轮喷', N'轮喷软管老化、破损', 5, N'Z2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (468, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轮喷', N'轮喷罐安装不牢固', 5, N'Z2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (469, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轮喷', N'罐盖漏风', 5, N'Z2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (470, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2轮喷', N'喷嘴角度不正', 5, N'Z2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (471, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轮喷', N'不喷油', 5, N'Y1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (472, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轮喷', N'轮喷软管老化、破损', 5, N'Y1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (473, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轮喷', N'轮喷罐安装不牢固', 5, N'Y1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (474, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轮喷', N'罐盖漏风', 5, N'Y1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (475, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1轮喷', N'喷嘴角度不正', 5, N'Y1LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (476, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轮喷', N'不喷油', 5, N'Y2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (477, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轮喷', N'轮喷软管老化、破损', 5, N'Y2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (478, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轮喷', N'轮喷罐安装不牢固', 5, N'Y2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (479, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轮喷', N'罐盖漏风', 5, N'Y2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (480, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2轮喷', N'喷嘴角度不正', 5, N'Y2LP')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (481, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1牵引杆', N'连接柱销螺丝松', 5, N'Z1QYG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (482, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2牵引杆', N'连接柱销螺丝松', 5, N'Z2QYG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (483, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1牵引杆', N'连接柱销螺丝松', 5, N'Y1QYG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (484, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2牵引杆', N'连接柱销螺丝松', 5, N'Y2QYG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (485, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1牵引座', N'裂纹', 5, N'Z1QYZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (486, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2牵引座', N'开焊', 5, N'Z2QYZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (487, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1牵引座', N'裂纹', 5, N'Y1QYZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (488, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2牵引座', N'开焊', 5, N'Y2QYZ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (489, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1牵引拐臂', N'连接柱销螺丝松', 5, N'Z1QYGB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (490, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左2牵引拐臂', N'连接柱销螺丝松', 5, N'Z2QYGB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (491, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右1牵引拐臂', N'连接柱销螺丝松', 5, N'Y1QYGB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (492, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右2牵引拐臂', N'连接柱销螺丝松', 5, N'Y2QYGB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (493, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'制动器风管接头漏风', 5, N'Z1ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (494, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'闸瓦偏磨', 5, N'Z1ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (495, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'闸瓦托位置不正', 5, N'Z1ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (496, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'闸瓦托安装螺丝松', 5, N'Z1ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (497, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'作用不良', 5, N'Z1ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (498, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'防尘帽丢失', 5, N'Z1ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (499, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'安装座螺丝松', 5, N'Z1ZDQ')
GO
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (500, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左1制动器', N'安装座裂', 5, N'Z1ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (501, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左2制动器', N'闸瓦托位置不正', 5, N'Z2ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (502, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左2制动器', N'闸瓦托安装螺丝松', 5, N'Z2ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (503, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左2制动器', N'作用不良', 5, N'Z2ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (504, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左2制动器', N'防尘帽丢失', 5, N'Z2ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (505, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左2制动器', N'安装座螺丝松', 5, N'Z2ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (506, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左2制动器', N'安装座裂', 5, N'Z2ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (507, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'制动器风管接头漏风', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (508, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'闸瓦偏磨', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (509, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'闸瓦托位置不正', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (510, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'闸瓦托安装螺丝松', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (511, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'作用不良', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (512, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'防尘帽丢失', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (513, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'安装座螺丝松', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (514, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'左3制动器', N'安装座裂', 5, N'Z3ZDQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (515, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3一系减震器', N'安装螺丝松、断、丢失', 5, N'Y3YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (516, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3一系减震器', N'漏油', 5, N'Y3YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (517, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3一系减震器', N'橡胶件老化', 5, N'Y3YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (518, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3一系减震器', N'安装底座裂', 5, N'Y3YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (519, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右3一系减震器', N'外罩变形', 5, N'Y3YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (520, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4一系减震器', N'安装螺丝松、断、丢失', 5, N'Y4YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (521, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4一系减震器', N'漏油', 5, N'Y4YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (522, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4一系减震器', N'橡胶件老化', 5, N'Y4YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (523, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4一系减震器', N'安装底座裂', 5, N'Y4YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (524, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'右4一系减震器', N'外罩变形', 5, N'Y4YXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (525, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1二系横向减震器', N'安装螺丝松、断、丢失', 5, N'Z1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (526, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1二系横向减震器', N'漏油', 5, N'Z1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (527, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1二系横向减震器', N'橡胶件老化', 5, N'Z1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (528, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'左1二系横向减震器', N'安装底座裂', 5, N'Z1EXHXJZQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (529, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱1', N'加油孔盖漏油', 5, N'CLX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (530, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱1', N'加油孔盖丢失', 5, N'CLX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (531, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱1', N'螺丝断', 5, N'CLX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (532, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱1', N'合口螺丝松', 5, N'CLX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (533, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱1', N'合口螺丝断', 5, N'CLX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (534, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（1端）', N'车钩高度', N'高度超限', 5, N'CGGD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (535, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'车钩（2端）', N'车钩高度', N'高度超限', 5, N'CGGD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (536, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线1', N'断股', 5, N'JDX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (537, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线1', N'螺丝松', 5, N'JDX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (538, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线2', N'断股', 5, N'JDX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (539, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线2', N'螺丝松', 5, N'JDX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (540, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线3', N'断股', 5, N'JDX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (541, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线3', N'断股', 5, N'JDX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (542, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线4', N'螺丝松', 5, N'JDX4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (543, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线4', N'螺丝松', 5, N'JDX4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (544, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线5', N'断股', 5, N'JDX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (545, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线5', N'螺丝松', 5, N'JDX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (546, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线6', N'断股', 5, N'JDX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (547, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地线6', N'螺丝松', 5, N'JDX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (548, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置1', N'安装螺丝松', 5, N'JDZZ1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (549, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置1', N'到限', 5, N'JDZZ1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (550, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置2', N'安装螺丝松', 5, N'JDZZ2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (551, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置2', N'到限', 5, N'JDZZ2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (552, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置3', N'安装螺丝松', 5, N'JDZZ3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (553, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置3', N'到限', 5, N'JDZZ3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (554, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置4', N'安装螺丝松', 5, N'JDZZ4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (555, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置4', N'到限', 5, N'JDZZ4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (556, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置5', N'安装螺丝松', 5, N'JDZZ5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (557, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置5', N'到限', 5, N'JDZZ5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (558, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置6', N'安装螺丝松', 5, N'JDZZ6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (559, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'接地装置6', N'到限', 5, N'JDZZ6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (560, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端左扫石器', N'裂', 5, N'YDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (561, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端左扫石器', N'丢失', 5, N'YDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (562, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端左扫石器', N'高度误差', 5, N'YDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (563, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端左扫石器', N'胶皮破损', 5, N'YDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (564, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端左扫石器', N'变形', 5, N'YDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (565, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端左扫石器', N'裂', 5, N'EDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (566, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端左扫石器', N'丢失', 5, N'EDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (567, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端左扫石器', N'高度误差', 5, N'EDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (568, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端左扫石器', N'胶皮破损', 5, N'EDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (569, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端左扫石器', N'变形', 5, N'EDZSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (570, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端右扫石器', N'变形', 5, N'YDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (571, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端右扫石器', N'胶皮破损', 5, N'YDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (572, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端右扫石器', N'高度误差', 5, N'YDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (573, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端右扫石器', N'裂', 5, N'YDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (574, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'一端右扫石器', N'丢失', 5, N'YDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (575, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端右扫石器', N'变形', 5, N'EDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (576, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端右扫石器', N'胶皮破损', 5, N'EDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (577, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端右扫石器', N'高度误差', 5, N'EDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (578, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端右扫石器', N'裂', 5, N'EDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (579, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'上部', N'二端右扫石器', N'丢失', 5, N'EDYSSQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (580, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱2', N'甩油', 5, N'CLX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (581, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱2', N'油尺丢', 5, N'CLX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (582, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱2', N'加油孔盖漏油', 5, N'CLX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (583, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱2', N'加油孔盖丢失', 5, N'CLX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (584, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱2', N'螺丝断', 5, N'CLX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (585, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱2', N'合口螺丝松', 5, N'CLX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (586, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱2', N'合口螺丝断', 5, N'CLX2')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (587, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱3', N'甩油', 5, N'CLX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (588, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱3', N'油尺丢', 5, N'CLX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (589, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱3', N'加油孔盖漏油', 5, N'CLX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (590, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱3', N'加油孔盖丢失', 5, N'CLX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (591, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱3', N'螺丝断', 5, N'CLX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (592, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱3', N'合口螺丝松', 5, N'CLX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (593, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱1', N'甩油', 5, N'CLX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (594, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱1', N'油尺丢', 5, N'CLX1')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (595, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱4', N'甩油', 5, N'CLX4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (596, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱4', N'油尺丢', 5, N'CLX4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (597, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱4', N'加油孔盖漏油', 5, N'CLX4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (598, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱4', N'加油孔盖丢失', 5, N'CLX4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (599, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱4', N'合口螺丝松', 5, N'CLX4')
GO
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (600, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱4', N'合口螺丝断', 5, N'CLX4')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (601, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱3', N'合口螺丝断', 5, N'CLX3')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (602, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱5', N'甩油', 5, N'CLX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (603, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱5', N'油尺丢', 5, N'CLX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (604, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱5', N'加油孔盖漏油', 5, N'CLX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (605, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱5', N'加油孔盖丢失', 5, N'CLX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (606, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱5', N'螺丝断', 5, N'CLX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (607, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱5', N'合口螺丝松', 5, N'CLX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (608, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱5', N'合口螺丝断', 5, N'CLX5')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (609, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱6', N'甩油', 5, N'CLX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (610, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱6', N'油尺丢', 5, N'CLX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (611, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱6', N'加油孔盖漏油', 5, N'CLX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (612, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱6', N'加油孔盖丢失', 5, N'CLX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (613, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱6', N'螺丝断', 5, N'CLX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (614, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱6', N'合口螺丝松', 5, N'CLX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (615, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'转向架', N'地沟', N'齿轮箱6', N'合口螺丝断', 5, N'CLX6')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (616, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'右侧遮阳帘', N'作用不良', 5, N'YCZYL')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (617, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'下柜门', N'下柜门变形', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (618, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'下柜门', N'门锁不良', 5, N'XGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (619, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'后柜门', N'下柜门变形', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (620, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'后柜门', N'门锁不良', 5, N'HGM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (621, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊门', N'门锁不良', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (622, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊门', N'抽风严重', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (623, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊门', N'门合叶螺丝松', 5, N'ZCZLM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (624, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'司机室地板', N'地板变形', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (625, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'司机室地板', N'地板缺少螺丝', 5, N'SJSDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (626, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊地板', N'地板变形', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (627, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧走廊地板', N'地板缺少螺丝', 5, N'ZCZLDB')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (628, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧下水管', N'胶管脱', 5, N'ZCXSG')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (629, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧灭火器', N'安装座开焊、不良', 5, N'ZCMHQ')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (630, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧门联锁', N'门联锁作用不良', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (631, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'司机室（2端）', N'左侧门联锁', N'锁臂压杆开焊', 5, N'ZCMLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (632, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'天窗', N'天窗门', N'门臂、合叶开焊', 5, N'TCM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (633, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'天窗', N'天窗门', N'漏雨', 5, N'TCM')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (634, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'车体', N'天窗', N'天窗梯', N'安装螺丝松、断、丢失', 5, N'TCT')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (635, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左1侧向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (636, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左1侧向限制器', N'橡胶垫', N'老化', 5, N'XJD')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (637, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左1侧向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'AZLS')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (638, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左2侧向限制器', N'与车体间隙', N'间隙不符标准', 5, N'YCTJX')
INSERT [dbo].[FaultDictionary] ([id], [type], [mainpart], [part1], [part2], [part3], [note], [consuming], [pyindex]) VALUES (639, N'DF8B|DF4D|DF4B|DF4DD', N'机械', N'侧向限制器', N'左2侧向限制器', N'橡胶垫', N'老化', 5, N'XJD')
SET IDENTITY_INSERT [dbo].[FaultDictionary] OFF
GO
SET IDENTITY_INSERT [dbo].[ManagerCar] ON 

INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (1, N'DF5F9527', N'车体', N'排障器（1端）', N'大排障器', N'排障器安装螺丝松、断、丢失', 5, N'1组', CAST(N'2005-04-01T00:00:00.000' AS DateTime), CAST(N'2025-04-03T16:00:50.717' AS DateTime), 2, CAST(N'2025-04-03T16:00:55.263' AS DateTime), CAST(1.028 AS Decimal(10, 3)))
INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (2, N'CR400AF305', N'垂向限制器', N'右2垂向限制器', N'安装螺丝', N'安装螺丝松动', 5, N'2组', CAST(N'2025-04-02T16:37:33.920' AS DateTime), CAST(N'2025-04-03T16:15:12.767' AS DateTime), 2, CAST(N'2025-04-03T16:15:17.730' AS DateTime), CAST(7.582 AS Decimal(10, 3)))
INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (3, N'CRH51679', N'转向架', N'上部', N'接地线4', N'螺丝松', 5, N'3组', CAST(N'2025-04-02T17:19:51.940' AS DateTime), CAST(N'2025-04-03T16:17:13.090' AS DateTime), 2, CAST(N'2025-04-03T16:17:19.227' AS DateTime), CAST(3.189 AS Decimal(10, 3)))
INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (15, N'CRH51679', N'转向架', N'上部', N'接地线4', N'螺丝松', 5, N'3组', CAST(N'2025-04-02T17:19:51.940' AS DateTime), CAST(N'2025-04-03T16:46:19.390' AS DateTime), 2, CAST(N'2025-04-03T16:46:25.163' AS DateTime), CAST(2.104 AS Decimal(10, 3)))
INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (16, N'CRH19735', N'侧向限制器', N'右1侧向限制器', N'橡胶垫', N'老化', 5, N'1组', CAST(N'2025-04-02T18:29:20.653' AS DateTime), CAST(N'2025-04-03T17:01:01.530' AS DateTime), 2, CAST(N'2025-04-03T17:05:50.877' AS DateTime), CAST(4.822 AS Decimal(10, 3)))
INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (17, N'CRH19735', N'车体', N'司机室（1端）', N'下柜门', N'下柜门变形', 5, N'1组', CAST(N'2025-04-02T18:30:27.307' AS DateTime), CAST(N'2025-04-03T17:10:55.360' AS DateTime), 2, CAST(N'2025-04-03T21:06:30.280' AS DateTime), CAST(3.926 AS Decimal(10, 3)))
INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (18, N'CRH19735', N'车体', N'司机室（1端）', N'下柜门', N'下柜门变形', 5, N'1组', CAST(N'2025-04-02T18:30:27.307' AS DateTime), NULL, 0, NULL, NULL)
INSERT [dbo].[ManagerCar] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (19, N'DF5F9527', N'转向架', N'上部', N'右2轴箱', N'接地碳刷压簧断', 5, N'2组', CAST(N'2025-04-02T18:32:00.817' AS DateTime), NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ManagerCar] OFF
GO
SET IDENTITY_INSERT [dbo].[ManageUser] ON 

INSERT [dbo].[ManageUser] ([id], [name], [account], [pwd], [post], [team], [note]) VALUES (1, N'张三', N'admin', N'1', N'Admin', N'1组', N'')
INSERT [dbo].[ManageUser] ([id], [name], [account], [pwd], [post], [team], [note]) VALUES (2, N'李四', N'admin1', N'1', N'Technician', N'2组', N'')
INSERT [dbo].[ManageUser] ([id], [name], [account], [pwd], [post], [team], [note]) VALUES (3, N'王五', N'admin2', N'1', N'Inspector', N'3组', N'')
SET IDENTITY_INSERT [dbo].[ManageUser] OFF
GO
SET IDENTITY_INSERT [dbo].[RepairTarget] ON 

INSERT [dbo].[RepairTarget] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime], [starttime], [status], [overtime], [costtime]) VALUES (1, N'DF5F9527', N'转向架', N'上部', N'右2轴箱', N'接地碳刷压簧断', 5, N'2组', CAST(N'2025-04-02T18:32:00.817' AS DateTime), NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RepairTarget] OFF
GO
SET IDENTITY_INSERT [dbo].[TechFault] ON 

INSERT [dbo].[TechFault] ([id], [number], [part1], [part2], [part3], [note], [man_hours], [team], [createtime]) VALUES (6, N'CRH19735', N'垂向限制器', N'右1垂向限制器', N'与车体间隙', N'间隙不符标准', 5, N'1组', CAST(N'2025-04-02T18:30:56.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[TechFault] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleInfo] ON 

INSERT [dbo].[VehicleInfo] ([id], [model], [number], [type], [blong], [entertime], [staff], [status], [outtime]) VALUES (1, N'DF4D', N'DF5F9527', N'内燃机车', N'兰州西车段', CAST(N'2024-04-20T00:00:00.000' AS DateTime), N'张三', N'0', NULL)
INSERT [dbo].[VehicleInfo] ([id], [model], [number], [type], [blong], [entertime], [staff], [status], [outtime]) VALUES (2, N'CRH1', N'CRH19735', N'动车组列车', N'兰州西车段', CAST(N'2025-03-26T00:00:00.000' AS DateTime), N'李四', N'0', NULL)
INSERT [dbo].[VehicleInfo] ([id], [model], [number], [type], [blong], [entertime], [staff], [status], [outtime]) VALUES (3, N'CRH5', N'CRH51679', N'动车组列车', N'兰州西车段', CAST(N'2025-04-25T00:00:00.000' AS DateTime), N'李四', N'1', CAST(N'2025-04-03T22:00:38.823' AS DateTime))
INSERT [dbo].[VehicleInfo] ([id], [model], [number], [type], [blong], [entertime], [staff], [status], [outtime]) VALUES (4, N'CR400AF', N'CR400AF305', N'动车组列车', N'兰州西车段', CAST(N'2025-05-11T00:00:00.000' AS DateTime), N'李四', N'1', CAST(N'2025-04-03T22:08:13.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[VehicleInfo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VehicleInfo_Number]    Script Date: 2025/4/3 22:21:50 ******/
ALTER TABLE [dbo].[VehicleInfo] ADD  CONSTRAINT [UQ_VehicleInfo_Number] UNIQUE NONCLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ManagerCar] ADD  CONSTRAINT [DF__ManagerCa__creat__6CD828CA]  DEFAULT (getdate()) FOR [createtime]
GO
ALTER TABLE [dbo].[ManagerCar] ADD  CONSTRAINT [DF__ManagerCa__statu__6DCC4D03]  DEFAULT ((0)) FOR [status]
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
