USE [clickfotos]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/07/2015 22:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[senha] [nvarchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galeria]    Script Date: 10/07/2015 22:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galeria](
	[id_usuario] [int] NOT NULL,
	[nome] [nvarchar](50) NULL,
	[descrição] [nvarchar](max) NULL,
	[id_galeria] [int] NOT NULL,
 CONSTRAINT [PK_Galeria] PRIMARY KEY CLUSTERED 
(
	[id_galeria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foto]    Script Date: 10/07/2015 22:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foto](
	[id_galeria] [int] NOT NULL,
	[titulo] [nvarchar](50) NULL,
	[caminho] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Foto_Galeria]    Script Date: 10/07/2015 22:44:18 ******/
ALTER TABLE [dbo].[Foto]  WITH CHECK ADD  CONSTRAINT [FK_Foto_Galeria] FOREIGN KEY([id_galeria])
REFERENCES [dbo].[Galeria] ([id_galeria])
GO
ALTER TABLE [dbo].[Foto] CHECK CONSTRAINT [FK_Foto_Galeria]
GO
/****** Object:  ForeignKey [FK_Galeria_Usuario]    Script Date: 10/07/2015 22:44:18 ******/
ALTER TABLE [dbo].[Galeria]  WITH CHECK ADD  CONSTRAINT [FK_Galeria_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Galeria] CHECK CONSTRAINT [FK_Galeria_Usuario]
GO
