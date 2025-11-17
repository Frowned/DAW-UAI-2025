CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Labels]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Labels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[isDefault] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Type] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdatedAt] [datetime] NULL,
	[Module] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLogs]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Points] [bigint] NOT NULL,
	[Category] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[EndDate] [datetime] NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Points] [bigint] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[ProductName] [varchar](100) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[CheckDigitHorizontal] [varchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleComponent]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleComponent](
	[ParentPermissionId] [int] NULL,
	[ChildPermissionId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Points] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[CheckDigitHorizontal] [varchar](max) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translations]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[LanguageId] [int] NOT NULL,
	[LabelId] [int] NOT NULL,
	[Translation] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC,
	[LabelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/10/2024 03:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[LanguageId] [int] NULL,
	[RoleId] [int] NULL,
	[Points] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[PointTransfers](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [SenderUserId] uniqueidentifier NOT NULL,
    [ReceiverUserId] uniqueidentifier NOT NULL,
    [PointsTransferred] [int] NOT NULL,
    [TransferDate] [datetime] NOT NULL DEFAULT GETDATE(),
	CheckDigitHorizontal VARCHAR(MAX) NULL
PRIMARY KEY CLUSTERED 
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
CONSTRAINT [FK_PointTransfers_Sender] FOREIGN KEY ([SenderUserId]) REFERENCES [dbo].[Users]([Id]),
CONSTRAINT [FK_PointTransfers_Receiver] FOREIGN KEY ([ReceiverUserId]) REFERENCES [dbo].[Users]([Id])
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Languages_isDefault]    Script Date: 28/10/2024 03:28:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Languages_isDefault] ON [dbo].[Languages]
(
	[isDefault] ASC
)
WHERE ([isDefault]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Languages] ADD  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Points]  DEFAULT ((0)) FOR [Points]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[RoleComponent]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_RoleComponent_Child] FOREIGN KEY([ChildPermissionId])
REFERENCES [dbo].[Permissions] ([Id])
GO
ALTER TABLE [dbo].[RoleComponent] CHECK CONSTRAINT [FK_Permissions_RoleComponent_Child]
GO
ALTER TABLE [dbo].[RoleComponent]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_RoleComponent_Parent] FOREIGN KEY([ParentPermissionId])
REFERENCES [dbo].[Permissions] ([Id])
GO
ALTER TABLE [dbo].[RoleComponent] CHECK CONSTRAINT [FK_Permissions_RoleComponent_Parent]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Products]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Labels] FOREIGN KEY([LabelId])
REFERENCES [dbo].[Labels] ([Id])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Labels]
GO
ALTER TABLE [dbo].[Translations]  WITH CHECK ADD  CONSTRAINT [FK_Translations_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Translations] CHECK CONSTRAINT [FK_Translations_Languages]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 
GO
INSERT [dbo].[Languages] ([Id], [Name], [isDefault]) VALUES (1, N'English', 0)
GO
INSERT [dbo].[Languages] ([Id], [Name], [isDefault]) VALUES (2, N'Spanish', 1)
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
INSERT [dbo].[Users] ([Id], [Email], [Username], [Password], [FirstName], [LastName], [IsBlocked], [LanguageId], [RoleId], [Points]) VALUES (N'08095958-3051-46e0-8869-6e8619a20643', N'gestor@admin.com', N'Gestor', N'9BA3A747D2E934A8964C121DFD29905096D84CA4C99F0E479EA5CA13BE5D86BE', N'Gestor', N'Comercial', 0, 1, 28, 85000)
GO
INSERT [dbo].[Users] ([Id], [Email], [Username], [Password], [FirstName], [LastName], [IsBlocked], [LanguageId], [RoleId], [Points]) VALUES (N'3a205255-2224-47cf-9207-74426cbb7f54', N'lautaro.bazaes@gmail.com', N'Lautaro', N'9BA3A747D2E934A8964C121DFD29905096D84CA4C99F0E479EA5CA13BE5D86BE', N'Lautaro', N'Bazaes', 0, 1, 27, 9000)
GO
INSERT [dbo].[Users] ([Id], [Email], [Username], [Password], [FirstName], [LastName], [IsBlocked], [LanguageId], [RoleId], [Points]) VALUES (N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', N'admin@admin.com', N'Admin', N'9BA3A747D2E934A8964C121DFD29905096D84CA4C99F0E479EA5CA13BE5D86BE', N'Admin', N'Admin', 0, 2, 26, 938099)
GO
SET IDENTITY_INSERT [dbo].[Labels] ON 
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1004, N'MANAGE_LANG')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1005, N'PRODUCTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1006, N'NO_ROWS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1007, N'MENU_START')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1008, N'MENU_LOGIN')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1009, N'MENU_CHANGE_PASSWORD')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1010, N'MENU_LOGOUT')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1011, N'MENU_POINTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1012, N'MENU_CHECK_POINTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1013, N'MENU_VIEW_PRODUCTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1014, N'MENU_ADMIN')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1015, N'MANAGE_EMPLOYEES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1016, N'MANAGE_ROLES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1017, N'MANAGE_LANGUAGE')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1018, N'MANAGE_PRODUCTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1019, N'MANAGE_OBJECTIVES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1020, N'MENU_REPORTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1021, N'MENU_HELP')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1022, N'POINTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1023, N'MENU_EXCHANGE_POINTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1024, N'EXCHANGE')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1025, N'CATEGORY')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1026, N'POINTS_EXCHANGE')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1027, N'POINTS_HISTORY')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1028, N'AVAILABLE_PRODUCTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1029, N'MANAGE_PRODUCT_TITLE')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1030, N'NAME')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1031, N'DESCRIPTION')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1032, N'ADD')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1033, N'DISABLE')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1034, N'DISABLED_PRODUCT')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1035, N'ADDED_PRODUCT')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1036, N'SUCCESS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1037, N'ALL_REQUIRED')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1038, N'VALID_POINTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1039, N'ACCEPT')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1040, N'CANCEL')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1041, N'CONFIRM_LOGOUT')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1042, N'DELETE_ROLE_ERROR')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1043, N'ROLE_ALREADY_EXISTS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1044, N'MENU_OBJECTIVES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1045, N'MENU_RECOGNITION')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1046, N'MENU_NAME_EVALUATE_OBJECTIVES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1047, N'MENU_NAME_VIEW_ASSIGNED_OBJECTIVES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1048, N'MENU_NAME_CREATE_OBJECTIVES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1049, N'MENU_NAME_CHECK_NOMINATION_STATUS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1050, N'MENU_NAME_REVIEW_PENDING_NOMINATIONS')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1051, N'MENU_NAME_NOMINATE_COLLABORATOR')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1052, N'MENU_NAME_CONFIGURE_REWARD_POLICIES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1053, N'MENU_NAME_CONFIGURE_RECOGNITION_CATEGORIES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1054, N'MENU_NAME_CUSTOMIZE_NOMINATION_RULES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1055, N'MENU_NAME_GENERATE_RECOGNITION_REPORT')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1056, N'MENU_REPORT_OBJECTIVES')
GO
INSERT [dbo].[Labels] ([Id], [Name]) VALUES (1057, N'MENU_TRANSFER_POINTS')
GO
SET IDENTITY_INSERT [dbo].[Labels] OFF
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1004, N'Lang management')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1005, N'Products')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1006, N'No rows selected')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1007, N'Start')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1008, N'Login')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1009, N'Change Password')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1010, N'Logout')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1011, N'Points')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1012, N'Check Points')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1013, N'View Products')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1014, N'Administration')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1015, N'Manage Employees')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1016, N'Manage Roles')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1017, N'Manage Language')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1018, N'Manage Products')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1019, N'Manage Objectives')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1020, N'Reports')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1021, N'Help')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1022, N'Points:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1023, N'Exchange points')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1024, N'Exchange')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1025, N'Category:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1026, N'Points Exchange:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1027, N'Points History:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1028, N'Available Products:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1029, N'Manage Products:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1030, N'Name:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1031, N'Description:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1032, N'Add')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1033, N'Disable')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1034, N'The product was disabled successfully.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1035, N'The product was added successfully.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1036, N'Success')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1037, N'All fields are required.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1038, N'The points field must be a valid number.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1039, N'Accept')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1040, N'Cancel')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1041, N'Are you sure you want to log out?')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1042, N'Cannot delete a role if it has assigned users.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1043, N'The role already exists.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1044, N'Objectives')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1045, N'Recognition')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1046, N'Evaluate Objectives')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1047, N'View Assigned Objectives')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1048, N'Create Objectives')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1049, N'Check Nomination Status')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1050, N'Review Pending Nominations')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1051, N'Nominate Collaborator')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1052, N'Configure Reward Policies')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1053, N'Configure Recognition Categories')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1054, N'Customize Nomination Rules')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1055, N'Generate Recognition Report')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1056, N'Objectives Report')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (1, 1057, N'Transfer Points')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1004, N'Gestión de idiomas')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1005, N'Productos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1006, N'No hay registros seleccionados.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1007, N'Inicio')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1008, N'Iniciar sesión')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1009, N'Cambiar clave')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1010, N'Cerrar sesión')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1011, N'Puntos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1012, N'Consultar puntos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1013, N'Ver productos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1014, N'Administración')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1015, N'Gestionar empleados')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1016, N'Gestionar perfiles')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1017, N'Gestionar idioma')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1018, N'Gestionar productos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1019, N'Gestionar objetivos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1020, N'Reportería')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1021, N'Ayuda')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1022, N'Puntos:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1023, N'Canjear puntos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1024, N'Canjear')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1025, N'Categoría:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1026, N'Canjear puntos:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1027, N'Historial de puntos:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1028, N'Productos disponibles:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1029, N'Gestión de productos:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1030, N'Nombre:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1031, N'Descripción:')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1032, N'Agregar')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1033, N'Deshabilitar')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1034, N'Se deshabilitó el producto correctamente.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1035, N'Se dio de alta el producto')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1036, N'Éxito')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1037, N'Todos los campos son obligatorios.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1038, N'El campo de puntos debe ser un número válido.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1039, N'Aceptar')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1040, N'Cancelar')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1041, N'¿Está seguro que desea salir?')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1042, N'No se puede eliminar un perfil si tiene usuarios asignados.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1043, N'Ya existe el rol.')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1044, N'Objetivos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1045, N'Reconocimiento')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1046, N'Evaluar Objetivos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1047, N'Ver Objetivos Asignados')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1048, N'Crear Objetivos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1049, N'Consultar Estado de Nominación')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1050, N'Revisar Nominaciones Pendientes')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1051, N'Nominación de Colaborador')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1052, N'Configurar Políticas de Recompensa')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1053, N'Configurar Categorías de Reconocimiento')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1054, N'Personalizar Reglas de Nominación')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1055, N'Generar Informe de Reconocimiento')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1056, N'Informe de Objetivos')
GO
INSERT [dbo].[Translations] ([LanguageId], [LabelId], [Translation]) VALUES (2, 1057, N'Transferir Puntos')
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1, N'Se creó el idioma Puaner', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-06-24T20:27:39.697' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (2, N'Se creó el idioma Prueba', 2, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-06-24T20:28:55.953' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (3, N'Se borró el idioma Puaner', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-06-24T20:30:04.483' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (4, N'Se borró el idioma Prueba', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-06-24T20:30:06.767' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (5, N'Se borró la etiqueta COD_CAMBIAR_IDIOMA', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-06-24T21:40:13.407' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (6, N'Se creó la etiqueta COD_LABEL', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-06-24T21:48:47.830' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1002, N'Se creó la etiqueta MANAGE_LANG', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-06T20:59:02.300' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1003, N'Se creó la etiqueta MANAGE_LANG', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-06T20:59:03.187' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1004, N'Se borró la etiqueta COD_LABEL', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-06T20:59:31.927' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1005, N'Se borró la etiqueta MANAGE_LANG', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-06T21:00:22.563' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1006, N'Se borró la etiqueta MANAGE_LANG', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-06T21:00:29.210' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1007, N'Se creó la etiqueta MANAGE_LANG', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-06T21:00:35.027' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1008, N'Se creó el idioma Prueba', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-07T00:01:59.697' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1009, N'Se borró el idioma Prueba', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-07T00:02:04.933' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1010, N'Se creó el idioma Prueba', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-07T00:05:33.930' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1011, N'Se borró el idioma Prueba', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-07T00:05:36.523' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1012, N'Se creó la etiqueta MANAGE_LANG', 0, N'3a205255-2224-47cf-9207-74426cbb7f54', CAST(N'2024-07-07T00:21:30.733' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1013, N'Se creó la etiqueta PRODUCTS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-08T02:16:01.243' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1014, N'Se creó la etiqueta PRODUCTS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-08T02:19:30.940' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1015, N'Se creó la etiqueta PRODUCTS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-08T02:19:40.930' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1016, N'Se borró la traducción Prueba', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-08T02:23:54.510' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1017, N'Se creó la etiqueta MANAGE_LANG', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-08T02:27:16.663' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1018, N'Se borró la traducción Testing', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-08T02:27:56.517' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1019, N'Se creó la etiqueta MANAGE_LANG', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-08T02:28:26.577' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1020, N'Se creó la etiqueta NO_ROWS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-15T06:39:05.993' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1021, N'Se creó la etiqueta NO_ROWS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-15T06:40:38.587' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1022, N'Se creó la etiqueta NO_ROWS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-15T06:40:54.513' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1023, N'Se borró la traducción No hay registros seleccionados.', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-15T06:41:06.573' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1024, N'Se creó la etiqueta NO_ROWS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-15T06:41:26.303' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1025, N'Se borró la traducción Products', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-15T22:26:05.583' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1026, N'Se creó la etiqueta PRODUCTS', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-07-15T22:26:14.737' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1027, N'Se creó el idioma Spanish2', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T04:25:51.137' AS DateTime), NULL, NULL, N'FrmManageLanguage')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1028, N'Se borró el idioma Spanish2', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T04:26:02.747' AS DateTime), NULL, NULL, N'FrmManageLanguage')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1029, N'Data inconsistency detected in table: Transactions | 93a205255-2224-47cf-9207-74426cbb7f54100015/8/2024 00:00:00|Transactions', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T16:58:59.010' AS DateTime), NULL, NULL, N'FrmLogin')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1030, N'Se agregó el producto: Prueba Bitacora', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T17:18:01.227' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1031, N'Se agregó el producto: Bitacora 2', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T17:18:52.493' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1032, N'Se deshabilitó el producto: Bitacora 2', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T17:19:56.487' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1033, N'Se agregó el producto: Prueba gestor', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:04:43.200' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1034, N'Se agregó el producto: Prueba gestor', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:15:38.217' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1035, N'Se agregó el producto: Prueba gestor', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:16:02.527' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1036, N'Se deshabilitó el producto: Prueba gestor', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:18:03.147' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1037, N'Se deshabilitó el producto: Prueba DV 2', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:19:51.790' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1038, N'Se agregó el producto: Prueba nueva', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:28:46.410' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1039, N'Se deshabilitó el producto: Prueba nueva', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:28:58.790' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1040, N'Se agregó el producto: Prueba 12', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:32:32.693' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1041, N'Se deshabilitó el producto: Prueba 12', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:32:38.917' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1042, N'Se deshabilitó el producto: Prueba gestor', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:33:07.763' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1043, N'Data inconsistency detected in table: Products | 1221000030/9/2024 18:28:45Prueba nuevaGestor 4|Products', 3, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:33:38.233' AS DateTime), NULL, NULL, N'FrmLogin')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1044, N'Se recalculó la tabla Products, vuelva a iniciar sesión', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:33:40.967' AS DateTime), NULL, NULL, N'FrmInconsistencyManagement')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1045, N'Se deshabilitó el producto: Bitacora 2', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:36:44.933' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1046, N'Se deshabilitó el producto: Prueba 12', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:37:43.643' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
INSERT [dbo].[Logs] ([Id], [Message], [Type], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [Module]) VALUES (1047, N'Se deshabilitó el producto: Teatro 25%', 0, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', CAST(N'2024-09-30T18:38:23.290' AS DateTime), NULL, NULL, N'FrmAddProducts')
GO
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Description]) VALUES (1, N'Moda                                                                                                ')
GO
INSERT [dbo].[Categories] ([Id], [Description]) VALUES (2, N'Entretenimiento                                                                                     ')
GO
INSERT [dbo].[Categories] ([Id], [Description]) VALUES (3, N'Giftcard                                                                                            ')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (1, 2, 15000, CAST(N'2024-07-08T01:51:49.737' AS DateTime), NULL, N'Cine 2x1', N'Entradas al 2x1 en Hoyts', N'8ab861a8ca61c1cb1a4eb84c03249c2791669ffe1a8282932f4d655f97d8aa5c')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (2, 3, 900, CAST(N'2024-07-08T01:56:27.327' AS DateTime), NULL, N'70 mil pesos en Havanna', N'Giftcard de 70 mil pesos en havanna', N'04291c6922e3791633e75e908bab005f4f30768a08ffb2195c7d28ea5d70a7b0')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (3, 2, 1000, CAST(N'2024-07-15T07:47:49.600' AS DateTime), CAST(N'2024-09-30T18:38:20.273' AS DateTime), N'Teatro 25%', N'Teatro al 25% de descuento los días jueves', N'24ec4b98980d723b31a62ae8c08cb61c4ef0af22d39d798cdb0b4ac7fc60f640')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (4, 3, 1000, CAST(N'2024-08-05T02:08:38.150' AS DateTime), NULL, N'Giftcard Asado vegano', N'Asado hecho de carne notco', N'ed01defaf8c89f28d4d3e48262244368d7dfcd6f6b336424c26642fa7f6a5a00')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (5, 2, 1050, CAST(N'2024-09-30T15:25:44.467' AS DateTime), CAST(N'2024-09-30T15:29:22.563' AS DateTime), N'Prueba DV', N'Prueba Digito Verificador', N'71ca3b325b5b0fb177527f20a7d77958a3da1987f0d74a53b47d4fd71a60ce12')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (6, 3, 50000, CAST(N'2024-09-30T15:27:03.580' AS DateTime), CAST(N'2024-09-30T18:19:48.433' AS DateTime), N'Prueba DV 2', N'Digito Verificador', N'74b87de2538fa71e8a9718033187ebc60653694d6613bf6aa37eb3776918726a')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (7, 2, 100, CAST(N'2024-09-30T17:17:59.360' AS DateTime), CAST(N'2024-09-30T17:18:03.230' AS DateTime), N'Prueba Bitacora', N'Bitacora', N'dfc7c905a42ab7d4c1c783bc098b3f62e5ff52199e599d29c6db505a219e909e')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (8, 2, 111, CAST(N'2024-09-30T17:18:50.183' AS DateTime), CAST(N'2024-09-30T18:36:40.830' AS DateTime), N'Bitacora 2', N'Bitacora 2', N'2b5d33fa344ab073e5bd37c8e546b67c6568726467b6ec89e0236e67e23d1ceb')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (9, 2, 1666, CAST(N'2024-09-30T18:04:42.077' AS DateTime), CAST(N'2024-09-30T18:33:04.580' AS DateTime), N'Prueba gestor', N'gestor', N'7f43c9be3a0a187fe2195b05e515e93100ab7006ea72c409f173628b198ea51a')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (10, 2, 1509, CAST(N'2024-09-30T18:15:36.793' AS DateTime), CAST(N'2024-09-30T18:16:14.543' AS DateTime), N'Prueba gestor', N'gestor2', N'6a3efee323ab8c8bb8741d751792059a7c75b0c16ca0b2f79a28e36ef9bdc31c')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (11, 2, 19000, CAST(N'2024-09-30T18:16:01.500' AS DateTime), CAST(N'2024-09-30T18:17:59.170' AS DateTime), N'Prueba gestor', N'Prueba 3', N'ab0a12c6372c4b9f33da991cd0c1b6fa85afe19115f93d8f8951d1c73a2b3ad8')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (12, 2, 10000, CAST(N'2024-09-30T18:28:45.403' AS DateTime), NULL, N'Prueba nueva', N'Gestor 4', N'f5c62f8aff2145746e8d9bf1eeb068041a135782991043325c244f4ffabe6814')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Points], [StartDate], [EndDate], [ProductName], [Description], [CheckDigitHorizontal]) VALUES (13, 3, 1444, CAST(N'2024-09-30T18:32:31.493' AS DateTime), NULL, N'Prueba 12', N'Prueba 12', N'26e23c032cc863ae1530e5a28bbfe4f0c08c5743e1769f3f77fdc7bfa9ec7bec')
GO
-- Insertar categoría "Benefits"
INSERT INTO Categories (Description) VALUES (N'Benefits');

