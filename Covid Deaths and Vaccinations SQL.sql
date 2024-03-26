--SELECT * 
--FROM CovidDeaths$


--SELECT *
--FROM CovidVaccinations$

-- Select Data that we are going to be using

SELECT location, date, total_cases_per_million, new_cases, total_deaths, population
FROM CovidDeaths$
ORDER BY 1, 2


-- Looking at Total Cases vs Total Deaths
-- Showing the likelihood of dying if you contract Covid in your country

SELECT location, date, total_cases_per_million, total_deaths, (total_deaths/total_cases_per_million)*100 AS DeathPercentage
FROM CovidDeaths$
WHERE location like '%states%'
and continent is not null
ORDER BY 1, 2


-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid

SELECT location, date, population, total_cases_per_million, (total_cases_per_million/population)*100 AS PopulationCovid
FROM CovidDeaths$
-- WHERE location like '%states%'
ORDER BY 1, 2

-- Looking at countries with highest infection rate compared to population

SELECT location, MAX(total_cases_per_million) AS HighestInfectionCount, MAX(total_cases_per_million/population)*100 AS PopulationCovid
FROM CovidDeaths$
--WHERE location like '%states%'
GROUP BY Location, Population
ORDER BY 1, 2


--Showing the countries with the highest death count per population

SELECT location, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM CovidDeaths$
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount desc

CREATE View HighestDeath as
SELECT location, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM CovidDeaths$
WHERE continent is not null
GROUP BY Location
--ORDER BY TotalDeathCount desc


-- Breaking things by continent
-- Showing continents with the highest death count per population

SELECT location, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM CovidDeaths$
WHERE continent is null
GROUP BY location
ORDER BY TotalDeathCount desc


-- Global numbers

SELECT SUM(new_cases) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 AS DeathPercentage
FROM CovidDeaths$
--WHERE location like '%states%'
WHERE continent is not null
--GROUP BY date
ORDER BY 1, 2

CREATE View GlobalNumbers as
SELECT SUM(new_cases) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 AS DeathPercentage
FROM CovidDeaths$
--WHERE location like '%states%'
WHERE continent is not null
--GROUP BY date
--ORDER BY 1, 2


--Covid Vaccinations
-- Looking at Total Population vs Vaccinations

--USE CTE

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated
FROM CovidDeaths$ dea
Join CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
-- ORDER by 2, 3
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM PopvsVac


-- TEMP Table

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated
FROM CovidDeaths$ dea
Join CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
-- ORDER by 2, 3

SELECT *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int, vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated
FROM CovidDeaths$ dea
Join CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent is not null
--ORDER by 2, 3

SELECT *
FROM PercentPopulationVaccinated