-- Search for aggregated metrics on daily spending in Google and Facebook

WITH union_facebook_google AS ( -- Consolidated table of media resources, with NULL value handling in key metrics
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
-- Finding the maximum, minimum, and average expenses grouped by date and resource.
SELECT  ufg.ad_date
,		ufg.name_media
,		max (ufg.spend) AS max_spend
,		min (ufg.spend) AS min_spend
,		round (AVG (ufg.spend),2) AS average_spend
FROM union_facebook_google AS ufg
GROUP BY ufg.ad_date, ufg.name_media
ORDER BY ufg.ad_date;