-- Suponiendo que el ID de la nueva categoría "Benefits" es 4
DECLARE @BenefitsCategoryId INT = (SELECT Id FROM Categories WHERE Description = 'Benefits');

-- Insertar beneficios corporativos en la categoría "Benefits"
INSERT INTO Products (Description, ProductName, StartDate, EndDate, Points, CategoryId)
VALUES 
    (N'Un día de Home Office', N'Home Office x 1 día', GETDATE(), NULL, 100, @BenefitsCategoryId),
    (N'Tarjeta de regalo para almuerzo', N'Tarjeta Regalo Almuerzo', GETDATE(), NULL, 150, @BenefitsCategoryId),
    (N'Día adicional de vacaciones', N'Vacaciones Extra', GETDATE(), NULL, 200, @BenefitsCategoryId),
    (N'Acceso al gimnasio corporativo por un mes', N'Gimnasio Corporativo', GETDATE(), NULL, 250, @BenefitsCategoryId);
SET IDENTITY_INSERT [dbo].[Products] OFF
GO

SET IDENTITY_INSERT [dbo].[Transactions] ON 
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (1, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 1500, 1, CAST(N'2024-07-08' AS Date), N'446f801e8858406dd5c05dc9684f029dcfc1ff318ea68fcaa0bf8187d573fa96')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (2, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 15000, 1, CAST(N'2024-07-15' AS Date), N'23070d30d2adeaa50946817819d8f380c4901d9e67537c6a8301f044771d61ce')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (3, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 15000, 1, CAST(N'2024-07-15' AS Date), N'5679fe63aee723e262f93f09998ea546cb2ee4c9f32f887af1a4f6e29491a1b1')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (4, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 900, 2, CAST(N'2024-07-15' AS Date), N'c2583d0c4f69c235fbd709b0e28c20c1e72922f05630e799b03edb326f4f6290')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (5, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 15000, 1, CAST(N'2024-07-15' AS Date), N'3d5bcb0aed469a00d3efcbb637e4e7fe563b8243624a78c85c4db455d67babdd')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (6, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 15000, 1, CAST(N'2024-07-15' AS Date), N'9822c1bef0c9b4aa2acd9f9e07b3c60c1232b659543d924964daeccc5c57f527')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (7, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 15000, 1, CAST(N'2024-07-15' AS Date), N'355ac9cae57f7b96286661a9e35eec3f644a7aa321abb88849fc042e423efdb9')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (8, N'08095958-3051-46e0-8869-6e8619a20643', 15000, 1, CAST(N'2024-07-15' AS Date), N'9f85472e0504001e2d86d28563406b5d24754f3f4831bd06d9d9bcd0795f0b4a')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (9, N'3a205255-2224-47cf-9207-74426cbb7f54', 1000, 1, CAST(N'2024-08-05' AS Date), N'f2a7b25b574d4632c7420bdbd7d569c08da64f95ce19f75080bc2d9c2c3ce724')
GO
INSERT [dbo].[Transactions] ([Id], [UserId], [Points], [ProductId], [TransactionDate], [CheckDigitHorizontal]) VALUES (10, N'2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 1000, 4, CAST(N'2024-09-30' AS Date), N'f863dec9f864b635ce7665799cd6f9b3978495e8413f65bf59931c8446e6cd79')
GO
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (15, N'Cambiar clave', N'CAMBIAR_CLAVE')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (16, N'Consultar puntos', N'CONSULTAR_PUNTOS')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (17, N'Canjear puntos', N'CANJEAR_PUNTOS')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (18, N'Ver productos', N'VER_PRODUCTOS')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (19, N'Gestionar idioma', N'GESTIONAR_IDIOMA')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (20, N'Gestionar perfil', N'GESTIONAR_PERFIL')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (21, N'Gestionar productos', N'GESTIONAR_PRODUCTOS')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (22, N'Gestionar empleados', N'GESTIONAR_EMPLEADOS')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (23, N'Gestionar objetivos', N'GESTIONAR_OBJETIVOS')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (24, N'Ver reporteria', N'VER_REPORTERIA')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (25, N'Ver ayuda', N'VER_AYUDA')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (26, N'Administrador', NULL)
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (27, N'Colaborador', NULL)
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (28, N'Gestor comercial', NULL)
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (29, N'Cambiar idioma', N'CAMBIAR_IDIOMA')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (32, N'Testing 2', NULL)
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (33, N'Prueba', N'CAMBIAR_CLAVE')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (34, N'Gestionar backup', N'GESTIONAR_BACKUP')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (35, N'Bitacora eventos', N'BITACORA_EVENTOS')
GO
INSERT [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (36, N'Bitacora productos', N'BITACORA_PRODUCTOS')
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (37, N'Configurar categorías reconocimiento', N'CONFIGURAR_CATEGORIAS_RECONOCIMIENTO');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (38, N'Configurar políticas recompensa', N'CONFIGURAR_POLITICAS_RECOMPENSA');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (39, N'Consultar estado nominación', N'CONSULTAR_ESTADO_NOMINACION');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (40, N'Crear objetivos', N'CREAR_OBJETIVOS');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (41, N'Customizar reglas nominación', N'CUSTOMIZAR_REGLAS_NOMINACION');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (42, N'Evaluar objetivos', N'EVALUAR_OBJETIVOS');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (43, N'Generar reporte reconocimiento', N'GENERAR_REPORTE_RECONOCIMIENTO');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (44, N'Nominación colaborador', N'NOMINAR_COLABORADOR');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (45, N'Revisar nominaciones pendientes', N'REVISAR_NOMINACIONES_PENDIENTES');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (46, N'Ver objetivos', N'VER_OBJETIVOS');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (47, N'Ver objetivos asignados', N'VER_OBJETIVOS_ASIGNADOS');
GO
INSERT INTO [dbo].[Permissions] ([Id], [Name], [Type]) VALUES (48, N'Ver reconocimiento', N'VER_RECONOCIMIENTO');
GO
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 15)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 16)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 17)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 18)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 25)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 27)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 28)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 19)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 20)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 22)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 15)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 16)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 18)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 17)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 21)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 23)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 25)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 24)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 29)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 27)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 34)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 35)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 36)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 36)
GO
INSERT [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 35)
GO
-- Asignar permisos nuevos al rol Administrador (Id: 26)
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 37) -- CONFIGURAR_CATEGORIAS_RECONOCIMIENTO
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 38) -- CONFIGURAR_POLITICAS_RECOMPENSA
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 39) -- CONSULTAR_ESTADO_NOMINACION
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 40) -- CREAR_OBJETIVOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 41) -- CUSTOMIZAR_REGLAS_NOMINACION
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 42) -- EVALUAR_OBJETIVOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 43) -- GENERAR_REPORTE_RECONOCIMIENTO
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 44) -- NOMINAR_COLABORADOR
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 45) -- REVISAR_NOMINACIONES_PENDIENTES
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 46) -- VER_OBJETIVOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 47) -- VER_OBJETIVOS_ASIGNADOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (26, 48) -- VER_RECONOCIMIENTO
GO

