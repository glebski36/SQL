/* Generic script for Date Dimension v0.9 */
CREATE TABLE [dbo].[Dim_Date]
(
	[SK_Date_ID] [bigint] IDENTITY(1,1) NOT NULL, -- potential anti-pattern
	[Date] [date] NOT NULL, -- '2020-03-26'
	[Day_Of_Week] AS (datepart(weekday,[Date])),
	[Date_Name] AS (format([Date],'yyyy/MM/dd')),
	[Day_Name_Of_Week] AS (datename(weekday,[Date])),
	[Day_Of_Month] AS (datepart(day,[Date])),
	[Day_Of_Year] AS (datepart(dayofyear,[Date])),
	[Weekday_Weekend] AS (case when datepart(weekday,[Date])=(7) OR datepart(weekday,[Date])=(6) then 'Weekend' else 'Weekday' end),
	[Week_Of_Year] AS (datepart(week,[Date])),
	[Week_Commencing_Date] AS (CONVERT([date],dateadd(week,datediff(week,(0),[date]),(0)),(0))),
	[Month_Name] AS (datename(month,[Date])),
	[Month_Of_Year] AS (datepart(month,[Date])),
	[Is_Last_Day_Of_Month] AS (case when [Date]=eomonth([Date]) then 'Y' else 'N' end),
	[Calendar_Quarter] AS (datepart(quarter,[Date])),
	[Calendar_Year] AS (datepart(year,[Date])),
	[Calendar_Year_Month] AS ((right('0'+CONVERT([varchar],datepart(month,[Date])),(2))+'-')+CONVERT([varchar],datename(year,[Date]))),
	[Calendar_Year_Quarter] AS ((CONVERT([varchar],datename(year,[Date]))+'Q')+CONVERT([varchar],datepart(quarter,[Date]))),
	[ISO_Date_Key] AS (CONVERT([int],concat(datepart(year,[Date]),right('0'+CONVERT([varchar],datepart(month,[Date])),(2)),right('0'+CONVERT([varchar],datepart(day,[Date])),(2))))),
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED ([date] ASC )WITH (DATA_COMPRESSION=PAGE, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
