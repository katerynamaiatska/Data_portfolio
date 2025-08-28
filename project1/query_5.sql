WITH union_facebook_google AS (
SELECT  fd.ad_date
,		fc.campaign_name
,		fa.adset_name
,		COALESCE (fd.spend, 0) AS spend
,		COALESCE (fd.impressions, 0) AS impressions
,		COALESCE (fd.reach, 0) AS reach
,		COALESCE (fd.clicks, 0) AS clicks 
,		COALESCE (fd.leads, 0) AS leads 
,		COALESCE (fd.value, 0) AS value
,		fd.url_parameters
,		'facebook' AS name_media
FROM facebook_ads_basic_daily AS fd
LEFT JOIN facebook_adset AS fa USING (adset_id) 
LEFT JOIN facebook_campaign AS fc USING (campaign_id)
UNION ALL
SELECT  gd.ad_date
,		gd.campaign_name
,		gd.adset_name
,		COALESCE (gd.spend, 0) AS spend
,		COALESCE (gd.impressions, 0) AS impressions
,		COALESCE (gd.reach, 0) AS reach
,		COALESCE (gd.clicks, 0) AS clicks 
,		COALESCE (gd.leads, 0) AS leads 
,		COALESCE (gd.value, 0) AS value
,		gd.url_parameters
,		'google' AS name_media
FROM google_ads_basic_daily AS gd
)
-- Identifying continuous impression sequences for each ad
, period_group_adset AS (
SELECT  adset_name
,		ad_date
,		ad_date - CAST (ROW_NUMBER () OVER (PARTITION BY adset_name ORDER BY ad_date) AS INT) AS group_marker
FROM  union_facebook_google
GROUP BY adset_name, ad_date
)
-- Identifying the start, end, and duration of impressions for each group
, sort_group AS (
SELECT  adset_name
,    	MIN(ad_date) AS start_date
,   	MAX(ad_date) AS end_date
,    	MAX(ad_date)- MIN(ad_date) + 1 AS duration
FROM period_group_adset
GROUP BY adset_name, group_marker
)
-- Determine the maximum uninterrupted display period, including the associated ad campaign and its start date.
SELECT  adset_name
,		start_date
,		COALESCE (MAX (duration), 0) AS max_duration
FROM sort_group
GROUP BY adset_name, start_date 
ORDER BY max_duration DESC
LIMIT 1