-- Asignar permisos nuevos al rol Colaborador (Id: 27)
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 39) -- CONSULTAR_ESTADO_NOMINACION
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 46) -- VER_OBJETIVOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 47) -- VER_OBJETIVOS_ASIGNADOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 44) -- NOMINAR_COLABORADOR
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (27, 48) -- VER_RECONOCIMIENTO
GO

-- Asignar permisos nuevos al rol Gestor Comercial (Id: 28)
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 37) -- CONFIGURAR_CATEGORIAS_RECONOCIMIENTO
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 38) -- CONFIGURAR_POLITICAS_RECOMPENSA
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 39) -- CONSULTAR_ESTADO_NOMINACION
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 40) -- CREAR_OBJETIVOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 41) -- CUSTOMIZAR_REGLAS_NOMINACION
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 42) -- EVALUAR_OBJETIVOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 43) -- GENERAR_REPORTE_RECONOCIMIENTO
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 44) -- NOMINAR_COLABORADOR
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 45) -- REVISAR_NOMINACIONES_PENDIENTES
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 46) -- VER_OBJETIVOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 47) -- VER_OBJETIVOS_ASIGNADOS
GO
INSERT INTO [dbo].[RoleComponent] ([ParentPermissionId], [ChildPermissionId]) VALUES (28, 48) -- VER_RECONOCIMIENTO
GO
SET IDENTITY_INSERT [dbo].[ProductLogs] ON 
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (1, N'Prueba nueva', N'Gestor 4', 10000, N'Entretenimiento                                                                                     ', CAST(N'2024-09-30T18:28:50.550' AS DateTime), 0, NULL, 12)
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (2, N'Prueba nueva', N'Gestor 4', 10000, N'Entretenimiento                                                                                     ', CAST(N'2024-09-30T18:28:45.000' AS DateTime), 1, NULL, 12)
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (3, N'Prueba 12', N'Prueba 12', 1444, N'Entretenimiento                                                                                     ', CAST(N'2024-09-30T18:32:33.820' AS DateTime), 0, NULL, 13)
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (4, N'Prueba 12', N'Prueba 12', 1444, N'Giftcard                                                                                            ', CAST(N'2024-09-30T18:32:31.000' AS DateTime), 1, NULL, 13)
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (5, N'Prueba gestor', N'gestor', 1666, N'Entretenimiento                                                                                     ', CAST(N'2024-09-30T18:04:42.000' AS DateTime), 1, NULL, 9)
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (6, N'Bitacora 2', N'Bitacora 2', 111, N'Entretenimiento                                                                                     ', CAST(N'2024-09-30T17:18:50.000' AS DateTime), 1, NULL, 8)
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (7, N'Prueba 12', N'Prueba 12', 1444, N'Giftcard                                                                                            ', CAST(N'2024-09-30T18:32:31.000' AS DateTime), 1, NULL, 13)
GO
INSERT [dbo].[ProductLogs] ([Id], [ProductName], [Description], [Points], [Category], [StartDate], [IsBlocked], [EndDate], [ProductId]) VALUES (8, N'Teatro 25%', N'Teatro al 25% de descuento los días jueves', 1000, N'Entretenimiento                                                                                     ', CAST(N'2024-07-15T07:47:49.000' AS DateTime), 1, NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[ProductLogs] OFF
GO
-- Tabla de Categorías de Políticas
CREATE TABLE [dbo].[PolicyCategories] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(255) NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_PolicyCategories_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_PolicyCategories_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);

