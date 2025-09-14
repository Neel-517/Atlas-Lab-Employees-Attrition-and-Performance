# Atlas Lab Employees: Attrition and Performance

## [Tableau Dashboard](https://public.tableau.com/views/AtlasLabEmployees_17569549535190/Demographics?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
## **Datasets**
### [Employee Demographics Dataset](https://github.com/Neel-517/Atlas-Lab-Employees/blob/9c82846a5873e4a98e2b55a51858e21a441ffcc6/Employee_Demographics.csv)
### [Employee Jobs Dataset](https://github.com/Neel-517/Atlas-Lab-Employees/blob/9c82846a5873e4a98e2b55a51858e21a441ffcc6/Employee_Job.csv)
### [Employee Ratings Dataset](https://github.com/Neel-517/Atlas-Lab-Employees/blob/9c82846a5873e4a98e2b55a51858e21a441ffcc6/Performance_Rating.csv)

## **Tools Used** 

1. **Excel**
   - Data Cleaning & Preparation, Sorting, Filtering, Rearranging 
2. **SQL**
   - Joins, Aggregate Functions, Sorting, Limits, Percentage Calculations, Filtering, SELECT Statements, Data Categorization, ORDER BY, Aliasing, Window Functions, CASE Statements
3. **Tableau**
   - Filters, Parameters, Calculated Fields, Performance & Publishing, KPIs, Sets

## **Project Overview** 

This analysis dives into detailed data on Atlas Lab employees. This dashboard is broken into 3 parts: Demographics, Jobs, and Ratings 
- <ins>Demographics</ins>:
  - Ethnicity breakdown, Gender breakdown, Headcount by Age Groups, Education Levels, State breakdown, and Business Travel.
  - Average Tenure and Average Age.
- <ins>Jobs</ins>:
  - Attrition Rate & Hires by year, Salary Ranges, Gender breakdown in each department and job role, Stock Option Levels, and employees' Overtime Status.
  - Overall Attrition Rate, Attrition count, Employee count, Number of job roles, and Average Salary.
- <ins>Ratings</ins>
   - Employees who gave a score of 1 through 5 on a 5-point scale, which includes Job Satisfaction, Relationship Satisfaction, Environment Satisfaction, Work-Life Satisfaction.
   - A count and percentage of Low Job Satisfaction, Relationship Satisfaction, Environment Satisfaction, Work-Life Satisfaction (Scores of 1 & 2 only).

Each dashboard consists of four filters: **Year**, **Gender**, **Attrition** (to toggle results of those who already left), & **Department**.

The objective is to identify issues in areas that may be correlated with turnover and potential solutions.

## **Screenshots**
<ins>**Demographics**</ins>

![image alt](https://github.com/Neel-517/Atlas-Lab-Employees-Attrition-and-Performance/blob/fcfea41a9923a10911baf376c540b82e11b42775/Dashboard%20Screenshots/Demographics.png)

<ins>**Jobs**</ins>

![image alt](https://github.com/Neel-517/Atlas-Lab-Employees-Attrition-and-Performance/blob/fcfea41a9923a10911baf376c540b82e11b42775/Dashboard%20Screenshots/Jobs.png)

<ins>**Ratings**</ins>

![image alt](https://github.com/Neel-517/Atlas-Lab-Employees-Attrition-and-Performance/blob/fcfea41a9923a10911baf376c540b82e11b42775/Dashboard%20Screenshots/Ratings.png)

# **Insights/Findings**
## **Turnover Rates** 
### **Overall Turnover**
---
Overall| 16.12%
:---:|:---:
### **Turnover rates by year**
---
Year |Turnover Rate
:---:|:---:
2012 | 15.89%
2013 | 16.91%
2014 | 16.91%
2015 | 11.81%
2016 | 21.05%
2017 | 10.38%
2018 | 16.18%
2019 | 14.48%
2020 | 22.05%
2021 | 15.33%
2022 | 16.13%

### **Turnover rates from each department**
---
Department |Turnover Rate         
:---:|:---:
Sales | 20.63%
Human Resources | 19.05%
Technology | 13.84%

### **Turnover rates from each job role**
---
Job Role |Turnover Rate
:---:|:---:
Sales Representative | 39.76%
Recruiter | 37.50%
Data Scientist | 23.75%
Sales Executive | 17.43%
Software Engineer | 15.99%
HR Executive | 10.71%
Machine Learning Engineer | 6.85%
Senior Software Engineer | 6.82%
Analytics Manager | 5.77%
Manager | 5.41%
Engineering Manager | 2.67%
HR Business Partner | 0.00%
HR Manager | 0.00%

## **Ratings (Only scores of 1 & 2)** 
Category | Count of rating (out of 1470) | Low Rating Percentage
:---:|:---:|:---:
Job Satisfaction | 381 | 25.92%
Work Life Balance | 376 | 25.58%
Relationship Satisfaction | 373 | 25.37%

## **Employees who left the company within the shortest tenure, with their promotion and role timelines (Top 5 results)**
Years At Company | Years Since Last Promotion | Years In Most Recent Role | Total
:---:|:---:|:---:|:---:
0 | 0 | 0 | 60
1 | 0 | 0 | 43
1 | 1 | 1 | 11
2 | 1 | 1 | 11
3 | 1 | 1 | 8

## **Suggestions** 
- 📝 <ins>**For every job role**</ins>: Conduct surveys to determine issues and to understand factors influencing turnover, and take action accordingly.
- 💼 <ins>**Job satisfaction**</ins>: Create learning paths and growth opportunities for each job role. Have one-on-one meetings to discuss expectations and any barriers. 
- 🌿 <ins>**Work-life balance**</ins>: Allow flexible work schedules, while offering rest days. Identify departments with continuous overtime and redistribute work to reduce burnout.
- ❤️ <ins>**Relationship satisfaction**</ins>: Implement an inclusive workplace model where employees are valued and get rid of toxic policies. Focus on team building with other employees and managers.
- 📊 <ins>**For new hires leaving early**</ins>: Implement a 30-60-90 day plan to outline milestones and objectives, and let new hires know about the goals and mission. Check up on employees regularly to identify and fix issues.
