# Goal: Marketing Campaign Effectiveness Analysis
**Project type:** Educational  
**Data:** Simulated dataset from training course (Google & Facebook Ads performance)  
**Tools:** DBeaver (PostgreSQL)
## Description 
This project demonstrates how to use SQL queries to analyze the effectiveness of digital marketing campaigns.  
The dataset includes ad spend, impressions, clicks, value and others from **Google Ads** and **Facebook Ads**.
## Tasks
**query_1** - Search for aggregated metrics on daily spending in Google and Facebook. Visualized result using Tableau  
**query_2** - Analysis of the top 5 days in terms of ROMI across all channels  
**query_3** - Analysis to find the company generating the highest revenue in a week  
**query_4** - Analysis of the company showing the largest month-to-month increase in reach  
**query_5** - Determine the maximum uninterrupted display period, including the associated ad campaign and its start date.

## Results
**query_1. Daily spending**  
![Dashboard Screenshot](https://github.com/katerynamaiatska/Data_portfolio/blob/main/project1/Dashboard%201.png?raw=true)
Interactive dashboard (https://public.tableau.com/views/query_17563955596260/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

**query_2. Top 5 days in terms of ROMI across all channels**  
|    Date    |      ROMI  |
|----------- |------------|
| 2022-01-11 |  148.69    |
| 2022-01-07 |	145.66    |
| 2022-02-13 |	141.87    |
| 2022-01-16 |	139.79    |
| 2022-02-23 |	137.32    |

**query_3. The company generating the highest revenue in a week**
|    Date    | Name campaing  | Week_value |
|----------- |----------------|------------|
| 2022-04-11 | Expansion	    |  2294120   |

**query_5. The maximum uninterrupted display period**

|  Adset_name |    Date    | max_duration |
|-----------  |------------|--------------|
|    Narrow   | 2021-05-17 |      108     |


## Note 
This project was completed using **training data** provided by an educational course.  
The goal is to demonstrate SQL and analytical skills, not real business outcomes.
