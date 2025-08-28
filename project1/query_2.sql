-- Analysis of the top 5 days in terms of ROMI across all channels

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

SELECT  ufg.ad_date
,		CASE
		 WHEN sum (ufg.spend)<>0 
		 THEN round (cast (sum (ufg.value) - sum (ufg.spend) as numeric)/ sum (ufg.spend)*100, 2)
		 ELSE 0
		END romi
FROM union_facebook_google AS ufg
GROUP BY ufg.ad_date
ORDER BY romi desc
LIMIT 5;

