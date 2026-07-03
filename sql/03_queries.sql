-- Analytical queries

-- Response rate by income band
SELECT income_band, COUNT(*) AS customers,
       ROUND(AVG(response)*100, 1) AS response_rate_pct
FROM customers GROUP BY income_band ORDER BY response_rate_pct DESC;

-- Response & spend by family status (CASE)
SELECT CASE WHEN children = 0 THEN 'No children' ELSE 'Has children' END AS family_status,
       COUNT(*) AS customers,
       ROUND(AVG(response)*100, 1) AS response_rate_pct,
       ROUND(AVG(total_spend)) AS avg_spend
FROM customers GROUP BY family_status;

-- Spend vs income-band average (window function)
SELECT id, income_band, total_spend,
       ROUND(AVG(total_spend) OVER (PARTITION BY income_band)) AS band_avg_spend
FROM customers;
