-- Atlas Lab employees attrition & performance


-- Viewing all data

SELECT * FROM employee_demographics
JOIN employee_job
ON employee_demographics.EmployeeID = employee_job.EmployeeID
JOIN performance_rating
ON performance_rating.EmployeeID = employee_job.EmployeeID;


-- 1. Gender breakdown of employees

SELECT Gender, COUNT(*) AS EmployeeCount
FROM employee_demographics
GROUP BY Gender;


-- 2. Ethnicity breakdown of employees

SELECT Ethnicity, COUNT(*) AS EmployeeCount
FROM employee_demographics
GROUP BY Ethnicity;


-- 3. Age distribution of employees 

SELECT CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE'55-65'
END AS AgeRange,
COUNT(*) AS EmployeeCount
FROM employee_demographics
GROUP BY AgeRange
ORDER BY FIELD(AgeRange, 'Under 25', '25-34', '35-44', '45-54', '55-64');


-- 4. State breakdown of employees

SELECT State, COUNT(*) AS EmployeeCount
FROM employee_demographics
GROUP BY State
ORDER BY EmployeeCount desc;


-- 5. Gender breakdown of employees in each department and job role

SELECT employee_job.Department, employee_job.JobRole, employee_demographics.Gender, COUNT(*) AS Count
FROM employee_demographics
JOIN employee_job ON employee_demographics.EmployeeID = employee_job.EmployeeID
GROUP BY employee_job.Department, employee_job.JobRole, employee_demographics.Gender
ORDER BY employee_job.Department, employee_job.JobRole, employee_demographics.Gender;


-- 6. Number of employees in each job role and department

SELECT JobRole, Department, COUNT(*) AS EmployeeCount
FROM employee_job
GROUP BY JobRole, Department
ORDER BY EmployeeCount DESC;


-- 7. Overall turnover rate

SELECT COUNT(*) AS TotalEmployees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS `Left`, CONCAT(ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS TurnoverRate
FROM employee_job
ORDER BY SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 DESC;


-- 8. Turnover rate of employees from each department

SELECT Department, COUNT(*) AS TotalEmployees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS `Left`, CONCAT(ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS TurnoverRate
FROM employee_job
GROUP BY Department
ORDER BY SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 DESC;


-- 9. Turnover rate of employees from each job role

SELECT JobRole, COUNT(*) AS TotalEmployees, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS `Left`, CONCAT(ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS TurnoverRate
FROM employee_job
GROUP BY JobRole
ORDER BY SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 DESC;
  
  
-- 10. Turnover rates by year

SELECT YEAR(HireDate) AS Year, COUNT(*) AS Hires, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS `Resignation`, CONCAT(ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS TurnoverRate
FROM employee_job
GROUP BY YEAR(HireDate)
ORDER BY Year;


-- 11. Changes in hires from each year

SELECT YEAR(HireDate) AS Year, COUNT(*) AS Hires, LAG(COUNT(*)) OVER (ORDER BY YEAR(HireDate)) AS PreviousYearHires, COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY YEAR(HireDate)) AS ChangeInHires,
CASE
WHEN LAG(COUNT(*)) OVER (ORDER BY YEAR(HireDate)) IS NULL THEN 'N/A'
WHEN COUNT(*) > LAG(COUNT(*)) OVER (ORDER BY YEAR(HireDate)) THEN 'Increase'
WHEN COUNT(*) < LAG(COUNT(*)) OVER (ORDER BY YEAR(HireDate)) THEN 'Decrease'
ELSE 'No Change'
END AS `Change`
FROM employee_job
GROUP BY YEAR(HireDate)
ORDER BY Year;


-- 12. Salary distribution among employees

SELECT 
CASE
WHEN Salary < 50000 THEN 'Under 50K'
WHEN Salary < 100000 THEN '50K–99K'
WHEN Salary < 150000 THEN '100K–149K'
WHEN Salary < 200000 THEN '150K–199K'
WHEN Salary < 250000 THEN '200K–249K'
WHEN Salary < 300000 THEN '250K–299K'
WHEN Salary < 350000 THEN '300K–349K'
WHEN Salary < 400000 THEN '350K–399K'
WHEN Salary < 450000 THEN '400K–449K'
WHEN Salary < 500000 THEN '450K–499K'
WHEN Salary < 550000 THEN '500K–549K'
ELSE '550K+'
END AS SalaryRange,
COUNT(*) AS EmployeeCount
FROM employee_job
GROUP BY SalaryRange
ORDER BY FIELD(SalaryRange, 'Under 50K', '50K–99K', '100K–149K', '150K–199K', '200K–249K', '250K–299K', '300K–349K', '350K–399K', '400K–449K', '450K–499K', '500K–549K', '550K+');


-- 13. Average scores of 1 & 2 from EnvironmentSatisfaction, JobSatisfaction, RelationshipSatisfaction, and WorkLifeBalance

SELECT
SUM(CASE WHEN EnvironmentSatisfaction IN (1, 2) THEN 1 ELSE 0 END) AS LowEnvironmentSatisfaction, 
CONCAT(ROUND(SUM(CASE WHEN EnvironmentSatisfaction IN (1, 2) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), '%') AS `LowEnvironmentSatisfaction%`,

SUM(CASE WHEN JobSatisfaction IN (1, 2) THEN 1 ELSE 0 END) AS LowJobSatisfaction,
CONCAT(ROUND(SUM(CASE WHEN JobSatisfaction IN (1, 2) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), '%') AS `LowJobSatisfaction%`,

SUM(CASE WHEN WorkLifeBalance IN (1, 2) THEN 1 ELSE 0 END) AS LowWorkLifeBalance,
CONCAT(ROUND(SUM(CASE WHEN WorkLifeBalance IN (1, 2) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), '%') AS `LowWorkLifeBalance%`,

SUM(CASE WHEN RelationshipSatisfaction IN (1, 2) THEN 1 ELSE 0 END) AS LowRelationshipSatisfaction,
CONCAT(ROUND(SUM(CASE WHEN RelationshipSatisfaction IN (1, 2) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), '%') AS `LowRelationshipSatisfaction%`
FROM performance_rating;


-- 14. How many employees left the company within the shortest tenure, and what were their promotion and role timelines?

SELECT YearsAtCompany, YearsSinceLastPromotion, YearsInMostRecentRole, COUNT(*) AS Total
FROM employee_job
WHERE Attrition = 'yes'
GROUP BY YearsAtCompany, YearsSinceLastPromotion, YearsInMostRecentRole
ORDER BY count(*) DESC
LIMIT 5;