-- Tabla de Políticas de Recompensas
CREATE TABLE [dbo].[RewardPolicies] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [PolicyName] NVARCHAR(255) NOT NULL, -- Nombre descriptivo de la política
    [Description] NVARCHAR(MAX) NULL, -- Descripción detallada
    [ConversionRate] DECIMAL(10, 2) NOT NULL, -- Tasa de conversión de objetivos a puntos
    [AccumulationLimit] DECIMAL(10, 2) NOT NULL, -- Límite de acumulación
    [EffectiveFrom] DATETIME NOT NULL, -- Fecha de inicio
    [EffectiveTo] DATETIME NULL, -- Fecha de fin
    [IsActive] BIT NOT NULL DEFAULT 1, -- Activa o inactiva
    [CategoryId] INT NULL, -- Relación con categorías de políticas
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_RewardPolicies_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_RewardPolicies_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_RewardPolicies_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[PolicyCategories]([Id])
);

-- Tabla de Estados de Objetivos
CREATE TABLE [dbo].[ObjectiveStatuses] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(255) NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_ObjectiveStatuses_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_ObjectiveStatuses_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);

-- Tabla de Categorías de Objetivos
CREATE TABLE [dbo].[ObjectiveCategories] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(255) NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_ObjectiveCategories_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_ObjectiveCategories_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);

