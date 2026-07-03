-- Views for the dashboard
CREATE OR REPLACE VIEW v_response_by_income AS
SELECT income_band, COUNT(*) AS customers,
       ROUND(AVG(response)*100, 1) AS response_rate_pct
FROM customers GROUP BY income_band;
