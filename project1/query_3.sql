-- Analysis to find the company generating the highest revenue in a week
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

SELECT  CAST (date_trunc ('week', ad_date) AS date) AS ad_week
,		campaign_name
,		sum (value) AS week_value
FROM union_facebook_google
GROUP BY ad_week, campaign_name
ORDER BY week_value desc
LIMIT 1;