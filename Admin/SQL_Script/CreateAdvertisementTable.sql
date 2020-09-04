USE [jagragbz_db]
GO

/****** Object:  Table [dbo].[Advertisement]    Script Date: 04-09-2020 04:29:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Advertisement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Headline] [varchar](200) NULL,
	[AddContent] [nvarchar](max) NULL,
	[ImagePath] [varchar](500) NULL,
	[ThumbnailPath] [varchar](500) NULL,
	[PublishedOn] [datetime] NULL,
	[PublishedTill] [datetime] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


