# Goal: Create a dashboard for a product manager with the goal of analyzing revenue from the project, tracking its dynamics, and performing high-level analysis of changes.  
**Project type:** Educational  
**Data:** The dataset used in this project is from a training SQL database and cannot be shared publicly due to access restrictions.  
**Tools:** SQL (PostgreSQL), Tableau
## Description
 The project includes SQL queries for data selection, transformation, and preparation. 
Dashboard for interactive visualization and analysis of metrics 

## Tasks 
1. **Data manipulation**  
 The query was implemented as a CTE using window functions. The following metrics were calculated: MRR, New MRR, New Paid Users, Churned MRR, Churned Users, Expansion MRR, Contraction MRR, Returning MRR, Returning Users.

2. **Visualisation**  
 Calculation in Tableau of the remaining metrics: ARPPU, LT, LTV, Paid Users, Churned Users Rate, Churned MRR Rate. Visualization of the results on the dashboard with added filters for month, user age, and user language.

## File
1. [Data manipulation](Project_SQL_RevenueMetrics.sql)
2. [Visualisation](https://public.tableau.com/app/profile/kateryna.maiatska/viz/Project_2_Revenue_Metrics/RevenueMetrics)
   
## Conclusions
1. The dashboard allows the manager to immediately see all key metrics and their interrelationships. Using analytics tools made it possible to identify patterns and critical points: 
- The business model is extensive, so acquiring new clients and retaining existing ones is critically important. 
- Customer churn remains fairly high (over 20%), which is significant even for the gaming industry. The highest risk is observed among users under 30 years old, where churn shows an increasing trend. The 30+ segment demonstrates a wave-like dynamic. This indicates the need for a separate analysis of factors affecting the choices of different age groups to improve retention. 
- Overall, the model is profitable, except for one month, which requires a deeper assessment of the factors that led to this outcome. 
- Since users are currently not ready to increase their average spend, it is recommended to focus on analyzing their needs and finding creative solutions to increase the product’s value.
2. The project demonstrated that a systematic approach to collecting, visualizing, and interpreting product metrics is an effective tool for decision-making, enabling improved business process performance and identifying pathways for development.
  
## Note
This project was educational, aiming to demonstrate Python and analytical skills.