-- Tabla de Prioridades de Objetivos
CREATE TABLE [dbo].[ObjectivePriorities] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(255) NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_ObjectivePriorities_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_ObjectivePriorities_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);

-- Tabla de Objetivos
CREATE TABLE [dbo].[Objectives] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Title] NVARCHAR(255) NOT NULL,
    [Description] NVARCHAR(MAX) NOT NULL,
    [StartDate] DATETIME NOT NULL,
    [EndDate] DATETIME NOT NULL,
    [ResponsibleUserId] UNIQUEIDENTIFIER NOT NULL,
    [AssignedUserId] UNIQUEIDENTIFIER NOT NULL, -- Usuario asignado al objetivo
    [StatusId] INT NOT NULL,
    [PriorityId] INT NOT NULL,
    [CategoryId] INT NOT NULL,
    [Progress] INT NOT NULL DEFAULT 0,
    [ReviewDate] DATETIME NULL,
    [PointsAssigned] INT NOT NULL,
    [RewardPolicyId] INT NOT NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_Objectives_Users_Responsible] FOREIGN KEY ([ResponsibleUserId]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_Objectives_Users_Assigned] FOREIGN KEY ([AssignedUserId]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_Objectives_Status] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[ObjectiveStatuses]([Id]),
    CONSTRAINT [FK_Objectives_Priority] FOREIGN KEY ([PriorityId]) REFERENCES [dbo].[ObjectivePriorities]([Id]),
    CONSTRAINT [FK_Objectives_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[ObjectiveCategories]([Id]),
    CONSTRAINT [FK_Objectives_RewardPolicies] FOREIGN KEY ([RewardPolicyId]) REFERENCES [dbo].[RewardPolicies]([Id]),
    CONSTRAINT [FK_Objectives_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_Objectives_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);

-- Tabla de Comentarios sobre Objetivos
CREATE TABLE [dbo].[ObjectiveComments] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [ObjectiveId] INT NOT NULL,
    [Comment] NVARCHAR(MAX) NOT NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_ObjectiveComments_Objectives] FOREIGN KEY ([ObjectiveId]) REFERENCES [dbo].[Objectives]([Id]),
    CONSTRAINT [FK_ObjectiveComments_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_ObjectiveComments_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);

