-- Top 10 Countries by Revenue (Excluding UK)
-- Insights: Which international markets are strongest?
-- Skills: Aggregation, WHERE filter, ORDER BY, LIMIT

SELECT 
    country,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT invoice_no) AS orders,
    ROUND(SUM(quantity * unit_price)::numeric, 2) AS revenue,
    ROUND(AVG(quantity * unit_price)::numeric, 2) AS avg_order_value
FROM online_retail
WHERE quantity > 0 
  AND unit_price > 0
  AND country != 'United Kingdom'
GROUP BY country
ORDER BY revenue DESC
LIMIT 10;