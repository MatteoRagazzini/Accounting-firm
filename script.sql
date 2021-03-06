USE [StudioCommerciale]
GO
/****** Object:  Table [dbo].[AMMINISTRATORI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMMINISTRATORI](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[data_inizio_incarico] [date] NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[data_fine_incarico] [date] NULL,
 CONSTRAINT [IDAMMINISTRATORE] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC,
	[data_inizio_incarico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASSOCIAZIONE_SOCI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSOCIAZIONE_SOCI](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[quota] [real] NULL,
	[precentuale] [real] NULL,
 CONSTRAINT [IDASSOCIAZIONE_SOCI] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC,
	[codice_fiscale_impresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILANCI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILANCI](
	[data_approvazione] [date] NOT NULL,
	[cod_bilancio] [varchar](4) NOT NULL,
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[data_chiusura] [date] NOT NULL,
	[periodicita] [varchar](20) NOT NULL,
 CONSTRAINT [IDBILANCIO] PRIMARY KEY CLUSTERED 
(
	[cod_bilancio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTI](
	[nome] [varchar](20) NOT NULL,
	[cognome] [varchar](20) NOT NULL,
	[nazionalita] [varchar](20) NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[cod_fiscale] [char](16) NOT NULL,
	[data_nascita] [date] NOT NULL,
	[luogo_nascita] [varchar](20) NOT NULL,
	[numero_telefono] [bigint] NOT NULL,
	[domicilio_fiscale] [varchar](20) NOT NULL,
 CONSTRAINT [IDCLIENTE] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTI_SEGUITI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTI_SEGUITI](
	[cod_cliente] [int] NOT NULL,
	[data_inizio_gestione] [date] NOT NULL,
	[data_fine_gestione] [date] NULL,
	[cod_dipendente] [varchar](4) NOT NULL,
 CONSTRAINT [IDCLIENTE_SEGUITO] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC,
	[data_inizio_gestione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATI_PIATTAFORMA_IMPRESE]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATI_PIATTAFORMA_IMPRESE](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[nome_utente] [varchar](20) NOT NULL,
	[password] [varchar](8) NOT NULL,
	[cod_piattaforma] [varchar](6) NOT NULL,
 CONSTRAINT [FKADO_IMP_ID] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATI_PIATTAFORMA_LIB_PROF]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATI_PIATTAFORMA_LIB_PROF](
	[cod_cliente] [int] NOT NULL,
	[nome_utente] [varchar](20) NOT NULL,
	[password] [varchar](8) NOT NULL,
	[cod_piattaforma] [varchar](6) NOT NULL,
 CONSTRAINT [FKSCE_LIB_ID] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DELEGHE_ANNUE_CLIENTI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DELEGHE_ANNUE_CLIENTI](
	[cod_cliente] [int] NOT NULL,
	[data_scadenza] [date] NOT NULL,
	[tipologia] [varchar](20) NOT NULL,
	[anno_sottoscrizione] [date] NOT NULL,
 CONSTRAINT [IDDELEGA_ANNUA_CLIENTI] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC,
	[anno_sottoscrizione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DELEGHE_ANNUE_IMPRESE]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DELEGHE_ANNUE_IMPRESE](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[data_scadenza] [date] NOT NULL,
	[tipologia] [varchar](20) NOT NULL,
	[anno_sottoscrizione] [date] NOT NULL,
 CONSTRAINT [IDDELEGA_ANNUA_IMPRESE] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC,
	[anno_sottoscrizione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIPENDENTI_STUDIO]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIPENDENTI_STUDIO](
	[nome] [varchar](20) NOT NULL,
	[cognome] [varchar](20) NOT NULL,
	[cod_dipendente] [varchar](4) NOT NULL,
	[settore] [varchar](20) NOT NULL,
 CONSTRAINT [IDADDETTO] PRIMARY KEY CLUSTERED 
(
	[cod_dipendente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRIGENZA_DITTE]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRIGENZA_DITTE](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[cod_cliente] [int] NOT NULL,
 CONSTRAINT [FKDIR_IMP_ID] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FABBRICATI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FABBRICATI](
	[cod_propieta] [varchar](4) NOT NULL,
	[rendita_catastale] [real] NOT NULL,
	[rendita_rivalutata] [real] NOT NULL,
	[cod_tipologia_fabbricato] [varchar](4) NOT NULL,
 CONSTRAINT [FKREGISTRAZIONE_FABBRICATO_ID] PRIMARY KEY CLUSTERED 
(
	[cod_propieta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMPRESE]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMPRESE](
	[cod_identificativo] [int] NOT NULL,
	[sigla] [varchar](20) NOT NULL,
	[nazionalita] [varchar](20) NOT NULL,
	[sede] [varchar](20) NOT NULL,
	[domicilio_fiscale] [varchar](20) NOT NULL,
	[data_inizio_attività] [date] NOT NULL,
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[cod_attivita] [varchar](20) NOT NULL,
	[metodo_gestione_fatturazione] [varchar](20) NULL,
	[periodicita_iva] [varchar](20) NULL,
	[metodo_conteggio] [varchar](20) NULL,
	[cod_tipologia] [char](1) NOT NULL,
 CONSTRAINT [IDRAGIONE_SOCIALE] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMPRESE_SEGUITE]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMPRESE_SEGUITE](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[data_inizio_gestione] [date] NOT NULL,
	[data_fine_gestione] [date] NULL,
	[cod_dipendente] [varchar](4) NOT NULL,
 CONSTRAINT [IDIMPRESA_SEGUITA] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC,
	[data_inizio_gestione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIBERI_PROFESSIONISTI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIBERI_PROFESSIONISTI](
	[cod_cliente] [int] NOT NULL,
	[professione] [varchar](20) NOT NULL,
	[tipologia_gestione_contribuzione] [varchar](20) NOT NULL,
	[tipo_contribuzione] [varchar](20) NOT NULL,
	[metodo_gestione_fatturazione] [varchar](20) NULL,
	[periodicita_iva] [varchar](20) NULL,
	[metodo_conteggio_iva] [varchar](20) NULL,
	[cod_tipologia] [char](1) NOT NULL,
 CONSTRAINT [FKREGISTRAZIONE_LIBERO_PROF_ID] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PIATTAFORME]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PIATTAFORME](
	[cod_piattaforma] [varchar](6) NOT NULL,
 CONSTRAINT [IDDATI_PIATTAFORMA] PRIMARY KEY CLUSTERED 
(
	[cod_piattaforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROPRIETA]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROPRIETA](
	[via] [varchar](20) NOT NULL,
	[civico] [int] NOT NULL,
	[comune] [varchar](20) NOT NULL,
	[CAP] [int] NOT NULL,
	[valore_IMU] [real] NULL,
	[cod_propieta] [varchar](4) NOT NULL,
	[sezione] [varchar](4) NOT NULL,
	[foglio] [varchar](4) NOT NULL,
	[particella] [varchar](4) NOT NULL,
	[subalterno] [varchar](4) NOT NULL,
	[classe] [varchar](4) NOT NULL,
	[cod_cliente] [int] NOT NULL,
 CONSTRAINT [IDPROPRIETÀ_ID] PRIMARY KEY CLUSTERED 
(
	[cod_propieta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGIMI_CONTABILE]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGIMI_CONTABILE](
	[descizione] [varchar](20) NOT NULL,
	[cod_tipologia] [char](1) NOT NULL,
 CONSTRAINT [IDREGIME_CONTABILE] PRIMARY KEY CLUSTERED 
(
	[cod_tipologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOCI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOCI](
	[cod_cliente] [int] NOT NULL,
	[data_affiliazione] [date] NOT NULL,
	[tipologia_socio] [varchar](20) NOT NULL,
 CONSTRAINT [FKREGISTRAZIONE_SOCIO_ID] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOCIETA]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOCIETA](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[sigla_tipologia] [varchar](20) NOT NULL,
	[capitale_sociale] [real] NOT NULL,
	[numero_reg_imprese] [varchar](20) NOT NULL,
	[descrizione_tipologia] [varchar](20) NOT NULL,
 CONSTRAINT [FKPUO_ESSERE_ID] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TERRENI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TERRENI](
	[cod_propieta] [varchar](4) NOT NULL,
	[qualita] [varchar](20) NOT NULL,
	[rendita_dominicale_catastale] [real] NOT NULL,
	[rendita_dominicale_rivalutata] [varchar](12) NOT NULL,
	[rendita_agraria_catastale] [varchar](12) NOT NULL,
	[rendita_agraria_rivalutata] [varchar](12) NOT NULL,
	[cod_tipologia_terreno] [varchar](4) NOT NULL,
 CONSTRAINT [FKREGISTRAZIONE_TERRENO_ID] PRIMARY KEY CLUSTERED 
(
	[cod_propieta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPI_FABBRICATI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPI_FABBRICATI](
	[tipologia_fabbricato] [varchar](20) NOT NULL,
	[cod_tipologia_fabbricato] [varchar](4) NOT NULL,
 CONSTRAINT [IDTIPO_FABBRICATI] PRIMARY KEY CLUSTERED 
(
	[cod_tipologia_fabbricato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPI_TERRENI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPI_TERRENI](
	[tipologia_terreno] [varchar](20) NOT NULL,
	[cod_tipologia_terreno] [varchar](4) NOT NULL,
 CONSTRAINT [IDTIPO_TERRENO] PRIMARY KEY CLUSTERED 
(
	[cod_tipologia_terreno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TITOLARI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TITOLARI](
	[cod_cliente] [int] NOT NULL,
	[partita_iva] [varchar](16) NOT NULL,
 CONSTRAINT [FKREGISTRAZIONE_TITOLARE_ID] PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UNITA_LOCALI]    Script Date: 09/07/2019 23:13:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNITA_LOCALI](
	[codice_fiscale_impresa] [varchar](16) NOT NULL,
	[cod_unita_locale] [int] NOT NULL,
	[via] [varchar](20) NOT NULL,
	[civico] [int] NOT NULL,
	[comune] [varchar](20) NOT NULL,
	[CAP] [int] NOT NULL,
 CONSTRAINT [IDUNITÀ_LOCALE] PRIMARY KEY CLUSTERED 
(
	[codice_fiscale_impresa] ASC,
	[cod_unita_locale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AMMINISTRATORI] ([codice_fiscale_impresa], [data_inizio_incarico], [cod_cliente], [data_fine_incarico]) VALUES (N'39384224839', CAST(N'2012-03-10' AS Date), 2, NULL)
INSERT [dbo].[ASSOCIAZIONE_SOCI] ([codice_fiscale_impresa], [cod_cliente], [quota], [precentuale]) VALUES (N'39384224839', 4, 100, NULL)
INSERT [dbo].[ASSOCIAZIONE_SOCI] ([codice_fiscale_impresa], [cod_cliente], [quota], [precentuale]) VALUES (N'39384224839', 7, NULL, 100)
INSERT [dbo].[ASSOCIAZIONE_SOCI] ([codice_fiscale_impresa], [cod_cliente], [quota], [precentuale]) VALUES (N'28182838949', 8, 40, NULL)
INSERT [dbo].[ASSOCIAZIONE_SOCI] ([codice_fiscale_impresa], [cod_cliente], [quota], [precentuale]) VALUES (N'28182838949', 9, 40, NULL)
INSERT [dbo].[ASSOCIAZIONE_SOCI] ([codice_fiscale_impresa], [cod_cliente], [quota], [precentuale]) VALUES (N'28182838949', 10, 20, NULL)
INSERT [dbo].[BILANCI] ([data_approvazione], [cod_bilancio], [codice_fiscale_impresa], [data_chiusura], [periodicita]) VALUES (CAST(N'2018-10-10' AS Date), N'1', N'39384224839', CAST(N'2019-12-31' AS Date), N'annua')
INSERT [dbo].[BILANCI] ([data_approvazione], [cod_bilancio], [codice_fiscale_impresa], [data_chiusura], [periodicita]) VALUES (CAST(N'2018-03-03' AS Date), N'2', N'28182838949', CAST(N'2019-12-31' AS Date), N'annua')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'ALESSANDRO ', N'GARAVINI', N'ITALIANA', 1, N'GRVLSN98H08D704Q', CAST(N'1998-06-08' AS Date), N'FORLI', 3333932221, N'FORLI')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'TOMMASO', N'LORENZETTI', N'ITALIANA', 2, N'LRNTMS90P30C573X', CAST(N'1990-09-30' AS Date), N'CESENA', 3316034152, N'CESENA')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'MATTIA', N'BASSI', N'ITALIANA', 3, N'BSSMTT94D26D704X', CAST(N'1994-04-26' AS Date), N'FORLI', 3342387541, N'FORLI')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'RICCARDO', N'LOMBARDI', N'ITALIANA', 4, N'LMBRCR86P08D458I', CAST(N'1986-09-08' AS Date), N'FAENZA', 3464090007, N'FAENZA')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'PIERERMINIO', N'CARUSO', N'ITALIANA', 5, N'CRSPRM10B05C351S', CAST(N'1992-02-05' AS Date), N'CATANIA', 3316030002, N'RIMINI')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'SOFIA', N'PLAZZI', N'ITALIANA', 6, N'PLZSFO77A41D704K', CAST(N'1977-01-01' AS Date), N'FORLI', 3330453913, N'FORLI')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'NICOL', N'CASADIO', N'ITALIANA', 7, N'CSDNCL00B21D704N', CAST(N'2000-02-21' AS Date), N'FORLI', 3345859405, N'FORLI')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'ANDREA', N'TASSANI', N'ITALIANA', 8, N'TSSNDR67D18D704D', CAST(N'1967-04-19' AS Date), N'FORLI', 3397832564, N'FORLI')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'LUCIA', N'STERNINI', N'ITALIANA', 9, N'STRLCU98L10D704J', CAST(N'1998-07-10' AS Date), N'FORLI', 3354569826, N'FORLI')
INSERT [dbo].[CLIENTI] ([nome], [cognome], [nazionalita], [cod_cliente], [cod_fiscale], [data_nascita], [luogo_nascita], [numero_telefono], [domicilio_fiscale]) VALUES (N'FABIO', N'SCOGNAMIGLIO', N'ITALIANA', 10, N'SCGFBA90C12F839K', CAST(N'1990-03-12' AS Date), N'NAPOLI', 33345958427, N'FORLI')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (1, CAST(N'2017-02-03' AS Date), NULL, N'1')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (2, CAST(N'2019-02-21' AS Date), NULL, N'1')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (3, CAST(N'2016-06-20' AS Date), NULL, N'1')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (4, CAST(N'2019-05-12' AS Date), NULL, N'1')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (5, CAST(N'2017-05-21' AS Date), NULL, N'2')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (6, CAST(N'2018-04-01' AS Date), NULL, N'2')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (7, CAST(N'2018-12-01' AS Date), NULL, N'1')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (8, CAST(N'2019-03-03' AS Date), NULL, N'2')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (9, CAST(N'2019-03-03' AS Date), NULL, N'2')
INSERT [dbo].[CLIENTI_SEGUITI] ([cod_cliente], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (10, CAST(N'2019-03-03' AS Date), NULL, N'2')
INSERT [dbo].[DATI_PIATTAFORMA_IMPRESE] ([codice_fiscale_impresa], [nome_utente], [password], [cod_piattaforma]) VALUES (N'39384224839', N'ParadiseHotel', N'Passw123', N'2')
INSERT [dbo].[DELEGHE_ANNUE_CLIENTI] ([cod_cliente], [data_scadenza], [tipologia], [anno_sottoscrizione]) VALUES (1, CAST(N'2018-01-01' AS Date), N'cassetto fiscale', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[DELEGHE_ANNUE_CLIENTI] ([cod_cliente], [data_scadenza], [tipologia], [anno_sottoscrizione]) VALUES (1, CAST(N'2019-01-01' AS Date), N'cassetto fiscale', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[DELEGHE_ANNUE_CLIENTI] ([cod_cliente], [data_scadenza], [tipologia], [anno_sottoscrizione]) VALUES (1, CAST(N'2020-01-01' AS Date), N'cassetto fiscale', CAST(N'2019-01-01' AS Date))
INSERT [dbo].[DELEGHE_ANNUE_IMPRESE] ([codice_fiscale_impresa], [data_scadenza], [tipologia], [anno_sottoscrizione]) VALUES (N'28182838949', CAST(N'2020-01-01' AS Date), N'totale', CAST(N'2019-01-01' AS Date))
INSERT [dbo].[DELEGHE_ANNUE_IMPRESE] ([codice_fiscale_impresa], [data_scadenza], [tipologia], [anno_sottoscrizione]) VALUES (N'39384224839', CAST(N'2019-01-01' AS Date), N'totale', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[DELEGHE_ANNUE_IMPRESE] ([codice_fiscale_impresa], [data_scadenza], [tipologia], [anno_sottoscrizione]) VALUES (N'39384224839', CAST(N'2020-01-01' AS Date), N'totale', CAST(N'2019-01-01' AS Date))
INSERT [dbo].[DIPENDENTI_STUDIO] ([nome], [cognome], [cod_dipendente], [settore]) VALUES (N'Matteo', N'Ragazzini', N'1', N'commercio')
INSERT [dbo].[DIPENDENTI_STUDIO] ([nome], [cognome], [cod_dipendente], [settore]) VALUES (N'Marta', N'Spadoni', N'2', N'artigianato')
INSERT [dbo].[FABBRICATI] ([cod_propieta], [rendita_catastale], [rendita_rivalutata], [cod_tipologia_fabbricato]) VALUES (N'2', 10000, 12000, N'2')
INSERT [dbo].[FABBRICATI] ([cod_propieta], [rendita_catastale], [rendita_rivalutata], [cod_tipologia_fabbricato]) VALUES (N'3', 25000, 26000, N'4')
INSERT [dbo].[FABBRICATI] ([cod_propieta], [rendita_catastale], [rendita_rivalutata], [cod_tipologia_fabbricato]) VALUES (N'4', 150000, 175000, N'1')
INSERT [dbo].[IMPRESE] ([cod_identificativo], [sigla], [nazionalita], [sede], [domicilio_fiscale], [data_inizio_attività], [codice_fiscale_impresa], [cod_attivita], [metodo_gestione_fatturazione], [periodicita_iva], [metodo_conteggio], [cod_tipologia]) VALUES (2, N'SunsetBeach', N'italiana', N'Cervia', N'Cervia', CAST(N'2019-04-10' AS Date), N'28182838949', N'24FB', N'delegato', NULL, N'NULL ', N'2')
INSERT [dbo].[IMPRESE] ([cod_identificativo], [sigla], [nazionalita], [sede], [domicilio_fiscale], [data_inizio_attività], [codice_fiscale_impresa], [cod_attivita], [metodo_gestione_fatturazione], [periodicita_iva], [metodo_conteggio], [cod_tipologia]) VALUES (3, N'Paradise', N'italiana', N'Forlì', N'Forlì', CAST(N'2018-05-10' AS Date), N'39384224839', N'12TA', N'misto', N'trimestrale', N'per cassa', N'2')
INSERT [dbo].[IMPRESE] ([cod_identificativo], [sigla], [nazionalita], [sede], [domicilio_fiscale], [data_inizio_attività], [codice_fiscale_impresa], [cod_attivita], [metodo_gestione_fatturazione], [periodicita_iva], [metodo_conteggio], [cod_tipologia]) VALUES (1, N'Glass', N'italiana', N'Forlì', N'Forlì', CAST(N'2019-07-08' AS Date), N'GRVLSN98H08D704Q', N'1A32', NULL, NULL, NULL, N'1')
INSERT [dbo].[IMPRESE_SEGUITE] ([codice_fiscale_impresa], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (N'28182838949', CAST(N'2019-04-10' AS Date), NULL, N'2')
INSERT [dbo].[IMPRESE_SEGUITE] ([codice_fiscale_impresa], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (N'39384224839', CAST(N'2018-05-10' AS Date), NULL, N'1')
INSERT [dbo].[IMPRESE_SEGUITE] ([codice_fiscale_impresa], [data_inizio_gestione], [data_fine_gestione], [cod_dipendente]) VALUES (N'GRVLSN98H08D704Q', CAST(N'2019-07-08' AS Date), NULL, N'1')
INSERT [dbo].[LIBERI_PROFESSIONISTI] ([cod_cliente], [professione], [tipologia_gestione_contribuzione], [tipo_contribuzione], [metodo_gestione_fatturazione], [periodicita_iva], [metodo_conteggio_iva], [cod_tipologia]) VALUES (3, N'idraulico', N'gestione separata', N'ridotta', N'autonomo', N'annuale', N'per cassa', N'2')
INSERT [dbo].[LIBERI_PROFESSIONISTI] ([cod_cliente], [professione], [tipologia_gestione_contribuzione], [tipo_contribuzione], [metodo_gestione_fatturazione], [periodicita_iva], [metodo_conteggio_iva], [cod_tipologia]) VALUES (6, N'avvocato', N'iscritto all''albo', N'piena', N'delegato', N'trimestrale ', N'analitico', N'3')
INSERT [dbo].[PIATTAFORME] ([cod_piattaforma]) VALUES (N'1')
INSERT [dbo].[PIATTAFORME] ([cod_piattaforma]) VALUES (N'2')
INSERT [dbo].[PROPRIETA] ([via], [civico], [comune], [CAP], [valore_IMU], [cod_propieta], [sezione], [foglio], [particella], [subalterno], [classe], [cod_cliente]) VALUES (N'Pietro Landi', 20, N'Forlì', 47121, 150000, N'1', N'190', N'23', N'3', N'1', N'3', 10)
INSERT [dbo].[PROPRIETA] ([via], [civico], [comune], [CAP], [valore_IMU], [cod_propieta], [sezione], [foglio], [particella], [subalterno], [classe], [cod_cliente]) VALUES (N'Ca Rossa', 3, N'Forlì', 47121, 50000, N'2', N'45', N'12', N'5', N'3', N'7', 6)
INSERT [dbo].[PROPRIETA] ([via], [civico], [comune], [CAP], [valore_IMU], [cod_propieta], [sezione], [foglio], [particella], [subalterno], [classe], [cod_cliente]) VALUES (N'del Partigiano', 190, N'Forlì', 47121, 10000, N'3', N'6', N'8', N'2', N'1', N'4', 3)
INSERT [dbo].[PROPRIETA] ([via], [civico], [comune], [CAP], [valore_IMU], [cod_propieta], [sezione], [foglio], [particella], [subalterno], [classe], [cod_cliente]) VALUES (N'Fornarina', 14, N'Forlì', 47121, 120000, N'4', N'3', N'12', N'9', N'3', N'3', 9)
INSERT [dbo].[REGIMI_CONTABILE] ([descizione], [cod_tipologia]) VALUES (N'forfettario', N'1')
INSERT [dbo].[REGIMI_CONTABILE] ([descizione], [cod_tipologia]) VALUES (N'ordinario', N'2')
INSERT [dbo].[REGIMI_CONTABILE] ([descizione], [cod_tipologia]) VALUES (N'semplificato', N'3')
INSERT [dbo].[SOCI] ([cod_cliente], [data_affiliazione], [tipologia_socio]) VALUES (4, CAST(N'2018-05-10' AS Date), N'capitale')
INSERT [dbo].[SOCI] ([cod_cliente], [data_affiliazione], [tipologia_socio]) VALUES (7, CAST(N'2018-05-10' AS Date), N'lavoro')
INSERT [dbo].[SOCI] ([cod_cliente], [data_affiliazione], [tipologia_socio]) VALUES (8, CAST(N'2019-03-03' AS Date), N'capitale')
INSERT [dbo].[SOCI] ([cod_cliente], [data_affiliazione], [tipologia_socio]) VALUES (9, CAST(N'2019-03-03' AS Date), N'capitale')
INSERT [dbo].[SOCI] ([cod_cliente], [data_affiliazione], [tipologia_socio]) VALUES (10, CAST(N'2019-03-03' AS Date), N'capitale')
INSERT [dbo].[SOCIETA] ([codice_fiscale_impresa], [sigla_tipologia], [capitale_sociale], [numero_reg_imprese], [descrizione_tipologia]) VALUES (N'28182838949', N'Snc', 500000, N'32479123', N'mista')
INSERT [dbo].[SOCIETA] ([codice_fiscale_impresa], [sigla_tipologia], [capitale_sociale], [numero_reg_imprese], [descrizione_tipologia]) VALUES (N'39384224839', N'Srl', 1.2E+07, N'11145789', N'capitale')
INSERT [dbo].[TERRENI] ([cod_propieta], [qualita], [rendita_dominicale_catastale], [rendita_dominicale_rivalutata], [rendita_agraria_catastale], [rendita_agraria_rivalutata], [cod_tipologia_terreno]) VALUES (N'1', N'erboreo', 12000, N'5000', N'3000', N'7000', N'2')
INSERT [dbo].[TIPI_FABBRICATI] ([tipologia_fabbricato], [cod_tipologia_fabbricato]) VALUES (N'abitazione popolare', N'1')
INSERT [dbo].[TIPI_FABBRICATI] ([tipologia_fabbricato], [cod_tipologia_fabbricato]) VALUES (N'abitazione civile', N'2')
INSERT [dbo].[TIPI_FABBRICATI] ([tipologia_fabbricato], [cod_tipologia_fabbricato]) VALUES (N'ufficio o studio', N'3')
INSERT [dbo].[TIPI_FABBRICATI] ([tipologia_fabbricato], [cod_tipologia_fabbricato]) VALUES (N'magazzino', N'4')
INSERT [dbo].[TIPI_TERRENI] ([tipologia_terreno], [cod_tipologia_terreno]) VALUES (N'agricolo', N'1')
INSERT [dbo].[TIPI_TERRENI] ([tipologia_terreno], [cod_tipologia_terreno]) VALUES (N'incolto', N'2')
INSERT [dbo].[TIPI_TERRENI] ([tipologia_terreno], [cod_tipologia_terreno]) VALUES (N'edificabile', N'3')
INSERT [dbo].[TITOLARI] ([cod_cliente], [partita_iva]) VALUES (1, N'GRVLSN98H08D704Q')
/****** Object:  Index [IDAMMINISTRATORE_1_1]    Script Date: 09/07/2019 23:13:19 ******/
ALTER TABLE [dbo].[AMMINISTRATORI] ADD  CONSTRAINT [IDAMMINISTRATORE_1_1] UNIQUE NONCLUSTERED 
(
	[cod_cliente] ASC,
	[data_inizio_incarico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FKREDAZIONE_ID]    Script Date: 09/07/2019 23:13:19 ******/
ALTER TABLE [dbo].[BILANCI] ADD  CONSTRAINT [FKREDAZIONE_ID] UNIQUE NONCLUSTERED 
(
	[codice_fiscale_impresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDCLIENTE_1]    Script Date: 09/07/2019 23:13:19 ******/
ALTER TABLE [dbo].[CLIENTI] ADD  CONSTRAINT [IDCLIENTE_1] UNIQUE NONCLUSTERED 
(
	[cod_fiscale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDIMPRESA]    Script Date: 09/07/2019 23:13:19 ******/
ALTER TABLE [dbo].[IMPRESE] ADD  CONSTRAINT [IDIMPRESA] UNIQUE NONCLUSTERED 
(
	[cod_identificativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FKIDENTIFICAZIONE]    Script Date: 09/07/2019 23:13:19 ******/
ALTER TABLE [dbo].[PROPRIETA] ADD  CONSTRAINT [FKIDENTIFICAZIONE] UNIQUE NONCLUSTERED 
(
	[sezione] ASC,
	[foglio] ASC,
	[particella] ASC,
	[subalterno] ASC,
	[classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDSOCIETÀ]    Script Date: 09/07/2019 23:13:19 ******/
ALTER TABLE [dbo].[SOCIETA] ADD  CONSTRAINT [IDSOCIETÀ] UNIQUE NONCLUSTERED 
(
	[numero_reg_imprese] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDTITOLARE]    Script Date: 09/07/2019 23:13:19 ******/
ALTER TABLE [dbo].[TITOLARI] ADD  CONSTRAINT [IDTITOLARE] UNIQUE NONCLUSTERED 
(
	[partita_iva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AMMINISTRATORI]  WITH CHECK ADD  CONSTRAINT [FKAMMINISTRA] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[SOCIETA] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[AMMINISTRATORI] CHECK CONSTRAINT [FKAMMINISTRA]
GO
ALTER TABLE [dbo].[AMMINISTRATORI]  WITH CHECK ADD  CONSTRAINT [FKINCARICO] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[AMMINISTRATORI] CHECK CONSTRAINT [FKINCARICO]
GO
ALTER TABLE [dbo].[ASSOCIAZIONE_SOCI]  WITH CHECK ADD  CONSTRAINT [FKASS_SOC] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[SOCIETA] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[ASSOCIAZIONE_SOCI] CHECK CONSTRAINT [FKASS_SOC]
GO
ALTER TABLE [dbo].[ASSOCIAZIONE_SOCI]  WITH CHECK ADD  CONSTRAINT [FKASS_SOC_1] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[SOCI] ([cod_cliente])
GO
ALTER TABLE [dbo].[ASSOCIAZIONE_SOCI] CHECK CONSTRAINT [FKASS_SOC_1]
GO
ALTER TABLE [dbo].[BILANCI]  WITH CHECK ADD  CONSTRAINT [FKREDAZIONE_FK] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[SOCIETA] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[BILANCI] CHECK CONSTRAINT [FKREDAZIONE_FK]
GO
ALTER TABLE [dbo].[CLIENTI_SEGUITI]  WITH CHECK ADD  CONSTRAINT [FKGESTIONE_CLIENTE] FOREIGN KEY([cod_dipendente])
REFERENCES [dbo].[DIPENDENTI_STUDIO] ([cod_dipendente])
GO
ALTER TABLE [dbo].[CLIENTI_SEGUITI] CHECK CONSTRAINT [FKGESTIONE_CLIENTE]
GO
ALTER TABLE [dbo].[CLIENTI_SEGUITI]  WITH CHECK ADD  CONSTRAINT [FKRICHIESTA_GESTIONE] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[CLIENTI_SEGUITI] CHECK CONSTRAINT [FKRICHIESTA_GESTIONE]
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_IMPRESE]  WITH CHECK ADD  CONSTRAINT [FKADO_DAT] FOREIGN KEY([cod_piattaforma])
REFERENCES [dbo].[PIATTAFORME] ([cod_piattaforma])
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_IMPRESE] CHECK CONSTRAINT [FKADO_DAT]
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_IMPRESE]  WITH CHECK ADD  CONSTRAINT [FKADO_IMP_FK] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[IMPRESE] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_IMPRESE] CHECK CONSTRAINT [FKADO_IMP_FK]
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_LIB_PROF]  WITH CHECK ADD  CONSTRAINT [FKSCE_LIB_FK] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[LIBERI_PROFESSIONISTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_LIB_PROF] CHECK CONSTRAINT [FKSCE_LIB_FK]
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_LIB_PROF]  WITH CHECK ADD  CONSTRAINT [FKSCE_PIA] FOREIGN KEY([cod_piattaforma])
REFERENCES [dbo].[PIATTAFORME] ([cod_piattaforma])
GO
ALTER TABLE [dbo].[DATI_PIATTAFORMA_LIB_PROF] CHECK CONSTRAINT [FKSCE_PIA]
GO
ALTER TABLE [dbo].[DELEGHE_ANNUE_CLIENTI]  WITH CHECK ADD  CONSTRAINT [FKCONCESSIONE] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[DELEGHE_ANNUE_CLIENTI] CHECK CONSTRAINT [FKCONCESSIONE]
GO
ALTER TABLE [dbo].[DELEGHE_ANNUE_IMPRESE]  WITH CHECK ADD  CONSTRAINT [FKSOTTOSCRIZIONE] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[IMPRESE] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[DELEGHE_ANNUE_IMPRESE] CHECK CONSTRAINT [FKSOTTOSCRIZIONE]
GO
ALTER TABLE [dbo].[DIRIGENZA_DITTE]  WITH CHECK ADD  CONSTRAINT [FKDIR_IMP_FK] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[IMPRESE] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[DIRIGENZA_DITTE] CHECK CONSTRAINT [FKDIR_IMP_FK]
GO
ALTER TABLE [dbo].[DIRIGENZA_DITTE]  WITH CHECK ADD  CONSTRAINT [FKDIR_TIT] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[TITOLARI] ([cod_cliente])
GO
ALTER TABLE [dbo].[DIRIGENZA_DITTE] CHECK CONSTRAINT [FKDIR_TIT]
GO
ALTER TABLE [dbo].[FABBRICATI]  WITH CHECK ADD  CONSTRAINT [FKATTINENZA] FOREIGN KEY([cod_tipologia_fabbricato])
REFERENCES [dbo].[TIPI_FABBRICATI] ([cod_tipologia_fabbricato])
GO
ALTER TABLE [dbo].[FABBRICATI] CHECK CONSTRAINT [FKATTINENZA]
GO
ALTER TABLE [dbo].[FABBRICATI]  WITH CHECK ADD  CONSTRAINT [FKREGISTRAZIONE_FABBRICATO_FK] FOREIGN KEY([cod_propieta])
REFERENCES [dbo].[PROPRIETA] ([cod_propieta])
GO
ALTER TABLE [dbo].[FABBRICATI] CHECK CONSTRAINT [FKREGISTRAZIONE_FABBRICATO_FK]
GO
ALTER TABLE [dbo].[IMPRESE]  WITH CHECK ADD  CONSTRAINT [FKSELEZIONE] FOREIGN KEY([cod_tipologia])
REFERENCES [dbo].[REGIMI_CONTABILE] ([cod_tipologia])
GO
ALTER TABLE [dbo].[IMPRESE] CHECK CONSTRAINT [FKSELEZIONE]
GO
ALTER TABLE [dbo].[IMPRESE_SEGUITE]  WITH CHECK ADD  CONSTRAINT [FKGESTIONE_IMPRESA] FOREIGN KEY([cod_dipendente])
REFERENCES [dbo].[DIPENDENTI_STUDIO] ([cod_dipendente])
GO
ALTER TABLE [dbo].[IMPRESE_SEGUITE] CHECK CONSTRAINT [FKGESTIONE_IMPRESA]
GO
ALTER TABLE [dbo].[IMPRESE_SEGUITE]  WITH CHECK ADD  CONSTRAINT [FKRICHIESTA_GESTIONE_IMPRESE] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[IMPRESE] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[IMPRESE_SEGUITE] CHECK CONSTRAINT [FKRICHIESTA_GESTIONE_IMPRESE]
GO
ALTER TABLE [dbo].[LIBERI_PROFESSIONISTI]  WITH CHECK ADD  CONSTRAINT [FKDECISIONE] FOREIGN KEY([cod_tipologia])
REFERENCES [dbo].[REGIMI_CONTABILE] ([cod_tipologia])
GO
ALTER TABLE [dbo].[LIBERI_PROFESSIONISTI] CHECK CONSTRAINT [FKDECISIONE]
GO
ALTER TABLE [dbo].[LIBERI_PROFESSIONISTI]  WITH CHECK ADD  CONSTRAINT [FKREGISTRAZIONE_LIBERO_PROF_FK] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[LIBERI_PROFESSIONISTI] CHECK CONSTRAINT [FKREGISTRAZIONE_LIBERO_PROF_FK]
GO
ALTER TABLE [dbo].[PROPRIETA]  WITH CHECK ADD  CONSTRAINT [FKPOSSESSO] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[PROPRIETA] CHECK CONSTRAINT [FKPOSSESSO]
GO
ALTER TABLE [dbo].[SOCI]  WITH CHECK ADD  CONSTRAINT [FKREGISTRAZIONE_SOCIO_FK] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[SOCI] CHECK CONSTRAINT [FKREGISTRAZIONE_SOCIO_FK]
GO
ALTER TABLE [dbo].[SOCIETA]  WITH CHECK ADD  CONSTRAINT [FKPUO_ESSERE_FK] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[IMPRESE] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[SOCIETA] CHECK CONSTRAINT [FKPUO_ESSERE_FK]
GO
ALTER TABLE [dbo].[TERRENI]  WITH CHECK ADD  CONSTRAINT [FKAPPARTENENZA] FOREIGN KEY([cod_tipologia_terreno])
REFERENCES [dbo].[TIPI_TERRENI] ([cod_tipologia_terreno])
GO
ALTER TABLE [dbo].[TERRENI] CHECK CONSTRAINT [FKAPPARTENENZA]
GO
ALTER TABLE [dbo].[TERRENI]  WITH CHECK ADD  CONSTRAINT [FKREGISTRAZIONE_TERRENO_FK] FOREIGN KEY([cod_propieta])
REFERENCES [dbo].[PROPRIETA] ([cod_propieta])
GO
ALTER TABLE [dbo].[TERRENI] CHECK CONSTRAINT [FKREGISTRAZIONE_TERRENO_FK]
GO
ALTER TABLE [dbo].[TITOLARI]  WITH CHECK ADD  CONSTRAINT [FKREGISTRAZIONE_TITOLARE_FK] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[CLIENTI] ([cod_cliente])
GO
ALTER TABLE [dbo].[TITOLARI] CHECK CONSTRAINT [FKREGISTRAZIONE_TITOLARE_FK]
GO
ALTER TABLE [dbo].[UNITA_LOCALI]  WITH CHECK ADD  CONSTRAINT [FKDISLOCAZIONE] FOREIGN KEY([codice_fiscale_impresa])
REFERENCES [dbo].[IMPRESE] ([codice_fiscale_impresa])
GO
ALTER TABLE [dbo].[UNITA_LOCALI] CHECK CONSTRAINT [FKDISLOCAZIONE]
GO