-- Tabla de Historial de Objetivos
CREATE TABLE [dbo].[ObjectiveHistory] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [ObjectiveId] INT NOT NULL,
    [StatusId] INT NOT NULL,
    [Progress] INT NOT NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [FK_ObjectiveHistory_Objectives] FOREIGN KEY ([ObjectiveId]) REFERENCES [dbo].[Objectives]([Id]),
    CONSTRAINT [FK_ObjectiveHistory_Status] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[ObjectiveStatuses]([Id]),
    CONSTRAINT [FK_ObjectiveHistory_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id])
);

-- Deshabilitar IDENTITY_INSERT para PolicyCategories
SET IDENTITY_INSERT [dbo].[PolicyCategories] ON;

INSERT INTO [dbo].[PolicyCategories] ([Id], [Name], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, N'General', N'Políticas generales', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'Ventas', N'Políticas relacionadas con ventas', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Desarrollo', N'Políticas relacionadas con desarrollo', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, N'Soporte', N'Políticas relacionadas con soporte', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[PolicyCategories] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para RewardPolicies
SET IDENTITY_INSERT [dbo].[RewardPolicies] ON;

INSERT INTO [dbo].[RewardPolicies] ([Id], [PolicyName], [Description], [ConversionRate], [AccumulationLimit], [EffectiveFrom], [EffectiveTo], [IsActive], [CategoryId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, N'Política General', N'Política de recompensas general', 1.5, 10000, GETDATE(), NULL, 1, 1, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'Política de Ventas', N'Política de recompensas para ventas', 2.0, 15000, GETDATE(), NULL, 1, 2, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Política de Desarrollo', N'Política de recompensas para desarrollo', 1.8, 12000, GETDATE(), NULL, 1, 3, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, N'Política de Soporte', N'Política de recompensas para soporte', 1.2, 8000, GETDATE(), NULL, 1, 4, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[RewardPolicies] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para ObjectiveStatuses
SET IDENTITY_INSERT [dbo].[ObjectiveStatuses] ON;

INSERT INTO [dbo].[ObjectiveStatuses] ([Id], [Name], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, N'Pendiente', N'El objetivo está pendiente', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'En Progreso', N'El objetivo está en progreso', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Completado', N'El objetivo está completado', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, N'En Espera', N'El objetivo está en espera', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[ObjectiveStatuses] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para ObjectiveCategories
SET IDENTITY_INSERT [dbo].[ObjectiveCategories] ON;

INSERT INTO [dbo].[ObjectiveCategories] ([Id], [Name], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, N'Ventas', N'Objetivos de ventas', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'Desarrollo', N'Objetivos de desarrollo', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Soporte', N'Objetivos de soporte', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, N'Marketing', N'Objetivos de marketing', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[ObjectiveCategories] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para ObjectivePriorities
SET IDENTITY_INSERT [dbo].[ObjectivePriorities] ON;

INSERT INTO [dbo].[ObjectivePriorities] ([Id], [Name], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, N'Alta', N'Objetivos de alta prioridad', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'Media', N'Objetivos de prioridad media', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Baja', N'Objetivos de baja prioridad', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[ObjectivePriorities] OFF;
GO

-- Deshabilitar IDENTITY_INSERT para Objectives
SET IDENTITY_INSERT [dbo].[Objectives] ON;

INSERT INTO [dbo].[Objectives] 
    ([Id], [Title], [Description], [StartDate], [EndDate], [ResponsibleUserId], [AssignedUserId], [StatusId], [PriorityId], [CategoryId], [Progress], [ReviewDate], [PointsAssigned], [RewardPolicyId], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) 
VALUES 
(1, N'Vender 100 unidades', N'Vender 100 unidades del producto X', GETDATE(), DATEADD(month, 1, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '3a205255-2224-47cf-9207-74426cbb7f54', 1, 1, 1, 0, NULL, 100, 1, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'Desarrollar nueva característica', N'Desarrollar una nueva característica para el producto Y', GETDATE(), DATEADD(month, 2, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 2, 2, 2, 0, NULL, 200, 2, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Resolver 50 tickets', N'Resolver 50 tickets de soporte', GETDATE(), DATEADD(month, 1, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '3a205255-2224-47cf-9207-74426cbb7f54', 1, 3, 3, 0, NULL, 150, 3, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, N'Lanzar campaña de marketing', N'Lanzar una nueva campaña de marketing para el producto Z', GETDATE(), DATEADD(month, 3, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 2, 1, 4, 0, NULL, 300, 1, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(5, N'Mejorar la satisfacción del cliente', N'Mejorar la satisfacción del cliente en un 20%', GETDATE(), DATEADD(month, 4, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '3a205255-2224-47cf-9207-74426cbb7f54', 3, 2, 3, 0, NULL, 250, 2, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(6, N'Aumentar el tráfico web', N'Aumentar el tráfico web en un 30%', GETDATE(), DATEADD(month, 5, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 1, 3, 4, 0, NULL, 400, 3, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(7, N'Reducir el tiempo de respuesta', N'Reducir el tiempo de respuesta para tickets de soporte en un 50%', GETDATE(), DATEADD(month, 6, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '3a205255-2224-47cf-9207-74426cbb7f54', 4, 1, 3, 0, NULL, 350, 1, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(8, N'Ampliar el alcance del mercado', N'Ampliar el alcance del mercado a 3 nuevas regiones', GETDATE(), DATEADD(month, 7, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 2, 2, 4, 0, NULL, 500, 2, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(9, N'Mejorar la calidad del producto', N'Mejorar la calidad del producto reduciendo los defectos en un 40%', GETDATE(), DATEADD(month, 8, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '3a205255-2224-47cf-9207-74426cbb7f54', 3, 3, 2, 0, NULL, 450, 3, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(10, N'Optimizar la cadena de suministro', N'Optimizar la cadena de suministro para reducir costos en un 20%', GETDATE(), DATEADD(month, 9, GETDATE()), '08095958-3051-46e0-8869-6e8619a20643', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 1, 1, 1, 0, NULL, 600, 1, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[Objectives] OFF;
GO

-- Deshabilitar IDENTITY_INSERT para ObjectiveComments
SET IDENTITY_INSERT [dbo].[ObjectiveComments] ON;

INSERT INTO [dbo].[ObjectiveComments] ([Id], [ObjectiveId], [Comment], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, 1, N'Iniciando la venta de unidades.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, 1, N'Vendidas 50 unidades, vamos bien.', '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 10, GETDATE()), NULL, NULL),
(3, 2, N'Comenzando el desarrollo de la nueva característica.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, 2, N'Característica en fase de pruebas.', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 20, GETDATE()), NULL, NULL),
(5, 3, N'Iniciando la resolución de tickets.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(6, 3, N'Resolvimos 25 tickets hasta ahora.', '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 15, GETDATE()), NULL, NULL),
(7, 4, N'Planificando la campaña de marketing.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(8, 4, N'Campaña lanzada con éxito.', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 30, GETDATE()), NULL, NULL),
(9, 5, N'Analizando la satisfacción del cliente.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(10, 5, N'Satisfacción del cliente mejorada en un 10%.', '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 25, GETDATE()), NULL, NULL),
(11, 6, N'Iniciando estrategias para aumentar el tráfico web.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(12, 6, N'Tráfico web aumentado en un 15%.', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 35, GETDATE()), NULL, NULL),
(13, 7, N'Implementando mejoras en el tiempo de respuesta.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(14, 7, N'Tiempo de respuesta reducido en un 25%.', '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 40, GETDATE()), NULL, NULL),
(15, 8, N'Explorando nuevas regiones para el mercado.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(16, 8, N'Mercado expandido a 2 nuevas regiones.', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 50, GETDATE()), NULL, NULL),
(17, 9, N'Analizando defectos en el producto.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(18, 9, N'Defectos reducidos en un 20%.', '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 45, GETDATE()), NULL, NULL),
(19, 10, N'Iniciando optimización de la cadena de suministro.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(20, 10, N'Costos reducidos en un 10%.', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 55, GETDATE()), NULL, NULL);

SET IDENTITY_INSERT [dbo].[ObjectiveComments] OFF;
GO

-- Deshabilitar IDENTITY_INSERT para ObjectiveHistory
SET IDENTITY_INSERT [dbo].[ObjectiveHistory] ON;

INSERT INTO [dbo].[ObjectiveHistory] ([Id], [ObjectiveId], [StatusId], [Progress], [CreatedBy], [CreatedAt]) VALUES 
(1, 1, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(2, 1, 2, 50, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 10, GETDATE())),
(3, 1, 3, 100, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 30, GETDATE())),
(4, 2, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(5, 2, 2, 50, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 20, GETDATE())),
(6, 2, 3, 100, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 60, GETDATE())),
(7, 3, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(8, 3, 2, 50, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 15, GETDATE())),
(9, 3, 3, 100, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 30, GETDATE())),
(10, 4, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(11, 4, 2, 50, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 30, GETDATE())),
(12, 4, 3, 100, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 90, GETDATE())),
(13, 5, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(14, 5, 2, 50, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 25, GETDATE())),
(15, 5, 3, 100, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 50, GETDATE())),
(16, 6, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(17, 6, 2, 50, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 35, GETDATE())),
(18, 6, 3, 100, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 70, GETDATE())),
(19, 7, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(20, 7, 2, 50, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 40, GETDATE())),
(21, 7, 3, 100, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 80, GETDATE())),
(22, 8, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(23, 8, 2, 50, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 50, GETDATE())),
(24, 8, 3, 100, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 100, GETDATE())),
(25, 9, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(26, 9, 2, 50, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 45, GETDATE())),
(27, 9, 3, 100, '3a205255-2224-47cf-9207-74426cbb7f54', DATEADD(day, 90, GETDATE())),
(28, 10, 1, 0, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(29, 10, 2, 50, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 55, GETDATE())),
(30, 10, 3, 100, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', DATEADD(day, 110, GETDATE()));

SET IDENTITY_INSERT [dbo].[ObjectiveHistory] OFF;
GO
-- Tabla de Categorías de Reconocimiento
CREATE TABLE [dbo].[RecognitionCategories] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(255) NULL,
    [Points] INT NOT NULL, -- Puntos asociados a la categoría
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_RecognitionCategories_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_RecognitionCategories_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);
GO

-- Tabla de Estados de Nominaciones
CREATE TABLE [dbo].[NominationStatuses] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(255) NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_NominationStatuses_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_NominationStatuses_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);
GO

