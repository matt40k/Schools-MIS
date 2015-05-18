CREATE TABLE [Staging].[MIS](
	[School_Code] [varchar](50) NOT NULL
	,[Supplier] [varchar](50) NOT NULL
	,[Year] [int] NOT NULL
)
GO

IF ((select count(1) from sys.tables where name='Contract' and schema_name(schema_id) = 'dbo') > 0)
	DROP TABLE [dbo].[Contract]
GO
CREATE TABLE [dbo].[Contract](
	[Contract_ID] [varchar](10) NOT NULL PRIMARY KEY
	,[Contract_Name] [varchar](50) NOT NULL
	,[Contract_URL] [varchar](100) NOT NULL
)
GO

INSERT [dbo].[Contract] ([Contract_ID], [Contract_Name], [Contract_URL]) VALUES (N'RM1500', N'Information Management and Learning Services', N'http://ccs-agreements.cabinetoffice.gov.uk/contracts/rm1500')
GO

IF ((select count(1) from sys.tables where name='Company' and schema_name(schema_id) = 'dbo') > 0)
	DROP TABLE [dbo].[Company]
GO
CREATE TABLE [dbo].[Company](
	[Company_Key] [int] identity(0,1) NOT NULL PRIMARY KEY
	,[Company_Name] [varchar](50) NOT NULL
	,[Company_FriendlyName] [varchar](30) NOT NULL
	,[Company_DUNS] [varchar](10) NOT NULL
	,[Company_URL] [varchar](50) NOT NULL
	,[Company_Telephone] [char](11) NOT NULL
	,[IsOnDigitalMarket] [bit] NOT NULL
	,[Company_VAT] [int] NOT NULL
	,[Company_Reg] [int] NOT NULL
	,[Company_DataProtectionNo] [varchar](15) NOT NULL
	,[Company_Questionnaire_Completed] [bit] NOT NULL
	,[Company_Questionnaire_URL] [varchar](50) NOT NULL
	,[Company_Incorporation] [date] NULL
	,[Company_OpenData_URL] [varchar](50) NULL
)
GO

INSERT [dbo].[Company] (
	[Company_Name],						[Company_FriendlyName],		[Company_DUNS],	[Company_URL],						[Company_Telephone],	[IsOnDigitalMarket],	[Company_VAT],	[Company_Reg],	[Company_DataProtectionNo],	[Company_Questionnaire_Completed], [Company_Questionnaire_URL],					[Company_Incorporation],	[Company_OpenData_URL]
) VALUES
	(N'Unknown\Other',					'Other',					0,				'',									'',						0,						0,				0,				N'',						0,									N'http://eduwarenetwork.com/',				null,						null)
	,(N'Bromcom Computers Plc',			N'Bromcom',					N'298225376',	N'http://www.bromcom.com/',			N'02082907171',			1,						474602347,		2040690,		N'Z5660020',				1,									N'http://eduwarenetwork.com/bromcom/',		'1986-07-24',				'https://opencorporates.com/companies/gb/02040690')
	,(N'Capita Business Services Ltd',	N'SIMS .net',				N'500191747',	N'http://www.capita-sims.co.uk/',	N'08001707005',			0,						618184140,		2299747,		N'Z6674638',				0,									N'http://eduwarenetwork.com/capita/',		'1988-09-26',				'https://opencorporates.com/companies/gb/02299747')
	,(N'Histon House Ltd',				N'ScholarPack',				N'217066555',	N'http://www.scholarpack.com/',		N'01522716048',			0,						103860147,		7319617,		N'Z2336352',				1,									N'http://eduwarenetwork.com/scholarpack/',	'2010-07-20',				'https://opencorporates.com/companies/gb/07319617')
	,(N'Novatia Plc',					N'',						N'233172266',	N'http://www.novatia.com/',			N'01962832632',			0,						807166923,		4656812,		N'Z2485308',				0,									N'http://eduwarenetwork.com/',				'2003-02-05',				'https://opencorporates.com/companies/gb/04656812')
	,(N'RM Education Ltd',				N'Integris G2',				N'217158708',	N'http://www.rmeducation.com/',		N'08450700300',			1,						630823656,		1148594,		N'Z3473738',				0,									N'http://eduwarenetwork.com/rm/',			'1973-11-30',				'https://opencorporates.com/companies/gb/01148594')
	,(N'Tribal Education Plc',			N'Synergy',					N'221095768',	N'http://www.tribalgroup.com/',		N'08451236001',			1,						0,				4128850,		N'Z5584105',				0,									N'http://eduwarenetwork.com/tribal/',		'2000-12-15',				'https://opencorporates.com/companies/gb/04128850')
	,(N'Wauton Samuel',					N'PASAPP',					N'217886177',	N'http://www.wautonsamuel.co.uk/',	N'02083181700',			0,						0,				0,				N'ZA020696',				0,									N'http://eduwarenetwork.com/wauton_samuel/',null,						null)
GO

IF ((select count(1) from sys.views where name='vw_Companies' and schema_name(schema_id) = 'dbo') > 0)
	DROP VIEW [dbo].[vw_Companies]
GO
CREATE VIEW [dbo].[vw_Companies]
AS
select
	[Company_Key]
	,[Company_Name]
	,[Company_FriendlyName]
	,[Company_DUNS]
	,[Company_URL]
	,[Company_Telephone] = case
		when (company_telephone like '08%') then substring(company_telephone, 1,4) + ' ' + substring(company_telephone, 5,7)
		else substring(company_telephone,1,5) + ' ' + substring(company_telephone,6,6)
	end
	,[IsOnDigitalMarket] 
	,[Company_VAT]
	,[Company_Reg]
	,[Company_DataProtectionNo]
	,[Company_Questionnaire_Completed]
	,[Company_Questionnaire_URL]
	,[Company_Incorporation]
	,[Company_OpenData_URL] 
from
	[dbo].[Company]
GO