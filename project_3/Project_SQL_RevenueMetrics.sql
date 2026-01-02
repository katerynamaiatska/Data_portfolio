WITH monthly_revenue AS(
SELECT	user_id
,		date (date_trunc('month', payment_date)) AS payment_month
,		sum(revenue_amount_usd) AS total_revenue
FROM project.games_payments AS gp
GROUP BY payment_month, user_id
),
staging_data AS (
SELECT 	*
,		LAG (payment_month) OVER (PARTITION BY user_id ORDER BY payment_month) AS previous_paid_month
,		LEAD (payment_month) OVER (PARTITION BY user_id ORDER BY payment_month) AS next_paid_month
,		DATE (payment_month + INTERVAL '1' month) AS next_calendar_month
,		DATE (payment_month - INTERVAL '1' month) AS previous_calendar_month
,		LAG (total_revenue) OVER (PARTITION BY user_id ORDER BY payment_month) AS previous_total_revenue
FROM monthly_revenue
),
-- New MRR, New Paid Users, Churned MRR, Churned Users, Expansion MRR, Contraction MRR, Back_from_churnd MRR, Back_from_churnd Users
revenue_metrics AS (
SELECT 	*
,		CASE
			WHEN previous_paid_month IS NULL
			THEN total_revenue
		END AS new_MRR
,		CASE 
			WHEN previous_paid_month IS NULL
			THEN 1
		END AS new_paid_users
,		CASE
			WHEN next_paid_month IS NULL OR next_paid_month != next_calendar_month
			THEN total_revenue
		END AS churned_MRR
,		CASE 
			WHEN next_paid_month IS NULL OR next_paid_month != next_calendar_month
			THEN 1
		END AS churned_users
,		CASE 
			WHEN previous_calendar_month = previous_paid_month AND total_revenue > previous_total_revenue
			THEN total_revenue - previous_total_revenue
		END AS expansion_MRR
,		CASE
			WHEN previous_calendar_month = previous_paid_month AND total_revenue < previous_total_revenue
			THEN total_revenue - previous_total_revenue
		END AS contraction_MRR
,		CASE 
			WHEN previous_paid_month != previous_calendar_month AND previous_paid_month IS NOT NULL
			THEN total_revenue
		END AS back_from_churn_mrr
,		CASE 
			WHEN previous_paid_month != previous_calendar_month AND previous_paid_month IS NOT NULL
			THEN 1
		END AS back_from_churn_users
FROM staging_data
)
SELECT *
FROM revenue_metrics
LEFT JOIN project.games_paid_users USING (user_id)
ORDER BY payment_month;