-- Tabla de Nominaciones
CREATE TABLE [dbo].[Nominations] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [NominatorUserId] UNIQUEIDENTIFIER NOT NULL, -- Usuario que realiza la nominación
    [NomineeUserId] UNIQUEIDENTIFIER NOT NULL, -- Usuario nominado
    [CategoryId] INT NOT NULL, -- Categoría de reconocimiento
    [StatusId] INT NOT NULL, -- Estado de la nominación
    [Comments] NVARCHAR(MAX) NULL, -- Comentarios adicionales
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_Nominations_Users_Nominator] FOREIGN KEY ([NominatorUserId]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_Nominations_Users_Nominee] FOREIGN KEY ([NomineeUserId]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_Nominations_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[RecognitionCategories]([Id]),
    CONSTRAINT [FK_Nominations_Status] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[NominationStatuses]([Id]),
    CONSTRAINT [FK_Nominations_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_Nominations_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);
GO

-- Tabla de Comentarios sobre Nominaciones
CREATE TABLE [dbo].[NominationComments] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [NominationId] INT NOT NULL,
    [Comment] NVARCHAR(MAX) NOT NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    [UpdatedBy] UNIQUEIDENTIFIER NULL,
    [UpdatedAt] DATETIME NULL,
    CONSTRAINT [FK_NominationComments_Nominations] FOREIGN KEY ([NominationId]) REFERENCES [dbo].[Nominations]([Id]),
    CONSTRAINT [FK_NominationComments_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id]),
    CONSTRAINT [FK_NominationComments_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users]([Id])
);
GO

