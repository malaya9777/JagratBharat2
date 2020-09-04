USE [jagragbz_db]
GO

/****** Object:  Table [dbo].[Posts]    Script Date: 04-09-2020 04:30:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HeadLine] [nvarchar](200) NULL,
	[Category] [int] NULL,
	[NewsDate] [datetime] NULL,
	[Image] [varbinary](max) NULL,
	[VideoPath] [varchar](300) NULL,
	[PostedOn] [datetime] NULL,
	[PostedBy] [int] NULL,
	[Submitted] [bit] NULL,
	[SelectedScroller] [bit] NULL,
	[ImagePath] [varchar](500) NULL,
	[ThumbnailPath] [varchar](500) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

