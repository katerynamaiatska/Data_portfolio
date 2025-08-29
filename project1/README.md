# Goal: Marketing Campaign Effectiveness Analysis
**Project type:** Educational  
**Data:** Simulated dataset from training course (Google & Facebook Ads performance)  
**Tools:** DBeaver (PostgreSQL)
## Description 
This project demonstrates how to use SQL queries to analyze the effectiveness of digital marketing campaigns.  
The dataset includes ad spend, impressions, clicks, value and others from **Google Ads** and **Facebook Ads**.
## Tasks
[Daily spending]() - Search for aggregated metrics on daily spending in Google and Facebook. Visualized result using Tableau  
[Top 5] - Analysis of the top 5 days in terms of ROMI across all channels  
[The campaign with the highest revenue] - Analysis to find the campaign generating the highest revenue in a week  
[The campaign with the largest increase in reach] - Analysis of the campaign showing the largest month-to-month increase in reach  
[The campaign with maximum uninterrupted display period] - Determine the maximum uninterrupted display period, including the associated ad campaign and its start date.

## Results
Determined high-performing campaigns, assessed optimal periods, and evaluated ad spend efficiency.  

**Daily spending**  
![Dashboard Screenshot](https://github.com/katerynamaiatska/Data_portfolio/blob/main/project1/Dashboard%201.png?raw=true)
Interactive dashboard (https://public.tableau.com/views/query_17563955596260/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

**Top 5 days in terms of ROMI across all channels**  
|    Date    |      ROMI  |
|----------- |------------|
| 2022-01-11 |  148.69    |
| 2022-01-07 |	145.66    |
| 2022-02-13 |	141.87    |
| 2022-01-16 |	139.79    |
| 2022-02-23 |	137.32    |

**The company generating the highest revenue in a week**
|    Date    | Name campaing  | Week_value |
|----------- |----------------|------------|
| 2022-04-11 | Expansion	    |  2294120   |

**The maximum uninterrupted display period**

|  Adset_name |    Date    | max_duration |
|-----------  |------------|--------------|
|    Narrow   | 2021-05-17 |      108     |


## Note 
This project was completed using **training data** provided by an educational course.  
The goal is to demonstrate SQL and analytical skills, not real business outcomes.
