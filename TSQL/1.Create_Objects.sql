CREATE TABLE [Staging].[MIS](
	[School_Code] [varchar](50) NOT NULL
	,[Supplier] [varchar](50) NOT NULL
	,[Year] [int] NOT NULL
)
GO


CREATE TABLE [dbo].[Contract](
	[Contract_ID] [varchar](10) NOT NULL PRIMARY KEY
	,[Contract_Name] [varchar](50) NOT NULL
	,[Contract_URL] [varchar](100) NOT NULL
)
GO

INSERT [dbo].[Contract] ([Contract_ID], [Contract_Name], [Contract_URL]) VALUES (N'RM1500', N'Information Management and Learning Services', N'http://ccs-agreements.cabinetoffice.gov.uk/contracts/rm1500')
GO

CREATE TABLE [dbo].[Company](
	[Company_Name] [varchar](50) NOT NULL
	,[Company_FriendlyName] [varchar](30) NOT NULL
	,[Company_DUNS] [varchar](10) NOT NULL
	,[Company_URL] [varchar](50) NOT NULL
	,[Company_Telephone] [char](11) NOT NULL
	,[IsOnDigitalMarket] [bit] NOT NULL
	,[Company_VAT] [int] NOT NULL
	,[Company_Reg] [int] NOT NULL
	,[Company_DataProtectionNo] [varchar](15) NOT NULL
)
GO

INSERT [dbo].[Company] ([Company_Name], [Company_FriendlyName], [Company_DUNS], [Company_URL], [Company_Telephone], [IsOnDigitalMarket], [Company_VAT], [Company_Reg], [Company_DataProtectionNo]) VALUES
	(N'Bromcom Computers Plc', N'Bromcom', N'298225376', N'http://www.bromcom.com/', N'02082907171', 0, 474602347, 2040690, N'Z5660020')
	,(N'Capita Business Services Ltd ', N'SIMS .net', N'500191747', N'http://www.capita-sims.co.uk/', N'08001707005', 0, 0, 0, N'Z6674638')
	,(N'Histon House Ltd', N'ScholarPack', N'217066555', N'http://www.scholarpack.com/', N'01522716048', 0, 103860147, 7319617, N'Z2336352')
	,(N'Novatia plc', N'', N'233172266', N'http://www.novatia.com/', N'01962832632', 0, 0, 0, N'Z2485308')
	,(N'RM Education plc', N'', N'217158708', N'http://www.rmeducation.com/', N'08450700300', 0, 0, 0, N'Z3473738')
	,(N'Tribal Education', N'', N'221095768', N'http://www.tribalgroup.com/', N'08451236001', 0, 0, 4128850, N'Z5584105')
	,(N'Wauton Samuel', N'', N'217886177', N'http://www.wautonsamuel.co.uk/', N'02083181700', 0, 0, 0, N'ZA020696')
GO