-- Tabla de Historial de Nominaciones
CREATE TABLE [dbo].[NominationHistory] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [NominationId] INT NOT NULL,
    [StatusId] INT NOT NULL,
    [CreatedBy] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [FK_NominationHistory_Nominations] FOREIGN KEY ([NominationId]) REFERENCES [dbo].[Nominations]([Id]),
    CONSTRAINT [FK_NominationHistory_Status] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[NominationStatuses]([Id]),
    CONSTRAINT [FK_NominationHistory_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users]([Id])
);
GO
-- Deshabilitar IDENTITY_INSERT para RecognitionCategories
SET IDENTITY_INSERT [dbo].[RecognitionCategories] ON;

INSERT INTO [dbo].[RecognitionCategories] ([Id], [Name], [Description], [Points], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, N'Innovación', N'Reconocimiento por innovación', 500, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'Colaboración', N'Reconocimiento por colaboración', 300, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Excelencia', N'Reconocimiento por excelencia', 700, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, N'Liderazgo', N'Reconocimiento por liderazgo', 600, '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[RecognitionCategories] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para NominationStatuses
SET IDENTITY_INSERT [dbo].[NominationStatuses] ON;

INSERT INTO [dbo].[NominationStatuses] ([Id], [Name], [Description], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, N'Pendiente', N'La nominación está pendiente', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, N'Aprobada', N'La nominación ha sido aprobada', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, N'Rechazada', N'La nominación ha sido rechazada', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(4, N'Cancelada', N'La nominación ha sido cancelada', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[NominationStatuses] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para Nominations
SET IDENTITY_INSERT [dbo].[Nominations] ON;

INSERT INTO [dbo].[Nominations] ([Id], [NominatorUserId], [NomineeUserId], [CategoryId], [StatusId], [Comments], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, '08095958-3051-46e0-8869-6e8619a20643', '3a205255-2224-47cf-9207-74426cbb7f54', 1, 1, N'Excelente trabajo en innovación.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, '08095958-3051-46e0-8869-6e8619a20643', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', 2, 1, N'Gran colaboración en el proyecto.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, '3a205255-2224-47cf-9207-74426cbb7f54', '08095958-3051-46e0-8869-6e8619a20643', 3, 1, N'Excelencia en la entrega del producto.', '3a205255-2224-47cf-9207-74426cbb7f54', GETDATE(), NULL, NULL),
(4, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', '08095958-3051-46e0-8869-6e8619a20643', 4, 1, N'Liderazgo destacado en el equipo.', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[Nominations] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para NominationHistory
SET IDENTITY_INSERT [dbo].[NominationHistory] ON;

INSERT INTO [dbo].[NominationHistory] ([Id], [NominationId], [StatusId], [CreatedBy], [CreatedAt]) VALUES 
(1, 1, 1, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(2, 2, 1, '08095958-3051-46e0-8869-6e8619a20643', GETDATE()),
(3, 3, 1, '3a205255-2224-47cf-9207-74426cbb7f54', GETDATE()),
(4, 4, 1, '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', GETDATE());

SET IDENTITY_INSERT [dbo].[NominationHistory] OFF;
GO
-- Deshabilitar IDENTITY_INSERT para NominationComments
SET IDENTITY_INSERT [dbo].[NominationComments] ON;

INSERT INTO [dbo].[NominationComments] ([Id], [NominationId], [Comment], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES 
(1, 1, N'Comentario adicional sobre la innovación.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(2, 2, N'Comentario adicional sobre la colaboración.', '08095958-3051-46e0-8869-6e8619a20643', GETDATE(), NULL, NULL),
(3, 3, N'Comentario adicional sobre la excelencia.', '3a205255-2224-47cf-9207-74426cbb7f54', GETDATE(), NULL, NULL),
(4, 4, N'Comentario adicional sobre el liderazgo.', '2eb2ce71-c0db-43f3-a6fb-d23dabd608df', GETDATE(), NULL, NULL);

SET IDENTITY_INSERT [dbo].[NominationComments] OFF;
GO
CREATE TABLE [dbo].[NominationRules] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [RuleName] NVARCHAR(255) NOT NULL, -- Nombre de la regla
    [RuleValue] NVARCHAR(255) NOT NULL, -- Valor asignado a la regla
    [Description] NVARCHAR(255) NULL, -- Descripción de la regla
    [IsActive] BIT NOT NULL DEFAULT 1, -- Indica si la regla está activa
    [CreatedBy] uniqueidentifier NOT NULL, -- Usuario que creó la regla
    [CreatedAt] DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha de creación
    [UpdatedBy] uniqueidentifier NULL, -- Último usuario que modificó la regla
    [UpdatedAt] DATETIME NULL -- Fecha de última actualización
);
INSERT INTO [dbo].[NominationRules] (RuleName, RuleValue, Description, CreatedBy)
VALUES
    -- Límite de nominaciones por usuario
    ('MaxNominationsPerUser', '5', 'Número máximo de nominaciones por usuario al mes', '2EB2CE71-C0DB-43F3-A6FB-D23DABD608DF'),
    
    -- Meses mínimos de antigüedad
    ('EligibilityMonths', '6', 'Meses mínimos de antigüedad para ser nominado', '2EB2CE71-C0DB-43F3-A6FB-D23DABD608DF'),
    
    -- Categorías permitidas
    ('AllowedCategories', '1,2,3,4', 'Categorías permitidas para nominaciones', '2EB2CE71-C0DB-43F3-A6FB-D23DABD608DF'),
    
    -- Plazo para revisar nominaciones
    ('ReviewDeadlineDays', '7', 'Tiempo máximo en días para revisar una nominación', '2EB2CE71-C0DB-43F3-A6FB-D23DABD608DF');
GO

/****** Object:  Table [dbo].[IntegrityControl]    Script Date: 17/11/2024 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntegrityControl](
	[TableName] [VARCHAR](100) NOT NULL,
	[CheckDigitVertical] [VARCHAR](64) NOT NULL,
	[FechaCalculo] [DATETIME] NOT NULL DEFAULT GETDATE(),
PRIMARY KEY CLUSTERED
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [master]
GO
ALTER DATABASE [DB_SIFRE] SET  READ_WRITE 
GO