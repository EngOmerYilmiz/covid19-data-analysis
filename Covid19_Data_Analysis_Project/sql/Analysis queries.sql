-- 1. Preview the deaths table and explore the data
SELECT *
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY location, date;

-- 2. Total cases vs total deaths & death percentage calculation
SELECT
location,
date,
total_cases,
total_deaths,
Round(cast(total_deaths As float)/cast( total_cases As float) *100,2) As death_percentage
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY location, date;

-- 3. Countries with highest infection percentage
SELECT
location,
population,
MAX(total_cases) AS highest_infection_count,
Round(cast(MAX(total_cases*0.1 / NULLIF(population*.1,0)*100) as float),2)  AS percent_population_infected
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY percent_population_infected DESC;

-- 4. countries with the highest death count
SELECT
location,
MAX(total_deaths) AS total_death_count
FROM covid_deaths
where continent is not null
GROUP BY location
ORDER BY total_death_count DESC;

-- 5. Continents with the highest death count
SELECT
continent,
MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC;

-- 6. Global daily totals
-- Using CTEs to choose only data with no null values
with daily_death_percentage as(
SELECT
date,
SUM(new_cases) AS total_new_cases,
SUM(new_deaths) AS total_new_deaths,
Round(cast(SUM(new_deaths) As float)/cast(SUM(new_cases) As float) *100,2) As daily_death_percentage
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY date
)

SELECT
date,
total_new_cases,
total_new_deaths,
daily_death_percentage
FROM daily_death_percentage
GROUP BY date,daily_death_percentage,total_new_cases,
total_new_deaths
Having daily_death_percentage is not null
ORDER BY daily_death_percentage DESC



-- 7. Joining both deaths and vaccinations tables
SELECT
d.continent,
d.location,
d.date,
d.population,
v.new_vaccinations,
v.people_vaccinated
FROM covid_deaths d
JOIN covid_vaccinations v
ON d.location = v.location
AND d.date = v.date
WHERE d.continent IS NOT NULL And v.new_vaccinations IS NOT NULL
ORDER BY d.location, d.date;

-- 8. Rolling vaccination count
With vaccination_progress As (
SELECT
d.continent,
d.location,
d.date,
d.population,
v.new_vaccinations,
SUM(cast(v.new_vaccinations as int)) OVER (
    PARTITION BY d.location
    ORDER BY d.location, d.date
) AS rolling_people_vaccinated
FROM covid_deaths d
JOIN covid_vaccinations v
ON d.location = v.location
AND d.date = v.date
WHERE d.continent IS NOT NULL
)

-- 9. percentage of people vaccinated from the previous CTE

SELECT
*,
(rolling_people_vaccinated / NULLIF(population*0.01, 0))  AS vaccination_percentage
FROM vaccination_progress
Where new_vaccinations is not null
order by date;

--Creating views for dashboards
Create View PercentPopulationVaccinated as 
SELECT
d.continent,
d.location,
d.date,
d.population,
v.new_vaccinations,
SUM(cast(v.new_vaccinations as int)) OVER (
    PARTITION BY d.location
    ORDER BY d.location, d.date
) AS rolling_people_vaccinated
FROM covid_deaths d
JOIN covid_vaccinations v
ON d.location = v.location
AND d.date = v.date
WHERE d.continent IS NOT NULL


Select *
From PercentPopulationVaccinated
