CREATE TABLE [Staging].[MIS](
	[School_Code] [varchar](50) NOT NULL
	,[Supplier] [varchar](50) NOT NULL
	,[Year] [int] NOT NULL
)
GO

CREATE TABLE [Staging].[Edubase_Extract] (
	[Address3] varchar(50) NULL
	,[County (name)] varchar(50) NULL
	,[CloseDate] varchar(50) NULL
	,[EstablishmentName] varchar(100) NULL
	,[EstablishmentNumber] varchar(50) NULL
	,[OpenDate] varchar(50) NULL
	,[EstablishmentStatus (name)] varchar(50) NULL
	,[Gender (name)] varchar(50) NULL
	,[HeadFirstName] varchar(50) NULL
	,[HeadHonours] varchar(50) NULL
	,[HeadLastName] varchar(50) NULL
	,[HeadPreferredJobTitle] varchar(50) NULL
	,[HeadTitle (name)] varchar(50) NULL
	,[LastChangedDate] varchar(50) NULL
	,[LA (name)] varchar(50) NULL
	,[LA (code)] varchar(50) NULL
	,[Locality] varchar(50) NULL
	,[Postcode] varchar(50) NULL
	,[PreviousEstablishmentNumber] int NULL
	,[PreviousLA (name)] varchar(50) NULL
	,[PreviousLA (code)] int NULL
	,[ReasonEstablishmentClosed (name)] varchar(50) NULL
	,[ReasonEstablishmentOpened (name)] varchar(50) NULL
	,[StatutoryHighAge] int NULL
	,[StatutoryLowAge] int NULL
	,[Street] varchar(50) NULL
	,[TelephoneNum] varchar(50) NULL
	,[Town] varchar(50) NULL
	,[TypeOfEstablishment (name)] varchar(50) NULL
	,[UKPRN] int NULL
	,[URN] int NULL
	,[SchoolWebsite] varchar(100) NULL
	,[OfficialSixthForm (name)] varchar(50) NULL
	,[FEHEIdentifier] varchar(255) NULL
	,[FurtherEducationType (name)] varchar(50) NULL
	,[PhaseOfEducation (name)] varchar(50) NULL
	,[AdmissionsPolicy (name)] varchar(50) NULL
	,[Boarders (name)] varchar(50) NULL
	,[BoardingEstablishment (name)] varchar(50) NULL
	,[Diocese (name)] varchar(50) NULL
	,[OfstedLastInsp] varchar(50) NULL
	,[PercentageFSM] varchar(50) NULL
	,[ReligiousCharacter (name)] varchar(50) NULL
	,[SchoolCapacity] varchar(50) NULL
	,[Trusts (name)] varchar(100) NULL
	,[TrustSchoolFlag (name)] varchar(50) NULL
	,[Federations (name)] varchar(150) NULL
	,[FederationFlag (name)] varchar(25) NULL
	,[SchoolSponsors (name)] varchar(25) NULL
	,[SchoolSponsorFlag (name)] varchar(20) NULL
	,[GSSLACode (name)] varchar(10) NULL
	,[ASCHighestAge] int NULL
	,[ASCLowestAge] int NULL
	,[Boys2] int NULL
	,[Boys3] int NULL
	,[Boys4a] int NULL
	,[Boys4b] int NULL
	,[Boys4c] int NULL
	,[Boys5] int NULL
	,[Boys6] int NULL
	,[Boys7] int NULL
	,[Boys8] int NULL
	,[Boys9] int NULL
	,[Boys10] int NULL
	,[Boys11] int NULL
	,[Boys12] int NULL
	,[Boys13] int NULL
	,[Boys14] int NULL
	,[Boys15] int NULL
	,[Boys16] int NULL
	,[Boys17] int NULL
	,[Boys18] int NULL
	,[Boys19plus] int NULL
	,[CensusDate] date NULL
	,[Girls2andUnder] int NULL
	,[Girls3] int NULL
	,[Girls4a] int NULL
	,[Girls4b] int NULL
	,[Girls4c] int NULL
	,[Girls5] int NULL
	,[Girls6] int NULL
	,[Girls7] int NULL
	,[Girls8] int NULL
	,[Girls9] int NULL
	,[Girls10] int NULL
	,[Girls11] int NULL
	,[Girls12] int NULL
	,[Girls13] int NULL
	,[Girls14] int NULL
	,[Girls15] int NULL
	,[Girls16] int NULL
	,[Girls17] int NULL
	,[Girls18] int NULL
	,[Girls19plus] int NULL
	,[NumberOfBoys] int NULL
	,[NumberOfGirls] int NULL
	,[NumberOfPupils] int NULL
	,[AdministrativeWard (name)] varchar(60) NULL
	,[GOR (name)] varchar(50) NULL
	,[LSOA (name)] varchar(50) NULL
	,[MSOA (name)] varchar(50) NULL
	,[ParliamentaryConstituency (name)] varchar(50) NULL
	,[UrbanRural (name)] varchar(50) NULL
	,[Easting] int NULL
	,[Northing] int NULL
	,[OfstedSpecialMeasures (name)] varchar(50) NULL
	,[SpecialClasses (name)] varchar(50) NULL
	,[TeenMothPlaces] int NULL
	,[TeenMoth (name)] varchar(50) NULL
	,[CCF (name)] varchar(50) NULL
	,[FTProv (name)] varchar(50) NULL
	,[EdByOther (name)] varchar(50) NULL
	,[EBD (name)] varchar(50) NULL
	,[SENPRU (name)] varchar(50) NULL
	,[SEN1 (name)] varchar(300) NULL
	,[SEN2 (name)] varchar(330) NULL
	,[SEN3 (name)] varchar(75) NULL
	,[Section41Approved (name)] varchar(15) NULL
)
GO

CREATE TABLE [Staging].[Edubase_Links] (
	[URN] int NULL
	,[LinkURN] int NULL
	,[LinkName] varchar(150) NULL
	,[LinkType] varchar(65) NULL
	,[LinkEstablishedDate] date NULL
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

IF ((select count(1) from sys.views where name='vw_School' and schema_name(schema_id) = 'dbo') > 0)
	DROP VIEW [Staging].[vw_School]
GO
CREATE VIEW [Staging].[vw_School]
AS
select distinct
	LA_CODE=[la (code)]
	,LA_NAME=[la (name)]
	,SCH_CODE=establishmentnumber
	,SCH_NAME=establishmentname
	,SCH_POSTCODE=Postcode
	,SCH_Easting=Easting
	,SCH_Northing=Northing
from
	staging.edubase_extract