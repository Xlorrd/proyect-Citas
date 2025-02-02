USE [ProyectoCitas]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 18/06/2019 11:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[cita_id] [int] IDENTITY(1,1) NOT NULL,
	[cita_estado] [varchar](20) NULL,
	[paci_id] [int] NULL,
	[medhor_id] [int] NOT NULL,
	[espmed_id] [int] NOT NULL,
 CONSTRAINT [PK_Citas] PRIMARY KEY CLUSTERED 
(
	[cita_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 18/06/2019 11:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[espe_id] [int] IDENTITY(1,1) NOT NULL,
	[espe_descripcion] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[espe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EspecialidadMedico]    Script Date: 18/06/2019 11:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EspecialidadMedico](
	[espmed_id] [int] IDENTITY(1,1) NOT NULL,
	[med_id] [int] NOT NULL,
	[espe_id] [int] NOT NULL,
 CONSTRAINT [PK_EspecialidadMedico] PRIMARY KEY CLUSTERED 
(
	[espmed_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 18/06/2019 11:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[med_id] [int] IDENTITY(1,1) NOT NULL,
	[med_abreviatura] [varchar](10) NOT NULL,
	[per_id] [int] NOT NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico_Horario]    Script Date: 18/06/2019 11:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico_Horario](
	[medhor_id] [int] IDENTITY(1,1) NOT NULL,
	[med_id] [int] NOT NULL,
	[medhor_fecha] [date] NOT NULL,
	[medhor_hora] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Medico_Horario] PRIMARY KEY CLUSTERED 
(
	[medhor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 18/06/2019 11:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[paci_id] [int] IDENTITY(1,1) NOT NULL,
	[paci_peso] [varchar](10) NOT NULL,
	[paci_tiposangre] [varchar](10) NULL,
	[paci_estatura] [varchar](10) NOT NULL,
	[paci_sintoma] [nchar](10) NULL,
	[per_id] [int] NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[paci_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 18/06/2019 11:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[per_id] [int] IDENTITY(1,1) NOT NULL,
	[per_nombres] [varchar](50) NOT NULL,
	[per_apellidos] [varchar](50) NOT NULL,
	[per_cedula] [int] NULL,
	[per_email] [varchar](50) NOT NULL,
	[per_telefono] [nchar](10) NULL,
	[per_fechanacimiento] [date] NOT NULL,
	[per_genero] [varchar](50) NOT NULL,
	[per_direccion] [varchar](100) NULL,
	[per_estado] [varchar](20) NOT NULL,
	[per_fechaCreacion] [date] NOT NULL,
	[per_usuario] [varchar](50) NOT NULL,
	[per_contrasenia] [varchar](50) NOT NULL,
	[id_tipousu] [int] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[per_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_usuario]    Script Date: 18/06/2019 11:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_usuario](
	[id_tipousu] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tipousu] [varchar](50) NULL,
 CONSTRAINT [PK_Tipo_usuario] PRIMARY KEY CLUSTERED 
(
	[id_tipousu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_EspecialidadMedico] FOREIGN KEY([espmed_id])
REFERENCES [dbo].[EspecialidadMedico] ([espmed_id])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_EspecialidadMedico]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Medico_Horario] FOREIGN KEY([medhor_id])
REFERENCES [dbo].[Medico_Horario] ([medhor_id])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Medico_Horario]
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Paciente] FOREIGN KEY([paci_id])
REFERENCES [dbo].[Paciente] ([paci_id])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Paciente]
GO
ALTER TABLE [dbo].[EspecialidadMedico]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadMedico_Especialidad] FOREIGN KEY([espe_id])
REFERENCES [dbo].[Especialidad] ([espe_id])
GO
ALTER TABLE [dbo].[EspecialidadMedico] CHECK CONSTRAINT [FK_EspecialidadMedico_Especialidad]
GO
ALTER TABLE [dbo].[EspecialidadMedico]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadMedico_Medico] FOREIGN KEY([med_id])
REFERENCES [dbo].[Medico] ([med_id])
GO
ALTER TABLE [dbo].[EspecialidadMedico] CHECK CONSTRAINT [FK_EspecialidadMedico_Medico]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Persona] FOREIGN KEY([per_id])
REFERENCES [dbo].[Persona] ([per_id])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Persona]
GO
ALTER TABLE [dbo].[Medico_Horario]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Horario_Medico] FOREIGN KEY([med_id])
REFERENCES [dbo].[Medico] ([med_id])
GO
ALTER TABLE [dbo].[Medico_Horario] CHECK CONSTRAINT [FK_Medico_Horario_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Persona] FOREIGN KEY([per_id])
REFERENCES [dbo].[Persona] ([per_id])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Persona]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Tipo_usuario] FOREIGN KEY([id_tipousu])
REFERENCES [dbo].[Tipo_usuario] ([id_tipousu])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Tipo_usuario]
GO
