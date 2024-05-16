USE corona_virus;
SELECT * FROM corona_virus.`corona virus dataset`;
-- Q1. Write a code to check NULL values
SELECT 
    SUM(CASE WHEN `Province` IS NULL THEN 1 ELSE 0 END) AS missing_province,
    SUM(CASE WHEN `Country/Region` IS NULL THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN `Latitude` IS NULL THEN 1 ELSE 0 END) AS missing_latitude,
    SUM(CASE WHEN `Longitude` IS NULL THEN 1 ELSE 0 END) AS missing_longitude,
    SUM(CASE WHEN `Date` IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN `Confirmed` IS NULL THEN 1 ELSE 0 END) AS missing_confirmed,
    SUM(CASE WHEN `Deaths` IS NULL THEN 1 ELSE 0 END) AS missing_deaths,
    SUM(CASE WHEN `Recovered` IS NULL THEN 1 ELSE 0 END) AS missing_recovered
FROM 
    corona_virus.`corona virus dataset`;

-- ALTERNATIVE SOLUTION FOR Q1
SELECT COUNT(*) AS missing_values
FROM corona_virus.`corona virus dataset`
WHERE Province IS NULL OR 'Country/Region' IS NULL OR Latitude IS NULL OR Longitude IS NULL OR Date IS NULL OR Confirmed IS NULL 
OR Deaths IS NULL OR Recovered IS NULL;

-- Q2. If NULL values are present, update them with zeros for all columns. 
-- The output for NULL values being present is zero, meaning there are no NULL values in any of these columns.

-- Q3. check total number of rows
SELECT COUNT(*) AS total_number_of_rows
FROM corona_virus.`corona virus dataset`;

-- Q4. Check what is start_date and end_date
SELECT MIN(Date) AS start_date, MAX(Date) AS end_date
FROM corona_virus.`corona virus dataset`;

-- Q5. Number of month present in dataset
SELECT COUNT(DISTINCT MONTH(Date)) AS number_of_months
FROM corona_virus.`corona virus dataset`;

-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
	MONTH(Date) AS Month,
    AVG(Confirmed) AS Avg_Confirmed,
    AVG(Deaths) AS Avg_Deaths,
    AVG(Recovered) AS Avg_Recovered
FROM 
    corona_virus.`corona virus dataset`
GROUP BY 
    Month(Date);

-- Q7. Find most frequent value for confirmed, deaths, recovered each month     
SELECT 
    MONTH(Date) AS Month,
    MAX(Confirmed) AS Most_Occured_Confirmed,
    MAX(Deaths) AS Most_Occured_Deaths,
    MAX(Recovered) AS Most_Occured_Recovered
FROM 
    corona_virus.`corona virus dataset`
GROUP BY 
    MONTH(Date);
    
-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT
    YEAR(Date) AS YEAR,
    MIN(Confirmed) AS Minimum_V_Confirmed,
    MIN(Deaths) AS Minimum_V_Deaths,
    MIN(Recovered) AS Minimum_V_Recovered
FROM 
    corona_virus.`corona virus dataset`
GROUP BY 
    YEAR(Date);
    
-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT
    YEAR(Date) AS YEAR,
    MAX(Confirmed) AS Maximum_V_Confirmed,
    MAX(Deaths) AS Maximum_V_Deaths,
    MAX(Recovered) AS Maximum_V_Recovered
FROM 
    corona_virus.`corona virus dataset`
GROUP BY 
    YEAR(Date);

-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
	MONTH(Date) AS Month,
    SUM(Confirmed) AS Total_no_of_Confirmed,
    SUM(Deaths) AS Total_no_of_Deaths,
    SUM(Recovered) AS Total_no_of_Recovered
FROM 
    corona_virus.`corona virus dataset`
GROUP BY 
    MONTH(Date);

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
     SUM(Confirmed) AS Total_Confirmed_Cases,
     AVG(Confirmed) AS Avg_Confirmed_Cases,
     VARIANCE(Confirmed) AS Var_Confirmed_Cases,
     STDDEV(Confirmed) AS STDEV_Confirmed_Cases
FROM 
    corona_virus.`corona virus dataset`
GROUP BY
	YEAR(Date)
 
-- Q12. Check how corona virus spread out with respect to death case per month
-- (Eg.: total confirmed cases, their average, variance & STDEV)
SELECT 
     MONTH(Date) AS Month,
     SUM(Deaths) AS Total_Deaths_Cases,
     AVG(Deaths) AS Avg_Deaths_Cases,
     VARIANCE(Deaths) AS Var_Deaths_Cases,
     STDDEV(Deaths) AS STDEV_Deaths_Cases
FROM 
    corona_virus.`corona virus dataset`
GROUP BY
	MONTH(Date);

-- Q13. Check how corona virus spread out with respect to recovered case
-- (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    SUM(Recovered) AS total_recovered_cases,
    AVG(Recovered) AS average_recovered_cases,
    VARIANCE(Recovered) AS variance_recovered_cases,
    STDDEV(Recovered) AS stddev_recovered_cases
FROM 
	corona_virus.`corona virus dataset`
    
-- Q14. Find Country having highest number of the Confirmed case
SELECT 
    MAX(Confirmed) AS Highest_Confirmed_Cases, `Country/Region` AS Country
FROM 
    corona_virus.`corona virus dataset`
GROUP BY
	`Country/Region`
ORDER BY
    Highest_Confirmed_Cases DESC
LIMIT 1;

-- Q15. Find Country having lowest number of the death case
SELECT 
    MIN(Deaths) AS Lowest_Death_Cases, `Country/Region` AS Country
FROM 
    corona_virus.`corona virus dataset`
GROUP BY
	`Country/Region`
ORDER BY
    Lowest_Death_Cases DESC
LIMIT 1;

-- Q16. Find top 5 countries having highest recovered case
SELECT 
    `Country/Region` AS Country, 
    SUM(Recovered) AS Highest_Recovered_Cases
FROM 
    corona_virus.`corona virus dataset`
GROUP BY 
   `Country/Region`
ORDER BY
	Highest_Recovered_Cases DESC
LIMIT 
    5;

