USE [covid19]
GO

/****** Object:  Table [dbo].[covid_deaths]    Script Date: 10/9/2026 3:40:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[covid_deaths](
	[iso_code] [nvarchar](255) NULL,
	[continent] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[population] [int] NULL,
	[total_cases] [int] NULL,
	[new_cases] [int] NULL,
	[new_cases_smoothed] [float] NULL,
	[total_deaths] [int] NULL,
	[new_deaths] [int] NULL,
	[new_deaths_smoothed] [float] NULL,
	[total_cases_per_million] [float] NULL,
	[new_cases_per_million] [float] NULL,
	[new_cases_smoothed_per_million] [float] NULL,
	[total_deaths_per_million] [float] NULL,
	[new_deaths_per_million] [float] NULL,
	[new_deaths_smoothed_per_million] [float] NULL,
	[reproduction_rate] [decimal](38, 0) NULL,
	[icu_patients] [int] NULL,
	[icu_patients_per_million] [float] NULL,
	[hosp_patients] [int] NULL,
	[hosp_patients_per_million] [float] NULL,
	[weekly_icu_admissions] [int] NULL,
	[weekly_icu_admissions_per_million] [float] NULL,
	[weekly_hosp_admissions] [int] NULL,
	[weekly_hosp_admissions_per_million] [float] NULL
) ON [PRIMARY]
GO


USE [covid19]
GO

/****** Object:  Table [dbo].[covid_vaccinations]    Script Date: 10/9/2026 3:41:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[covid_vaccinations](
	[iso_code] [nvarchar](255) NULL,
	[continent] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[new_tests] [nvarchar](255) NULL,
	[total_tests] [nvarchar](255) NULL,
	[total_tests_per_thousand] [nvarchar](255) NULL,
	[new_tests_per_thousand] [nvarchar](255) NULL,
	[new_tests_smoothed] [nvarchar](255) NULL,
	[new_tests_smoothed_per_thousand] [nvarchar](255) NULL,
	[positive_rate] [nvarchar](255) NULL,
	[tests_per_case] [nvarchar](255) NULL,
	[tests_units] [nvarchar](255) NULL,
	[total_vaccinations] [nvarchar](255) NULL,
	[people_vaccinated] [nvarchar](255) NULL,
	[people_fully_vaccinated] [nvarchar](255) NULL,
	[new_vaccinations] [nvarchar](255) NULL,
	[new_vaccinations_smoothed] [nvarchar](255) NULL,
	[total_vaccinations_per_hundred] [nvarchar](255) NULL,
	[people_vaccinated_per_hundred] [nvarchar](255) NULL,
	[people_fully_vaccinated_per_hundred] [nvarchar](255) NULL,
	[new_vaccinations_smoothed_per_million] [nvarchar](255) NULL,
	[stringency_index] [float] NULL,
	[population_density] [float] NULL,
	[median_age] [float] NULL,
	[aged_65_older] [float] NULL,
	[aged_70_older] [float] NULL,
	[gdp_per_capita] [float] NULL,
	[extreme_poverty] [nvarchar](255) NULL,
	[cardiovasc_death_rate] [float] NULL,
	[diabetes_prevalence] [float] NULL,
	[female_smokers] [nvarchar](255) NULL,
	[male_smokers] [nvarchar](255) NULL,
	[handwashing_facilities] [float] NULL,
	[hospital_beds_per_thousand] [float] NULL,
	[life_expectancy] [float] NULL,
	[human_development_index] [float] NULL
) ON [PRIMARY]
GO

